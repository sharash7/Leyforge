class_name ForgeCreatorStudioPanel
extends VBoxContainer
## Shared source browser/editor used by Structures, Characters, VFX and Audio.

signal source_activated(resource: Resource, descriptor: ForgeAuthoringTypeDescriptor)
signal source_changed(resource: Resource)
signal status_changed(message: String, is_error: bool)
signal history_changed(can_undo: bool, can_redo: bool)

const WAVEFORM_PREVIEW_SCRIPT := preload("res://scripts/forge/ui/forge_waveform_preview.gd")
const VISUAL_SWITCHES_SCRIPT := preload(
	"res://scripts/forge/application/forge_visual_studio_switches.gd")

var domain := ""
var session: ForgeAuthoringSession
var registry := ForgeAuthoringTypeRegistry.new()
var autosaves := ForgeAutosaveService.new()
var current_descriptor: ForgeAuthoringTypeDescriptor
var current_resource: Resource

var _type_selector: OptionButton
var _creation_mode_selector: OptionButton
var _name_entry: LineEdit
var _slug_entry: LineEdit
var _existing_selector: OptionButton
var _source_heading: Label
var _state_label: Label
var _editor: VBoxContainer
var _editor_root: VBoxContainer
var _advanced_editor: VBoxContainer
var _advanced_toggle: CheckButton
var _visual_workspace: VBoxContainer
var _diagnostics: VBoxContainer
var _preview_output: RichTextLabel
var _audio_player: AudioStreamPlayer
var _audio_import_dialog: FileDialog
var _selected_body_part: ForgeBodyPartDefinition
var _voxel_canvas: ForgeVoxelSliceCanvas
var _voxel_palette: ForgePaletteDefinition
var _vfx_form_volume: ForgeVoxelVolume
var _vfx_form_canvas: ForgeVoxelSliceCanvas
var _structure_builder: ForgeStructureVoxelBuilder
var _character_3d_canvas: ForgeVoxel3DCanvas
var _character_voxel_part: ForgeBodyPartDefinition
var _character_voxel_pending: ForgeVoxelVolume
var _character_palette_index := 0
var _character_symmetry := false
var _vfx_3d_canvas: ForgeVoxel3DCanvas
var _vfx_visual_pending: Array[Dictionary] = []
var _vfx_visual_palette_index := 0
var _vfx_visual_form: ForgeVfxForm
var _vfx_visual_stroke_active := false
var _slug_edit_guard := false
var _slug_user_edited := false


func configure(p_domain: String, p_session: ForgeAuthoringSession) -> void:
	domain = p_domain
	session = p_session
	size_flags_horizontal = Control.SIZE_EXPAND_FILL
	add_theme_constant_override("separation", 10)
	_build_document_bar()
	_build_source_header()
	_editor = VBoxContainer.new()
	_editor.name = "CreatorEditor"
	_editor.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_editor.add_theme_constant_override("separation", 9)
	add_child(_editor)
	_editor_root = _editor
	_build_diagnostics()
	_refresh_existing()
	var active := session.active_resource()
	var descriptor: ForgeAuthoringTypeDescriptor = session.descriptors.get(
		session.active_source_id)
	if active != null and descriptor != null and descriptor.domain == domain:
		_activate(active, descriptor)
	else:
		_show_empty_state()


func has_source() -> bool:
	return current_resource != null and current_descriptor != null


func save_current() -> Dictionary:
	if not has_source():
		return {"ok": false, "error": "No creator source is open."}
	var result := session.save(current_descriptor.identity(current_resource))
	if bool(result.get("ok", false)):
		_discard_current_autosave()
		_set_state("SAVED", "Draft saved and read back successfully.")
		status_changed.emit("Creator draft saved.", false)
		_refresh_existing()
	else:
		status_changed.emit("Creator save failed: %s" % str(result.get("error", "")), true)
	_show_diagnostic_records(result.get("diagnostics", []))
	return result


func validate_current() -> Dictionary:
	if not has_source():
		return {"ok": false, "error": "No creator source is open."}
	var diagnostics := session.document_service.validate(current_resource)
	var records: Array[Dictionary] = []
	var blockers := 0
	var warnings := 0
	for diagnostic in diagnostics:
		records.append(diagnostic.to_record())
		if diagnostic.severity == ForgeDiagnostic.WARNING:
			warnings += 1
		elif diagnostic.severity in [ForgeDiagnostic.ERROR, ForgeDiagnostic.CRITICAL,
				ForgeDiagnostic.BLOCKER, ForgeDiagnostic.CRITICAL_RELEASE_BLOCKER]:
			blockers += 1
	_show_diagnostic_records(records)
	_set_state("BLOCKED" if blockers > 0 else "VALID",
		"%d blocker(s), %d warning(s)." % [blockers, warnings])
	status_changed.emit("Creator validation: %d blocker(s), %d warning(s)." % [
		blockers, warnings], blockers > 0)
	return {"ok": blockers == 0, "diagnostics": records,
		"blockers": blockers, "warnings": warnings}


func approve_current() -> Dictionary:
	if not has_source():
		return {"ok": false, "error": "No creator source is open."}
	var result := session.document_service.approve(
		current_resource, str(session.paths.get(
			current_descriptor.identity(current_resource), "")), _bake_action())
	if bool(result.get("ok", false)):
		session.dirty[current_descriptor.identity(current_resource)] = false
		_set_state("APPROVED", "Validated source and generated product are matched.")
		status_changed.emit("Creator source approved.", false)
	else:
		status_changed.emit("Creator approval blocked: %s" % str(result.get("error", "")), true)
	_show_diagnostic_records(result.get("diagnostics", []))
	return result


func preview_current() -> Dictionary:
	if not has_source():
		return {"ok": false, "error": "No creator source is open."}
	if current_resource is ForgeSynthPatchDefinition:
		return _play_synth_note(current_resource.preview_midi_note)
	if current_resource is ForgeSoundSource:
		return _play_sound_source(current_resource)
	if current_resource is ForgeProceduralStructureRuleSet:
		return _preview_structure_rules(current_resource)
	if current_resource is ForgeVfxGraph:
		var result: Dictionary = {"ok": true, "nodes": current_resource.nodes.size(),
			"edges": current_resource.edges.size(),
			"maximum_spawn_count": current_resource.maximum_spawn_count}
		_show_preview_text("VFX GRAPH PREVIEW\nNodes: %d\nEdges: %d\nSpawn bound: %d" % [
			result.nodes, result.edges, result.maximum_spawn_count])
		return result
	if current_resource is ForgeEntityDefinition:
		var part_count: int = current_resource.body_plan.body_parts.size() \
			if current_resource.body_plan != null else 0
		var result: Dictionary = {"ok": true, "body_family": current_resource.body_family,
			"parts": part_count, "dimensions": current_resource.world_dimensions_meters}
		_show_preview_text("ENTITY PREVIEW\nFamily: %s\nBody parts: %d\nWorld size: %s" % [
			result.body_family, result.parts, str(result.dimensions)])
		return result
	var validation: Dictionary = validate_current()
	_show_preview_text("SOURCE PREVIEW\n%s\nValidation: %s" % [
		current_descriptor.display_name,
		"ready" if bool(validation.get("ok", false)) else "blocked"])
	return validation


func undo() -> bool:
	if not has_source() or not session.undo(current_descriptor.identity(current_resource)):
		return false
	_rebuild_editor()
	_emit_history()
	source_changed.emit(current_resource)
	return true


func redo() -> bool:
	if not has_source() or not session.redo(current_descriptor.identity(current_resource)):
		return false
	_rebuild_editor()
	_emit_history()
	source_changed.emit(current_resource)
	return true


func _build_document_bar() -> void:
	var panel := PanelContainer.new()
	panel.name = "CreatorDocumentBar"
	var stack := VBoxContainer.new()
	stack.add_theme_constant_override("separation", 7)
	panel.add_child(stack)
	# Creator controls must wrap in compact game/editor hosts. A single HBox fed
	# the sum of every field minimum into the page width, which pushed both the
	# authoring canvas and the separate Live Preview beyond the clipped window.
	var first := HFlowContainer.new()
	first.add_theme_constant_override("separation", 7)
	_type_selector = OptionButton.new()
	_type_selector.name = "CreatorType"
	_type_selector.custom_minimum_size = Vector2(220, 38)
	_type_selector.tooltip_text = "Choose the canonical source type to create."
	for descriptor in registry.all(domain):
		_type_selector.add_item(descriptor.display_name)
		_type_selector.set_item_metadata(_type_selector.item_count - 1, descriptor.type_id)
	first.add_child(_labeled("Source type", _type_selector))
	_creation_mode_selector = OptionButton.new()
	_creation_mode_selector.name = "CreatorStartingPoint"
	for definition in [["Guided Template", "guided"], ["Blank", "blank"],
			["Duplicate Existing", "duplicate"]]:
		_creation_mode_selector.add_item(str(definition[0]))
		_creation_mode_selector.set_item_metadata(
			_creation_mode_selector.item_count - 1, definition[1])
	_creation_mode_selector.tooltip_text = (
		"Templates seed helpful editable content; Blank starts minimal; Duplicate "
		+ "copies the saved source chosen below with a new identity.")
	first.add_child(_labeled("Starting point", _creation_mode_selector))
	_name_entry = LineEdit.new()
	_name_entry.name = "CreatorName"
	_name_entry.placeholder_text = "Display name"
	_name_entry.custom_minimum_size = Vector2(190, 38)
	_name_entry.tooltip_text = "Human-readable source name."
	_name_entry.text_changed.connect(_suggest_slug_from_name)
	first.add_child(_labeled("Name", _name_entry))
	_slug_entry = LineEdit.new()
	_slug_entry.name = "CreatorSlug"
	_slug_entry.placeholder_text = "stable_id_suffix"
	_slug_entry.custom_minimum_size = Vector2(165, 38)
	_slug_entry.tooltip_text = "Lowercase stable-ID suffix; identity is preserved after creation."
	_slug_entry.text_changed.connect(func(_value: String) -> void:
		if not _slug_edit_guard:
			_slug_user_edited = true)
	first.add_child(_labeled("ID suffix", _slug_entry))
	var create_button := _button("Create New Source", _create_new)
	create_button.name = "CreateCreatorSource"
	first.add_child(create_button)
	stack.add_child(first)
	var second := HFlowContainer.new()
	second.add_theme_constant_override("separation", 7)
	_existing_selector = OptionButton.new()
	_existing_selector.name = "ExistingCreatorSources"
	_existing_selector.fit_to_longest_item = false
	_existing_selector.custom_minimum_size.x = 260
	_existing_selector.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_existing_selector.tooltip_text = "Saved canonical sources in this studio."
	second.add_child(_labeled("Open saved source", _existing_selector))
	second.add_child(_button("Refresh", _refresh_existing))
	second.add_child(_button("Open", _open_selected))
	second.add_child(_button("Duplicate", _duplicate_current))
	var save_button := _button("Save Draft", save_current)
	save_button.name = "GuideTarget_SaveDraft"
	second.add_child(save_button)
	var validate_button := _button("Validate", validate_current)
	validate_button.name = "GuideTarget_Validate"
	second.add_child(validate_button)
	second.add_child(_button("Preview", preview_current))
	var approve_button := _button("Approve & Save", approve_current)
	approve_button.name = "GuideTarget_ApproveAndSave"
	second.add_child(approve_button)
	stack.add_child(second)
	add_child(panel)


func _build_source_header() -> void:
	var panel := PanelContainer.new()
	var row := HBoxContainer.new()
	row.add_theme_constant_override("separation", 10)
	panel.add_child(row)
	_source_heading = Label.new()
	_source_heading.name = "CreatorSourceHeading"
	_source_heading.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_source_heading.add_theme_font_size_override("font_size", 18)
	row.add_child(_source_heading)
	_state_label = Label.new()
	_state_label.name = "CreatorSourceState"
	_state_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	row.add_child(_state_label)
	add_child(panel)


func _build_diagnostics() -> void:
	var panel := PanelContainer.new()
	var stack := VBoxContainer.new()
	panel.add_child(stack)
	var title := Label.new()
	title.text = "Validation & Preview Output"
	title.add_theme_font_size_override("font_size", 17)
	stack.add_child(title)
	_diagnostics = VBoxContainer.new()
	_diagnostics.name = "CreatorDiagnostics"
	stack.add_child(_diagnostics)
	_preview_output = RichTextLabel.new()
	_preview_output.name = "CreatorPreviewOutput"
	_preview_output.custom_minimum_size = Vector2(0, 90)
	_preview_output.fit_content = true
	_preview_output.scroll_active = false
	_preview_output.bbcode_enabled = false
	_preview_output.text = "No preview has been run."
	stack.add_child(_preview_output)
	add_child(panel)


func _show_empty_state() -> void:
	_source_heading.text = "No creator source open"
	_set_state("NO SOURCE", "Choose a type and create a source, or open a saved one.")
	_clear(_editor_root)
	_editor = _editor_root
	var note := Label.new()
	note.text = (
		"Creator sources are canonical editable .tres documents. Generated previews "
		+ "stay separate and never overwrite gameplay registries or generated files by hand.")
	note.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_editor.add_child(note)


func _create_new() -> void:
	var type_id := str(_type_selector.get_item_metadata(_type_selector.selected))
	var title := _name_entry.text.strip_edges()
	var slug := _slug_entry.text.strip_edges()
	if title.is_empty():
		status_changed.emit("Enter a display name before creating a source.", true)
		_name_entry.grab_focus()
		return
	var creation_mode := str(_creation_mode_selector.get_item_metadata(
		_creation_mode_selector.selected))
	if creation_mode == "duplicate":
		_duplicate_selected_as_new(slug, title)
		return
	var result := session.create(type_id, slug, title)
	if not bool(result.get("ok", false)):
		status_changed.emit("Creator source failed: %s" % str(result.get("error", "")), true)
		return
	if creation_mode == "blank":
		_apply_blank_start(result["resource"])
	_activate(result["resource"], result["descriptor"])
	status_changed.emit("Created %s as an unsaved draft." % title, false)


func _suggest_slug_from_name(value: String) -> void:
	if _slug_user_edited or not is_instance_valid(_slug_entry):
		return
	_slug_edit_guard = true
	_slug_entry.text = ForgeId.safe_filename(
		value.strip_edges().to_lower().replace(" ", "_"))
	_slug_edit_guard = false


func _duplicate_selected_as_new(slug: String, title: String) -> void:
	if _existing_selector.item_count == 0 or _existing_selector.selected < 0:
		status_changed.emit(
			"Choose a saved source below before using Duplicate Existing.", true)
		return
	var path := str(_existing_selector.get_item_metadata(_existing_selector.selected))
	var original := ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)
	var original_descriptor := registry.for_resource(original)
	var requested_type := str(_type_selector.get_item_metadata(_type_selector.selected))
	if original == null or original_descriptor == null \
			or original_descriptor.type_id != requested_type:
		status_changed.emit(
			"The selected saved source must match the chosen source type.", true)
		return
	var result := session.document_service.duplicate_source(original, slug, title)
	if not bool(result.get("ok", false)):
		status_changed.emit("Duplicate failed: %s" % str(result.get("error", "")), true)
		return
	var duplicate: Resource = result["resource"]
	var descriptor: ForgeAuthoringTypeDescriptor = result["descriptor"]
	session.register_recovery({"ok": true, "resource": duplicate,
		"recovery_for_path": descriptor.default_path(duplicate)})
	_activate(duplicate, descriptor)
	status_changed.emit("Created an editable duplicate with a new stable identity.", false)


func _apply_blank_start(resource: Resource) -> void:
	if resource is ForgeBlueprintDefinition \
			or resource is ForgeBlueprintModuleDefinition:
		var source := ForgeStructureVoxelSource.new()
		source.stage_ids = PackedStringArray(["stage.foundation"])
		resource.structure_voxel_source = source
		resource.elements.clear()
		if resource is ForgeBlueprintDefinition:
			resource.construction_deltas.clear()
		else:
			resource.connectors.clear()
	elif resource is ForgeEntityDefinition and resource.body_plan != null:
		resource.body_plan.body_parts.clear()
		resource.body_plan.root_part_id = ""
	elif resource is ForgeBodyPlanDefinition:
		resource.body_parts.clear()
		resource.root_part_id = ""
	elif resource is ForgeBodyPartDefinition:
		resource.voxel_source = ForgeVoxelVolume.new()
		resource.voxel_source.dimensions = Vector3i(8, 8, 8)
		resource.voxel_source.ensure_storage()
	elif resource is ForgeVfxGraph:
		resource.nodes.clear()
		resource.edges.clear()
	elif resource is ForgeVfxForm:
		resource.cell_records.clear()


func _open_selected() -> void:
	if _existing_selector.item_count == 0 or _existing_selector.selected < 0:
		status_changed.emit("No saved creator source is selected.", true)
		return
	var path := str(_existing_selector.get_item_metadata(_existing_selector.selected))
	var result := session.open(path)
	if not bool(result.get("ok", false)):
		status_changed.emit("Open failed: %s" % str(result.get("error", "")), true)
		return
	_activate(result["resource"], result["descriptor"])
	status_changed.emit("Opened %s." % path.get_file(), false)


func _duplicate_current() -> void:
	if not has_source():
		status_changed.emit("Open a creator source before duplicating it.", true)
		return
	var title := "%s Copy" % current_descriptor.title(current_resource)
	var slug := "%s_copy" % ForgeId.safe_filename(current_descriptor.identity(current_resource))
	var result := session.document_service.duplicate_source(current_resource, slug, title)
	if not bool(result.get("ok", false)):
		status_changed.emit("Duplicate failed: %s" % str(result.get("error", "")), true)
		return
	var duplicate: Resource = result["resource"]
	var descriptor: ForgeAuthoringTypeDescriptor = result["descriptor"]
	session.register_recovery({"ok": true, "resource": duplicate,
		"recovery_for_path": descriptor.default_path(duplicate)})
	_activate(duplicate, descriptor)
	status_changed.emit("Created an unsaved duplicate with a new stable ID.", false)


func _activate(resource: Resource, descriptor: ForgeAuthoringTypeDescriptor) -> void:
	current_resource = resource
	current_descriptor = descriptor
	session.set_active(descriptor.identity(resource))
	_source_heading.text = "%s\n%s" % [descriptor.title(resource), descriptor.identity(resource)]
	_set_state("DRAFT" if session.is_dirty() else "SAVED",
		"%s source" % descriptor.display_name)
	_rebuild_editor()
	source_activated.emit(resource, descriptor)
	_emit_history()


func _rebuild_editor() -> void:
	_clear(_editor_root)
	_editor = _editor_root
	if not has_source():
		_show_empty_state()
		return
	var visual_enabled: bool = VISUAL_SWITCHES_SCRIPT.is_enabled(domain)
	var rollout := CheckButton.new()
	rollout.name = "VisualStudioRolloutSwitch"
	rollout.text = "Visual-first studio enabled  |  Internal rollout switch"
	rollout.button_pressed = visual_enabled
	rollout.tooltip_text = (
		"Local developer preference. Disabling it exposes the complete form editor "
		+ "and never changes this source or its generated product.")
	rollout.set_meta("accessible_label", rollout.text)
	rollout.toggled.connect(func(value: bool) -> void:
		VISUAL_SWITCHES_SCRIPT.set_enabled(domain, value)
		_rebuild_editor())
	_editor_root.add_child(rollout)
	if visual_enabled:
		_build_visual_workspace()
	else:
		var fallback := Label.new()
		fallback.text = (
			"VISUAL STUDIO DISABLED LOCALLY  |  The complete canonical form editor "
			+ "remains active below; no source data was converted or removed.")
		fallback.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		_editor_root.add_child(fallback)
	_advanced_toggle = CheckButton.new()
	_advanced_toggle.name = "AdvancedSourceToggle"
	_advanced_toggle.text = "Advanced Source  |  Show every canonical field"
	_advanced_toggle.button_pressed = not visual_enabled
	_advanced_toggle.tooltip_text = (
		"Visual tools are the default. Expand this panel for every existing typed "
		+ "field without changing or removing the canonical source contract.")
	_advanced_toggle.set_meta("accessible_label", "Show Advanced Source fields")
	_editor_root.add_child(_advanced_toggle)
	_advanced_editor = VBoxContainer.new()
	_advanced_editor.name = "AdvancedSourceFields"
	_advanced_editor.visible = not visual_enabled
	_advanced_editor.add_theme_constant_override("separation", 9)
	_editor_root.add_child(_advanced_editor)
	_advanced_toggle.toggled.connect(func(value: bool) -> void:
		_advanced_editor.visible = value)
	_editor = _advanced_editor
	_add_common_fields()
	match domain:
		"structures": _build_structure_editor()
		"characters": _build_character_editor()
		"vfx": _build_vfx_editor()
		"audio": _build_audio_editor()
	_editor = _editor_root


func _build_visual_workspace() -> void:
	_visual_workspace = VBoxContainer.new()
	_visual_workspace.name = "VisualCreatorWorkspace"
	_visual_workspace.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_visual_workspace.add_theme_constant_override("separation", 8)
	_editor_root.add_child(_visual_workspace)
	var heading := Label.new()
	heading.text = "Create visually"
	heading.add_theme_font_size_override("font_size", 20)
	heading.add_theme_color_override("font_color", Color("#E6B85C"))
	_visual_workspace.add_child(heading)
	match domain:
		"structures": _build_structure_visual_workspace()
		"characters": _build_character_visual_workspace()
		"vfx": _build_vfx_visual_workspace()
		"audio": _build_audio_visual_workspace()


func _build_structure_visual_workspace() -> void:
	var owner := _structure_voxel_owner()
	if owner == null:
		var note := Label.new()
		note.text = (
			"This structure source is managed visually through module cards, connection "
			+ "previews or the procedural layout board below. Typed values remain in Advanced Source.")
		note.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		_visual_workspace.add_child(note)
		_build_structure_board_visuals()
		return
	var mode := str(owner.get("physical_authoring_mode"))
	var mode_row := HFlowContainer.new()
	var mode_label := Label.new()
	mode_label.text = "PHYSICAL SOURCE: %s" % mode.replace("_", " ").to_upper()
	mode_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	mode_row.add_child(mode_label)
	if mode == "voxel_grid":
		mode_row.add_child(_button("Use preserved element source",
			_switch_structure_source_mode.bind(owner, "elements")))
	else:
		mode_row.add_child(_button("Create visual working source",
			_convert_structure_to_visual.bind(owner)))
	_visual_workspace.add_child(mode_row)
	if mode != "voxel_grid":
		var explanation := Label.new()
		explanation.text = (
			"This schema-v1 source remains unchanged. Create a visual working source to "
			+ "copy block geometry into the 3D builder while preserving these elements as an inactive fallback.")
		explanation.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		_visual_workspace.add_child(explanation)
		return
	var voxel_source: ForgeStructureVoxelSource = owner.get("structure_voxel_source")
	if voxel_source == null:
		voxel_source = ForgeStructureVoxelSource.new()
		voxel_source.ensure_defaults()
		owner.set("structure_voxel_source", voxel_source)
	_structure_builder = ForgeStructureVoxelBuilder.new()
	_structure_builder.name = "StructureVisualBuilder"
	_structure_builder.configure(voxel_source)
	_structure_builder.source_change_requested.connect(
		_commit_structure_voxel_source.bind(owner))
	_structure_builder.status_changed.connect(status_changed.emit)
	_structure_builder.set_semantic_overlays(_structure_overlay_records(owner))
	_visual_workspace.add_child(_structure_builder)
	_build_structure_semantic_visuals(owner)


func _structure_voxel_owner() -> Resource:
	if current_resource is ForgeBlueprintDefinition \
			or current_resource is ForgeBlueprintModuleDefinition:
		return current_resource
	return null


func _convert_structure_to_visual(owner: Resource) -> void:
	var before_schema := int(owner.get("schema_version"))
	var before_mode := str(owner.get("physical_authoring_mode"))
	var before_source: ForgeStructureVoxelSource = owner.get("structure_voxel_source")
	var elements: Array[ForgeBlueprintElement] = owner.get("elements")
	var next_source := ForgeStructureVoxelSource.from_elements(elements)
	var source_id := current_descriptor.identity(current_resource)
	if not session.execute("Create non-destructive visual structure source",
			func() -> void:
				owner.set("schema_version", 2)
				owner.set("structure_voxel_source", next_source)
				owner.set("physical_authoring_mode", "voxel_grid"),
			func() -> void:
				owner.set("schema_version", before_schema)
				owner.set("structure_voxel_source", before_source)
				owner.set("physical_authoring_mode", before_mode), source_id):
		status_changed.emit("Could not create the visual structure source.", true)
		return
	_mark_edited(false)
	_rebuild_editor()
	status_changed.emit(
		"Created a visual working source; the original element source is preserved.", false)


func _switch_structure_source_mode(owner: Resource, next_mode: String) -> void:
	_commit_property(owner, "physical_authoring_mode", next_mode,
		"Switch structure physical authoring mode")
	_rebuild_editor()


func _commit_structure_voxel_source(
		next_source: ForgeStructureVoxelSource, label: String, owner: Resource) -> void:
	_commit_property(owner, "structure_voxel_source", next_source, label)


func _build_structure_semantic_visuals(owner: Resource) -> void:
	var panel := VBoxContainer.new()
	panel.name = "StructureSemanticOverlayTools"
	var title := Label.new()
	title.text = "SEMANTIC OVERLAYS & MODULE ASSEMBLY"
	title.add_theme_font_size_override("font_size", 18)
	title.add_theme_color_override("font_color", Color("#E8D6A4"))
	panel.add_child(title)
	var explanation := Label.new()
	explanation.text = (
		"Geometry never grants capacity by itself. Place doors, access, rooms, workstations, "
		+ "functional markers, sockets, networks and navigation clearance as explicit records. "
		+ "They appear as translucent viewport overlays and compile beside the voxel cells.")
	explanation.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	panel.add_child(explanation)
	var controls := HFlowContainer.new()
	var kind := OptionButton.new()
	var kinds := ["door", "access_point", "room", "workstation",
		"functional_marker", "socket", "network", "navigation_clearance"]
	if owner is ForgeBlueprintModuleDefinition:
		kinds.append("connector")
	for value in kinds:
		kind.add_item(value.replace("_", " ").capitalize())
		kind.set_item_metadata(kind.item_count - 1, value)
	controls.add_child(_labeled("Overlay tool", kind))
	var role := OptionButton.new()
	controls.add_child(_labeled("Canonical semantic role", role))
	var position_spins: Array[SpinBox] = []
	for axis in ["X", "Y", "Z"]:
		var spin := SpinBox.new()
		spin.min_value = -4096
		spin.max_value = 4096
		spin.step = 1
		position_spins.append(spin)
		controls.add_child(_labeled("Position %s" % axis, spin))
	var size_spins: Array[SpinBox] = []
	for axis in ["W", "H", "D"]:
		var spin := SpinBox.new()
		spin.min_value = 1
		spin.max_value = 256
		spin.value = 1
		spin.step = 1
		size_spins.append(spin)
		controls.add_child(_labeled("Size %s" % axis, spin))
	var refresh_roles := func(_index := 0) -> void:
		_populate_structure_role_picker(role,
			str(kind.get_item_metadata(kind.selected)))
	kind.item_selected.connect(refresh_roles)
	refresh_roles.call()
	controls.add_child(_button("Place overlay", func() -> void:
		var position := Vector3i(int(position_spins[0].value),
			int(position_spins[1].value), int(position_spins[2].value))
		var extent := Vector3i(int(size_spins[0].value),
			int(size_spins[1].value), int(size_spins[2].value))
		var role_id := str(role.get_item_metadata(role.selected)) \
			if role.item_count > 0 and role.selected >= 0 else ""
		_add_structure_semantic_record(owner,
			str(kind.get_item_metadata(kind.selected)), role_id, position, extent)))
	panel.add_child(controls)
	var cards := HFlowContainer.new()
	cards.name = "StructureSemanticOverlayCards"
	var elements := _structure_elements(owner)
	for index in elements.size():
		var element := elements[index]
		if element == null or not _is_structure_semantic_element(element):
			continue
		var card := VBoxContainer.new()
		card.custom_minimum_size = Vector2(230, 100)
		var kind_label := str(element.metadata.get("visual_semantic_kind",
			element.element_kind)).replace("_", " ").to_upper()
		var heading := Label.new()
		heading.text = kind_label
		heading.add_theme_font_size_override("font_size", 16)
		card.add_child(heading)
		var details := Label.new()
		details.text = "%s\nposition %s  |  size %s" % [
			_structure_element_role(element), str(element.position), str(element.size)]
		details.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		card.add_child(details)
		card.add_child(_button("Select & frame", func() -> void:
			_structure_builder._canvas.camera_target = Vector3(element.position) + Vector3(element.size) * 0.5
			_structure_builder._canvas.focus_records()))
		card.add_child(_button("Remove overlay",
			_remove_structure_semantic_record.bind(owner, index)))
		cards.add_child(_boxed(card))
	if owner is ForgeBlueprintModuleDefinition:
		var module := owner as ForgeBlueprintModuleDefinition
		for connector_index in module.connectors.size():
			var connector: ForgeBlueprintConnectorDefinition = module.connectors[connector_index]
			if connector == null:
				continue
			var card := VBoxContainer.new()
			card.custom_minimum_size = Vector2(230, 100)
			var heading := Label.new()
			heading.text = "CONNECTOR  |  %s" % connector.display_name
			heading.add_theme_font_size_override("font_size", 16)
			card.add_child(heading)
			var details := Label.new()
			details.text = "%s\n%s  |  clearance %s  |  navigation %s" % [
				connector.socket_role_id, str(connector.direction),
				str(connector.clearance), connector.navigation_mode]
			details.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
			card.add_child(details)
			card.add_child(_button("Remove connector",
				_remove_connector.bind(owner, connector_index)))
			cards.add_child(_boxed(card))
	panel.add_child(cards)
	if owner is ForgeBlueprintDefinition:
		var module_picker := ForgeReferencePicker.new()
		module_picker.configure(_reference_choices("structure_module"), "",
			"Save a Room / Structure Module to place reusable geometry here.")
		module_picker.reference_selected.connect(func(stable_id: String) -> void:
			_add_visual_module_instance(owner, stable_id))
		panel.add_child(_labeled("Drag/add reusable room module", module_picker))
	var state_row := HFlowContainer.new()
	var state_preview := OptionButton.new()
	for value in ["construction playback", "intact", "damaged", "repaired"]:
		state_preview.add_item(value.capitalize())
	state_preview.item_selected.connect(func(index: int) -> void:
		status_changed.emit("Structure test-pad state: %s." %
			state_preview.get_item_text(index), false))
	state_row.add_child(_labeled("Test-pad state", state_preview))
	var fit_status := Label.new()
	fit_status.text = (
		"Terrain: grid/slope presets available above  |  Entrance reachability and "
		+ "marker containment are blocking validation evidence, not inferred from blocks.")
	fit_status.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	fit_status.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	state_row.add_child(fit_status)
	panel.add_child(state_row)
	_visual_workspace.add_child(_boxed(panel))


func _populate_structure_role_picker(option: OptionButton, kind: String) -> void:
	option.clear()
	var family := "marker"
	if kind in ["socket", "connector"]:
		family = "socket"
	elif kind == "network":
		family = "network"
	var semantic := ForgeSemanticRegistry.new()
	semantic.load_and_validate()
	var records := semantic.filtered_list(family)
	for record in records:
		var role_id := str(record.get("id", ""))
		var display := str(record.get("display_name", role_id))
		var haystack := "%s %s" % [role_id, display]
		var preferred := kind.replace("_", " ") in haystack.to_lower()
		option.add_item(("Recommended  |  " if preferred else "") + display)
		option.set_item_metadata(option.item_count - 1, role_id)
		if preferred:
			option.select(option.item_count - 1)


func _add_structure_semantic_record(
		owner: Resource, kind: String, role_id: String,
		position: Vector3i, extent: Vector3i) -> void:
	if kind == "connector" and owner is ForgeBlueprintModuleDefinition:
		var connector := ForgeBlueprintConnectorDefinition.new()
		connector.connector_id = "blueprint.connector.%s.visual_%d" % [
			ForgeId.safe_filename(owner.module_id), owner.connectors.size() + 1]
		connector.display_name = "Visual Connector %d" % (owner.connectors.size() + 1)
		connector.owner_module_id = owner.module_id
		connector.position = position
		connector.opening_size = extent
		connector.clearance = extent.max(Vector3i(1, 2, 1))
		connector.socket_role_id = role_id
		var connectors: Array[ForgeBlueprintConnectorDefinition] = owner.connectors.duplicate()
		connectors.append(connector)
		_commit_property(owner, "connectors", connectors, "Place structure connector gizmo")
		_rebuild_editor()
		return
	var element := ForgeBlueprintElement.new()
	element.element_id = "semantic.%s_%03d" % [kind, _structure_elements(owner).size() + 1]
	element.element_kind = "semantic_marker" if kind not in ["socket", "network"] else kind
	element.position = position
	element.size = extent.max(Vector3i.ONE)
	element.stage_id = _structure_builder.active_stage_id
	element.metadata = {"visual_semantic_kind": kind,
		"functional_record_required": true}
	if kind == "socket" and not role_id.is_empty():
		element.socket_role_ids = PackedStringArray([role_id])
	elif kind == "network" and not role_id.is_empty():
		element.network_role_ids = PackedStringArray([role_id])
	elif not role_id.is_empty():
		element.marker_role_ids = PackedStringArray([role_id])
	var elements := _structure_elements(owner)
	elements.append(element)
	_commit_property(owner, "elements", elements, "Place structure semantic overlay")
	_rebuild_editor()


func _remove_structure_semantic_record(owner: Resource, index: int) -> void:
	var elements := _structure_elements(owner)
	if index < 0 or index >= elements.size():
		return
	elements.remove_at(index)
	_commit_property(owner, "elements", elements, "Remove structure semantic overlay")
	_rebuild_editor()


func _add_visual_module_instance(
		blueprint: ForgeBlueprintDefinition, module_id: String) -> void:
	var element := ForgeBlueprintElement.new()
	element.element_id = "module.instance_%03d" % (blueprint.elements.size() + 1)
	element.element_kind = "module"
	element.module_id = module_id
	element.stage_id = _structure_builder.active_stage_id
	var elements: Array[ForgeBlueprintElement] = blueprint.elements.duplicate()
	elements.append(element)
	var modules := blueprint.module_ids.duplicate()
	if module_id not in modules:
		modules.append(module_id)
	var before_elements := blueprint.elements
	var before_modules := blueprint.module_ids
	var source_id := current_descriptor.identity(current_resource)
	if session.execute("Place reusable structure module",
		func() -> void:
			blueprint.elements = elements
			blueprint.module_ids = modules,
		func() -> void:
			blueprint.elements = before_elements
			blueprint.module_ids = before_modules, source_id):
		_mark_edited(false)
		_rebuild_editor()


func _structure_elements(owner: Resource) -> Array[ForgeBlueprintElement]:
	var result: Array[ForgeBlueprintElement] = []
	for element in owner.get("elements"):
		if element is ForgeBlueprintElement:
			result.append(element)
	return result


func _is_structure_semantic_element(element: ForgeBlueprintElement) -> bool:
	return not element.module_id.is_empty() or element.source_id.is_empty() \
		or element.element_kind in ["marker", "semantic_marker", "socket",
			"network", "child_blueprint", "module"]


func _structure_element_role(element: ForgeBlueprintElement) -> String:
	if not element.marker_role_ids.is_empty():
		return str(element.marker_role_ids[0])
	if not element.socket_role_ids.is_empty():
		return str(element.socket_role_ids[0])
	if not element.network_role_ids.is_empty():
		return str(element.network_role_ids[0])
	if not element.module_id.is_empty():
		return element.module_id
	return "role required"


func _structure_overlay_records(owner: Resource) -> Array[Dictionary]:
	var records: Array[Dictionary] = []
	var colors := {"door": Color("#E6B85C"), "access_point": Color("#7ED68B"),
		"room": Color("#75C9D2"), "workstation": Color("#D17A70"),
		"functional_marker": Color("#B99BE6"), "socket": Color("#F4F7F9"),
		"network": Color("#69B6E8"), "navigation_clearance": Color("#9DD6D1"),
		"module": Color("#C88B58")}
	for element in _structure_elements(owner):
		if element == null or not _is_structure_semantic_element(element):
			continue
		var kind := str(element.metadata.get("visual_semantic_kind",
			"module" if not element.module_id.is_empty() else element.element_kind))
		records.append({"position": element.position,
			"name": "Semantic_%s" % ForgeId.safe_filename(element.element_id),
			"color": colors.get(kind, Color("#F2C45E")), "alpha": 0.48,
			"semantic_kind": kind, "element_id": element.element_id})
	if owner is ForgeBlueprintModuleDefinition:
		for connector in owner.connectors:
			if connector != null:
				records.append({"position": connector.position,
					"name": "Connector_%s" % ForgeId.safe_filename(connector.connector_id),
					"color": Color("#F05AC8"), "alpha": 0.58,
					"semantic_kind": "connector"})
	return records


func _build_character_visual_workspace() -> void:
	var intro := Label.new()
	intro.text = (
		"Sculpt anatomy in 3D, select parts from the hierarchy, bind semantic roles, "
		+ "pose on the dope sheet, and fit equipment visually. Slice precision and every "
		+ "raw role/track/profile record remain in Advanced Source.")
	intro.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_visual_workspace.add_child(intro)
	var plan: ForgeBodyPlanDefinition
	if current_resource is ForgeEntityDefinition:
		plan = current_resource.body_plan
	elif current_resource is ForgeBodyPlanDefinition:
		plan = current_resource
	if plan != null:
		_build_body_hierarchy_visual(plan)
		if _selected_body_part == null or _selected_body_part not in plan.body_parts:
			if not plan.body_parts.is_empty():
				_selected_body_part = plan.body_parts[0]
		if _selected_body_part != null:
			_build_character_voxel_visual(_selected_body_part, plan)
		return
	if current_resource is ForgeBodyPartDefinition:
		_build_character_voxel_visual(current_resource, null)
	elif current_resource is ForgeRigProfile:
		_build_rig_visual_workspace(current_resource)
	elif current_resource is ForgeEntityAnimationLibrary:
		_build_animation_visual_workspace(current_resource)
	elif current_resource is ForgeEntityVariantProfile:
		_build_variant_visual_workspace(current_resource)
	elif current_resource is ForgeEquipmentFitProfile:
		_build_equipment_visual_workspace(current_resource)


func _build_body_hierarchy_visual(plan: ForgeBodyPlanDefinition) -> void:
	var split := HSplitContainer.new()
	split.custom_minimum_size = Vector2(0, 190)
	var hierarchy := VBoxContainer.new()
	hierarchy.custom_minimum_size.x = 360
	var heading := Label.new()
	heading.text = "BODY-PART HIERARCHY"
	heading.add_theme_font_size_override("font_size", 17)
	hierarchy.add_child(heading)
	var parts := ItemList.new()
	parts.name = "CharacterBodyHierarchy"
	parts.custom_minimum_size = Vector2(350, 125)
	for part in _ordered_body_parts(plan):
		var depth := _body_part_depth(plan, part)
		var side := part.side_token if not part.side_token.is_empty() else "centre"
		parts.add_item("%s%s  |  %s  |  %s" % [
			"  ".repeat(depth), part.display_name, part.anatomy_role_id, side])
		parts.set_item_metadata(parts.item_count - 1, part)
		if part == _selected_body_part:
			parts.select(parts.item_count - 1)
	parts.item_selected.connect(func(index: int) -> void:
		_selected_body_part = parts.get_item_metadata(index) as ForgeBodyPartDefinition
		_rebuild_editor())
	hierarchy.add_child(parts)
	split.add_child(hierarchy)
	var actions := VBoxContainer.new()
	var explanation := Label.new()
	explanation.text = (
		"Choose a part to sculpt. Parentage, anatomy role, pivot, side and material "
		+ "stay explicit; geometry never creates gameplay semantics by implication.")
	explanation.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	actions.add_child(explanation)
	actions.add_child(_button("Add body-part template", _add_body_part.bind(plan)))
	if _selected_body_part != null:
		actions.add_child(_button("Create mirrored counterpart",
			_duplicate_mirrored_body_part.bind(plan, _selected_body_part)))
	split.add_child(actions)
	_visual_workspace.add_child(split)


func _build_character_voxel_visual(
		part: ForgeBodyPartDefinition, plan: ForgeBodyPlanDefinition) -> void:
	_character_voxel_part = part
	if part.voxel_source == null:
		var initialise := _button("Initialise 3D voxel volume",
			_initialise_body_part_volume.bind(part))
		_visual_workspace.add_child(initialise)
		return
	var toolbar := HFlowContainer.new()
	var layer := SpinBox.new()
	layer.min_value = 0
	layer.max_value = maxi(0, part.voxel_source.dimensions.y - 1)
	layer.step = 1
	toolbar.add_child(_labeled("Sculpt layer Y", layer))
	var palette := OptionButton.new()
	for index in 8:
		palette.add_item("Material role %d" % (index + 1))
		palette.set_item_metadata(index, index)
	palette.item_selected.connect(func(index: int) -> void:
		_character_palette_index = int(palette.get_item_metadata(index)))
	toolbar.add_child(_labeled("Material", palette))
	var symmetry := CheckButton.new()
	symmetry.text = "Mirror X while sculpting"
	symmetry.button_pressed = _character_symmetry
	symmetry.toggled.connect(func(value: bool) -> void: _character_symmetry = value)
	toolbar.add_child(symmetry)
	toolbar.add_child(_button("Extrude active layer", _extrude_body_part_layer.bind(part)))
	toolbar.add_child(_button("Clear active layer", func() -> void:
		_clear_body_part_layer(part, int(layer.value))))
	_visual_workspace.add_child(toolbar)
	_character_3d_canvas = ForgeVoxel3DCanvas.new()
	_character_3d_canvas.name = "CharacterVoxel3DCanvas"
	_character_3d_canvas.set_records(_voxel_volume_records(part.voxel_source, true))
	_character_3d_canvas.set_active_layer(int(layer.value))
	_character_3d_canvas.set_test_pad_mode("scale")
	_character_3d_canvas.cell_pressed.connect(_on_character_3d_cell)
	_character_3d_canvas.stroke_finished.connect(_finish_character_3d_stroke)
	layer.value_changed.connect(func(value: float) -> void:
		_character_3d_canvas.set_active_layer(int(value)))
	_visual_workspace.add_child(_character_3d_canvas)
	var status := Label.new()
	status.text = "%s  |  %d voxels  |  %s  |  parent %s" % [
		part.display_name, part.voxel_source.occupied_count(),
		part.anatomy_role_id if not part.anatomy_role_id.is_empty() else "role required",
		part.parent_part_id if not part.parent_part_id.is_empty() else "ROOT"]
	status.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_visual_workspace.add_child(status)


func _on_character_3d_cell(position: Vector3i, erase: bool, _continuous: bool) -> void:
	if _character_voxel_part == null or _character_voxel_part.voxel_source == null:
		return
	if not _character_voxel_part.voxel_source.contains(position):
		return
	if _character_voxel_pending == null:
		_character_voxel_pending = _character_voxel_part.voxel_source.duplicate(true)
	if erase:
		_character_voxel_pending.clear_cell(position)
	else:
		_character_voxel_pending.set_cell(position, _character_palette_index)
	if _character_symmetry:
		var mirrored := Vector3i(
			_character_voxel_pending.dimensions.x - 1 - position.x,
			position.y, position.z)
		if erase:
			_character_voxel_pending.clear_cell(mirrored)
		else:
			_character_voxel_pending.set_cell(mirrored, _character_palette_index)
	_character_3d_canvas.set_records(_voxel_volume_records(_character_voxel_pending, true))


func _finish_character_3d_stroke() -> void:
	if _character_voxel_pending == null or _character_voxel_part == null:
		return
	var next := _character_voxel_pending
	_character_voxel_pending = null
	_commit_property(_character_voxel_part, "voxel_source", next,
		"Sculpt character voxels")


func _build_rig_visual_workspace(rig: ForgeRigProfile) -> void:
	var board := HFlowContainer.new()
	board.name = "CharacterRigBoard"
	for binding in rig.role_bindings:
		if binding == null:
			continue
		var card := VBoxContainer.new()
		card.custom_minimum_size = Vector2(235, 95)
		var title := Label.new()
		title.text = str(binding.role_id).get_slice(".", str(binding.role_id).get_slice_count(".") - 1).capitalize()
		title.add_theme_font_size_override("font_size", 16)
		card.add_child(title)
		var details := Label.new()
		details.text = "%s\npart: %s\nparent: %s" % [binding.role_id,
			binding.body_part_id, binding.parent_role_id if not binding.parent_role_id.is_empty() else "ROOT"]
		details.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		card.add_child(details)
		board.add_child(_boxed(card))
	_visual_workspace.add_child(board)
	var joints := Label.new()
	joints.text = "%d semantic bindings  |  %d joint connection(s)  |  root %s" % [
		rig.role_bindings.size(), rig.joints.size(), rig.root_role_id]
	joints.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_visual_workspace.add_child(joints)
	var actions := HBoxContainer.new()
	actions.add_child(_button("Bind body part", _add_rig_binding.bind(rig)))
	actions.add_child(_button("Connect joint", _add_rig_joint.bind(rig)))
	actions.add_child(_button("Mirror left/right bindings", _mirror_rig_bindings.bind(rig)))
	_visual_workspace.add_child(actions)


func _build_animation_visual_workspace(library: ForgeEntityAnimationLibrary) -> void:
	if library.clips.is_empty():
		_visual_workspace.add_child(_button("Create first animation clip",
			_add_animation_clip.bind(library)))
		return
	var tabs := TabContainer.new()
	tabs.custom_minimum_size = Vector2(0, 290)
	for clip in library.clips:
		if clip == null:
			continue
		var page := VBoxContainer.new()
		page.name = ForgeId.safe_filename(clip.display_name if not clip.display_name.is_empty() else clip.clip_id)
		var controls := HBoxContainer.new()
		var timeline := ForgeAnimationTimeline.new()
		timeline.configure(clip)
		var play := CheckButton.new()
		play.text = "Play / pause"
		play.toggled.connect(timeline.set_playing)
		controls.add_child(play)
		controls.add_child(_button("Add role track", _add_animation_track.bind(clip)))
		controls.add_child(_button("Add event marker", _add_animation_marker.bind(clip)))
		var state := Label.new()
		state.text = "%s  |  %.2fs  |  %s  |  root motion %s" % [
			clip.semantic_action, clip.duration_seconds,
			"loop" if clip.looping else "one shot", clip.root_motion_policy]
		state.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		controls.add_child(state)
		page.add_child(controls)
		timeline.key_time_changed.connect(_move_animation_key.bind(clip))
		page.add_child(timeline)
		tabs.add_child(page)
	_visual_workspace.add_child(tabs)
	_visual_workspace.add_child(_button("Add animation clip", _add_animation_clip.bind(library)))


func _build_variant_visual_workspace(profile: ForgeEntityVariantProfile) -> void:
	var board := HFlowContainer.new()
	for definition in [["Materials", profile.material_variant_ids],
			["Equipment", profile.equipment_profile_ids]]:
		var card := VBoxContainer.new()
		card.custom_minimum_size = Vector2(280, 100)
		var title := Label.new()
		title.text = "%s (%d)" % [definition[0], definition[1].size()]
		title.add_theme_font_size_override("font_size", 17)
		card.add_child(title)
		var contents := Label.new()
		contents.text = "\n".join(Array(definition[1])) if definition[1].size() > 0 else "No overrides; inherits base character"
		contents.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		card.add_child(contents)
		board.add_child(_boxed(card))
	_visual_workspace.add_child(board)
	var scale_row := HBoxContainer.new()
	for axis in ["x", "y", "z"]:
		var slider := HSlider.new()
		slider.min_value = 0.25
		slider.max_value = 3.0
		slider.step = 0.01
		slider.value = profile.proportion_scale[axis]
		slider.custom_minimum_size.x = 160
		slider.drag_ended.connect(func(_changed: bool) -> void:
			var next := profile.proportion_scale
			next[axis] = slider.value
			_commit_property(profile, "proportion_scale", next,
				"Adjust character %s proportion" % axis.to_upper()))
		scale_row.add_child(_labeled("Scale %s" % axis.to_upper(), slider))
	_visual_workspace.add_child(scale_row)


func _build_equipment_visual_workspace(profile: ForgeEquipmentFitProfile) -> void:
	var preview := ForgeSpatialAudioCanvas.new()
	var fake_profile := ForgeSpatialAudioProfile.new()
	fake_profile.maximum_distance_meters = 2.0
	preview.configure(fake_profile)
	preview.set_meta("accessible_label",
		"Equipment fitting test pad. Drag the source marker as an equipment transform preview; exact transform gizmo values remain in Advanced Source.")
	_visual_workspace.add_child(preview)
	var choices := _reference_choices("rig_role")
	var picker := ForgeReferencePicker.new()
	picker.configure(choices, profile.socket_role_id,
		"Open a rig profile to expose compatible socket roles.")
	picker.reference_selected.connect(func(stable_id: String) -> void:
		_commit_property(profile, "socket_role_id", stable_id,
			"Choose equipment socket role"))
	_visual_workspace.add_child(_boxed(picker))
	var warning := Label.new()
	warning.text = "Compatibility and clipping remain blocking diagnostics; fitting never changes the equipment gameplay identity."
	warning.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_visual_workspace.add_child(warning)


func _build_vfx_visual_workspace() -> void:
	var intro := Label.new()
	intro.text = (
		"Connect effect behavior as a graph, sculpt reusable voxel forms in 3D, and "
		+ "preview bounded normal, reduced-motion and flash-safe variants. Graph layout "
		+ "is editor metadata and never changes deterministic runtime output.")
	intro.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_visual_workspace.add_child(intro)
	if current_resource is ForgeVfxGraph:
		var canvas := ForgeVfxGraphCanvas.new()
		canvas.configure(current_resource)
		canvas.graph_change_requested.connect(_commit_vfx_graph_visual.bind(current_resource))
		canvas.status_changed.connect(status_changed.emit)
		_visual_workspace.add_child(canvas)
	elif current_resource is ForgeVfxForm:
		_build_vfx_form_visual_workspace(current_resource)
	elif current_resource is ForgeVfxDefinition:
		_build_vfx_effect_visual_workspace(current_resource)


func _commit_vfx_graph_visual(
		nodes: Array[Dictionary], edges: Array[Dictionary], layout: Dictionary,
		label: String, graph: ForgeVfxGraph) -> void:
	var before_nodes := graph.nodes.duplicate(true)
	var before_edges := graph.edges.duplicate(true)
	var before_layout := graph.editor_layout.duplicate(true)
	if before_nodes == nodes and before_edges == edges and before_layout == layout:
		return
	var source_id := current_descriptor.identity(current_resource)
	if session.execute(label,
		func() -> void:
			graph.nodes = nodes.duplicate(true)
			graph.edges = edges.duplicate(true)
			graph.editor_layout = layout.duplicate(true),
		func() -> void:
			graph.nodes = before_nodes
			graph.edges = before_edges
			graph.editor_layout = before_layout, source_id):
		_mark_edited(false)
		_rebuild_editor()


func _build_vfx_form_visual_workspace(form: ForgeVfxForm) -> void:
	_vfx_visual_form = form
	var toolbar := HFlowContainer.new()
	var layer := SpinBox.new()
	layer.min_value = 0
	layer.max_value = 63
	layer.step = 1
	toolbar.add_child(_labeled("Sculpt layer Y", layer))
	var palette := OptionButton.new()
	var role_count := maxi(1, form.palette_role_ids.size())
	for index in role_count:
		var role_id := str(form.palette_role_ids[index]) if index < form.palette_role_ids.size() else "effect.role.default"
		palette.add_item(role_id)
		palette.set_item_metadata(index, index)
	palette.item_selected.connect(func(index: int) -> void:
		_vfx_visual_palette_index = int(palette.get_item_metadata(index)))
	toolbar.add_child(_labeled("Palette role", palette))
	var pad := OptionButton.new()
	for value in ["grid", "scale", "slope_scale"]:
		pad.add_item(value.replace("_", " + ").capitalize())
		pad.set_item_metadata(pad.item_count - 1, value)
	toolbar.add_child(_labeled("Context", pad))
	_visual_workspace.add_child(toolbar)
	_vfx_3d_canvas = ForgeVoxel3DCanvas.new()
	_vfx_3d_canvas.name = "VfxVoxel3DCanvas"
	_vfx_3d_canvas.set_records(_vfx_form_visual_records(form.cell_records))
	_vfx_3d_canvas.cell_pressed.connect(_on_vfx_3d_cell)
	_vfx_3d_canvas.stroke_finished.connect(_finish_vfx_3d_stroke)
	layer.value_changed.connect(func(value: float) -> void:
		_vfx_3d_canvas.set_active_layer(int(value)))
	pad.item_selected.connect(func(index: int) -> void:
		_vfx_3d_canvas.set_test_pad_mode(str(pad.get_item_metadata(index))))
	_visual_workspace.add_child(_vfx_3d_canvas)
	var summary := Label.new()
	summary.text = "%d / %d cells  |  pivot %s  |  direct 3D and slice precision are both available" % [
		form.cell_records.size(), form.maximum_cells, str(form.pivot)]
	_visual_workspace.add_child(summary)


func _on_vfx_3d_cell(position: Vector3i, erase: bool, _continuous: bool) -> void:
	if _vfx_visual_form == null:
		return
	if not _vfx_visual_stroke_active:
		_vfx_visual_pending = _vfx_visual_form.cell_records.duplicate(true)
		_vfx_visual_stroke_active = true
	var found := -1
	for index in _vfx_visual_pending.size():
		if _array_vector3i(_vfx_visual_pending[index].get("position", [])) == position:
			found = index
			break
	if erase:
		if found >= 0:
			_vfx_visual_pending.remove_at(found)
	elif found >= 0:
		_vfx_visual_pending[found]["palette_index"] = _vfx_visual_palette_index
	elif _vfx_visual_pending.size() < _vfx_visual_form.maximum_cells:
		_vfx_visual_pending.append({"position": [position.x, position.y, position.z],
			"palette_index": _vfx_visual_palette_index,
			"palette_role_id": str(_vfx_visual_form.palette_role_ids[_vfx_visual_palette_index])
				if _vfx_visual_palette_index < _vfx_visual_form.palette_role_ids.size() else ""})
	_vfx_3d_canvas.set_records(_vfx_form_visual_records(_vfx_visual_pending))


func _finish_vfx_3d_stroke() -> void:
	if _vfx_visual_form == null or not _vfx_visual_stroke_active:
		return
	var records := _vfx_visual_pending.duplicate(true)
	_vfx_visual_pending.clear()
	_vfx_visual_stroke_active = false
	_commit_property(_vfx_visual_form, "cell_records", records, "Sculpt VFX form in 3D")


func _build_vfx_effect_visual_workspace(effect: ForgeVfxDefinition) -> void:
	var split := HSplitContainer.new()
	for definition in [["Behavior graph", "vfx_graph", effect.graph_id],
			["Reusable voxel forms", "vfx_form", ""]]:
		var stack := VBoxContainer.new()
		stack.custom_minimum_size.x = 360
		var title := Label.new()
		title.text = str(definition[0]).to_upper()
		title.add_theme_font_size_override("font_size", 17)
		stack.add_child(title)
		var picker := ForgeReferencePicker.new()
		picker.configure(_reference_choices(str(definition[1])), str(definition[2]))
		if str(definition[1]) == "vfx_graph":
			picker.reference_selected.connect(func(stable_id: String) -> void:
				_commit_property(effect, "graph_id", stable_id, "Choose VFX graph"))
		else:
			picker.reference_selected.connect(func(stable_id: String) -> void:
				var ids := effect.form_ids.duplicate()
				if stable_id not in ids:
					ids.append(stable_id)
					_commit_property(effect, "form_ids", ids, "Add VFX form"))
		stack.add_child(picker)
		split.add_child(stack)
	_visual_workspace.add_child(split)
	var controls := HBoxContainer.new()
	for mode in ["Normal", "Reduced motion", "Flash safe"]:
		controls.add_child(_button("Preview %s" % mode,
			_preview_vfx_accessibility.bind(effect, mode.to_lower().replace(" ", "_"))))
	var seed := SpinBox.new()
	seed.min_value = 0
	seed.max_value = 2147483647
	seed.value = 1
	controls.add_child(_labeled("Simulation seed", seed))
	controls.add_child(_button("Restart same seed", preview_current))
	_visual_workspace.add_child(controls)


func _build_audio_visual_workspace() -> void:
	var intro := Label.new()
	intro.text = (
		"Shape sound instead of transcribing numbers: drag waveform and envelope handles, "
		+ "mix event lanes, audition the playable keyboard, and test distance, direction, "
		+ "occlusion and reverb in an isolated spatial pad.")
	intro.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_visual_workspace.add_child(intro)
	if current_resource is ForgeSynthPatchDefinition:
		_build_synth_visual_workspace(current_resource)
	elif current_resource is ForgeSoundSource:
		_build_sound_source_visual_workspace(current_resource)
	elif current_resource is ForgeSoundEvent:
		_build_sound_event_visual_workspace(current_resource)
	elif current_resource is ForgeSpatialAudioProfile:
		_build_spatial_audio_visual_workspace(current_resource)


func _build_synth_visual_workspace(patch: ForgeSynthPatchDefinition) -> void:
	var split := HSplitContainer.new()
	var envelope_stack := VBoxContainer.new()
	var envelope_title := Label.new()
	envelope_title.text = "AMPLITUDE ENVELOPE"
	envelope_title.add_theme_font_size_override("font_size", 17)
	envelope_stack.add_child(envelope_title)
	var envelope := ForgeSynthEnvelopeCanvas.new()
	envelope.configure(patch.amplitude_envelope)
	envelope.envelope_changed.connect(func(value: Dictionary) -> void:
		_commit_property(patch, "amplitude_envelope", value, "Shape synth envelope"))
	envelope_stack.add_child(envelope)
	split.add_child(envelope_stack)
	var mixer := VBoxContainer.new()
	mixer.custom_minimum_size.x = 330
	var mixer_title := Label.new()
	mixer_title.text = "OSCILLATOR MIXER"
	mixer_title.add_theme_font_size_override("font_size", 17)
	mixer.add_child(mixer_title)
	for index in patch.oscillators.size():
		var oscillator: Dictionary = patch.oscillators[index]
		var row := HBoxContainer.new()
		var name := Label.new()
		name.text = str(oscillator.get("waveform", "sine")).capitalize()
		name.custom_minimum_size.x = 90
		row.add_child(name)
		var level := HSlider.new()
		level.min_value = 0.0
		level.max_value = 1.0
		level.step = 0.01
		level.value = float(oscillator.get("level", 0.8))
		level.custom_minimum_size.x = 170
		level.drag_ended.connect(func(_changed: bool) -> void:
			_update_oscillator(patch, index, "level", level.value))
		row.add_child(level)
		row.add_child(_button("Remove", _remove_oscillator.bind(patch, index)))
		mixer.add_child(row)
	mixer.add_child(_button("Add oscillator", _add_oscillator.bind(patch)))
	split.add_child(mixer)
	_visual_workspace.add_child(split)
	_build_visual_synth_keyboard(patch)


func _build_visual_synth_keyboard(patch: ForgeSynthPatchDefinition) -> void:
	if _audio_player == null or not is_instance_valid(_audio_player):
		_audio_player = AudioStreamPlayer.new()
		_audio_player.name = "ForgeSynthPreviewPlayer"
		add_child(_audio_player)
	var keyboard := GridContainer.new()
	keyboard.name = "VisualSynthKeyboard"
	keyboard.columns = 12
	for note in range(48, 72):
		var key := _button(_note_name(note), _play_synth_note.bind(note))
		key.custom_minimum_size = Vector2(52, 48)
		key.tooltip_text = "Play %s at current tuning." % _note_name(note)
		keyboard.add_child(key)
	_visual_workspace.add_child(keyboard)
	var actions := HBoxContainer.new()
	actions.add_child(_button("Create editable Sound Source",
		_create_editable_source_from_synth.bind(patch)))
	actions.add_child(_button("Create layered Sound Event",
		_create_sound_event_from_synth.bind(patch)))
	_visual_workspace.add_child(actions)


func _build_sound_source_visual_workspace(source: ForgeSoundSource) -> void:
	var waveform := ForgeWaveformPreview.new()
	waveform.name = "VisualWaveformEditor"
	waveform.configure_editor(source)
	waveform.edit_completed.connect(_complete_waveform_visual_edit.bind(source))
	_visual_workspace.add_child(waveform)
	var actions := HBoxContainer.new()
	actions.add_child(_button("Add full-length region", _add_full_audio_region.bind(source)))
	actions.add_child(_button("Create safe loop", _set_safe_loop_markers.bind(source)))
	actions.add_child(_button("Clear loop", _clear_loop_markers.bind(source)))
	actions.add_child(_button("Play", _play_sound_source.bind(source)))
	actions.add_child(_button("Create layered event", _create_sound_event_from_source.bind(source)))
	_visual_workspace.add_child(actions)
	var provenance := Label.new()
	provenance.text = "RIGHTS %s  |  %s  |  %d Hz  |  %.2fs  |  %s" % [
		source.rights_status.to_upper(), source.channel_layout, source.sample_rate_hz,
		source.duration_seconds,
		"provenance present" if not source.source_hash.is_empty() else "source hash required"]
	provenance.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_visual_workspace.add_child(provenance)


func _complete_waveform_visual_edit(values: Dictionary, source: ForgeSoundSource) -> void:
	var before_start := source.loop_start_seconds
	var before_end := source.loop_end_seconds
	var next_start := float(values.get("loop_start_seconds", before_start))
	var next_end := float(values.get("loop_end_seconds", before_end))
	if before_start != next_start or before_end != next_end:
		var source_id := current_descriptor.identity(current_resource)
		if session.execute("Move waveform loop handles",
			func() -> void:
				source.loop_start_seconds = next_start
				source.loop_end_seconds = next_end,
			func() -> void:
				source.loop_start_seconds = before_start
				source.loop_end_seconds = before_end, source_id):
			_mark_edited(false)
	var trim_start := float(values.get("trim_start_seconds", 0.0))
	var trim_end := float(values.get("trim_end_seconds", source.duration_seconds))
	var fade_in := float(values.get("fade_in_seconds", 0.0))
	var fade_out := float(values.get("fade_out_seconds", 0.0))
	if trim_start > 0.0001 or trim_end < source.duration_seconds - 0.0001 \
			or fade_in > 0.0001 or fade_out > 0.0001:
		_apply_audio_transform(source, {"trim_start_seconds": trim_start,
			"trim_end_seconds": trim_end, "fade_in_seconds": fade_in,
			"fade_out_seconds": fade_out})


func _build_sound_event_visual_workspace(event: ForgeSoundEvent) -> void:
	var lanes := VBoxContainer.new()
	lanes.name = "SoundEventVisualLanes"
	for index in event.layer_records.size():
		var layer: Dictionary = event.layer_records[index]
		var panel := VBoxContainer.new()
		var header := HBoxContainer.new()
		var title := Label.new()
		title.text = "%02d  %s" % [index + 1, str(layer.get("layer_id", "layer"))]
		title.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		title.add_theme_font_size_override("font_size", 16)
		header.add_child(title)
		var mute := CheckButton.new()
		mute.text = "Mute"
		mute.button_pressed = bool(layer.get("muted", false))
		mute.toggled.connect(func(value: bool) -> void:
			_update_sound_layer(event, index, "muted", value))
		header.add_child(mute)
		var solo := CheckButton.new()
		solo.text = "Solo"
		solo.button_pressed = bool(layer.get("solo", false))
		solo.toggled.connect(func(value: bool) -> void:
			_update_sound_layer(event, index, "solo", value))
		header.add_child(solo)
		header.add_child(_button("Audition", _audition_sound_layer.bind(layer)))
		header.add_child(_button("Up", _move_sound_layer.bind(event, index, -1)))
		header.add_child(_button("Down", _move_sound_layer.bind(event, index, 1)))
		header.add_child(_button("Remove", _remove_sound_layer.bind(event, index)))
		panel.add_child(header)
		var picker := ForgeReferencePicker.new()
		picker.configure(_reference_choices("sound_source"), str(layer.get("source_id", "")))
		picker.reference_selected.connect(func(stable_id: String) -> void:
			_update_sound_layer(event, index, "source_id", stable_id))
		panel.add_child(picker)
		var controls := HBoxContainer.new()
		for definition in [["Gain dB", "gain_db", -60.0, 12.0, 0.1],
				["Pitch", "pitch_scale", 0.125, 8.0, 0.01],
				["Delay", "start_delay_seconds", 0.0, 60.0, 0.01]]:
			var slider := HSlider.new()
			slider.min_value = float(definition[2])
			slider.max_value = float(definition[3])
			slider.step = float(definition[4])
			slider.value = float(layer.get(str(definition[1]), 0.0))
			slider.custom_minimum_size.x = 160
			slider.drag_ended.connect(func(_changed: bool) -> void:
				_update_sound_layer(event, index, str(definition[1]), slider.value))
			controls.add_child(_labeled(str(definition[0]), slider))
		panel.add_child(controls)
		lanes.add_child(_boxed(panel))
	_visual_workspace.add_child(lanes)
	_visual_workspace.add_child(_button("Add source lane", _add_sound_layer.bind(event)))
	var state := Label.new()
	state.text = "%s  |  %s  |  max %d voices  |  caption %s  |  critical cue %s" % [
		event.variation_policy, event.loop_policy, event.maximum_voices,
		event.caption_key if not event.caption_key.is_empty() else "missing",
		"yes" if event.critical_cue else "no"]
	state.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_visual_workspace.add_child(state)


func _build_spatial_audio_visual_workspace(profile: ForgeSpatialAudioProfile) -> void:
	var controls := HBoxContainer.new()
	var barrier := CheckButton.new()
	barrier.text = "Occlusion barrier"
	controls.add_child(barrier)
	var explanation := Label.new()
	explanation.text = "Drag listener/source. Press O to toggle barrier. Preview is isolated from gameplay saves."
	explanation.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	controls.add_child(explanation)
	_visual_workspace.add_child(controls)
	var canvas := ForgeSpatialAudioCanvas.new()
	canvas.configure(profile)
	barrier.toggled.connect(func(value: bool) -> void:
		canvas.barrier_enabled = value
		canvas.queue_redraw())
	_visual_workspace.add_child(canvas)
	var accessibility := Label.new()
	accessibility.text = "Attenuation %s  |  Direction %.0f%%  |  Occlusion %s  |  Reverb %.0f%%" % [
		profile.attenuation_model, profile.directionality * 100.0,
		profile.occlusion_policy, profile.reverb_send * 100.0]
	accessibility.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_visual_workspace.add_child(accessibility)


func _build_structure_board_visuals() -> void:
	if current_resource is ForgeBlueprintModuleSet:
		var module_set := current_resource as ForgeBlueprintModuleSet
		var board := HFlowContainer.new()
		board.name = "StructureModuleBoard"
		for module_id in module_set.module_ids:
			var card := Button.new()
			card.text = "%s\nWeight %.2f%s%s" % [
				str(module_id), module_set.weight_for(module_id),
				"\nSTART" if module_id in module_set.start_module_ids else "",
				"\nEND" if module_id in module_set.end_module_ids else ""]
			card.custom_minimum_size = Vector2(210, 90)
			card.tooltip_text = "Module card; select it in Advanced Source to change exact IDs and weight."
			board.add_child(card)
		_visual_workspace.add_child(board)
	elif current_resource is ForgeProceduralStructureRuleSet:
		var rules := current_resource as ForgeProceduralStructureRuleSet
		var summary := Label.new()
		summary.name = "ProceduralStructureVisualSummary"
		summary.text = (
			"GENERATED LAYOUT BOARD\nSeed %d  |  Up to %d modules  |  Depth %d  |  "
			+ "Open connectors %d  |  Loops %s  |  %s") % [
			rules.seed, rules.maximum_modules, rules.maximum_depth,
			rules.maximum_open_connectors, "allowed" if rules.allow_loops else "blocked",
			"continuing" if rules.continuing else "finite"]
		summary.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		_visual_workspace.add_child(summary)
		_visual_workspace.add_child(_button("Generate deterministic 3D layout",
			_preview_structure_rules.bind(rules)))
	elif current_resource is ForgeBlueprintStateDefinition:
		var state := current_resource as ForgeBlueprintStateDefinition
		var state_card := Label.new()
		state_card.text = (
			"STATE OVERLAY  |  %s  |  Damage %.0f%%\n%d additions, %d removals, "
			+ "%d enabled marker roles, %d disabled marker roles") % [
			state.state_kind.replace("_", " ").to_upper(), state.damage_ratio * 100.0,
			state.add_element_ids.size(), state.remove_element_ids.size(),
			state.enable_marker_role_ids.size(), state.disable_marker_role_ids.size()]
		state_card.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		_visual_workspace.add_child(state_card)


func _add_common_fields() -> void:
	_add_heading("Source identity")
	var display := LineEdit.new()
	display.text = current_descriptor.title(current_resource)
	display.editable = not current_descriptor.display_property.is_empty()
	display.tooltip_text = "Display name; changing this does not change stable identity."
	if not current_descriptor.display_property.is_empty():
		display.text_submitted.connect(func(value: String) -> void:
			_commit_property(current_resource, current_descriptor.display_property,
				value.strip_edges(), "Rename source"))
		display.focus_exited.connect(func() -> void:
			_commit_property(current_resource, current_descriptor.display_property,
				display.text.strip_edges(), "Rename source"))
	_editor.add_child(_labeled("Display name", display))
	var stable := LineEdit.new()
	stable.text = current_descriptor.identity(current_resource)
	stable.editable = false
	stable.tooltip_text = "Stable identity is read-only after source creation. Duplicate to create a new identity."
	_editor.add_child(_labeled("Stable ID (read-only)", stable))


func _build_structure_editor() -> void:
	if current_resource is ForgeBlueprintDefinition:
		_build_blueprint_editor(current_resource)
	elif current_resource is ForgeBlueprintModuleDefinition:
		_build_module_editor(current_resource)
	elif current_resource is ForgeBlueprintModuleSet:
		_build_module_set_editor(current_resource)
	elif current_resource is ForgeProceduralStructureRuleSet:
		_build_rule_set_editor(current_resource)
	elif current_resource is ForgeBlueprintStateDefinition:
		_build_blueprint_state_editor(current_resource)


func _build_blueprint_editor(blueprint: ForgeBlueprintDefinition) -> void:
	_add_heading("Blueprint composition")
	_editor.add_child(_line_property("Lifecycle", blueprint, "lifecycle"))
	_editor.add_child(_packed_lines_property("Reusable module IDs", blueprint, "module_ids"))
	_editor.add_child(_packed_lines_property("Gameplay definition IDs", blueprint, "definition_ids"))
	_editor.add_child(_packed_lines_property("Construction contract IDs", blueprint, "contract_ids"))
	if blueprint.placement_profile == null:
		blueprint.placement_profile = ForgePlacementProfile.new()
		blueprint.placement_profile.placement_profile_id = (
			"blueprint.placement_profile.%s" % ForgeId.safe_filename(
				blueprint.blueprint_id.trim_prefix("blueprint.leyforge.")))
	_add_heading("Placement and footprint")
	_editor.add_child(_line_property("Placement profile ID",
		blueprint.placement_profile, "placement_profile_id"))
	_editor.add_child(_vector3i_property("Footprint minimum",
		blueprint.placement_profile, "footprint_min"))
	_editor.add_child(_vector3i_property("Footprint maximum",
		blueprint.placement_profile, "footprint_max"))
	_editor.add_child(_integer_property("Maximum slope",
		blueprint.placement_profile, "max_slope", 0, 90))
	_editor.add_child(_option_property("Terrain handling",
		blueprint.placement_profile, "terrain_mode",
		["none", "minor_levelling", "foundation_fill", "terrain_cut"] ))
	_editor.add_child(_packed_lines_property("Required placement sockets",
		blueprint.placement_profile, "required_socket_role_ids"))
	if blueprint.material_role_set == null:
		blueprint.material_role_set = ForgeBlueprintMaterialRoleSet.new()
		blueprint.material_role_set.material_role_set_id = (
			"blueprint.material_role_set.%s" % ForgeId.safe_filename(
				blueprint.blueprint_id.trim_prefix("blueprint.leyforge.")))
	_add_heading("Material roles")
	_editor.add_child(_line_property("Material role set ID",
		blueprint.material_role_set, "material_role_set_id"))
	_editor.add_child(_dictionary_lines_property("Role to Material DNA bindings",
		blueprint.material_role_set, "role_bindings"))
	_editor.add_child(_packed_lines_property("Required material roles",
		blueprint.material_role_set, "required_role_ids"))
	_add_heading("Placed elements (%d)" % blueprint.elements.size())
	for index in blueprint.elements.size():
		var element := blueprint.elements[index]
		if element == null:
			continue
		var panel := VBoxContainer.new()
		panel.add_child(_line_property("Element ID", element, "element_id"))
		panel.add_child(_line_property("Module ID", element, "module_id"))
		panel.add_child(_vector3i_property("Grid position", element, "position"))
		panel.add_child(_button("Remove element", _remove_blueprint_element.bind(blueprint, index)))
		_editor.add_child(_boxed(panel))
	_editor.add_child(_button("Add placed module", _add_blueprint_element.bind(blueprint)))
	_add_heading("Construction stages (%d)" % blueprint.construction_deltas.size())
	for delta in blueprint.construction_deltas:
		if delta == null:
			continue
		var stage_panel := VBoxContainer.new()
		stage_panel.add_child(_line_property("Delta ID", delta, "delta_id"))
		stage_panel.add_child(_line_property("Stage ID", delta, "stage_id"))
		stage_panel.add_child(_packed_lines_property("Add element IDs", delta, "add_element_ids"))
		stage_panel.add_child(_packed_lines_property("Remove element IDs", delta, "remove_element_ids"))
		stage_panel.add_child(_packed_lines_property("Required earlier stages", delta,
			"dependency_stage_ids"))
		_editor.add_child(_boxed(stage_panel))
	_editor.add_child(_button("Add construction stage", _add_construction_delta.bind(blueprint)))


func _build_module_editor(module: ForgeBlueprintModuleDefinition) -> void:
	_add_heading("Reusable room / structure module")
	_editor.add_child(_line_property("Module kind", module, "module_kind"))
	_editor.add_child(_packed_lines_property("Dependencies", module, "dependency_ids"))
	_add_heading("Module elements (%d)" % module.elements.size())
	for index in module.elements.size():
		var element := module.elements[index]
		if element == null:
			continue
		var element_panel := VBoxContainer.new()
		element_panel.add_child(_line_property("Element ID", element, "element_id"))
		element_panel.add_child(_option_property("Element kind", element, "element_kind",
			["block", "marker", "socket", "network", "child_blueprint"]))
		element_panel.add_child(_line_property("Source block / item ID", element, "source_id"))
		element_panel.add_child(_line_property("Material role", element, "material_role_id"))
		element_panel.add_child(_vector3i_property("Grid position", element, "position"))
		element_panel.add_child(_vector3i_property("Grid size", element, "size"))
		element_panel.add_child(_integer_property("Quarter-turn rotation", element,
			"rotation_quarters", 0, 3))
		element_panel.add_child(_button("Remove module element",
			_remove_module_element.bind(module, index)))
		_editor.add_child(_boxed(element_panel))
	_editor.add_child(_button("Add module element", _add_module_element.bind(module)))
	_add_heading("Connection points (%d)" % module.connectors.size())
	var explanation := Label.new()
	explanation.text = (
		"A connection point is a doorway, corridor, stair, shaft or continuation edge. "
		+ "Compatible socket roles and tags snap modules together; direction controls facing.")
	explanation.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_editor.add_child(explanation)
	for index in module.connectors.size():
		var connector := module.connectors[index]
		if connector == null:
			continue
		var panel := VBoxContainer.new()
		panel.add_child(_line_property("Connection ID", connector, "connector_id"))
		panel.add_child(_line_property("Name", connector, "display_name"))
		panel.add_child(_line_property("Socket role", connector, "socket_role_id"))
		panel.add_child(_vector3i_property("Local position", connector, "position"))
		panel.add_child(_direction_property(connector))
		panel.add_child(_packed_lines_property("Compatibility tags", connector, "connection_tags"))
		panel.add_child(_line_property("Compatibility group", connector, "compatibility_group"))
		panel.add_child(_vector3i_property("Opening size", connector, "opening_size"))
		panel.add_child(_vector3i_property("Required clearance", connector, "clearance"))
		panel.add_child(_integer_property("Elevation change", connector, "elevation_delta", -256, 256))
		panel.add_child(_option_property("Navigation mode", connector, "navigation_mode",
			["walk", "crawl", "climb", "jump", "rail", "none"]))
		panel.add_child(_option_property("Terrain policy", connector, "terrain_policy",
			["inherit_module", "surface_fit", "carve", "bridge", "none"]))
		panel.add_child(_packed_int_lines_property("Allowed quarter-turn rotations", connector,
			"allowed_rotations"))
		panel.add_child(_button("Remove connection point",
			_remove_connector.bind(module, index)))
		_editor.add_child(_boxed(panel))
	_editor.add_child(_button("Add connection point", _add_connector.bind(module)))


func _build_module_set_editor(module_set: ForgeBlueprintModuleSet) -> void:
	_add_heading("Room / structure set")
	_editor.add_child(_packed_lines_property("Module IDs", module_set, "module_ids"))
	_editor.add_child(_packed_lines_property("Allowed start modules", module_set, "start_module_ids"))
	_editor.add_child(_packed_lines_property("Preferred end modules", module_set, "end_module_ids"))
	_editor.add_child(_option_property("Continuation policy", module_set,
		"continuation_policy", ["finite", "continuing"]))
	_add_heading("Selection weights")
	for module_id in module_set.module_ids:
		var spin := SpinBox.new()
		spin.min_value = 0.01
		spin.max_value = 100.0
		spin.step = 0.1
		spin.value = module_set.weight_for(module_id)
		spin.value_changed.connect(func(value: float) -> void:
			var weights := module_set.module_weights.duplicate(true)
			weights[module_id] = value
			_commit_property(module_set, "module_weights", weights,
				"Change module weight"))
		_editor.add_child(_labeled(str(module_id), spin))


func _build_rule_set_editor(rules: ForgeProceduralStructureRuleSet) -> void:
	_add_heading("Dungeon / continuing-structure generation")
	_editor.add_child(_line_property("Structure set ID", rules, "module_set_id"))
	_editor.add_child(_integer_property("Seed", rules, "seed", 0, 2147483647))
	_editor.add_child(_integer_property("Maximum modules", rules, "maximum_modules", 1, 4096))
	_editor.add_child(_integer_property("Maximum depth", rules, "maximum_depth", 0, 256))
	_editor.add_child(_integer_property("Open connection budget", rules,
		"maximum_open_connectors", 1, 4096))
	_editor.add_child(_float_property("Termination chance", rules,
		"termination_chance", 0.0, 1.0, 0.01))
	_editor.add_child(_bool_property("Continuing / resumable generation", rules, "continuing"))
	_editor.add_child(_bool_property("Allow loops", rules, "allow_loops"))
	_editor.add_child(_integer_property("Maximum repeats per module", rules,
		"maximum_repeats_per_module", 1, 4096))
	_editor.add_child(_integer_property("Modules before encounter", rules,
		"minimum_modules_before_encounter", 0, 4096))
	_editor.add_child(_integer_property("Modules before terminal", rules,
		"minimum_modules_before_terminal", 0, 4096))
	_editor.add_child(_option_property("Dead-end policy", rules, "dead_end_policy",
		["terminate_with_cap", "leave_open", "seal"]))
	_editor.add_child(_integer_property("Continuation checkpoint interval", rules,
		"continuation_checkpoint_interval", 1, 4096))
	_editor.add_child(_button("Generate deterministic layout preview",
		_preview_structure_rules.bind(rules)))


func _build_blueprint_state_editor(state: ForgeBlueprintStateDefinition) -> void:
	_add_heading("Construction, damage, occupation or repair state")
	_editor.add_child(_line_property("Owning blueprint ID", state, "blueprint_id"))
	_editor.add_child(_option_property("State kind", state, "state_kind", [
		"intact", "under_construction", "light_damage", "heavy_damage",
		"repaired", "occupied", "corrupted"]))
	_editor.add_child(_line_property("Parent state ID", state, "parent_state_id"))
	_editor.add_child(_float_property("Damage ratio", state, "damage_ratio", 0.0, 1.0, 0.01))
	_editor.add_child(_packed_lines_property("Add element IDs", state, "add_element_ids"))
	_editor.add_child(_packed_lines_property("Remove element IDs", state, "remove_element_ids"))
	_editor.add_child(_dictionary_lines_property("Material role overrides", state,
		"material_role_overrides"))
	_editor.add_child(_packed_lines_property("Enable marker roles", state,
		"enable_marker_role_ids"))
	_editor.add_child(_packed_lines_property("Disable marker roles", state,
		"disable_marker_role_ids"))
	_editor.add_child(_packed_lines_property("Surface layers", state, "surface_layer_ids"))
	_editor.add_child(_packed_lines_property("Repair resources", state, "repair_resource_ids"))


func _build_character_editor() -> void:
	if current_resource is ForgeEntityDefinition:
		var entity := current_resource as ForgeEntityDefinition
		_add_heading("Character / creature body")
		_editor.add_child(_option_property("Body family", entity, "body_family",
			["humanoid", "quadruped", "avian", "serpentine", "arthropod", "custom"]))
		_editor.add_child(_vector3_property("World dimensions (metres)", entity,
			"world_dimensions_meters", 0.01, 64.0))
		_editor.add_child(_line_property("Density profile", entity, "density_profile_id"))
		_editor.add_child(_packed_lines_property("Material DNA IDs", entity, "material_dna_ids"))
		_editor.add_child(_packed_lines_property("Gameplay definition IDs", entity,
			"gameplay_definition_ids"))
		if entity.body_plan != null:
			_add_body_plan_controls(entity.body_plan)
	elif current_resource is ForgeBodyPlanDefinition:
		_add_body_plan_controls(current_resource)
	elif current_resource is ForgeBodyPartDefinition:
		_build_body_part_editor(current_resource)
	elif current_resource is ForgeRigProfile:
		_build_rig_editor(current_resource)
	elif current_resource is ForgeEntityAnimationLibrary:
		_build_animation_editor(current_resource)
	elif current_resource is ForgeEntityVariantProfile:
		_build_variant_editor(current_resource)
	elif current_resource is ForgeEquipmentFitProfile:
		_build_equipment_editor(current_resource)


func _add_body_plan_controls(plan: ForgeBodyPlanDefinition) -> void:
	_add_heading("Body plan parts (%d)" % plan.body_parts.size())
	_editor.add_child(_line_property("Body-plan ID", plan, "body_plan_id"))
	_editor.add_child(_line_property("Root part ID", plan, "root_part_id"))
	for part in plan.body_parts:
		if part == null:
			continue
		var row := HBoxContainer.new()
		var label := Label.new()
		label.text = "%s  |  %s  |  parent: %s" % [
			part.display_name, part.body_part_id,
			part.parent_part_id if not part.parent_part_id.is_empty() else "ROOT"]
		label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		row.add_child(label)
		row.add_child(_button("Edit voxels", _select_body_part.bind(part)))
		_editor.add_child(row)
	_editor.add_child(_button("Add body part", _add_body_part.bind(plan)))
	if _selected_body_part != null and _selected_body_part in plan.body_parts:
		_build_body_part_editor(_selected_body_part)


func _build_body_part_editor(part: ForgeBodyPartDefinition) -> void:
	_selected_body_part = part
	_add_heading("Voxel body-part sculpting")
	_editor.add_child(_line_property("Part ID", part, "body_part_id"))
	_editor.add_child(_line_property("Parent part ID", part, "parent_part_id"))
	_editor.add_child(_line_property("Anatomy role", part, "anatomy_role_id"))
	_editor.add_child(_vector3_property("Local position (metres)", part,
		"local_position_meters", -64.0, 64.0))
	if part.voxel_source == null:
		part.voxel_source = ForgeVoxelVolume.new()
		part.voxel_source.dimensions = Vector3i(8, 8, 8)
		part.voxel_source.density_profile = part.density_profile_id
		part.voxel_source.ensure_storage()
	_voxel_palette = ForgePaletteDefinition.new()
	_voxel_palette.ensure_default_entries()
	var tools := HBoxContainer.new()
	var axis := OptionButton.new()
	for label in ["X slices", "Y slices", "Z slices"]:
		axis.add_item(label)
	axis.select(2)
	tools.add_child(_labeled("Slice axis", axis))
	var slice := SpinBox.new()
	slice.min_value = 0
	slice.max_value = part.voxel_source.dimensions.z - 1
	slice.value = 0
	tools.add_child(_labeled("Slice", slice))
	var palette_index := SpinBox.new()
	palette_index.min_value = 0
	palette_index.max_value = _voxel_palette.entries.size() - 1
	palette_index.value = 0
	tools.add_child(_labeled("Palette role", palette_index))
	_editor.add_child(tools)
	_voxel_canvas = ForgeVoxelSliceCanvas.new()
	_voxel_canvas.name = "CharacterVoxelCanvas"
	_voxel_canvas.configure(part.voxel_source, _voxel_palette)
	_voxel_canvas.slice_axis = 2
	_voxel_canvas.slice_index = 0
	_voxel_canvas.voxel_edit_requested.connect(func(position: Vector3i, value: int) -> void:
		var before := part.voxel_source.get_cell(position)
		if before == value:
			return
		var source_id := current_descriptor.identity(current_resource)
		session.execute("Sculpt body voxel",
			func() -> void:
				part.voxel_source.set_cell(position, value) if value >= 0 \
					else part.voxel_source.clear_cell(position),
			func() -> void:
				part.voxel_source.set_cell(position, before) if before >= 0 \
					else part.voxel_source.clear_cell(position), source_id)
		_mark_edited(false)
		_voxel_canvas.queue_redraw())
	axis.item_selected.connect(func(index: int) -> void:
		_voxel_canvas.slice_axis = index
		var dimensions := part.voxel_source.dimensions
		slice.max_value = [dimensions.x, dimensions.y, dimensions.z][index] - 1
		slice.value = 0
		_voxel_canvas.slice_index = 0
		_voxel_canvas.queue_redraw())
	slice.value_changed.connect(func(value: float) -> void:
		_voxel_canvas.slice_index = int(value)
		_voxel_canvas.queue_redraw())
	palette_index.value_changed.connect(func(value: float) -> void:
		_voxel_canvas.active_palette_index = int(value))
	_editor.add_child(_voxel_canvas)


func _build_rig_editor(rig: ForgeRigProfile) -> void:
	_add_heading("Semantic rig")
	_editor.add_child(_line_property("Entity definition ID", rig, "entity_definition_id"))
	_editor.add_child(_line_property("Body plan ID", rig, "body_plan_id"))
	_editor.add_child(_line_property("Root role ID", rig, "root_role_id"))
	_editor.add_child(_line_property("Spatial map ID", rig, "spatial_map_id"))
	_editor.add_child(_packed_lines_property("Socket references", rig, "socket_reference_ids"))
	_add_heading("Role bindings (%d)" % rig.role_bindings.size())
	for binding in rig.role_bindings:
		if binding == null:
			continue
		var binding_panel := VBoxContainer.new()
		binding_panel.add_child(_line_property("Semantic role", binding, "role_id"))
		binding_panel.add_child(_line_property("Body part ID", binding, "body_part_id"))
		binding_panel.add_child(_line_property("Parent role", binding, "parent_role_id"))
		binding_panel.add_child(_line_property("Joint ID", binding, "joint_id"))
		binding_panel.add_child(_option_property("Binding mode", binding, "binding_mode",
			Array(ForgeRigRoleBinding.BINDING_MODES)))
		_editor.add_child(_boxed(binding_panel))
	_editor.add_child(_button("Add role binding", _add_rig_binding.bind(rig)))
	_add_heading("Joints (%d)" % rig.joints.size())
	for joint in rig.joints:
		if joint == null:
			continue
		var joint_panel := VBoxContainer.new()
		joint_panel.add_child(_line_property("Joint ID", joint, "joint_id"))
		joint_panel.add_child(_line_property("Parent role", joint, "parent_role_id"))
		joint_panel.add_child(_line_property("Child role", joint, "child_role_id"))
		joint_panel.add_child(_option_property("Joint type", joint, "joint_type",
			Array(ForgeRigJointDefinition.JOINT_TYPES)))
		joint_panel.add_child(_vector3_property("Minimum angles", joint,
			"minimum_angles_degrees", -360.0, 360.0))
		joint_panel.add_child(_vector3_property("Maximum angles", joint,
			"maximum_angles_degrees", -360.0, 360.0))
		joint_panel.add_child(_float_property("Stiffness", joint, "stiffness", 0.0, 1000.0, 0.01))
		joint_panel.add_child(_float_property("Damping", joint, "damping", 0.0, 1000.0, 0.01))
		_editor.add_child(_boxed(joint_panel))
	_editor.add_child(_button("Add joint", _add_rig_joint.bind(rig)))
	_editor.add_child(_dictionary_lines_property("Motion profile bindings", rig,
		"motion_profiles"))
	var note := Label.new()
	note.text = "Bindings and joints use semantic roles; no scene-node paths are stored."
	note.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_editor.add_child(note)


func _build_animation_editor(library: ForgeEntityAnimationLibrary) -> void:
	_add_heading("Animation library")
	_editor.add_child(_line_property("Rig profile ID", library, "rig_profile_id"))
	_editor.add_child(_line_property("Rig family", library, "rig_family"))
	for clip in library.clips:
		if clip == null:
			continue
		var panel := VBoxContainer.new()
		panel.add_child(_line_property("Clip ID", clip, "clip_id"))
		panel.add_child(_line_property("Action", clip, "semantic_action"))
		panel.add_child(_float_property("Duration", clip, "duration_seconds", 0.01, 120.0, 0.01))
		panel.add_child(_bool_property("Looping", clip, "looping"))
		panel.add_child(_option_property("Root motion", clip, "root_motion_policy",
			["in_place", "extract", "ignore"]))
		var tracks := Label.new()
		tracks.text = "Semantic tracks: %d" % clip.role_tracks.size()
		panel.add_child(tracks)
		for track_index in clip.role_tracks.size():
			var track: Dictionary = clip.role_tracks[track_index]
			var track_row := HBoxContainer.new()
			var role := LineEdit.new()
			role.text = str(track.get("role_id", ""))
			role.placeholder_text = "entity_role.body.root"
			role.text_submitted.connect(func(value: String) -> void:
				_update_animation_track(clip, track_index, "role_id", value.strip_edges()))
			track_row.add_child(_labeled("Track role", role))
			var key_label := Label.new()
			key_label.text = "%d key(s)" % (track.get("keys", []) as Array).size()
			track_row.add_child(key_label)
			track_row.add_child(_button("Add key", _add_animation_key.bind(clip, track_index)))
			panel.add_child(track_row)
		panel.add_child(_button("Add semantic track", _add_animation_track.bind(clip)))
		var markers := Label.new()
		markers.text = "Event markers: %d" % clip.event_markers.size()
		panel.add_child(markers)
		for marker in clip.event_markers:
			if marker == null:
				continue
			var marker_panel := VBoxContainer.new()
			marker_panel.add_child(_line_property("Marker ID", marker, "marker_id"))
			marker_panel.add_child(_line_property("Event contract", marker, "event_contract_id"))
			marker_panel.add_child(_float_property("Normalized time", marker,
				"normalized_time", 0.0, 1.0, 0.01))
			marker_panel.add_child(_line_property("Spatial role", marker, "spatial_role_id"))
			panel.add_child(_boxed(marker_panel))
		panel.add_child(_button("Add event marker", _add_animation_marker.bind(clip)))
		_editor.add_child(_boxed(panel))
	_editor.add_child(_button("Add animation clip", _add_animation_clip.bind(library)))


func _build_variant_editor(profile: ForgeEntityVariantProfile) -> void:
	_add_heading("Appearance and equipment variant")
	_editor.add_child(_line_property("Entity definition ID", profile, "entity_definition_id"))
	_editor.add_child(_packed_lines_property("Material variants", profile, "material_variant_ids"))
	_editor.add_child(_packed_lines_property("Equipment profiles", profile, "equipment_profile_ids"))
	_editor.add_child(_vector3_property("Proportion scale", profile, "proportion_scale", 0.1, 4.0))


func _build_equipment_editor(profile: ForgeEquipmentFitProfile) -> void:
	_add_heading("Equipment fitting")
	_editor.add_child(_line_property("Equipment asset ID", profile, "equipment_asset_id"))
	_editor.add_child(_packed_lines_property("Compatible rig profiles", profile,
		"compatible_rig_profile_ids"))
	_editor.add_child(_line_property("Socket role", profile, "socket_role_id"))
	_editor.add_child(_vector3_property("Local position", profile, "local_position", -64.0, 64.0))
	_editor.add_child(_vector3_property("Local rotation", profile,
		"local_rotation_degrees", -360.0, 360.0))
	_editor.add_child(_vector3_property("Local scale", profile, "local_scale", 0.01, 10.0))


func _build_vfx_editor() -> void:
	if current_resource is ForgeVfxGraph:
		var graph := current_resource as ForgeVfxGraph
		_add_heading("Bounded VFX graph")
		_editor.add_child(_integer_property("Maximum nodes", graph, "maximum_nodes", 1, 1024))
		_editor.add_child(_integer_property("Maximum spawn count", graph,
			"maximum_spawn_count", 1, 100000))
		_editor.add_child(_float_property("Maximum lifetime (seconds)", graph,
			"maximum_lifetime_seconds", 0.01, 600.0, 0.1))
		_editor.add_child(_bool_property("Allow graph cycles", graph, "cycles_allowed"))
		_add_heading("Graph nodes (%d)" % graph.nodes.size())
		for index in graph.nodes.size():
			var record: Dictionary = graph.nodes[index]
			var node_panel := VBoxContainer.new()
			var node_id := LineEdit.new()
			node_id.text = str(record.get("id", "node"))
			node_id.text_submitted.connect(func(value: String) -> void:
				_update_vfx_node(graph, index, "id", value.strip_edges()))
			node_panel.add_child(_labeled("Node ID", node_id))
			var node_kind := LineEdit.new()
			node_kind.text = str(record.get("type", "emitter"))
			node_kind.text_submitted.connect(func(value: String) -> void:
				_update_vfx_node(graph, index, "type", value.strip_edges()))
			node_panel.add_child(_labeled("Node type", node_kind))
			var parameters := TextEdit.new()
			parameters.custom_minimum_size = Vector2(0, 68)
			parameters.text = _dictionary_to_lines(record.get("parameters", {}))
			parameters.focus_exited.connect(func() -> void:
				_update_vfx_node(graph, index, "parameters",
					_lines_to_dictionary(parameters.text)))
			node_panel.add_child(_labeled("Parameters (key=value)", parameters))
			node_panel.add_child(_button("Remove node", _remove_vfx_node.bind(graph, index)))
			_editor.add_child(_boxed(node_panel))
		var node_type := OptionButton.new()
		for value in ["emitter", "shape", "velocity", "force", "colour", "size",
				"light", "collision", "surface", "output"]:
			node_type.add_item(value.capitalize())
			node_type.set_item_metadata(node_type.item_count - 1, value)
		_editor.add_child(_labeled("New node type", node_type))
		_editor.add_child(_button("Add graph node", func() -> void:
			_add_vfx_node(graph, str(node_type.get_item_metadata(node_type.selected)))))
		_editor.add_child(_button("Connect nodes in listed order",
			_connect_vfx_nodes.bind(graph)))
		_add_heading("Graph edges (%d)" % graph.edges.size())
		for edge in graph.edges:
			var edge_label := Label.new()
			edge_label.text = "%s → %s" % [str(edge.get("from", "")), str(edge.get("to", ""))]
			_editor.add_child(edge_label)
	elif current_resource is ForgeVfxForm:
		var form := current_resource as ForgeVfxForm
		_add_heading("Voxel VFX form")
		_editor.add_child(_option_property("Primitive", form, "form_kind",
			["cube", "sphere", "ring", "spark", "custom_voxel"]))
		_editor.add_child(_float_property("Voxel size (metres)", form,
			"voxel_size_meters", 0.001, 4.0, 0.001))
		_editor.add_child(_integer_property("Maximum cells", form, "maximum_cells", 1, 65536))
		_editor.add_child(_packed_lines_property("Palette role IDs", form, "palette_role_ids"))
		_build_vfx_form_canvas(form)
	elif current_resource is ForgeVfxDefinition:
		var effect := current_resource as ForgeVfxDefinition
		_add_heading("VFX effect assembly")
		_editor.add_child(_line_property("Graph ID", effect, "graph_id"))
		_editor.add_child(_packed_lines_property("Form IDs", effect, "form_ids"))
		_editor.add_child(_packed_lines_property("Material IDs", effect, "material_ids"))
		_editor.add_child(_integer_property("Maximum instances", effect,
			"maximum_instances", 1, 100000))
		_editor.add_child(_line_property("Budget profile", effect, "budget_profile_id"))
		_editor.add_child(_line_property("Accessibility profile", effect,
			"accessibility_profile_id"))


func _build_vfx_form_canvas(form: ForgeVfxForm) -> void:
	_add_heading("Voxel form sculpting (%d cells)" % form.cell_records.size())
	_vfx_form_volume = ForgeVoxelVolume.new()
	_vfx_form_volume.dimensions = Vector3i(16, 16, 16)
	_vfx_form_volume.density_profile = "voxel.standard.effect"
	_vfx_form_volume.ensure_storage()
	for record in form.cell_records:
		var position := _array_vector3i(record.get("position", [0, 0, 0]))
		if _vfx_form_volume.contains(position):
			_vfx_form_volume.set_cell(position, int(record.get("palette_index", 0)))
	var palette := ForgePaletteDefinition.new()
	palette.ensure_default_entries()
	var tools := HBoxContainer.new()
	var axis := OptionButton.new()
	for label in ["X slices", "Y slices", "Z slices"]:
		axis.add_item(label)
	axis.select(2)
	tools.add_child(_labeled("Slice axis", axis))
	var slice := SpinBox.new()
	slice.min_value = 0
	slice.max_value = 15
	slice.step = 1
	tools.add_child(_labeled("Slice", slice))
	var palette_index := SpinBox.new()
	palette_index.min_value = 0
	palette_index.max_value = palette.entries.size() - 1
	palette_index.step = 1
	tools.add_child(_labeled("Palette role", palette_index))
	_editor.add_child(tools)
	_vfx_form_canvas = ForgeVoxelSliceCanvas.new()
	_vfx_form_canvas.name = "VfxFormVoxelCanvas"
	_vfx_form_canvas.configure(_vfx_form_volume, palette)
	_vfx_form_canvas.slice_axis = 2
	_vfx_form_canvas.slice_index = 0
	_vfx_form_canvas.voxel_edit_requested.connect(func(position: Vector3i, value: int) -> void:
		var records: Array[Dictionary] = form.cell_records.duplicate(true)
		var found := -1
		for index in records.size():
			if _array_vector3i(records[index].get("position", [])) == position:
				found = index
				break
		if value < 0:
			if found >= 0:
				records.remove_at(found)
			_vfx_form_volume.clear_cell(position)
		else:
			var record := {"position": [position.x, position.y, position.z],
				"palette_index": value,
				"palette_role_id": str(form.palette_role_ids[value]) \
					if value < form.palette_role_ids.size() else ""}
			if found >= 0:
				records[found] = record
			else:
				records.append(record)
			_vfx_form_volume.set_cell(position, value)
		_commit_property(form, "cell_records", records, "Sculpt VFX form voxel")
		_vfx_form_canvas.queue_redraw())
	axis.item_selected.connect(func(index: int) -> void:
		_vfx_form_canvas.slice_axis = index
		_vfx_form_canvas.slice_index = 0
		slice.value = 0
		_vfx_form_canvas.queue_redraw())
	slice.value_changed.connect(func(value: float) -> void:
		_vfx_form_canvas.slice_index = int(value)
		_vfx_form_canvas.queue_redraw())
	palette_index.value_changed.connect(func(value: float) -> void:
		_vfx_form_canvas.active_palette_index = int(value))
	_editor.add_child(_vfx_form_canvas)


func _build_audio_editor() -> void:
	if current_resource is ForgeSynthPatchDefinition:
		_build_synth_editor(current_resource)
	elif current_resource is ForgeSoundSource:
		_build_sound_source_editor(current_resource)
	elif current_resource is ForgeSoundEvent:
		_build_sound_event_editor(current_resource)
	elif current_resource is ForgeSpatialAudioProfile:
		_build_spatial_audio_editor(current_resource)


func _build_synth_editor(patch: ForgeSynthPatchDefinition) -> void:
	_add_heading("Virtual instrument — no file upload required")
	var explanation := Label.new()
	explanation.text = (
		"The keyboard renders deterministic audio from oscillators, an amplitude "
		+ "envelope, filter and modulation. A4 tuning changes the pitch reference; "
		+ "Bake creates an internal Sound Source that can be layered in Sound Events.")
	explanation.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_editor.add_child(explanation)
	_editor.add_child(_float_property("A4 tuning (Hz)", patch, "tuning_a4_hz", 300.0, 500.0, 0.1))
	_editor.add_child(_float_property("Preview cent offset", patch,
		"preview_cent_offset", -100.0, 100.0, 0.1))
	_editor.add_child(_float_property("Master gain (dB)", patch, "master_gain_db", -60.0, 6.0, 0.1))
	_editor.add_child(_integer_property("Sample rate", patch, "sample_rate_hz", 8000, 96000))
	_editor.add_child(_float_property("Note duration", patch,
		"note_duration_seconds", 0.02, 10.0, 0.01))
	_editor.add_child(_integer_property("Maximum polyphony", patch,
		"maximum_polyphony", 1, 64))
	_editor.add_child(_integer_property("Noise seed", patch, "noise_seed", 0, 2147483647))
	_add_heading("Oscillators")
	for index in patch.oscillators.size():
		var oscillator: Dictionary = patch.oscillators[index]
		var panel := VBoxContainer.new()
		var waveform := OptionButton.new()
		for value in ForgeSynthPatchDefinition.WAVEFORMS:
			waveform.add_item(value.capitalize())
			waveform.set_item_metadata(waveform.item_count - 1, value)
			if value == str(oscillator.get("waveform", "sine")):
				waveform.select(waveform.item_count - 1)
		waveform.item_selected.connect(func(selected: int) -> void:
			_update_oscillator(patch, index, "waveform",
				str(waveform.get_item_metadata(selected))))
		panel.add_child(_labeled("Waveform", waveform))
		panel.add_child(_dictionary_float_field("Level", patch, "oscillators", index,
			"level", float(oscillator.get("level", 0.8)), 0.0, 1.0, 0.01))
		panel.add_child(_dictionary_float_field("Detune (cents)", patch, "oscillators", index,
			"detune_cents", float(oscillator.get("detune_cents", 0.0)), -2400.0, 2400.0, 1.0))
		panel.add_child(_dictionary_float_field("Octave", patch, "oscillators", index,
			"octave", float(oscillator.get("octave", 0)), -4.0, 4.0, 1.0))
		panel.add_child(_button("Remove oscillator", _remove_oscillator.bind(patch, index)))
		_editor.add_child(_boxed(panel))
	_editor.add_child(_button("Add oscillator", _add_oscillator.bind(patch)))
	_add_heading("Amplitude envelope")
	for field in [
		["Attack (seconds)", "attack_seconds", 0.0, 5.0, 0.01],
		["Decay (seconds)", "decay_seconds", 0.0, 5.0, 0.01],
		["Sustain level", "sustain_level", 0.0, 1.0, 0.01],
		["Release (seconds)", "release_seconds", 0.0, 5.0, 0.01],
	]:
		_editor.add_child(_dictionary_property(str(field[0]), patch,
			"amplitude_envelope", str(field[1]), float(field[2]), float(field[3]), float(field[4])))
	_add_heading("Filter and modulation")
	_editor.add_child(_dictionary_option_property("Filter type", patch,
		"filter_settings", "type", ["none", "low_pass", "high_pass"]))
	_editor.add_child(_dictionary_property("Filter cutoff (Hz)", patch,
		"filter_settings", "cutoff_hz", 20.0, float(patch.sample_rate_hz) * 0.49, 1.0))
	_editor.add_child(_dictionary_property("LFO rate (Hz)", patch,
		"modulation", "lfo_rate_hz", 0.0, 40.0, 0.1))
	_editor.add_child(_dictionary_option_property("LFO waveform", patch,
		"modulation", "lfo_waveform", ["sine", "triangle", "square"]))
	_editor.add_child(_dictionary_property("Pitch depth (cents)", patch,
		"modulation", "pitch_depth_cents", -2400.0, 2400.0, 1.0))
	_editor.add_child(_dictionary_property("Amplitude depth", patch,
		"modulation", "amplitude_depth", 0.0, 1.0, 0.01))
	_add_heading("Playable keyboard")
	if _audio_player == null or not is_instance_valid(_audio_player):
		_audio_player = AudioStreamPlayer.new()
		_audio_player.name = "ForgeSynthPreviewPlayer"
		add_child(_audio_player)
	var keyboard := GridContainer.new()
	keyboard.name = "ForgeSynthKeyboard"
	keyboard.columns = 12
	for note in range(48, 72):
		var button := _button(_note_name(note), _play_synth_note.bind(note))
		button.custom_minimum_size = Vector2(54, 52)
		button.tooltip_text = "Play %s, MIDI %d, at current A4 tuning." % [_note_name(note), note]
		button.set_meta("accessible_label", "Play piano note %s" % _note_name(note))
		keyboard.add_child(button)
	_editor.add_child(keyboard)
	_editor.add_child(_button("Create editable Sound Source from current note",
		_create_editable_source_from_synth.bind(patch)))
	_editor.add_child(_button("Create layered Sound Event from this instrument",
		_create_sound_event_from_synth.bind(patch)))
	var handoff := Label.new()
	handoff.text = (
		"Approve & Bake creates the internal source %s. The handoff button opens a "
		+ "new Sound Event already linked to that source; no media file is needed.") % \
		ForgeCreatorBakeService.generated_synth_source_id(patch)
	handoff.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_editor.add_child(handoff)


func _build_sound_source_editor(source: ForgeSoundSource) -> void:
	_add_heading("Sound source and waveform")
	var waveform: Control = WAVEFORM_PREVIEW_SCRIPT.new()
	waveform.name = "GuideTarget_WaveformOverview"
	waveform.set("samples", source.waveform_preview)
	_editor.add_child(waveform)
	var analysis := Label.new()
	analysis.name = "GuideTarget_LoudnessAnalysis"
	analysis.text = "Peak: %.2f dB | Integrated: %.2f LUFS | Clipped samples: %d | Silent: %s" % [
		float(source.loudness_analysis.get("peak_db", -120.0)),
		float(source.loudness_analysis.get("integrated_lufs", -120.0)),
		int(source.loudness_analysis.get("clipped_samples", 0)),
		"yes" if bool(source.loudness_analysis.get("silent", false)) else "no"]
	analysis.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	analysis.set_meta("accessible_label", analysis.text)
	_editor.add_child(analysis)
	_add_heading("Recorded / imported source (optional)")
	_editor.add_child(_button("Choose WAV, OGG or MP3 file",
		_choose_audio_file.bind(source)))
	_editor.add_child(_line_property("Source path", source, "source_path"))
	_editor.add_child(_line_property("Content hash", source, "source_hash"))
	_editor.add_child(_option_property("Channel layout", source, "channel_layout",
		["mono", "stereo"]))
	_editor.add_child(_integer_property("Sample rate", source, "sample_rate_hz", 8000, 192000))
	_editor.add_child(_float_property("Duration", source, "duration_seconds", 0.0, 86400.0, 0.01))
	_editor.add_child(_option_property("Rights status", source, "rights_status",
		["not_assessed", "owned", "licensed", "public_domain"]))
	_editor.add_child(_line_property("Procedural recipe ID", source, "procedural_recipe_id"))
	_editor.add_child(_integer_property("Procedural seed", source, "procedural_seed", 0, 2147483647))
	_editor.add_child(_line_property("Generator version", source, "generator_version"))
	_add_heading("Non-destructive regions, loops and processing")
	var region_actions := HBoxContainer.new()
	region_actions.add_child(_button("Add full-length region", _add_full_audio_region.bind(source)))
	region_actions.add_child(_button("Set safe loop markers", _set_safe_loop_markers.bind(source)))
	region_actions.add_child(_button("Clear loop markers", _clear_loop_markers.bind(source)))
	_editor.add_child(region_actions)
	_editor.add_child(_float_property("Loop start", source, "loop_start_seconds", -1.0,
		maxf(1.0, source.duration_seconds), 0.01))
	_editor.add_child(_float_property("Loop end", source, "loop_end_seconds", -1.0,
		maxf(1.0, source.duration_seconds), 0.01))
	_add_heading("Non-destructive waveform tools (16-bit WAV)")
	var trim_row := HBoxContainer.new()
	var trim_start := SpinBox.new()
	trim_start.min_value = 0.0
	trim_start.max_value = maxf(1.0, source.duration_seconds)
	trim_start.step = 0.01
	var trim_end := SpinBox.new()
	trim_end.min_value = 0.0
	trim_end.max_value = maxf(1.0, source.duration_seconds)
	trim_end.step = 0.01
	trim_end.value = maxf(0.0, source.duration_seconds)
	trim_row.add_child(_labeled("Trim start", trim_start))
	trim_row.add_child(_labeled("Trim end", trim_end))
	trim_row.add_child(_button("Apply trim", func() -> void:
		_apply_audio_transform(source, {"trim_start_seconds": trim_start.value,
			"trim_end_seconds": trim_end.value})))
	_editor.add_child(trim_row)
	var fade_row := HBoxContainer.new()
	var fade_in := SpinBox.new()
	fade_in.min_value = 0.0
	fade_in.max_value = 30.0
	fade_in.step = 0.01
	var fade_out := SpinBox.new()
	fade_out.min_value = 0.0
	fade_out.max_value = 30.0
	fade_out.step = 0.01
	fade_row.add_child(_labeled("Fade in", fade_in))
	fade_row.add_child(_labeled("Fade out", fade_out))
	fade_row.add_child(_button("Apply fades", func() -> void:
		_apply_audio_transform(source, {"fade_in_seconds": fade_in.value,
			"fade_out_seconds": fade_out.value})))
	_editor.add_child(fade_row)
	var transform_actions := HBoxContainer.new()
	transform_actions.add_child(_button("Normalize to -1 dB",
		func() -> void: _apply_audio_transform(source, {"normalize_peak_db": -1.0})))
	transform_actions.add_child(_button("Reverse waveform",
		func() -> void: _apply_audio_transform(source, {"reverse": true})))
	transform_actions.add_child(_button("Play source", _play_sound_source.bind(source)))
	_editor.add_child(transform_actions)
	_editor.add_child(_button("Create layered Sound Event from this source",
		_create_sound_event_from_source.bind(source)))
	var note := Label.new()
	note.text = (
		"Use Synth Instrument / Sound when you want to create audio entirely inside "
		+ "Forge. Imported sources retain path, hash, rights and transformation history.")
	note.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_editor.add_child(note)


func _choose_audio_file(source: ForgeSoundSource) -> void:
	if _audio_import_dialog == null or not is_instance_valid(_audio_import_dialog):
		_audio_import_dialog = FileDialog.new()
		_audio_import_dialog.name = "ForgeAudioImportDialog"
		_audio_import_dialog.file_mode = FileDialog.FILE_MODE_OPEN_FILE
		_audio_import_dialog.access = FileDialog.ACCESS_FILESYSTEM
		_audio_import_dialog.use_native_dialog = false
		_audio_import_dialog.filters = PackedStringArray([
			"*.wav ; WAV audio", "*.ogg ; OGG audio", "*.mp3 ; MP3 audio"])
		add_child(_audio_import_dialog)
		_audio_import_dialog.file_selected.connect(func(path: String) -> void:
			_import_audio_file(path))
	_audio_import_dialog.set_meta("target_source", source)
	_audio_import_dialog.popup_centered_ratio(0.72)


func _import_audio_file(path: String) -> void:
	if _audio_import_dialog == null:
		return
	var source: ForgeSoundSource = _audio_import_dialog.get_meta("target_source")
	var result := ForgeAudioImportService.new().import_file(source, path)
	if bool(result.get("ok", false)):
		_mark_edited()
		_rebuild_editor()
		status_changed.emit("Imported audio into the canonical Forge media library.", false)
	else:
		status_changed.emit("Audio import failed: %s" % str(result.get("error", "")), true)


func _apply_audio_transform(source: ForgeSoundSource, options: Dictionary) -> void:
	var result := ForgeAudioTransformService.new().apply_to_source(source, options)
	if bool(result.get("ok", false)):
		_mark_edited()
		_rebuild_editor()
		status_changed.emit("Waveform edit created a non-destructive generated revision.", false)
	else:
		status_changed.emit("Waveform edit failed: %s" % str(result.get("error", "")), true)


func _add_full_audio_region(source: ForgeSoundSource) -> void:
	var regions := source.regions.duplicate(true)
	regions.append({"region_id": "region_%02d" % (regions.size() + 1),
		"start_seconds": 0.0, "end_seconds": source.duration_seconds})
	_commit_property(source, "regions", regions, "Add waveform region")
	_rebuild_editor()


func _set_safe_loop_markers(source: ForgeSoundSource) -> void:
	_commit_property(source, "loop_start_seconds", source.duration_seconds * 0.2,
		"Set loop start")
	_commit_property(source, "loop_end_seconds", source.duration_seconds * 0.8,
		"Set loop end")
	_rebuild_editor()


func _clear_loop_markers(source: ForgeSoundSource) -> void:
	_commit_property(source, "loop_start_seconds", -1.0, "Clear loop start")
	_commit_property(source, "loop_end_seconds", -1.0, "Clear loop end")
	_rebuild_editor()


func _build_sound_event_editor(event: ForgeSoundEvent) -> void:
	_add_heading("Sound Event layers and playback")
	_editor.add_child(_packed_lines_property("Source IDs", event, "source_ids"))
	_add_heading("Layers (%d)" % event.layer_records.size())
	for index in event.layer_records.size():
		var layer: Dictionary = event.layer_records[index]
		var panel := VBoxContainer.new()
		panel.add_child(_event_layer_text(event, index, "Layer ID", "layer_id",
			str(layer.get("layer_id", "layer_%d" % (index + 1)))))
		panel.add_child(_event_layer_text(event, index, "Source ID", "source_id",
			str(layer.get("source_id", ""))))
		panel.add_child(_event_layer_float(event, index, "Gain (dB)", "gain_db",
			float(layer.get("gain_db", 0.0)), -60.0, 12.0, 0.1))
		panel.add_child(_event_layer_float(event, index, "Pitch scale", "pitch_scale",
			float(layer.get("pitch_scale", 1.0)), 0.125, 8.0, 0.01))
		panel.add_child(_event_layer_float(event, index, "Start delay", "start_delay_seconds",
			float(layer.get("start_delay_seconds", 0.0)), 0.0, 60.0, 0.01))
		panel.add_child(_button("Remove layer", _remove_sound_layer.bind(event, index)))
		_editor.add_child(_boxed(panel))
	_editor.add_child(_button("Add Sound Event layer", _add_sound_layer.bind(event)))
	_editor.add_child(_option_property("Variation policy", event, "variation_policy",
		["seeded_round_robin", "seeded_random", "sequential", "single"]))
	_editor.add_child(_option_property("Loop policy", event, "loop_policy",
		["one_shot", "managed_loop", "state_loop"]))
	_editor.add_child(_line_property("Concurrency group", event, "concurrency_group"))
	_editor.add_child(_integer_property("Maximum voices", event, "maximum_voices", 1, 256))
	_editor.add_child(_line_property("Spatial profile ID", event,
		"spatial_audio_profile_id"))
	_editor.add_child(_line_property("Audio bus", event, "bus_id"))
	_editor.add_child(_line_property("Caption / equivalent feedback key", event,
		"caption_key"))
	_editor.add_child(_bool_property("Critical cue", event, "critical_cue"))


func _build_spatial_audio_editor(profile: ForgeSpatialAudioProfile) -> void:
	_add_heading("Spatial audio")
	_editor.add_child(_float_property("Maximum distance (metres)", profile,
		"maximum_distance_meters", 0.01, 10000.0, 0.1))
	_editor.add_child(_option_property("Attenuation", profile, "attenuation_model",
		["inverse_distance", "linear", "disabled"]))
	_editor.add_child(_float_property("Directionality", profile, "directionality", 0.0, 1.0, 0.01))
	_editor.add_child(_option_property("Occlusion", profile, "occlusion_policy",
		["none", "raycast", "acoustic_zones"]))
	_editor.add_child(_float_property("Reverb send", profile, "reverb_send", 0.0, 1.0, 0.01))
	_editor.add_child(_integer_property("Priority", profile, "priority", -100, 100))


func _refresh_existing() -> void:
	if not is_instance_valid(_existing_selector):
		return
	_existing_selector.clear()
	var seen := {}
	for descriptor in registry.all(domain):
		for path in _resource_paths_recursive(descriptor.source_root):
			if seen.has(path):
				continue
			seen[path] = true
			var resource := ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)
			var resolved := registry.for_resource(resource)
			if resolved == null or resolved.domain != domain:
				continue
			_existing_selector.add_item("%s  |  %s" % [
				resolved.title(resource), resolved.display_name])
			_existing_selector.set_item_metadata(_existing_selector.item_count - 1, path)


func _preview_structure_rules(rules: ForgeProceduralStructureRuleSet) -> Dictionary:
	var sources := _structure_sources(rules.module_set_id)
	if sources.module_set == null:
		var missing := {"ok": false, "error": "Save/open the referenced structure set first."}
		_show_preview_text("STRUCTURE PREVIEW BLOCKED\n%s" % missing.error)
		return missing
	var result := ForgeProceduralStructureAssembler.new().generate(
		sources.module_set, sources.modules, rules)
	if not bool(result.get("ok", false)):
		_show_preview_text("STRUCTURE PREVIEW BLOCKED\n%s" % str(result.get("error", "")))
		return result
	var lines: Array[String] = ["STRUCTURE LAYOUT PREVIEW"]
	for placement in result.get("placements", []):
		lines.append("%s at %s, rotation %d quarter-turn(s)" % [
			str(placement.get("module_id", "")), str(placement.get("position", [])),
			int(placement.get("rotation_quarters", 0))])
	lines.append("Open connection points: %d" % (result.get("open_connectors") as Array).size())
	lines.append("Continuation state: %s" % (
		"available" if not (result.get("continuation_state") as Dictionary).is_empty() else "finite"))
	_show_preview_text("\n".join(lines))
	return result


func _structure_sources(module_set_id: String) -> Dictionary:
	var module_set: ForgeBlueprintModuleSet
	var modules := {}
	for resource in session.resources.values():
		if resource is ForgeBlueprintModuleSet and resource.module_set_id == module_set_id:
			module_set = resource
		elif resource is ForgeBlueprintModuleDefinition:
			modules[resource.module_id] = resource
	if module_set == null:
		for path in _resource_paths_recursive("res://content/forge/blueprints"):
			var resource := ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)
			if resource is ForgeBlueprintModuleSet and resource.module_set_id == module_set_id:
				module_set = resource
			elif resource is ForgeBlueprintModuleDefinition:
				modules[resource.module_id] = resource
	return {"module_set": module_set, "modules": modules}


func _play_synth_note(note: int) -> Dictionary:
	if not current_resource is ForgeSynthPatchDefinition:
		return {"ok": false, "error": "Open a synth patch first."}
	var patch := current_resource as ForgeSynthPatchDefinition
	patch.preview_midi_note = note
	var result := ForgeProceduralAudioBaker.new().render_note(patch, note)
	if bool(result.get("ok", false)):
		if _audio_player == null or not is_instance_valid(_audio_player):
			_audio_player = AudioStreamPlayer.new()
			_audio_player.name = "ForgeSynthPreviewPlayer"
			add_child(_audio_player)
		_audio_player.stream = result["stream"]
		_audio_player.play()
		_show_preview_text("SYNTH NOTE PREVIEW\n%s  |  %.2f Hz\n%d samples at %d Hz\nPeak %.3f  |  clipped samples %d" % [
			_note_name(note), float(result.frequency_hz), int(result.sample_count),
			int(result.sample_rate_hz), float(result.peak), int(result.clipped_samples)])
	else:
		_show_preview_text("SYNTH PREVIEW BLOCKED\n%s" % str(result.get("error", "")))
	return result


func _play_sound_source(source: ForgeSoundSource) -> Dictionary:
	if source == null or source.source_path.is_empty():
		return {"ok": false, "error": "Sound Source has no media path."}
	var stream := ResourceLoader.load(
		source.source_path, "", ResourceLoader.CACHE_MODE_IGNORE)
	if not stream is AudioStream:
		var failed := {"ok": false, "error": "Sound media is not imported as a playable AudioStream."}
		_show_preview_text("SOUND SOURCE PREVIEW BLOCKED\n%s" % failed.error)
		return failed
	if _audio_player == null or not is_instance_valid(_audio_player):
		_audio_player = AudioStreamPlayer.new()
		_audio_player.name = "ForgeAudioSourcePreviewPlayer"
		add_child(_audio_player)
	_audio_player.stream = stream
	_audio_player.play()
	var result := {"ok": true, "path": source.source_path,
		"duration_seconds": stream.get_length(), "hash": source.source_hash}
	_show_preview_text("SOUND SOURCE PREVIEW\n%s\nDuration %.3f seconds\nHash %s" % [
		source.source_path, float(result.duration_seconds), source.source_hash])
	return result


func _bake_action() -> Callable:
	return func(resource: Resource) -> Dictionary:
		return ForgeCreatorBakeService.new().bake(resource, session.resources)


func _commit_property(
		resource: Resource, property_name: String, value: Variant, label: String) -> void:
	if resource == null:
		return
	var before: Variant = resource.get(property_name)
	if before == value:
		return
	var source_id := current_descriptor.identity(current_resource)
	if session.execute(label,
		func() -> void: resource.set(property_name, value),
		func() -> void: resource.set(property_name, before), source_id):
		_mark_edited(false)


func _mark_edited(mark_session := true) -> void:
	if not has_source():
		return
	if mark_session:
		session.mark_dirty(current_descriptor.identity(current_resource))
	if not current_descriptor.status_property.is_empty():
		var status := str(current_resource.get(current_descriptor.status_property))
		if status in ["approved", "published", "review_approved"]:
			current_resource.set(current_descriptor.status_property, "draft")
	if not current_descriptor.lifecycle_property.is_empty():
		var lifecycle := str(current_resource.get(
			current_descriptor.lifecycle_property))
		if lifecycle in ["approved", "published", "review_approved"]:
			current_resource.set(current_descriptor.lifecycle_property, "draft")
	_set_state("UNSAVED", "Source has editable changes; autosave recovery is updated.")
	autosaves.autosave(current_resource)
	source_changed.emit(current_resource)
	_emit_history()


func _discard_current_autosave() -> void:
	var path := ForgeAutosaveService.AUTOSAVE_ROOT.path_join(
		"%s.autosave.tres" % ForgeId.safe_filename(
			current_descriptor.identity(current_resource)))
	autosaves.discard(path)


func _add_blueprint_element(blueprint: ForgeBlueprintDefinition) -> void:
	var element := ForgeBlueprintElement.new()
	element.element_id = "element_%d" % (blueprint.elements.size() + 1)
	var updated: Array[ForgeBlueprintElement] = blueprint.elements.duplicate()
	updated.append(element)
	_commit_property(blueprint, "elements", updated, "Add blueprint element")
	_rebuild_editor()


func _remove_blueprint_element(blueprint: ForgeBlueprintDefinition, index: int) -> void:
	var updated: Array[ForgeBlueprintElement] = blueprint.elements.duplicate()
	if index >= 0 and index < updated.size():
		updated.remove_at(index)
		_commit_property(blueprint, "elements", updated, "Remove blueprint element")
		_rebuild_editor()


func _add_construction_delta(blueprint: ForgeBlueprintDefinition) -> void:
	var delta := ForgeConstructionDelta.new()
	delta.delta_id = "delta_%d" % (blueprint.construction_deltas.size() + 1)
	delta.stage_id = "stage_%d" % (blueprint.construction_deltas.size() + 1)
	var updated: Array[ForgeConstructionDelta] = blueprint.construction_deltas.duplicate()
	updated.append(delta)
	_commit_property(blueprint, "construction_deltas", updated, "Add construction stage")
	_rebuild_editor()


func _add_module_element(module: ForgeBlueprintModuleDefinition) -> void:
	var element := ForgeBlueprintElement.new()
	element.element_id = "element_%d" % (module.elements.size() + 1)
	element.element_kind = "block"
	var updated: Array[ForgeBlueprintElement] = module.elements.duplicate()
	updated.append(element)
	_commit_property(module, "elements", updated, "Add module element")
	_rebuild_editor()


func _remove_module_element(module: ForgeBlueprintModuleDefinition, index: int) -> void:
	var updated: Array[ForgeBlueprintElement] = module.elements.duplicate()
	if index >= 0 and index < updated.size():
		updated.remove_at(index)
		_commit_property(module, "elements", updated, "Remove module element")
		_rebuild_editor()


func _add_connector(module: ForgeBlueprintModuleDefinition) -> void:
	var connector := ForgeBlueprintConnectorDefinition.new()
	connector.connector_id = "blueprint.connector.%s.connection_%d" % [
		ForgeId.safe_filename(module.module_id.trim_prefix("blueprint.module.")),
		module.connectors.size() + 1]
	connector.owner_module_id = module.module_id
	connector.position = Vector3i(0, 0, module.connectors.size() * 4)
	var updated: Array[ForgeBlueprintConnectorDefinition] = module.connectors.duplicate()
	updated.append(connector)
	_commit_property(module, "connectors", updated, "Add connection point")
	_rebuild_editor()


func _remove_connector(module: ForgeBlueprintModuleDefinition, index: int) -> void:
	var updated: Array[ForgeBlueprintConnectorDefinition] = module.connectors.duplicate()
	if index >= 0 and index < updated.size():
		updated.remove_at(index)
		_commit_property(module, "connectors", updated, "Remove connection point")
		_rebuild_editor()


func _add_body_part(plan: ForgeBodyPlanDefinition) -> void:
	var part := ForgeBodyPartDefinition.new()
	var slug := ForgeId.safe_filename(plan.body_plan_id.trim_prefix("entity.body_plan."))
	part.body_part_id = "entity.body_part.%s.part_%d" % [slug, plan.body_parts.size() + 1]
	part.display_name = "Part %d" % (plan.body_parts.size() + 1)
	part.parent_part_id = plan.root_part_id
	part.voxel_source = ForgeVoxelVolume.new()
	part.voxel_source.dimensions = Vector3i(8, 8, 8)
	part.voxel_source.density_profile = part.density_profile_id
	part.voxel_source.ensure_storage()
	part.voxel_source.set_cell(Vector3i(3, 3, 3), 0)
	var updated: Array[ForgeBodyPartDefinition] = plan.body_parts.duplicate()
	updated.append(part)
	_commit_property(plan, "body_parts", updated, "Add body part")
	_selected_body_part = part
	_rebuild_editor()


func _select_body_part(part: ForgeBodyPartDefinition) -> void:
	_selected_body_part = part
	_rebuild_editor()


func _add_animation_clip(library: ForgeEntityAnimationLibrary) -> void:
	var clip := ForgeEntityAnimationClip.new()
	clip.clip_id = "clip.%s.clip_%d" % [
		ForgeId.safe_filename(library.animation_library_id), library.clips.size() + 1]
	clip.display_name = "New Clip"
	var updated: Array[ForgeEntityAnimationClip] = library.clips.duplicate()
	updated.append(clip)
	_commit_property(library, "clips", updated, "Add animation clip")
	_rebuild_editor()


func _add_rig_binding(rig: ForgeRigProfile) -> void:
	var binding := ForgeRigRoleBinding.new()
	var index := rig.role_bindings.size() + 1
	binding.role_id = "entity_role.custom.role_%d" % index
	binding.body_part_id = "entity.body_part.unassigned_%d" % index
	if rig.role_bindings.is_empty():
		rig.root_role_id = binding.role_id
	else:
		binding.parent_role_id = rig.root_role_id
	var updated: Array[ForgeRigRoleBinding] = rig.role_bindings.duplicate()
	updated.append(binding)
	_commit_property(rig, "role_bindings", updated, "Add rig role binding")
	_rebuild_editor()


func _add_rig_joint(rig: ForgeRigProfile) -> void:
	var joint := ForgeRigJointDefinition.new()
	joint.joint_id = "%s.joint.joint_%d" % [rig.rig_profile_id, rig.joints.size() + 1]
	if rig.role_bindings.size() >= 2:
		joint.parent_role_id = rig.role_bindings[0].role_id
		joint.child_role_id = rig.role_bindings[-1].role_id
		rig.role_bindings[-1].joint_id = joint.joint_id
	var updated: Array[ForgeRigJointDefinition] = rig.joints.duplicate()
	updated.append(joint)
	_commit_property(rig, "joints", updated, "Add rig joint")
	_rebuild_editor()


func _add_animation_track(clip: ForgeEntityAnimationClip) -> void:
	var tracks: Array[Dictionary] = clip.role_tracks.duplicate(true)
	tracks.append({"role_id": "entity_role.body.root", "keys": [{
		"time": 0.0, "position": [0.0, 0.0, 0.0],
		"rotation_degrees": [0.0, 0.0, 0.0], "scale": [1.0, 1.0, 1.0]}]})
	_commit_property(clip, "role_tracks", tracks, "Add animation role track")
	_rebuild_editor()


func _update_animation_track(
		clip: ForgeEntityAnimationClip, index: int,
		key: String, value: Variant) -> void:
	var tracks: Array[Dictionary] = clip.role_tracks.duplicate(true)
	if index < 0 or index >= tracks.size():
		return
	tracks[index][key] = value
	_commit_property(clip, "role_tracks", tracks, "Edit animation role track")


func _add_animation_key(clip: ForgeEntityAnimationClip, index: int) -> void:
	var tracks: Array[Dictionary] = clip.role_tracks.duplicate(true)
	if index < 0 or index >= tracks.size():
		return
	var keys: Array = tracks[index].get("keys", []).duplicate(true)
	var time := minf(1.0, float(keys.size()) * 0.25)
	keys.append({"time": time, "position": [0.0, 0.0, 0.0],
		"rotation_degrees": [0.0, 0.0, 0.0], "scale": [1.0, 1.0, 1.0]})
	tracks[index]["keys"] = keys
	_commit_property(clip, "role_tracks", tracks, "Add animation key")
	_rebuild_editor()


func _add_animation_marker(clip: ForgeEntityAnimationClip) -> void:
	var marker := ForgeAnimationEventMarker.new()
	marker.marker_id = "%s.marker_%d" % [clip.clip_id, clip.event_markers.size() + 1]
	marker.normalized_time = 0.5
	var updated: Array[ForgeAnimationEventMarker] = clip.event_markers.duplicate()
	updated.append(marker)
	_commit_property(clip, "event_markers", updated, "Add animation event marker")
	_rebuild_editor()


func _add_vfx_node(graph: ForgeVfxGraph, node_type: String) -> void:
	var updated: Array[Dictionary] = graph.nodes.duplicate(true)
	updated.append({"id": "%s_%d" % [node_type, updated.size() + 1],
		"type": node_type, "parameters": {}})
	_commit_property(graph, "nodes", updated, "Add VFX node")
	_rebuild_editor()


func _remove_vfx_node(graph: ForgeVfxGraph, index: int) -> void:
	var updated: Array[Dictionary] = graph.nodes.duplicate(true)
	if index >= 0 and index < updated.size():
		var removed_id := str(updated[index].get("id", ""))
		updated.remove_at(index)
		_commit_property(graph, "nodes", updated, "Remove VFX node")
		var edges: Array[Dictionary] = []
		for edge in graph.edges:
			if str(edge.get("from", "")) != removed_id and str(edge.get("to", "")) != removed_id:
				edges.append(edge.duplicate(true))
		_commit_property(graph, "edges", edges, "Remove VFX node edges")
		_rebuild_editor()


func _update_vfx_node(
		graph: ForgeVfxGraph, index: int, key: String, value: Variant) -> void:
	var nodes: Array[Dictionary] = graph.nodes.duplicate(true)
	if index < 0 or index >= nodes.size():
		return
	var previous_id := str(nodes[index].get("id", ""))
	nodes[index][key] = value
	_commit_property(graph, "nodes", nodes, "Edit VFX node")
	if key == "id" and previous_id != str(value):
		var edges: Array[Dictionary] = graph.edges.duplicate(true)
		for edge in edges:
			if str(edge.get("from", "")) == previous_id: edge["from"] = str(value)
			if str(edge.get("to", "")) == previous_id: edge["to"] = str(value)
		_commit_property(graph, "edges", edges, "Update VFX edge identity")


func _connect_vfx_nodes(graph: ForgeVfxGraph) -> void:
	var edges: Array[Dictionary] = []
	for index in maxi(0, graph.nodes.size() - 1):
		edges.append({"from": str(graph.nodes[index].get("id", "")),
			"to": str(graph.nodes[index + 1].get("id", ""))})
	_commit_property(graph, "edges", edges, "Connect VFX nodes")
	_rebuild_editor()


func _add_vfx_cell(form: ForgeVfxForm) -> void:
	var cells: Array[Dictionary] = form.cell_records.duplicate(true)
	var index := cells.size()
	cells.append({"position": [index % 8, (index / 8) % 8, index / 64],
		"palette_index": 0})
	_commit_property(form, "cell_records", cells, "Add VFX form cell")
	_rebuild_editor()


func _remove_vfx_cell(form: ForgeVfxForm) -> void:
	if form.cell_records.is_empty():
		return
	var cells: Array[Dictionary] = form.cell_records.duplicate(true)
	cells.pop_back()
	_commit_property(form, "cell_records", cells, "Remove VFX form cell")
	_rebuild_editor()


func _add_oscillator(patch: ForgeSynthPatchDefinition) -> void:
	if patch.oscillators.size() >= 8:
		status_changed.emit("Synth patches are bounded to eight oscillators.", true)
		return
	var oscillators: Array[Dictionary] = patch.oscillators.duplicate(true)
	oscillators.append({"waveform": "sine", "level": 0.5, "detune_cents": 0.0,
		"octave": 0, "phase": 0.0, "pulse_width": 0.5})
	_commit_property(patch, "oscillators", oscillators, "Add synth oscillator")
	_rebuild_editor()


func _remove_oscillator(patch: ForgeSynthPatchDefinition, index: int) -> void:
	if patch.oscillators.size() <= 1:
		status_changed.emit("A synth patch must keep at least one oscillator.", true)
		return
	var oscillators: Array[Dictionary] = patch.oscillators.duplicate(true)
	oscillators.remove_at(index)
	_commit_property(patch, "oscillators", oscillators, "Remove synth oscillator")
	_rebuild_editor()


func _update_oscillator(
		patch: ForgeSynthPatchDefinition, index: int,
		key: String, value: Variant) -> void:
	var oscillators: Array[Dictionary] = patch.oscillators.duplicate(true)
	if index < 0 or index >= oscillators.size():
		return
	oscillators[index][key] = value
	_commit_property(patch, "oscillators", oscillators, "Edit synth oscillator")


func _add_sound_layer(event: ForgeSoundEvent) -> void:
	var layers: Array[Dictionary] = event.layer_records.duplicate(true)
	var source_id := str(event.source_ids[0]) if not event.source_ids.is_empty() else ""
	layers.append({"layer_id": "layer_%d" % (layers.size() + 1),
		"source_id": source_id, "gain_db": 0.0, "pitch_scale": 1.0,
		"start_delay_seconds": 0.0})
	_commit_property(event, "layer_records", layers, "Add Sound Event layer")
	_rebuild_editor()


func _create_sound_event_from_synth(patch: ForgeSynthPatchDefinition) -> void:
	var patch_slug := ForgeId.safe_filename(
		patch.stable_id.trim_prefix("sound.source.synth."))
	var result := session.create(
		"audio.event", "%s_event" % patch_slug, "%s Event" % patch.display_name)
	if not bool(result.get("ok", false)):
		status_changed.emit("Sound Event creation failed: %s" % str(
			result.get("error", "")), true)
		return
	var event: ForgeSoundEvent = result["resource"]
	var source_id := ForgeCreatorBakeService.generated_synth_source_id(patch)
	event.source_ids = PackedStringArray([source_id])
	event.layer_records = [{"layer_id": "instrument_note", "source_id": source_id,
		"gain_db": 0.0, "pitch_scale": 1.0, "start_delay_seconds": 0.0}]
	session.mark_dirty(event.stable_id)
	_activate(event, result["descriptor"])
	status_changed.emit(
		"Created a layered Sound Event linked to the generated instrument source.", false)


func _create_editable_source_from_synth(patch: ForgeSynthPatchDefinition) -> void:
	var patch_slug := ForgeId.safe_filename(
		patch.stable_id.trim_prefix("sound.source.synth."))
	var result := session.create("audio.source", "%s_note_%d" % [
		patch_slug, patch.preview_midi_note], "%s Note %d" % [
		patch.display_name, patch.preview_midi_note])
	if not bool(result.get("ok", false)):
		status_changed.emit("Sound Source creation failed: %s" % str(
			result.get("error", "")), true)
		return
	var source: ForgeSoundSource = result["resource"]
	var target_path := "res://generated/forge/audio/working/%s_stream.tres" % \
		ForgeId.safe_filename(source.stable_id)
	var rendered := ForgeProceduralAudioBaker.new().bake_source(
		patch, patch.preview_midi_note, target_path, source.stable_id)
	if not bool(rendered.get("ok", false)):
		session.close(source.stable_id, true)
		status_changed.emit("Sound Source render failed: %s" % str(
			rendered.get("error", "")), true)
		return
	var generated: ForgeSoundSource = rendered["sound_source"]
	source.source_path = generated.source_path
	source.source_hash = generated.source_hash
	source.media_format = generated.media_format
	source.channel_layout = generated.channel_layout
	source.sample_rate_hz = generated.sample_rate_hz
	source.duration_seconds = generated.duration_seconds
	source.transformation_history = generated.transformation_history.duplicate(true)
	source.procedural_recipe_id = generated.procedural_recipe_id
	source.procedural_seed = generated.procedural_seed
	source.generator_version = generated.generator_version
	source.waveform_preview = generated.waveform_preview
	source.regions = generated.regions.duplicate(true)
	source.processing_settings = generated.processing_settings.duplicate(true)
	source.loudness_analysis = generated.loudness_analysis.duplicate(true)
	source.dependency_ids = generated.dependency_ids
	source.provenance = generated.provenance.duplicate(true)
	source.rights_status = generated.rights_status
	session.mark_dirty(source.stable_id)
	_activate(source, result["descriptor"])
	status_changed.emit(
		"Rendered an editable Sound Source entirely inside Forge.", false)


func _create_sound_event_from_source(source: ForgeSoundSource) -> void:
	var source_slug := ForgeId.safe_filename(
		source.stable_id.trim_prefix("sound.source."))
	var result := session.create(
		"audio.event", "%s_event" % source_slug, "%s Event" % source.display_name)
	if not bool(result.get("ok", false)):
		status_changed.emit("Sound Event creation failed: %s" % str(
			result.get("error", "")), true)
		return
	var event: ForgeSoundEvent = result["resource"]
	event.source_ids = PackedStringArray([source.stable_id])
	event.layer_records = [{"layer_id": "source_layer", "source_id": source.stable_id,
		"gain_db": 0.0, "pitch_scale": 1.0, "start_delay_seconds": 0.0}]
	session.mark_dirty(event.stable_id)
	_activate(event, result["descriptor"])
	status_changed.emit("Created a layered Sound Event linked to this source.", false)


func _remove_sound_layer(event: ForgeSoundEvent, index: int) -> void:
	var layers: Array[Dictionary] = event.layer_records.duplicate(true)
	if index >= 0 and index < layers.size():
		layers.remove_at(index)
		_commit_property(event, "layer_records", layers, "Remove Sound Event layer")
		_rebuild_editor()


func _update_sound_layer(
		event: ForgeSoundEvent, index: int, key: String, value: Variant) -> void:
	var layers: Array[Dictionary] = event.layer_records.duplicate(true)
	if index < 0 or index >= layers.size():
		return
	layers[index][key] = value
	_commit_property(event, "layer_records", layers, "Edit Sound Event layer")


func _event_layer_text(
		event: ForgeSoundEvent, index: int, label: String,
		key: String, value: String) -> Control:
	var entry := LineEdit.new()
	entry.text = value
	entry.text_submitted.connect(func(updated: String) -> void:
		_update_sound_layer(event, index, key, updated.strip_edges()))
	entry.focus_exited.connect(func() -> void:
		_update_sound_layer(event, index, key, entry.text.strip_edges()))
	return _labeled(label, entry)


func _event_layer_float(
		event: ForgeSoundEvent, index: int, label: String,
		key: String, value: float, minimum: float,
		maximum: float, step: float) -> Control:
	var spin := SpinBox.new()
	spin.min_value = minimum
	spin.max_value = maximum
	spin.step = step
	spin.value = value
	spin.value_changed.connect(func(updated: float) -> void:
		_update_sound_layer(event, index, key, updated))
	return _labeled(label, spin)


func _line_property(label: String, resource: Resource, property_name: String) -> Control:
	var entry := LineEdit.new()
	entry.text = str(resource.get(property_name))
	entry.tooltip_text = "Edit %s." % label.to_lower()
	entry.text_submitted.connect(func(value: String) -> void:
		_commit_property(resource, property_name, value.strip_edges(), "Edit %s" % label))
	entry.focus_exited.connect(func() -> void:
		_commit_property(resource, property_name, entry.text.strip_edges(), "Edit %s" % label))
	return _labeled(label, entry)


func _packed_lines_property(label: String, resource: Resource, property_name: String) -> Control:
	var entry := TextEdit.new()
	entry.custom_minimum_size = Vector2(0, 74)
	entry.wrap_mode = TextEdit.LINE_WRAPPING_BOUNDARY
	entry.text = "\n".join(Array(resource.get(property_name)))
	entry.tooltip_text = "One stable ID or tag per line. Changes apply when focus leaves the field."
	entry.focus_exited.connect(func() -> void:
		var values := PackedStringArray()
		for line in entry.text.split("\n"):
			var value := line.strip_edges()
			if not value.is_empty() and value not in values:
				values.append(value)
		_commit_property(resource, property_name, values, "Edit %s" % label))
	return _labeled(label, entry)


func _packed_int_lines_property(label: String, resource: Resource, property_name: String) -> Control:
	var entry := LineEdit.new()
	entry.text = ", ".join(Array(resource.get(property_name)).map(func(value): return str(value)))
	entry.tooltip_text = "Comma-separated integer values. Changes apply when focus leaves the field."
	entry.focus_exited.connect(func() -> void:
		var values := PackedInt32Array()
		for token in entry.text.split(","):
			var value := token.strip_edges()
			if value.is_valid_int() and int(value) not in values:
				values.append(int(value))
		_commit_property(resource, property_name, values, "Edit %s" % label))
	return _labeled(label, entry)


func _dictionary_lines_property(
		label: String, resource: Resource, property_name: String) -> Control:
	var entry := TextEdit.new()
	entry.custom_minimum_size = Vector2(0, 90)
	entry.wrap_mode = TextEdit.LINE_WRAPPING_BOUNDARY
	var dictionary: Dictionary = resource.get(property_name)
	var keys: Array = dictionary.keys()
	keys.sort()
	var lines: Array[String] = []
	for key in keys:
		lines.append("%s=%s" % [str(key), str(dictionary[key])])
	entry.text = "\n".join(lines)
	entry.tooltip_text = "One key=value binding per line. Changes apply when focus leaves the field."
	entry.focus_exited.connect(func() -> void:
		var updated := {}
		for line in entry.text.split("\n"):
			var separator := line.find("=")
			if separator <= 0:
				continue
			var key := line.left(separator).strip_edges()
			var value := line.substr(separator + 1).strip_edges()
			if not key.is_empty() and not value.is_empty():
				updated[key] = value
		_commit_property(resource, property_name, updated, "Edit %s" % label))
	return _labeled(label, entry)


func _dictionary_to_lines(value: Variant) -> String:
	if not value is Dictionary:
		return ""
	var dictionary: Dictionary = value
	var keys: Array = dictionary.keys()
	keys.sort()
	var lines: Array[String] = []
	for key in keys:
		lines.append("%s=%s" % [str(key), str(dictionary[key])])
	return "\n".join(lines)


func _lines_to_dictionary(text: String) -> Dictionary:
	var result := {}
	for line in text.split("\n"):
		var separator := line.find("=")
		if separator <= 0:
			continue
		var key := line.left(separator).strip_edges()
		var raw := line.substr(separator + 1).strip_edges()
		if key.is_empty():
			continue
		var value: Variant = raw
		if raw.is_valid_float(): value = raw.to_float()
		elif raw == "true": value = true
		elif raw == "false": value = false
		result[key] = value
	return result


func _option_property(
		label: String, resource: Resource, property_name: String,
		values: Array) -> Control:
	var option := OptionButton.new()
	var current := str(resource.get(property_name))
	for value in values:
		option.add_item(str(value).replace("_", " ").capitalize())
		option.set_item_metadata(option.item_count - 1, str(value))
		if str(value) == current:
			option.select(option.item_count - 1)
	option.item_selected.connect(func(index: int) -> void:
		_commit_property(resource, property_name, str(option.get_item_metadata(index)),
			"Change %s" % label))
	return _labeled(label, option)


func _bool_property(label: String, resource: Resource, property_name: String) -> Control:
	var check := CheckButton.new()
	check.text = label
	check.button_pressed = bool(resource.get(property_name))
	check.tooltip_text = "%s. Current state is written in the control, not colour alone." % label
	check.toggled.connect(func(value: bool) -> void:
		_commit_property(resource, property_name, value, "Toggle %s" % label))
	return check


func _integer_property(
		label: String, resource: Resource, property_name: String,
		minimum: int, maximum: int) -> Control:
	var spin := SpinBox.new()
	spin.min_value = minimum
	spin.max_value = maximum
	spin.step = 1
	spin.value = int(resource.get(property_name))
	spin.value_changed.connect(func(value: float) -> void:
		_commit_property(resource, property_name, int(value), "Change %s" % label))
	return _labeled(label, spin)


func _float_property(
		label: String, resource: Resource, property_name: String,
		minimum: float, maximum: float, step: float) -> Control:
	var spin := SpinBox.new()
	spin.min_value = minimum
	spin.max_value = maximum
	spin.step = step
	spin.value = float(resource.get(property_name))
	spin.value_changed.connect(func(value: float) -> void:
		_commit_property(resource, property_name, value, "Change %s" % label))
	return _labeled(label, spin)


func _vector3_property(
		label: String, resource: Resource, property_name: String,
		minimum: float, maximum: float) -> Control:
	var row := HBoxContainer.new()
	var current: Vector3 = resource.get(property_name)
	for axis in 3:
		var spin := SpinBox.new()
		spin.min_value = minimum
		spin.max_value = maximum
		spin.step = 0.01
		spin.value = current[axis]
		spin.value_changed.connect(func(value: float) -> void:
			var updated: Vector3 = resource.get(property_name)
			updated[axis] = value
			_commit_property(resource, property_name, updated, "Change %s" % label))
		row.add_child(_labeled(["X", "Y", "Z"][axis], spin))
	return _labeled(label, row)


func _vector3i_property(label: String, resource: Resource, property_name: String) -> Control:
	var row := HBoxContainer.new()
	var current: Vector3i = resource.get(property_name)
	for axis in 3:
		var spin := SpinBox.new()
		spin.min_value = -4096
		spin.max_value = 4096
		spin.step = 1
		spin.value = current[axis]
		spin.value_changed.connect(func(value: float) -> void:
			var updated: Vector3i = resource.get(property_name)
			updated[axis] = int(value)
			_commit_property(resource, property_name, updated, "Change %s" % label))
		row.add_child(_labeled(["X", "Y", "Z"][axis], spin))
	return _labeled(label, row)


func _direction_property(connector: ForgeBlueprintConnectorDefinition) -> Control:
	var option := OptionButton.new()
	var values: Array[Vector3i] = ForgeBlueprintConnectorDefinition.CARDINAL_DIRECTIONS
	for value in values:
		option.add_item(_direction_name(value))
		option.set_item_metadata(option.item_count - 1, value)
		if value == connector.direction:
			option.select(option.item_count - 1)
	option.item_selected.connect(func(index: int) -> void:
		_commit_property(connector, "direction", option.get_item_metadata(index),
			"Change connection direction"))
	return _labeled("Facing direction", option)


func _dictionary_property(
		label: String, resource: Resource, property_name: String, key: String,
		minimum: float, maximum: float, step: float) -> Control:
	var dictionary: Dictionary = resource.get(property_name)
	var spin := SpinBox.new()
	spin.min_value = minimum
	spin.max_value = maximum
	spin.step = step
	spin.value = float(dictionary.get(key, minimum))
	spin.value_changed.connect(func(value: float) -> void:
		var updated: Dictionary = (resource.get(property_name) as Dictionary).duplicate(true)
		updated[key] = value
		_commit_property(resource, property_name, updated, "Change %s" % label))
	return _labeled(label, spin)


func _dictionary_option_property(
		label: String, resource: Resource, property_name: String,
		key: String, values: Array) -> Control:
	var dictionary: Dictionary = resource.get(property_name)
	var current := str(dictionary.get(key, ""))
	var option := OptionButton.new()
	for value in values:
		option.add_item(str(value).replace("_", " ").capitalize())
		option.set_item_metadata(option.item_count - 1, str(value))
		if str(value) == current:
			option.select(option.item_count - 1)
	option.item_selected.connect(func(index: int) -> void:
		var updated: Dictionary = (resource.get(property_name) as Dictionary).duplicate(true)
		updated[key] = str(option.get_item_metadata(index))
		_commit_property(resource, property_name, updated, "Change %s" % label))
	return _labeled(label, option)


func _dictionary_float_field(
		label: String, patch: ForgeSynthPatchDefinition,
		_property_name: String, index: int, key: String, value: float,
		minimum: float, maximum: float, step: float) -> Control:
	var spin := SpinBox.new()
	spin.min_value = minimum
	spin.max_value = maximum
	spin.step = step
	spin.value = value
	spin.value_changed.connect(func(updated: float) -> void:
		_update_oscillator(patch, index, key,
			int(updated) if key in ["octave"] else updated))
	return _labeled(label, spin)


func _ordered_body_parts(plan: ForgeBodyPlanDefinition) -> Array[ForgeBodyPartDefinition]:
	var ordered: Array[ForgeBodyPartDefinition] = plan.body_parts.duplicate()
	ordered.sort_custom(func(a: ForgeBodyPartDefinition, b: ForgeBodyPartDefinition) -> bool:
		var depth_a := _body_part_depth(plan, a)
		var depth_b := _body_part_depth(plan, b)
		if depth_a != depth_b:
			return depth_a < depth_b
		return a.body_part_id < b.body_part_id)
	return ordered


func _body_part_depth(plan: ForgeBodyPlanDefinition, part: ForgeBodyPartDefinition) -> int:
	var depth := 0
	var parent_id := part.parent_part_id
	var visited := {}
	while not parent_id.is_empty() and depth < 32 and not visited.has(parent_id):
		visited[parent_id] = true
		var parent := plan.find_body_part(parent_id)
		if parent == null:
			break
		depth += 1
		parent_id = parent.parent_part_id
	return depth


func _initialise_body_part_volume(part: ForgeBodyPartDefinition) -> void:
	var volume := ForgeVoxelVolume.new()
	volume.dimensions = Vector3i(8, 8, 8)
	volume.density_profile = part.density_profile_id
	volume.voxel_size_meters = 0.125
	volume.ensure_storage()
	volume.set_cell(Vector3i(3, 3, 3), 0)
	_commit_property(part, "voxel_source", volume, "Initialise character voxel volume")
	_rebuild_editor()


func _voxel_volume_records(volume: ForgeVoxelVolume, anatomy := false) -> Array[Dictionary]:
	var records: Array[Dictionary] = []
	if volume == null:
		return records
	volume.ensure_storage()
	var colors := [Color("#C88B58"), Color("#D7B07B"), Color("#7F9F78"),
		Color("#6E8EA8"), Color("#A779A5"), Color("#D2C66D"),
		Color("#A6B4C2"), Color("#D17A70")]
	for z in volume.dimensions.z:
		for y in volume.dimensions.y:
			for x in volume.dimensions.x:
				var position := Vector3i(x, y, z)
				var palette_index := volume.get_cell(position)
				if palette_index < 0:
					continue
				records.append({"position": position,
					"name": "AnatomyVoxel_%d_%d_%d" % [x, y, z],
					"palette_index": palette_index,
					"color": colors[posmod(palette_index, colors.size())],
					"alpha": 0.96 if anatomy else 1.0})
	return records


func _extrude_body_part_layer(part: ForgeBodyPartDefinition) -> void:
	if part.voxel_source == null or _character_3d_canvas == null:
		return
	var source_layer := clampi(_character_3d_canvas.active_layer, 0,
		part.voxel_source.dimensions.y - 1)
	var destination := mini(part.voxel_source.dimensions.y - 1, source_layer + 1)
	if destination == source_layer:
		status_changed.emit("The active layer is already at the volume boundary.", true)
		return
	var volume: ForgeVoxelVolume = part.voxel_source.duplicate(true)
	for z in volume.dimensions.z:
		for x in volume.dimensions.x:
			var value := part.voxel_source.get_cell(Vector3i(x, source_layer, z))
			if value >= 0:
				volume.set_cell(Vector3i(x, destination, z), value)
	_commit_property(part, "voxel_source", volume, "Extrude character voxel layer")
	_rebuild_editor()


func _clear_body_part_layer(part: ForgeBodyPartDefinition, layer: int) -> void:
	if part.voxel_source == null:
		return
	var volume: ForgeVoxelVolume = part.voxel_source.duplicate(true)
	for z in volume.dimensions.z:
		for x in volume.dimensions.x:
			volume.clear_cell(Vector3i(x, layer, z))
	_commit_property(part, "voxel_source", volume, "Clear character voxel layer")
	_rebuild_editor()


func _duplicate_mirrored_body_part(
		plan: ForgeBodyPlanDefinition, part: ForgeBodyPartDefinition) -> void:
	var mirrored := part.duplicate(true) as ForgeBodyPartDefinition
	if mirrored == null:
		return
	var suffix := "right" if part.side_token != "right" else "left"
	mirrored.body_part_id = "%s_%s" % [part.body_part_id, suffix]
	var serial := 2
	while plan.find_body_part(mirrored.body_part_id) != null:
		mirrored.body_part_id = "%s_%s_%d" % [part.body_part_id, suffix, serial]
		serial += 1
	mirrored.display_name = "%s %s" % [part.display_name, suffix.capitalize()]
	mirrored.side_token = suffix
	mirrored.local_position_meters.x = -part.local_position_meters.x
	if mirrored.voxel_source != null:
		var flipped: ForgeVoxelVolume = mirrored.voxel_source.duplicate(true)
		for z in flipped.dimensions.z:
			for y in flipped.dimensions.y:
				for x in flipped.dimensions.x:
					var source_x := flipped.dimensions.x - 1 - x
					var value := mirrored.voxel_source.get_cell(Vector3i(source_x, y, z))
					if value >= 0:
						flipped.set_cell(Vector3i(x, y, z), value)
					else:
						flipped.clear_cell(Vector3i(x, y, z))
		mirrored.voxel_source = flipped
	var parts: Array[ForgeBodyPartDefinition] = plan.body_parts.duplicate()
	parts.append(mirrored)
	_commit_property(plan, "body_parts", parts, "Create mirrored body part")
	_selected_body_part = mirrored
	_rebuild_editor()


func _mirror_rig_bindings(rig: ForgeRigProfile) -> void:
	var bindings: Array[ForgeRigRoleBinding] = rig.role_bindings.duplicate(true)
	var additions: Array[ForgeRigRoleBinding] = []
	for binding in bindings:
		if binding == null or ".left" not in binding.role_id:
			continue
		var right_id := binding.role_id.replace(".left", ".right")
		var already_exists := false
		for existing in bindings:
			if existing != null and existing.role_id == right_id:
				already_exists = true
				break
		if already_exists:
			continue
		var mirrored := binding.duplicate(true) as ForgeRigRoleBinding
		mirrored.role_id = right_id
		mirrored.body_part_id = mirrored.body_part_id.replace("left", "right")
		mirrored.parent_role_id = mirrored.parent_role_id.replace(".left", ".right")
		additions.append(mirrored)
	bindings.append_array(additions)
	if additions.is_empty():
		status_changed.emit("No unmatched .left semantic roles were found.", true)
		return
	_commit_property(rig, "role_bindings", bindings, "Mirror rig role bindings")
	_rebuild_editor()


func _move_animation_key(
		track_index: int, key_index: int, normalized_time: float,
		clip: ForgeEntityAnimationClip) -> void:
	var tracks: Array[Dictionary] = clip.role_tracks.duplicate(true)
	if track_index < 0 or track_index >= tracks.size():
		return
	var keys: Array = tracks[track_index].get("keys", []).duplicate(true)
	if key_index < 0 or key_index >= keys.size():
		return
	keys[key_index]["time"] = clampf(normalized_time, 0.0, 1.0)
	keys.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return float(a.get("time", 0.0)) < float(b.get("time", 0.0)))
	tracks[track_index]["keys"] = keys
	_commit_property(clip, "role_tracks", tracks, "Move animation key")
	_rebuild_editor()


func _vfx_form_visual_records(records: Array[Dictionary]) -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	var colors := [Color("#F2C45E"), Color("#E67C73"), Color("#75C9D2"),
		Color("#B99BE6"), Color("#7ED68B"), Color("#F4F7F9")]
	for record in records:
		var value := record.duplicate(true)
		var palette_index := int(value.get("palette_index", 0))
		value["color"] = colors[posmod(palette_index, colors.size())]
		value["alpha"] = 0.9
		result.append(value)
	return result


func _preview_vfx_accessibility(effect: ForgeVfxDefinition, mode: String) -> void:
	_show_preview_text("VFX ACCESSIBILITY PREVIEW\n%s\nMode: %s\nGraph: %s\nForms: %d\nInstance budget: %d\nNo approval or canonical runtime content changed." % [
		effect.display_name, mode.replace("_", " ").to_upper(), effect.graph_id,
		effect.form_ids.size(), effect.maximum_instances])
	status_changed.emit("VFX preview mode: %s." % mode.replace("_", " "), false)


func _reference_choices(kind: String) -> Array[Dictionary]:
	var choices: Array[Dictionary] = []
	var seen := {}
	var resources: Array[Resource] = []
	for resource in session.resources.values():
		if resource is Resource:
			resources.append(resource)
	for descriptor in registry.all():
		if not _descriptor_matches_reference_kind(descriptor, kind):
			continue
		for path in _resource_paths_recursive(descriptor.source_root):
			var resource := ResourceLoader.load(path, "", ResourceLoader.CACHE_MODE_IGNORE)
			if resource != null:
				resources.append(resource)
	for resource in resources:
		var descriptor := registry.for_resource(resource)
		if descriptor == null or not _descriptor_matches_reference_kind(descriptor, kind):
			continue
		var stable_id := descriptor.identity(resource)
		if kind == "sound_source" and resource is ForgeSynthPatchDefinition:
			stable_id = ForgeCreatorBakeService.generated_synth_source_id(resource)
		if stable_id.is_empty() or seen.has(stable_id):
			continue
		seen[stable_id] = true
		var state := "available"
		if not descriptor.status_property.is_empty():
			state = str(resource.get(descriptor.status_property))
		elif not descriptor.lifecycle_property.is_empty():
			state = str(resource.get(descriptor.lifecycle_property))
		choices.append({"id": stable_id, "name": descriptor.title(resource),
			"category": descriptor.display_name, "state": state,
			"dependency": "open" if session.resources.has(stable_id) else "saved"})
	if kind == "rig_role":
		for resource in session.resources.values():
			if not resource is ForgeRigProfile:
				continue
			for binding in resource.role_bindings:
				if binding == null or seen.has(binding.role_id):
					continue
				seen[binding.role_id] = true
				choices.append({"id": binding.role_id,
					"name": binding.role_id.get_slice(".", binding.role_id.get_slice_count(".") - 1).capitalize(),
					"category": "Rig socket / role", "state": resource.lifecycle,
					"dependency": resource.rig_profile_id})
	return choices


func _descriptor_matches_reference_kind(
		descriptor: ForgeAuthoringTypeDescriptor, kind: String) -> bool:
	match kind:
		"structure_module": return descriptor.type_id == "structure.module"
		"vfx_graph": return descriptor.type_id == "vfx.graph"
		"vfx_form": return descriptor.type_id == "vfx.form"
		"sound_source": return descriptor.type_id in ["audio.source", "audio.synth_patch"]
		"rig_role": return descriptor.type_id == "character.rig"
	return false


func _move_sound_layer(event: ForgeSoundEvent, index: int, direction: int) -> void:
	var destination := index + direction
	if index < 0 or destination < 0 or index >= event.layer_records.size() \
			or destination >= event.layer_records.size():
		return
	var layers: Array[Dictionary] = event.layer_records.duplicate(true)
	var layer := layers[index]
	layers.remove_at(index)
	layers.insert(destination, layer)
	_commit_property(event, "layer_records", layers, "Reorder Sound Event layer")
	_rebuild_editor()


func _audition_sound_layer(layer: Dictionary) -> void:
	var source_id := str(layer.get("source_id", ""))
	for resource in session.resources.values():
		if resource is ForgeSoundSource and resource.stable_id == source_id:
			_play_sound_source(resource)
			return
		if resource is ForgeSynthPatchDefinition and resource.stable_id == source_id:
			_play_synth_note(resource.preview_midi_note)
			return
	status_changed.emit("Open the referenced source to audition this lane.", true)


func _labeled(label_text: String, control: Control) -> Control:
	var stack := VBoxContainer.new()
	stack.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var label := Label.new()
	label.text = label_text
	label.add_theme_font_size_override("font_size", 12)
	stack.add_child(label)
	control.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	control.set_meta("accessible_label", label_text)
	if control.name.is_empty() or str(control.name).begins_with("@"): 
		control.name = "GuideTarget_%s" % ForgeId.safe_filename(label_text)
	control.set_meta("guide_target_id", str(control.name))
	stack.add_child(control)
	return stack


func _button(label: String, action: Callable) -> Button:
	var button := Button.new()
	button.name = "GuideTarget_%s" % ForgeId.safe_filename(label)
	button.text = label
	button.custom_minimum_size = Vector2(0, 38)
	button.tooltip_text = label
	button.set_meta("accessible_label", label)
	button.set_meta("guide_target_id", str(button.name))
	button.pressed.connect(action)
	ForgeVisualTheme.apply_button(button, Color("#D9A441"))
	return button


func _boxed(content: Control) -> Control:
	var panel := PanelContainer.new()
	panel.add_child(content)
	return panel


func _add_heading(text: String) -> void:
	var label := Label.new()
	label.text = text
	label.add_theme_font_size_override("font_size", 18)
	label.add_theme_color_override("font_color", Color("#E8D6A4"))
	_editor.add_child(label)


func _show_diagnostic_records(records: Array) -> void:
	_clear(_diagnostics)
	if records.is_empty():
		var clear_label := Label.new()
		clear_label.text = "No validation diagnostics."
		_diagnostics.add_child(clear_label)
		return
	for record in records:
		var label := Label.new()
		label.text = "[%s] %s — %s" % [
			str(record.get("severity", "info")).to_upper(),
			str(record.get("code", "FORGE")), str(record.get("message", ""))]
		label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		label.tooltip_text = "Severity and code are written explicitly; colour is supplemental."
		_diagnostics.add_child(label)


func _show_preview_text(text: String) -> void:
	if is_instance_valid(_preview_output):
		_preview_output.text = text


func _set_state(state: String, detail: String) -> void:
	_state_label.text = "%s  |  %s" % [state, detail]
	_state_label.tooltip_text = "Creator source state: %s. %s" % [state, detail]


func _emit_history() -> void:
	var history: ForgeCommandService = session.command_histories.get(
		current_descriptor.identity(current_resource)) if has_source() else null
	history_changed.emit(history != null and not history.undo_stack.is_empty(),
		history != null and not history.redo_stack.is_empty())


func _resource_paths_recursive(root: String) -> PackedStringArray:
	var results := PackedStringArray()
	var directory := DirAccess.open(root)
	if directory == null:
		return results
	directory.list_dir_begin()
	var entry := directory.get_next()
	while not entry.is_empty():
		if not entry.begins_with("."):
			var path := root.path_join(entry)
			if directory.current_is_dir():
				results.append_array(_resource_paths_recursive(path))
			elif (entry.ends_with(".tres") or entry.ends_with(".res")) \
					and ".previous." not in entry and ".tmp." not in entry:
				results.append(path)
		entry = directory.get_next()
	directory.list_dir_end()
	results.sort()
	return results


func _direction_name(value: Vector3i) -> String:
	if value == Vector3i.RIGHT: return "East (+X)"
	if value == Vector3i.LEFT: return "West (-X)"
	if value == Vector3i.FORWARD: return "North / Forward (-Z)"
	if value == Vector3i.BACK: return "South / Back (+Z)"
	if value == Vector3i.UP: return "Up (+Y)"
	return "Down (-Y)"


func _array_vector3i(value: Variant) -> Vector3i:
	if value is Vector3i:
		return value
	if value is Array and value.size() >= 3:
		return Vector3i(int(value[0]), int(value[1]), int(value[2]))
	return Vector3i.ZERO


func _note_name(note: int) -> String:
	const NAMES := ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
	return "%s%d" % [NAMES[posmod(note, 12)], floori(float(note) / 12.0) - 1]


func _clear(parent: Node) -> void:
	if parent == null:
		return
	for child in parent.get_children():
		parent.remove_child(child)
		child.queue_free()
