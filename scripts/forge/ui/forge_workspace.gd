class_name ForgeWorkspace
extends Control
## Shared creator shell used by the Godot main-screen plug-in and development
## runtime host. Both hosts call the same services and write the same sources.

signal asset_opened(asset_id: String)
signal asset_baked(presentation_id: String)

@export_enum("runtime", "editor") var host_mode := "runtime"

const MATERIAL_ROOT := "res://content/forge/materials"
const PATTERN_ROOT := "res://content/forge/patterns"
const LAYOUT_PREFERENCES_PATH := "user://leyforge_forge_ui.cfg"
const WIDE_LAYOUT_MINIMUM := 1500.0

var asset_index := ForgeAssetIndex.new()
var document_service := ForgeDocumentService.new()
var command_service := ForgeCommandService.new()
var autosave_service := ForgeAutosaveService.new()
var validation_service := ForgeValidationService.new()
var bake_service := ForgeBakeService.new()
var registry_bridge := ForgeRegistryBridge.new()
var presentation_workspace := ForgePresentationWorkspaceService.new()
var presentation_laboratory := ForgePresentationTestLaboratory.new()

var current_asset: ForgeAssetDefinition
var current_record: Dictionary = {}
var current_diagnostics: Array[ForgeDiagnostic] = []
var current_preview_override: ForgeOverrideDefinition

var _page_title: Label
var _page: VBoxContainer
var _page_scroll: ScrollContainer
var _asset_heading: Label
var _status_label: Label
var _preview: ForgePreviewViewport
var _preview_panel: Control
var _undo_button: Button
var _redo_button: Button
var _save_button: Button
var _validate_button: Button
var _bake_preview_button: Button
var _approve_button: Button
var _navigation_toggle_button: Button
var _preview_toggle_button: Button
var _search_entry: LineEdit
var _browser_results: VBoxContainer
var _surface_canvas: ForgePixelCanvas
var _voxel_canvas: ForgeVoxelSliceCanvas
var _columns: HSplitContainer
var _centre_and_preview: HSplitContainer
var _navigation_host: Control
var _primary_rail: VBoxContainer
var _secondary_navigation: PanelContainer
var _secondary_title_label: Label
var _route_container: VBoxContainer
var _route_popup: PopupPanel
var _route_popup_container: VBoxContainer
var _workflow_cards: GridContainer
var _section_context_label: Label
var _breadcrumb_context_label: Label
var _asset_context_label: Label
var _lifecycle_context_label: Label
var _section_buttons := {}
var _route_buttons := {}
var _active_section_id := "home"
var _active_route_id := "home_dashboard"
var _active_accent := Color("#D9A441")
var _secondary_user_collapsed := false
var _preview_user_visible := true
var _current_route_allows_preview := false
var _synchronising_route := false
var _selected_face := "north"
var _selected_palette_index := 0
var _surface_face_clipboard := PackedByteArray()
var _surface_face_clipboard_size := Vector2i.ZERO
var _surface_face_clipboard_source := ""
var _voxel_layer_clipboard := PackedByteArray()
var _voxel_layer_clipboard_size := Vector2i.ZERO
var _voxel_layer_clipboard_source := ""
var _pending_autosave := false


func _ready() -> void:
	if not ForgeAccessPolicy.is_development_enabled():
		_show_access_denied()
		return
	clip_contents = true
	_load_layout_preferences()
	_build_shell()
	command_service.history_changed.connect(_on_history_changed)
	document_service.document_saved.connect(_on_document_saved)
	bake_service.bake_completed.connect(_on_bake_completed)
	asset_index.rebuild()
	resized.connect(_apply_responsive_layout)
	open_section(_active_section_id)
	call_deferred("_offer_recovery")


func _build_shell() -> void:
	var background := ColorRect.new()
	background.color = ForgeVisualTheme.INK
	background.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	add_child(background)
	var root := VBoxContainer.new()
	root.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	root.add_theme_constant_override("separation", 0)
	add_child(root)
	root.add_child(_build_toolbar())
	root.add_child(_build_context_ribbon())
	var separator := HSeparator.new()
	root.add_child(separator)
	_columns = HSplitContainer.new()
	_columns.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_columns.split_offset = 312
	root.add_child(_columns)
	_navigation_host = _build_navigation()
	_columns.add_child(_navigation_host)
	_centre_and_preview = HSplitContainer.new()
	_centre_and_preview.split_offset = 560
	_columns.add_child(_centre_and_preview)
	_centre_and_preview.add_child(_build_page_host())
	_preview_panel = _build_preview_panel()
	_centre_and_preview.add_child(_preview_panel)
	_centre_and_preview.resized.connect(_fit_shell_splits)
	_route_popup = _build_route_popup()
	add_child(_route_popup)
	_rebuild_navigation()
	_apply_responsive_layout()
	call_deferred("_fit_shell_splits")


func _build_toolbar() -> Control:
	var bar := HBoxContainer.new()
	bar.custom_minimum_size = Vector2(0, 58)
	bar.add_theme_constant_override("separation", 8)
	var brand := Label.new()
	brand.text = " LEYFORGE FORGE"
	brand.custom_minimum_size = Vector2(205, 0)
	brand.add_theme_font_size_override("font_size", 20)
	brand.add_theme_color_override("font_color", ForgeVisualTheme.FOCUS_GOLD)
	bar.add_child(brand)
	_save_button = _toolbar_button("Save Draft", _save_current)
	_save_button.disabled = true
	_save_button.tooltip_text = (
		"Save Draft (Ctrl+S). Open or create an editable asset before saving.")
	bar.add_child(_save_button)
	_undo_button = _toolbar_button("Undo", command_service.undo)
	_undo_button.disabled = true
	_undo_button.tooltip_text = "Undo (Ctrl+Z). No undo command is available."
	bar.add_child(_undo_button)
	_redo_button = _toolbar_button("Redo", command_service.redo)
	_redo_button.disabled = true
	_redo_button.tooltip_text = "Redo (Ctrl+Y). No redo command is available."
	bar.add_child(_redo_button)
	_validate_button = _toolbar_button("Validate", _validate_current)
	_validate_button.disabled = true
	_validate_button.tooltip_text = (
		"Validate (Ctrl+Enter). Open or create an asset before validating.")
	bar.add_child(_validate_button)
	_bake_preview_button = _toolbar_button("Bake Preview", _bake_preview)
	_bake_preview_button.disabled = true
	_bake_preview_button.tooltip_text = "Open or create an asset before baking a preview."
	bar.add_child(_bake_preview_button)
	_approve_button = _toolbar_button("Approve & Bake", _approve_and_bake)
	_approve_button.disabled = true
	_approve_button.tooltip_text = (
		"Open a validated editable asset before approving a runtime product.")
	bar.add_child(_approve_button)
	_navigation_toggle_button = _toolbar_button("Studio Workflows", _show_route_popup)
	_navigation_toggle_button.tooltip_text = (
		"Open the workflows for the current Forge studio.")
	bar.add_child(_navigation_toggle_button)
	_preview_toggle_button = _toolbar_button("Preview Panel", func() -> void:
		_preview_user_visible = not _preview_user_visible
		_save_layout_preferences()
		_apply_preview_visibility())
	_preview_toggle_button.tooltip_text = (
		"Show or hide the contextual live preview without changing the asset.")
	bar.add_child(_preview_toggle_button)
	var spacer := Control.new()
	spacer.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	bar.add_child(spacer)
	_status_label = Label.new()
	_status_label.text = "No asset open"
	_status_label.add_theme_color_override("font_color", ForgeVisualTheme.MUTED)
	bar.add_child(_status_label)
	return bar


func _build_context_ribbon() -> Control:
	var panel := PanelContainer.new()
	panel.custom_minimum_size = Vector2(0, 38)
	panel.add_theme_stylebox_override(
		"panel", ForgeVisualTheme.panel_style(
			ForgeVisualTheme.PANEL.darkened(0.08), Color("#263840"), 1))
	var row := HBoxContainer.new()
	row.add_theme_constant_override("separation", 12)
	panel.add_child(row)
	_section_context_label = Label.new()
	_section_context_label.custom_minimum_size = Vector2(155, 0)
	_section_context_label.add_theme_font_size_override("font_size", 13)
	row.add_child(_section_context_label)
	_breadcrumb_context_label = Label.new()
	_breadcrumb_context_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_breadcrumb_context_label.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	_breadcrumb_context_label.add_theme_color_override(
		"font_color", ForgeVisualTheme.PARCHMENT)
	row.add_child(_breadcrumb_context_label)
	_asset_context_label = Label.new()
	_asset_context_label.custom_minimum_size = Vector2(260, 0)
	_asset_context_label.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
	_asset_context_label.add_theme_color_override("font_color", ForgeVisualTheme.MUTED)
	row.add_child(_asset_context_label)
	_lifecycle_context_label = Label.new()
	_lifecycle_context_label.custom_minimum_size = Vector2(300, 0)
	_lifecycle_context_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	row.add_child(_lifecycle_context_label)
	return panel


func _build_navigation() -> Control:
	var host := HBoxContainer.new()
	host.custom_minimum_size = Vector2(312, 0)
	host.add_theme_constant_override("separation", 0)
	var rail_panel := PanelContainer.new()
	rail_panel.custom_minimum_size = Vector2(72, 0)
	var rail_style := ForgeVisualTheme.panel_style(
		ForgeVisualTheme.PANEL.darkened(0.05), Color("#26343B"), 1)
	rail_style.content_margin_left = 0.0
	rail_style.content_margin_right = 0.0
	rail_style.content_margin_top = 0.0
	rail_style.content_margin_bottom = 0.0
	rail_panel.add_theme_stylebox_override("panel", rail_style)
	host.add_child(rail_panel)
	var rail_margin := MarginContainer.new()
	rail_margin.add_theme_constant_override("margin_left", 6)
	rail_margin.add_theme_constant_override("margin_right", 6)
	rail_margin.add_theme_constant_override("margin_top", 8)
	rail_margin.add_theme_constant_override("margin_bottom", 8)
	rail_panel.add_child(rail_margin)
	_primary_rail = VBoxContainer.new()
	_primary_rail.name = "ForgeStudioRail"
	_primary_rail.add_theme_constant_override("separation", 5)
	rail_margin.add_child(_primary_rail)
	var crest := Label.new()
	crest.text = "LF"
	crest.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	crest.add_theme_font_size_override("font_size", 17)
	crest.add_theme_color_override("font_color", ForgeVisualTheme.FOCUS_GOLD)
	_primary_rail.add_child(crest)
	for section in ForgeNavigationCatalog.sections():
		var button := Button.new()
		button.name = "Studio_%s" % str(section.id)
		button.custom_minimum_size = Vector2(58, 48)
		button.tooltip_text = "%s — %s" % [section.label, section.description]
		button.set_meta("accessible_label", str(section.label))
		var icon_path := str(section.icon)
		if ResourceLoader.exists(icon_path):
			button.icon = load(icon_path)
			button.expand_icon = true
		else:
			button.text = str(section.short_label)
		button.pressed.connect(open_section.bind(str(section.id)))
		_primary_rail.add_child(button)
		_section_buttons[str(section.id)] = button
	var rail_spacer := Control.new()
	rail_spacer.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_primary_rail.add_child(rail_spacer)
	var help := Button.new()
	help.text = "?"
	help.custom_minimum_size = Vector2(58, 38)
	help.tooltip_text = "Open the complete Leyforge Forge guide."
	help.set_meta("accessible_label", "Forge Guide")
	help.pressed.connect(open_route.bind("forge_guide"))
	ForgeVisualTheme.apply_button(help, ForgeVisualTheme.FOCUS_GOLD)
	_primary_rail.add_child(help)
	if host_mode == "runtime":
		var back := Button.new()
		back.text = "←"
		back.custom_minimum_size = Vector2(58, 38)
		back.tooltip_text = "Back to Main Menu"
		back.set_meta("accessible_label", "Back to Main Menu")
		back.pressed.connect(_return_to_main_menu)
		ForgeVisualTheme.apply_button(back, ForgeVisualTheme.FOCUS_GOLD)
		_primary_rail.add_child(back)

	_secondary_navigation = PanelContainer.new()
	_secondary_navigation.name = "ForgeContextNavigation"
	_secondary_navigation.custom_minimum_size = Vector2(240, 0)
	var secondary_style := ForgeVisualTheme.panel_style(
		ForgeVisualTheme.PANEL, Color("#2A3A42"), 1)
	secondary_style.content_margin_left = 8.0
	secondary_style.content_margin_right = 8.0
	_secondary_navigation.add_theme_stylebox_override("panel", secondary_style)
	host.add_child(_secondary_navigation)
	var secondary_stack := VBoxContainer.new()
	secondary_stack.add_theme_constant_override("separation", 8)
	_secondary_navigation.add_child(secondary_stack)
	var secondary_header := HBoxContainer.new()
	_secondary_title_label = Label.new()
	_secondary_title_label.name = "StudioNavigationTitle"
	_secondary_title_label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_secondary_title_label.add_theme_font_size_override("font_size", 17)
	secondary_header.add_child(_secondary_title_label)
	var collapse := Button.new()
	collapse.text = "‹"
	collapse.tooltip_text = "Collapse studio workflows."
	collapse.pressed.connect(func() -> void:
		_secondary_user_collapsed = true
		_save_layout_preferences()
		_apply_responsive_layout())
	ForgeVisualTheme.apply_button(collapse, ForgeVisualTheme.FOCUS_GOLD)
	secondary_header.add_child(collapse)
	secondary_stack.add_child(secondary_header)
	var scroll := ScrollContainer.new()
	scroll.name = "ForgeNavigationScroll"
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	secondary_stack.add_child(scroll)
	var margin := MarginContainer.new()
	margin.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	margin.add_theme_constant_override("margin_left", 2)
	margin.add_theme_constant_override("margin_right", 2)
	margin.add_theme_constant_override("margin_top", 2)
	margin.add_theme_constant_override("margin_bottom", 8)
	scroll.add_child(margin)
	_route_container = VBoxContainer.new()
	_route_container.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_route_container.add_theme_constant_override("separation", 6)
	margin.add_child(_route_container)
	return host


func _build_route_popup() -> PopupPanel:
	var popup := PopupPanel.new()
	popup.name = "ForgeWorkflowDrawer"
	popup.transparent_bg = false
	var margin := MarginContainer.new()
	for side in ["left", "right", "top", "bottom"]:
		margin.add_theme_constant_override("margin_%s" % side, 12)
	popup.add_child(margin)
	var scroll := ScrollContainer.new()
	scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	scroll.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	margin.add_child(scroll)
	_route_popup_container = VBoxContainer.new()
	_route_popup_container.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_route_popup_container.add_theme_constant_override("separation", 6)
	scroll.add_child(_route_popup_container)
	return popup


func open_section(section_id: String) -> void:
	var section := ForgeNavigationCatalog.section(section_id)
	if section.is_empty():
		_set_status("Unknown Forge studio: %s" % section_id, true)
		return
	_active_section_id = section_id
	_active_route_id = ""
	_active_accent = Color(str(section.accent))
	_current_route_allows_preview = false
	_apply_preview_visibility()
	_rebuild_navigation()
	_refresh_context_ribbon()
	_save_layout_preferences()
	var handler_name := str(section.landing_handler)
	if has_method(handler_name):
		Callable(self, handler_name).call()


func open_route(route_id: String) -> void:
	var route := ForgeNavigationCatalog.route(route_id)
	if route.is_empty():
		_set_status("Unknown Forge workflow: %s" % route_id, true)
		return
	if str(route.availability) == ForgeNavigationCatalog.PLANNED:
		_set_status("%s is planned and is not presented as complete." % route.label, false)
		return
	if bool(route.requires_asset) and current_asset == null:
		_set_status("Open or create an asset before using %s." % route.label, true)
		return
	_active_section_id = str(route.section_id)
	_active_route_id = route_id
	var section := ForgeNavigationCatalog.section(_active_section_id)
	_active_accent = Color(str(section.accent))
	_current_route_allows_preview = bool(route.show_preview)
	_apply_preview_visibility()
	_rebuild_navigation()
	_refresh_context_ribbon()
	_save_layout_preferences()
	if is_instance_valid(_route_popup):
		_route_popup.hide()
	var handler_name := str(route.handler)
	if has_method(handler_name):
		Callable(self, handler_name).call()
	else:
		_set_status("Forge workflow handler is unavailable: %s" % handler_name, true)


func _rebuild_navigation() -> void:
	if not is_instance_valid(_primary_rail):
		return
	var section := ForgeNavigationCatalog.section(_active_section_id)
	if section.is_empty():
		return
	_active_accent = Color(str(section.accent))
	if is_instance_valid(_secondary_title_label):
		_secondary_title_label.text = str(section.label)
		_secondary_title_label.add_theme_color_override("font_color", _active_accent)
	for section_id in _section_buttons:
		var button: Button = _section_buttons[section_id]
		var definition := ForgeNavigationCatalog.section(str(section_id))
		ForgeVisualTheme.apply_button(
			button, Color(str(definition.accent)), str(section_id) == _active_section_id)
	_populate_route_buttons(_route_container, true)
	_populate_route_buttons(_route_popup_container, false)
	if is_instance_valid(_page_title):
		_page_title.add_theme_color_override("font_color", _active_accent.lightened(0.18))


func _populate_route_buttons(container: VBoxContainer, track_buttons: bool) -> void:
	if not is_instance_valid(container):
		return
	for child in container.get_children():
		container.remove_child(child)
		child.queue_free()
	if track_buttons:
		_route_buttons.clear()
	var last_group := ""
	for route in ForgeNavigationCatalog.routes_for_section(_active_section_id):
		var group := str(route.group)
		if group != last_group:
			var heading := Label.new()
			heading.text = group.to_upper()
			heading.add_theme_font_size_override("font_size", 11)
			heading.add_theme_color_override("font_color", _active_accent)
			container.add_child(heading)
			last_group = group
		var button := Button.new()
		button.name = "Route_%s" % str(route.route_id)
		button.text = "%s  %s" % [
			ForgeVisualTheme.availability_prefix(str(route.availability)),
			str(route.label),
		]
		button.alignment = HORIZONTAL_ALIGNMENT_LEFT
		button.clip_text = true
		button.text_overrun_behavior = TextServer.OVERRUN_TRIM_ELLIPSIS
		button.custom_minimum_size = Vector2(0, 40)
		button.set_meta("accessible_label", "%s, %s" % [
			route.label, route.availability])
		button.tooltip_text = "%s workflow." % str(route.availability)
		var disabled_reason := ""
		if str(route.availability) == ForgeNavigationCatalog.PLANNED:
			disabled_reason = "Planned specialist editor; it is not implemented yet."
		elif bool(route.requires_asset) and current_asset == null:
			disabled_reason = "Open or create an asset before using this workflow."
		button.disabled = not disabled_reason.is_empty()
		if not disabled_reason.is_empty():
			button.tooltip_text = disabled_reason
		button.pressed.connect(open_route.bind(str(route.route_id)))
		ForgeVisualTheme.apply_button(
			button, _active_accent, str(route.route_id) == _active_route_id)
		container.add_child(button)
		if track_buttons:
			_route_buttons[str(route.route_id)] = button


func _show_route_popup() -> void:
	if not is_instance_valid(_route_popup):
		return
	_populate_route_buttons(_route_popup_container, false)
	var popup_height := clampi(roundi(size.y - 100.0), 360, 680)
	_route_popup.popup(Rect2i(Vector2i(72, 76), Vector2i(300, popup_height)))


func _apply_responsive_layout() -> void:
	if not is_instance_valid(_navigation_host) or not is_instance_valid(_columns):
		return
	var show_secondary := size.x >= WIDE_LAYOUT_MINIMUM \
		and not _secondary_user_collapsed
	_secondary_navigation.visible = show_secondary
	_navigation_host.custom_minimum_size.x = 312.0 if show_secondary else 72.0
	_columns.split_offset = 312 if show_secondary else 72
	if is_instance_valid(_navigation_toggle_button):
		_navigation_toggle_button.visible = not show_secondary
	if is_instance_valid(_status_label):
		_status_label.visible = size.x >= 1400.0
	_update_workflow_card_columns()
	_fit_shell_splits()


func refresh_host_layout() -> void:
	if not is_node_ready():
		return
	# The Godot main-screen plug-in creates this workspace hidden. Containers can
	# therefore miss their first sort notification even though their children and
	# minimum sizes are already valid. Re-sort the current page after the editor
	# makes it visible or changes the available centre-panel rectangle.
	_apply_responsive_layout()
	if is_instance_valid(_page_scroll):
		_page_scroll.queue_sort()
	if is_instance_valid(_page):
		_page.queue_sort()
	if is_instance_valid(_workflow_cards):
		_workflow_cards.queue_sort()


func _update_workflow_card_columns() -> void:
	if not is_instance_valid(_workflow_cards):
		return
	var available_width := _page_scroll.size.x if is_instance_valid(_page_scroll) else 0.0
	if available_width <= 0.0:
		available_width = size.x - (
			_navigation_host.custom_minimum_size.x
			if is_instance_valid(_navigation_host) else 72.0) - 48.0
	# Cards have a 245 px minimum and 10 px separation. Three columns keep the
	# hubs scannable on normal Forge layouts; narrower hosts step down cleanly.
	_workflow_cards.columns = clampi(
		floori((maxf(245.0, available_width) + 10.0) / 255.0), 1, 3)


func _apply_preview_visibility() -> void:
	if not is_instance_valid(_preview_panel):
		return
	var visible_now := _current_route_allows_preview and _preview_user_visible
	_preview_panel.visible = visible_now
	if is_instance_valid(_preview_toggle_button):
		_preview_toggle_button.disabled = not _current_route_allows_preview
		_preview_toggle_button.text = (
			"Preview: On" if visible_now else "Preview: Off")
		_preview_toggle_button.tooltip_text = (
			"This workflow has no contextual preview."
			if not _current_route_allows_preview
			else "Show or hide the preview without changing source data.")
	_fit_shell_splits()
	call_deferred("_fit_shell_splits")


func _sync_route_from_page_title(page_title: String) -> void:
	if _synchronising_route:
		return
	var route := ForgeNavigationCatalog.route_for_page(page_title)
	if route.is_empty():
		return
	_synchronising_route = true
	_active_section_id = str(route.section_id)
	_active_route_id = str(route.route_id)
	var section := ForgeNavigationCatalog.section(_active_section_id)
	_active_accent = Color(str(section.accent))
	_current_route_allows_preview = bool(route.show_preview)
	_apply_preview_visibility()
	_rebuild_navigation()
	_refresh_context_ribbon()
	_save_layout_preferences()
	_synchronising_route = false


func _refresh_context_ribbon() -> void:
	if not is_instance_valid(_section_context_label):
		return
	var section := ForgeNavigationCatalog.section(_active_section_id)
	var section_label := str(section.get("label", "Leyforge Forge"))
	var route := ForgeNavigationCatalog.route(_active_route_id)
	var route_label := str(route.get("label", "Studio Overview"))
	_section_context_label.text = "◆  %s" % section_label
	_section_context_label.add_theme_color_override("font_color", _active_accent)
	_breadcrumb_context_label.text = "%s  ›  %s" % [section_label, route_label]
	if current_asset == null:
		_asset_context_label.text = "No asset open"
		_lifecycle_context_label.text = "◇ SOURCE: NONE  •  VALIDATION: NOT RUN"
		_lifecycle_context_label.add_theme_color_override(
			"font_color", ForgeVisualTheme.MUTED)
		return
	_asset_context_label.text = "%s  •  %s" % [
		current_asset.display_name, current_asset.presentation_id]
	var source_status := current_asset.source_status.to_upper()
	var validation_status := "NOT RUN"
	var has_blocker := false
	if not current_diagnostics.is_empty():
		var summary := validation_service.summarize(current_diagnostics)
		has_blocker = int(summary.error) + int(summary.critical) > 0
		validation_status = (
			"BLOCKED" if has_blocker else "%d WARNING(S)" % int(summary.warning))
	var bake_status := "STALE" if bool(current_record.get(
		"approved_product_stale", false)) else (
		"MATCHED" if current_asset.source_status == "approved" else "PREVIEW ONLY")
	_lifecycle_context_label.text = "◆ SOURCE: %s  •  VALIDATION: %s  •  BAKE: %s" % [
		source_status, validation_status, bake_status]
	_lifecycle_context_label.add_theme_color_override(
		"font_color", ForgeVisualTheme.ERROR if has_blocker else _active_accent.lightened(0.2))


func _load_layout_preferences() -> void:
	var config := ConfigFile.new()
	if config.load(LAYOUT_PREFERENCES_PATH) != OK:
		return
	var requested_section := str(config.get_value("layout", "active_section", "home"))
	if not ForgeNavigationCatalog.section(requested_section).is_empty():
		_active_section_id = requested_section
	_secondary_user_collapsed = bool(config.get_value(
		"layout", "secondary_collapsed", false))
	_preview_user_visible = bool(config.get_value(
		"layout", "preview_visible", true))


func _save_layout_preferences() -> void:
	var config := ConfigFile.new()
	config.set_value("layout", "active_section", _active_section_id)
	config.set_value("layout", "secondary_collapsed", _secondary_user_collapsed)
	config.set_value("layout", "preview_visible", _preview_user_visible)
	config.save(LAYOUT_PREFERENCES_PATH)


func _build_page_host() -> Control:
	var panel := PanelContainer.new()
	panel.add_theme_stylebox_override(
		"panel", ForgeVisualTheme.panel_style(
			ForgeVisualTheme.INK, Color("#203139"), 1))
	var margin := MarginContainer.new()
	margin.add_theme_constant_override("margin_left", 20)
	margin.add_theme_constant_override("margin_right", 20)
	margin.add_theme_constant_override("margin_top", 16)
	margin.add_theme_constant_override("margin_bottom", 16)
	var content := VBoxContainer.new()
	content.add_theme_constant_override("separation", 10)
	panel.add_child(margin)
	margin.add_child(content)
	_page_title = Label.new()
	_page_title.add_theme_font_size_override("font_size", 27)
	_page_title.add_theme_color_override("font_color", _active_accent.lightened(0.18))
	content.add_child(_page_title)
	_page_scroll = ScrollContainer.new()
	_page_scroll.name = "ForgePageScroll"
	_page_scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
	_page_scroll.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_page_scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	content.add_child(_page_scroll)
	_page = VBoxContainer.new()
	_page.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	_page.add_theme_constant_override("separation", 10)
	_page_scroll.add_child(_page)
	return panel


func _build_preview_panel() -> Control:
	var panel := PanelContainer.new()
	panel.custom_minimum_size = Vector2(280, 0)
	panel.clip_contents = true
	panel.add_theme_stylebox_override(
		"panel", ForgeVisualTheme.panel_style(
			ForgeVisualTheme.PANEL, Color("#2B3B43"), 1))
	var margin := MarginContainer.new()
	margin.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	margin.size_flags_vertical = Control.SIZE_EXPAND_FILL
	for side in ["left", "right", "top", "bottom"]:
		margin.add_theme_constant_override("margin_%s" % side, 12)
	panel.add_child(margin)
	var stack := VBoxContainer.new()
	stack.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	stack.size_flags_vertical = Control.SIZE_EXPAND_FILL
	stack.add_theme_constant_override("separation", 10)
	margin.add_child(stack)
	var title := Label.new()
	title.text = "Live Preview"
	title.add_theme_font_size_override("font_size", 20)
	title.add_theme_color_override("font_color", ForgeVisualTheme.FOCUS_GOLD)
	stack.add_child(title)
	_preview = ForgePreviewViewport.new()
	_preview.size_flags_vertical = Control.SIZE_EXPAND_FILL
	var preview_controls := HBoxContainer.new()
	preview_controls.alignment = BoxContainer.ALIGNMENT_CENTER
	preview_controls.add_theme_constant_override("separation", 8)
	var zoom_out_button := _toolbar_button("−", _preview.zoom_out)
	zoom_out_button.tooltip_text = (
		"Zoom out (mouse wheel down or minus key)")
	preview_controls.add_child(zoom_out_button)
	var reset_button := _toolbar_button("Reset", _preview.reset_view)
	reset_button.tooltip_text = "Reset orbit and zoom (0 key)"
	preview_controls.add_child(reset_button)
	var zoom_in_button := _toolbar_button("+", _preview.zoom_in)
	zoom_in_button.tooltip_text = "Zoom in (mouse wheel up or plus key)"
	preview_controls.add_child(zoom_in_button)
	var zoom_readout := Label.new()
	zoom_readout.text = "100%"
	zoom_readout.custom_minimum_size = Vector2(48, 0)
	zoom_readout.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	preview_controls.add_child(zoom_readout)
	_preview.zoom_changed.connect(func(percent: int) -> void:
		zoom_readout.text = "%d%%" % percent)
	stack.add_child(preview_controls)
	var pan_controls := HBoxContainer.new()
	pan_controls.alignment = BoxContainer.ALIGNMENT_CENTER
	pan_controls.add_theme_constant_override("separation", 6)
	for control in [
		["←", "Pan left", _preview.pan_left],
		["↑", "Pan up", _preview.pan_up],
		["↓", "Pan down", _preview.pan_down],
		["→", "Pan right", _preview.pan_right],
	]:
		var pan_button := _toolbar_button(str(control[0]), control[2])
		pan_button.tooltip_text = "%s (arrow key)" % str(control[1])
		pan_controls.add_child(pan_button)
	stack.add_child(pan_controls)
	# The canvas flexes inside the remaining panel height. It is deliberately not
	# inside a whole-panel ScrollContainer: an expanding SubViewport in a scroll
	# child can feed its own height back into the content minimum and run below
	# the host viewport.
	stack.add_child(_preview)
	var details_scroll := ScrollContainer.new()
	details_scroll.name = "ForgePreviewScroll"
	details_scroll.custom_minimum_size = Vector2(0, 68)
	details_scroll.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	details_scroll.size_flags_vertical = Control.SIZE_SHRINK_END
	details_scroll.horizontal_scroll_mode = ScrollContainer.SCROLL_MODE_DISABLED
	details_scroll.vertical_scroll_mode = ScrollContainer.SCROLL_MODE_AUTO
	stack.add_child(details_scroll)
	var details := VBoxContainer.new()
	details.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	details.add_theme_constant_override("separation", 5)
	details_scroll.add_child(details)
	_asset_heading = Label.new()
	_asset_heading.text = "No asset open"
	_asset_heading.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_asset_heading.add_theme_color_override("font_color", ForgeVisualTheme.PARCHMENT)
	details.add_child(_asset_heading)
	var hint := Label.new()
	hint.text = (
		"Drag to orbit. Shift-drag, middle-drag, right-drag, or use the "
		+ "arrow controls to pan. Scroll or use +/− to zoom; press 0 to "
		+ "centre and reset. Preview state never edits gameplay.")
	hint.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	hint.add_theme_color_override("font_color", ForgeVisualTheme.MUTED)
	details.add_child(hint)
	return panel


func _toolbar_button(label: String, action: Callable) -> Button:
	var button := Button.new()
	button.text = label
	button.pressed.connect(action)
	ForgeVisualTheme.apply_button(button, ForgeVisualTheme.FOCUS_GOLD)
	return button


func _clear_page(title: String) -> void:
	_sync_route_from_page_title(title)
	_page_title.text = title
	_page_title.add_theme_color_override("font_color", _active_accent.lightened(0.18))
	for child in _page.get_children():
		_page.remove_child(child)
		child.queue_free()
	_workflow_cards = null
	_page_scroll.scroll_vertical = 0
	_add_inline_guide(title)


func _fit_shell_splits() -> void:
	if not is_instance_valid(_centre_and_preview):
		return
	if not is_instance_valid(_preview_panel) or not _preview_panel.visible:
		return
	var available := roundi(_centre_and_preview.size.x)
	if available <= 0:
		return
	var preview_width := clampi(roundi(available * 0.38), 280, 420)
	var desired := maxi(340, available - preview_width)
	if _centre_and_preview.split_offset != desired:
		_centre_and_preview.split_offset = desired


func _add_inline_guide(page_title: String) -> void:
	var steps := ForgeSectionGuides.steps_for_page(page_title)
	if steps.is_empty() and not _active_route_id.is_empty():
		var route := ForgeNavigationCatalog.route(_active_route_id)
		steps = ForgeSectionGuides.steps_for_page(str(route.get("help_key", "")))
	if steps.is_empty():
		return
	var panel := PanelContainer.new()
	panel.name = "SectionGuide"
	panel.add_theme_stylebox_override(
		"panel", ForgeVisualTheme.panel_style(
			ForgeVisualTheme.PANEL, _active_accent.darkened(0.35), 1))
	var stack := VBoxContainer.new()
	stack.add_theme_constant_override("separation", 6)
	panel.add_child(stack)
	var toggle := Button.new()
	toggle.text = "How to use this section — %d steps" % steps.size()
	toggle.alignment = HORIZONTAL_ALIGNMENT_LEFT
	toggle.toggle_mode = true
	ForgeVisualTheme.apply_button(toggle, _active_accent)
	stack.add_child(toggle)
	var details := VBoxContainer.new()
	details.visible = false
	stack.add_child(details)
	for index in steps.size():
		var label := Label.new()
		label.text = "%d. %s" % [index + 1, str(steps[index])]
		label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		details.add_child(label)
	toggle.toggled.connect(func(expanded: bool) -> void:
		details.visible = expanded)
	_page.add_child(panel)


func _show_guide() -> void:
	_clear_page("Forge Guide")
	_add_body(
		"Start here if you have never used Leyforge Forge. This guide explains what "
		+ "each page is for, exactly what to click, and when to save, validate or "
		+ "bake. Every page repeats its own section in a collapsible help panel.")
	_add_section("The eight studios")
	_add_body(
		"Home resumes and recovers work. Library & Create finds canonical IDs and "
		+ "starts sources. Items & Blocks owns voxel, surface and shared material "
		+ "authoring. Structures & Buildings and Characters & Creatures expose their "
		+ "current shared catalogues without pretending unfinished specialist editors "
		+ "are complete. VFX and Audio inspect their production records. Test & "
		+ "Delivery owns shared contracts, evidence, validation and publication.")
	_add_body(
		"The normal path is Home -> Library & Create -> a specialist studio -> "
		+ "Test & Delivery -> Approve & Bake. Switching studios does not close the "
		+ "asset or change its stable identity, draft, undo history or preview camera.")
	_add_section("Five terms to learn first")
	_add_body(
		"Gameplay ID — the permanent block or item identity used by recipes and "
		+ "saved worlds. Forge never creates a duplicate when you select an "
		+ "existing ID.")
	_add_body(
		"Presentation — the model, textures, materials, effects and animations "
		+ "shown for that gameplay ID.")
	_add_body(
		"Block Surface — six painted square faces wrapped around a full cube. "
		+ "Voxel Model — a sculpted 3D grid used for non-cube shapes.")
	_add_body(
		"Palette role — a named paint colour. Material DNA — the reusable "
		+ "rendering behaviour assigned to that colour, such as wood or metal.")
	_add_body(
		"Save Draft stores editable work. Bake Preview builds a temporary runtime "
		+ "result. Approve & Bake promotes a validated result for game use.")
	_add_section("Common controls")
	_add_body(
		"Left-drag paints, right-drag removes or restores, Ctrl+Z/Ctrl+Y undo and "
		+ "redo, Ctrl+S saves, and Ctrl+Enter validates. In Live Preview, drag to "
		+ "orbit, Shift/right/middle-drag to pan, scroll to zoom and Reset to frame "
		+ "the model again.")
	_add_section("Page-by-page lessons")
	for title in ForgeSectionGuides.page_titles():
		_add_section(str(title))
		var steps := ForgeSectionGuides.steps_for_page(str(title))
		for index in steps.size():
			_add_body("%d. %s" % [index + 1, str(steps[index])])


func _add_hub_banner(section_id: String, title: String, description: String) -> void:
	var section := ForgeNavigationCatalog.section(section_id)
	var banner := ForgeSectionBackdrop.new()
	banner.name = "ForgeHubBackdrop_%s" % section_id
	banner.custom_minimum_size = Vector2(0, 156)
	banner.configure(str(section.motif), Color(str(section.accent)))
	var margin := MarginContainer.new()
	margin.add_theme_constant_override("margin_left", 22)
	margin.add_theme_constant_override("margin_right", 22)
	margin.add_theme_constant_override("margin_top", 20)
	margin.add_theme_constant_override("margin_bottom", 18)
	banner.add_child(margin)
	var stack := VBoxContainer.new()
	stack.add_theme_constant_override("separation", 8)
	margin.add_child(stack)
	var eyebrow := Label.new()
	eyebrow.text = "LEYFORGE FORGE  /  %s" % str(section.label).to_upper()
	eyebrow.add_theme_font_size_override("font_size", 11)
	eyebrow.add_theme_color_override("font_color", Color(str(section.accent)))
	stack.add_child(eyebrow)
	var heading := Label.new()
	heading.text = title
	heading.add_theme_font_size_override("font_size", 27)
	heading.add_theme_color_override("font_color", ForgeVisualTheme.PARCHMENT)
	stack.add_child(heading)
	var body := Label.new()
	body.text = description
	body.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	body.add_theme_color_override("font_color", ForgeVisualTheme.PARCHMENT.darkened(0.12))
	stack.add_child(body)
	var badge := Label.new()
	badge.text = "[MOTIF] %s  |  STATIC DECORATION  |  REDUCED-MOTION SAFE" % (
		str(section.motif).replace("_", " ").to_upper())
	badge.add_theme_font_size_override("font_size", 10)
	badge.add_theme_color_override("font_color", ForgeVisualTheme.MUTED)
	stack.add_child(badge)
	_page.add_child(banner)


func _add_studio_workflow_cards(section_id: String) -> void:
	_add_section("Studio workflows")
	var cards := GridContainer.new()
	cards.name = "ForgeStudioWorkflowCards"
	cards.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	cards.add_theme_constant_override("h_separation", 10)
	cards.add_theme_constant_override("v_separation", 10)
	_workflow_cards = cards
	_page.add_child(cards)
	for route in ForgeNavigationCatalog.routes_for_section(section_id):
		var panel := PanelContainer.new()
		panel.name = "WorkflowCard_%s" % str(route.route_id)
		panel.custom_minimum_size = Vector2(245, 96)
		panel.add_theme_stylebox_override(
			"panel", ForgeVisualTheme.panel_style(
				ForgeVisualTheme.RAISED, _active_accent.darkened(0.35), 1))
		var stack := VBoxContainer.new()
		stack.add_theme_constant_override("separation", 5)
		panel.add_child(stack)
		var button := Button.new()
		button.name = "WorkflowCardButton_%s" % str(route.route_id)
		button.text = "%s  %s" % [
			ForgeVisualTheme.availability_prefix(str(route.availability)),
			str(route.label),
		]
		button.alignment = HORIZONTAL_ALIGNMENT_LEFT
		button.set_meta("accessible_label", "%s, %s" % [
			route.label, route.availability])
		var disabled_reason := ""
		if str(route.availability) == ForgeNavigationCatalog.PLANNED:
			disabled_reason = "Planned specialist editor; inspect the available catalogue instead."
		elif bool(route.requires_asset) and current_asset == null:
			disabled_reason = "Open or create an asset before using this workflow."
		button.disabled = not disabled_reason.is_empty()
		button.tooltip_text = disabled_reason if not disabled_reason.is_empty() else (
			"Open %s." % str(route.label))
		button.pressed.connect(open_route.bind(str(route.route_id)))
		ForgeVisualTheme.apply_button(button, _active_accent)
		stack.add_child(button)
		var note := Label.new()
		note.text = "%s  |  %s" % [str(route.group), str(route.availability)]
		note.add_theme_font_size_override("font_size", 11)
		note.add_theme_color_override("font_color", ForgeVisualTheme.MUTED)
		stack.add_child(note)
		cards.add_child(panel)
	_update_workflow_card_columns()
	call_deferred("refresh_host_layout")


func _show_home() -> void:
	_clear_page("Forge Home")
	_add_hub_banner("home", "Forge Hall",
		"Resume work beside the hearth, inspect source health and recover drafts. "
		+ "The shared toolbar and lifecycle ribbon stay fixed throughout every studio.")
	var summary := asset_index.rebuild()
	_add_body(
		"Developer-only visual authoring for Leyforge blocks, items and machines. "
		+ "Gameplay registries remain authoritative; Forge sources replace only "
		+ "their presentations.")
	_add_stat_card("Indexed gameplay presentations", int(summary["asset_count"]))
	var statuses: Dictionary = summary["status_counts"]
	_add_stat_card("Approved Forge sources", int(statuses.get("approved", 0)))
	_add_stat_card("Draft Forge sources", int(statuses.get("draft", 0)))
	_add_stat_card(
		"Legacy fallbacks", int(statuses.get("legacy_wrapper", 0)))
	_add_section("Quick start")
	_add_body(
		"Open Asset Browser, select an existing stable gameplay ID, then create "
		+ "a project source. Save Draft is recoverable; Approve & Bake promotes "
		+ "a validated runtime package without changing recipes, inventory data "
		+ "or save identity.")
	if not autosave_service.recovery_candidates().is_empty():
		_add_action("Review recovery candidates", _show_recovery)
	_add_studio_workflow_cards("home")


func _show_library_hub() -> void:
	_clear_page("Library & Create")
	_add_hub_banner("library_create", "Archive & Map Room",
		"Search canonical gameplay identities, create visual sources and inspect the "
		+ "migration map without duplicating registries or rewriting save identity.")
	var summary := asset_index.rebuild()
	_add_stat_card("Canonical presentations", int(summary.get("asset_count", 0)))
	_add_stat_card("Migration records", _migration_record_count())
	_add_studio_workflow_cards("library_create")


func _show_items_hub() -> void:
	_clear_page("Items & Blocks")
	_add_hub_banner("items_blocks", "Smithing Workbench",
		"Shape surfaces and voxel forms, then finish them with shared Material DNA, "
		+ "collision, icons, animation, variants and world-test evidence.")
	var summary := asset_index.rebuild()
	_add_stat_card("Indexed item and block presentations", int(summary.get("asset_count", 0)))
	_add_stat_card("Shared Material DNA", _resource_paths_in(MATERIAL_ROOT).size())
	if current_asset != null:
		_add_body("OPEN ON BENCH  |  %s  |  %s" % [
			current_asset.display_name, current_asset.source_status.to_upper()])
	_add_studio_workflow_cards("items_blocks")


func _show_structures_hub() -> void:
	_clear_page("Structures & Buildings")
	_add_hub_banner("structures", "Mason's Drafting Table",
		"Inspect the unified blueprint foundation and construction handoff. The "
		+ "specialist composition editor remains plainly marked as planned.")
	_ensure_presentation_workspace()
	_add_stat_card("Blueprint definitions",
		presentation_workspace.filtered_list("blueprint_definition").size())
	_add_stat_card("Blueprint modules",
		presentation_workspace.filtered_list("blueprint_module_definition").size())
	_add_stat_card("Construction handoff records", SettlementContentRegistry.blueprints.size())
	_add_studio_workflow_cards("structures")


func _show_characters_hub() -> void:
	_clear_page("Characters & Creatures")
	_add_hub_banner("characters", "Bestiary Gallery",
		"Browse canonical entities, anatomy, rigs, appearance, animation and equipment "
		+ "records. The dedicated entity modeller is not yet an authoring claim.")
	_ensure_presentation_workspace()
	_add_stat_card("Entity definitions",
		presentation_workspace.filtered_list("entity_definition").size())
	_add_stat_card("Body plans",
		presentation_workspace.filtered_list("body_plan").size())
	_add_stat_card("Rig profiles",
		presentation_workspace.filtered_list("rig_profile").size())
	_add_studio_workflow_cards("characters")


func _show_vfx_hub() -> void:
	_clear_page("VFX")
	_add_hub_banner("vfx", "Arcane Laboratory",
		"Inspect bounded effects, voxel forms, graph sources and budgets on a static "
		+ "rune grid. The live graph editor remains planned.")
	_ensure_presentation_workspace()
	_add_stat_card("VFX definitions", presentation_workspace.filtered_list("vfx_effect").size())
	_add_stat_card("Voxel forms", presentation_workspace.filtered_list("vfx_form").size())
	_add_stat_card("Graph records", presentation_workspace.filtered_list("vfx_graph").size())
	_add_studio_workflow_cards("vfx")


func _show_audio_hub() -> void:
	_clear_page("Audio")
	_add_hub_banner("audio", "Resonance Chamber",
		"Inspect Sound Events, sources, families, ambience and acoustics. Nothing on "
		+ "this landing page autoplays, and the waveform editor remains planned.")
	_ensure_presentation_workspace()
	_add_stat_card("Sound Events", presentation_workspace.filtered_list("sound_event").size())
	_add_stat_card("Sound sources", presentation_workspace.filtered_list("sound_source").size())
	_add_stat_card("Ambience plans", presentation_workspace.filtered_list("ambience_plan").size())
	_add_studio_workflow_cards("audio")


func _show_delivery_hub() -> void:
	_clear_page("Test & Delivery")
	_add_hub_banner("test_delivery", "Proving Ground",
		"Bring shared presentation contracts through accessibility, deterministic "
		+ "capture, validation, evidence review and recoverable publication.")
	_ensure_presentation_workspace()
	_add_stat_card("Indexed foundation records", presentation_workspace.filtered_list().size())
	_add_stat_card("Open diagnostics", presentation_workspace.diagnostics.size())
	_add_stat_card("Test scenarios", presentation_workspace.filtered_list("test_scenario").size())
	_add_studio_workflow_cards("test_delivery")


func _migration_record_count() -> int:
	var path := "res://content/forge/migration/registry_migration_register.json"
	if not FileAccess.file_exists(path):
		return 0
	var payload: Variant = JSON.parse_string(FileAccess.get_file_as_string(path))
	return payload.get("records", []).size() if payload is Dictionary else 0


func _show_asset_browser() -> void:
	_clear_page("Asset Browser")
	_add_body(
		"Every registry entry appears once. Legacy wrappers remain playable until "
		+ "an approved Forge presentation exists.")
	_search_entry = LineEdit.new()
	_search_entry.placeholder_text = "Search stable ID, name, category or status"
	_search_entry.text_changed.connect(_refresh_browser_results)
	_page.add_child(_search_entry)
	_browser_results = VBoxContainer.new()
	_browser_results.add_theme_constant_override("separation", 5)
	_page.add_child(_browser_results)
	_refresh_browser_results("")


func _refresh_browser_results(query: String) -> void:
	if not is_instance_valid(_browser_results):
		return
	for child in _browser_results.get_children():
		child.queue_free()
	var records := asset_index.search(query)
	for record in records.slice(0, mini(records.size(), 120)):
		var button := Button.new()
		button.text = "%s  |  %s  |  %s" % [
			str(record.get("display_name", "")),
			str(record.get("gameplay_id", "")),
			str(record.get("source_status", "legacy_wrapper")),
		]
		button.alignment = HORIZONTAL_ALIGNMENT_LEFT
		button.tooltip_text = "Open presentation without changing its gameplay ID"
		button.pressed.connect(_open_record.bind(record))
		_browser_results.add_child(button)
	if records.size() > 120:
		_add_child_note(
			_browser_results,
			"Showing 120 of %d matches; refine the search." % records.size())


func _open_record(record: Dictionary) -> void:
	current_record = record.duplicate(true)
	var source_id := str(record.get("forge_asset_id", ""))
	var source_path := asset_index.path_for_source_id(source_id)
	if not source_path.is_empty():
		current_asset = document_service.open_path(source_path)
		_after_open_asset()
		_show_relevant_editor()
		return
	_clear_page("Legacy Presentation")
	_add_section(str(record.get("display_name", "Unnamed")))
	_add_body("Stable gameplay ID: %s" % str(record.get("gameplay_id", "")))
	_add_body("Presentation ID: %s" % str(record.get("presentation_id", "")))
	_add_body(
		"Current provenance: legacy runtime fallback. Creating a project source "
		+ "does not duplicate or rename the gameplay registry record.")
	_add_action(
		"Create Project Source",
		_create_source_for_record.bind(record))


func _show_new_asset() -> void:
	_clear_page("New Asset Wizard")
	_add_body(
		"Select a canonical registry presentation. The wizard creates one "
		+ "editable project source linked to that stable ID. You can accept the "
		+ "recommended editor or explicitly start with a blank Block Surface or "
		+ "Voxel Model source.")
	var option := OptionButton.new()
	option.name = "RegistryPresentation"
	var records := asset_index.all_records()
	for record in records:
		option.add_item("%s — %s" % [
			str(record.get("gameplay_id", "")),
			str(record.get("display_name", "")),
		])
		option.set_item_metadata(option.item_count - 1, record)
	_page.add_child(_labeled("Canonical gameplay presentation", option))
	var mode_option := OptionButton.new()
	for entry in [
		["Recommended from the registry", ""],
		["Block Surface — six painted cube faces", "surface"],
		["Voxel Model — blank 3D microvoxel volume", "voxel"],
	]:
		mode_option.add_item(str(entry[0]))
		mode_option.set_item_metadata(mode_option.item_count - 1, entry[1])
	_page.add_child(_labeled("Starting authoring mode", mode_option))
	_add_body(
		"This choice changes only the editable presentation. The gameplay ID, "
		+ "recipes, placement identity and saved-world identity stay unchanged.")
	var create := Button.new()
	create.text = "Create or Open Project Source"
	create.custom_minimum_size = Vector2(0, 48)
	create.pressed.connect(func() -> void:
		if option.item_count == 0:
			return
		var record: Dictionary = option.get_item_metadata(option.selected)
		var requested_mode := str(mode_option.get_item_metadata(
			mode_option.selected))
		var path := asset_index.path_for_source_id(
			str(record.get("forge_asset_id", "")))
		if not path.is_empty():
			current_asset = document_service.open_path(path)
			current_record = record
			_after_open_asset()
			if requested_mode.is_empty() \
					or current_asset.active_authoring_mode() == requested_mode:
				_show_relevant_editor()
			else:
				_switch_authoring_mode(requested_mode)
		else:
			_create_source_for_record(record, requested_mode))
	_page.add_child(create)


func _create_source_for_record(
		record: Dictionary, authoring_mode_override := "") -> void:
	current_record = record.duplicate(true)
	current_asset = document_service.create_from_registry(
		record, authoring_mode_override)
	# Recommended legacy replacements keep their useful starter geometry.
	# Explicit modes are intentionally blank so creators can begin from scratch.
	if authoring_mode_override.is_empty():
		_seed_new_source(current_asset, record)
	_after_open_asset()
	_save_current()
	asset_index.rebuild()
	_show_relevant_editor()


func _seed_new_source(
		asset: ForgeAssetDefinition, record: Dictionary) -> void:
	var gameplay_id := str(record.get("gameplay_id", ""))
	if asset.surface_set is ForgeSurfaceSet:
		var surface: ForgeSurfaceSet = asset.surface_set
		for face in ForgeSurfaceSet.FACE_KEYS:
			surface.fill_face(face, 0)
		return
	var volume: ForgeVoxelVolume = asset.voxel_volume
	if volume == null and not asset.parts.is_empty() \
			and asset.parts[0] is ForgePartDefinition:
		volume = asset.parts[0].source_volume
	if volume == null:
		return
	var item_like := str(record.get("kind", "")) == "item"
	var x_range := range(12, 20) if item_like else range(4, 28)
	var y_range := range(4, 28) if not item_like else range(4, 26)
	var z_range := range(14, 18) if item_like else range(4, 28)
	if "chute" in gameplay_id:
		x_range = range(2, 30)
		y_range = range(6, 11)
		z_range = range(7, 25)
	for z in z_range:
		for y in y_range:
			for x in x_range:
				var shell_only: bool = "chute" in gameplay_id \
					and y > 7 and x > 4 and x < 27
				if shell_only and z > 10 and z < 21:
					continue
				volume.set_cell(Vector3i(x, y, z), 0)


func _show_relevant_editor() -> void:
	if current_asset == null:
		_show_asset_browser()
	elif current_asset.active_authoring_mode() == \
			ForgeAssetDefinition.AUTHORING_SURFACE:
		_show_surface_editor()
	elif current_asset.active_authoring_mode() == \
			ForgeAssetDefinition.AUTHORING_COMPOUND:
		_show_compound_editor()
	else:
		_show_voxel_editor()


func _show_surface_editor() -> void:
	_clear_page("Block Surface Editor")
	if not _require_asset():
		return
	_add_authoring_mode_switcher()
	if not current_asset.uses_surface_authoring():
		_add_body(
			"This asset is currently using Voxel Model or Compound authoring. "
			+ "Choose Block Surface above and press Switch authoring mode to "
			+ "create or reopen its six-face source.")
		return
	var surface: ForgeSurfaceSet = current_asset.surface_set
	var palette := _primary_palette()
	var tools := HFlowContainer.new()
	var face_option := OptionButton.new()
	for face in ForgeSurfaceSet.FACE_KEYS:
		face_option.add_item(face.capitalize())
		face_option.set_item_metadata(face_option.item_count - 1, face)
		if face == _selected_face:
			face_option.select(face_option.item_count - 1)
	face_option.item_selected.connect(func(index: int) -> void:
		_selected_face = str(face_option.get_item_metadata(index))
		_surface_canvas.active_face = _selected_face
		_surface_canvas.queue_redraw())
	tools.add_child(_labeled("Face", face_option))
	var tile := CheckButton.new()
	tile.text = "2 × 2 tile preview"
	tile.toggled.connect(func(enabled: bool) -> void:
		_surface_canvas.show_tiling = enabled
		_surface_canvas.queue_redraw())
	tools.add_child(tile)
	tools.add_child(_palette_selector(palette, func(index: int) -> void:
		_selected_palette_index = index
		_surface_canvas.active_palette_index = index))
	var tool_option := OptionButton.new()
	for entry in [
		["Pencil", ForgePixelCanvas.TOOL_PENCIL],
		["Square", ForgePixelCanvas.TOOL_SQUARE],
		["Circle", ForgePixelCanvas.TOOL_CIRCLE],
		["Diamond", ForgePixelCanvas.TOOL_DIAMOND],
		["Fill bucket", ForgePixelCanvas.TOOL_FILL],
	]:
		tool_option.add_item(str(entry[0]))
		tool_option.set_item_metadata(tool_option.item_count - 1, entry[1])
	tools.add_child(_labeled("Paint tool", tool_option))
	var brush_size := SpinBox.new()
	brush_size.min_value = 1
	brush_size.max_value = 8
	brush_size.step = 1
	brush_size.value = 1
	brush_size.tooltip_text = "Radius in canvas cells for shape tools."
	tools.add_child(_labeled("Shape radius", brush_size))
	_page.add_child(tools)
	_surface_canvas = ForgePixelCanvas.new()
	_surface_canvas.active_face = _selected_face
	_surface_canvas.active_palette_index = _selected_palette_index
	_surface_canvas.configure(surface, palette)
	tool_option.item_selected.connect(func(index: int) -> void:
		_surface_canvas.tool_mode = str(tool_option.get_item_metadata(index)))
	brush_size.value_changed.connect(func(value: float) -> void:
		_surface_canvas.brush_size = int(value))
	_surface_canvas.pixel_batch_edit_requested.connect(_paint_surface_pixels)
	_surface_canvas.pixel_values_edit_requested.connect(_paint_surface_values)
	_page.add_child(_randomizer_controls(palette, false))
	_add_surface_pattern_controls(surface, palette)
	_add_section("Face clipboard and orientation")
	_add_body(
		"Copy one face, select any number of destination faces, then paste it "
		+ "as-is, mirrored, or rotated. Current-face transforms are also "
		+ "available without changing the clipboard.")
	var target_toggles: Array[CheckButton] = []
	var targets := HFlowContainer.new()
	for face in ForgeSurfaceSet.FACE_KEYS:
		var target := CheckButton.new()
		target.text = face.capitalize()
		target.set_meta("forge_face", face)
		target.button_pressed = face == _opposite_face(_selected_face)
		target_toggles.append(target)
		targets.add_child(target)
	_page.add_child(_labeled("Paste to faces", targets))
	var transform_option := OptionButton.new()
	for entry in [
		["Copy as-is", "copy"],
		["Mirror horizontally", "mirror_horizontal"],
		["Mirror vertically", "mirror_vertical"],
		["Rotate 90° clockwise", "rotate_cw"],
		["Rotate 180°", "rotate_180"],
		["Rotate 90° counter-clockwise", "rotate_ccw"],
	]:
		transform_option.add_item(str(entry[0]))
		transform_option.set_item_metadata(
			transform_option.item_count - 1, entry[1])
	_page.add_child(_labeled("Paste transform", transform_option))
	var transfer_actions := HFlowContainer.new()
	transfer_actions.add_child(_toolbar_button(
		"Copy current face", _copy_surface_face_to_clipboard))
	transfer_actions.add_child(_toolbar_button(
		"Paste to selected faces", func() -> void:
			var selected: Array[String] = []
			for toggle in target_toggles:
				if toggle.button_pressed:
					selected.append(str(toggle.get_meta("forge_face", "")))
			_paste_surface_face_targets(
				selected,
				str(transform_option.get_item_metadata(
					transform_option.selected)))))
	transfer_actions.add_child(_toolbar_button(
		"Mirror current ↔", _transform_current_surface_face.bind(
			"mirror_horizontal")))
	transfer_actions.add_child(_toolbar_button(
		"Mirror current ↕", _transform_current_surface_face.bind(
			"mirror_vertical")))
	transfer_actions.add_child(_toolbar_button(
		"Rotate current ↺", _transform_current_surface_face.bind(
			"rotate_ccw")))
	transfer_actions.add_child(_toolbar_button(
		"Rotate current ↻", _transform_current_surface_face.bind(
			"rotate_cw")))
	_page.add_child(transfer_actions)
	_page.add_child(_surface_canvas)
	_add_body(
		"Hold and drag left-click to paint; hold and drag right-click to "
		+ "restore role 0. Shape size is a cell radius. The 2 × 2 preview "
		+ "checks seams without modifying source pixels.")


func _paint_surface_pixel(face: String, x: int, y: int, value: int) -> void:
	_paint_surface_pixels(face, [Vector2i(x, y)], value)


func _paint_surface_pixels(face: String, cells: Array, value: int) -> void:
	var surface: ForgeSurfaceSet = current_asset.surface_set
	var previous := {}
	var changed: Array[Vector2i] = []
	for cell_value in cells:
		var cell := Vector2i(cell_value)
		if previous.has(cell):
			continue
		var old_value := surface.get_pixel(face, cell.x, cell.y)
		if old_value == value:
			continue
		previous[cell] = old_value
		changed.append(cell)
	if changed.is_empty():
		return
	command_service.execute(
		"Paint %s (%d cells)" % [face, changed.size()],
		func() -> void:
			for cell in changed:
				surface.set_pixel(face, cell.x, cell.y, value)
			_after_edit(),
		func() -> void:
			for cell in changed:
				surface.set_pixel(
					face, cell.x, cell.y, int(previous[cell]))
			_after_edit())


func _paint_surface_values(face: String, values: Dictionary) -> void:
	if current_asset == null or not current_asset.surface_set is ForgeSurfaceSet:
		return
	var surface: ForgeSurfaceSet = current_asset.surface_set
	var previous := {}
	var changed: Array[Vector2i] = []
	for cell_value in values:
		var cell := Vector2i(cell_value)
		var new_value := int(values[cell_value])
		var old_value := surface.get_pixel(face, cell.x, cell.y)
		if old_value == new_value:
			continue
		previous[cell] = old_value
		changed.append(cell)
	if changed.is_empty():
		return
	command_service.execute(
		"Randomize %d surface pixel(s)" % changed.size(),
		func() -> void:
			for cell in changed:
				surface.set_pixel(
					face, cell.x, cell.y, int(values[cell]))
			_after_edit(),
		func() -> void:
			for cell in changed:
				surface.set_pixel(
					face, cell.x, cell.y, int(previous[cell]))
			_after_edit())


func _copy_surface_face_to_clipboard() -> void:
	if current_asset == null \
			or not current_asset.surface_set is ForgeSurfaceSet:
		_set_status("Open a surface-authored asset first.", true)
		return
	var surface: ForgeSurfaceSet = current_asset.surface_set
	_surface_face_clipboard = surface.face_pixels_copy(_selected_face)
	_surface_face_clipboard_size = Vector2i(surface.width, surface.height)
	_surface_face_clipboard_source = "%s / %s" % [
		current_asset.display_name, _selected_face.capitalize()]
	_set_status(
		"Copied %s face to the Forge clipboard."
		% _surface_face_clipboard_source, false)


func _paste_surface_face_targets(
		targets: Array[String], operation: String) -> void:
	if current_asset == null \
			or not current_asset.surface_set is ForgeSurfaceSet:
		_set_status("Open a surface-authored asset first.", true)
		return
	if _surface_face_clipboard.is_empty():
		_set_status("Copy a surface face before pasting.", true)
		return
	if targets.is_empty():
		_set_status("Select at least one destination face.", true)
		return
	var surface: ForgeSurfaceSet = current_asset.surface_set
	if _surface_face_clipboard_size != Vector2i(
			surface.width, surface.height):
		_set_status(
			"The copied face dimensions do not match this surface.", true)
		return
	var transformed := surface.transformed_pixels(
		_surface_face_clipboard, operation)
	if transformed.is_empty():
		_set_status(
			"This rotation requires a square surface face.", true)
		return
	var previous := {}
	var valid_targets: Array[String] = []
	for target in targets:
		if target not in ForgeSurfaceSet.FACE_KEYS \
				or previous.has(target):
			continue
		var old_pixels := surface.face_pixels_copy(target)
		if old_pixels == transformed:
			continue
		previous[target] = old_pixels
		valid_targets.append(target)
	if valid_targets.is_empty():
		_set_status("Selected faces already match the clipboard.", false)
		return
	command_service.execute(
		"Paste face to %d side(s)" % valid_targets.size(),
		func() -> void:
			for target in valid_targets:
				surface.set_face_pixels(target, transformed)
			_after_edit(),
		func() -> void:
			for target in valid_targets:
				surface.set_face_pixels(target, previous[target])
			_after_edit())


func _transform_current_surface_face(operation: String) -> void:
	if current_asset == null \
			or not current_asset.surface_set is ForgeSurfaceSet:
		_set_status("Open a surface-authored asset first.", true)
		return
	var surface: ForgeSurfaceSet = current_asset.surface_set
	var previous := surface.face_pixels_copy(_selected_face)
	var transformed := surface.transformed_pixels(previous, operation)
	if transformed.is_empty():
		_set_status(
			"This rotation requires a square surface face.", true)
		return
	if transformed == previous:
		_set_status("The current face is unchanged by that transform.", false)
		return
	var target_face := _selected_face
	command_service.execute(
		"Transform %s face" % target_face,
		func() -> void:
			surface.set_face_pixels(target_face, transformed)
			_after_edit(),
		func() -> void:
			surface.set_face_pixels(target_face, previous)
			_after_edit())


func _opposite_face(face: String) -> String:
	return {
		"top": "bottom",
		"bottom": "top",
		"north": "south",
		"south": "north",
		"east": "west",
		"west": "east",
	}.get(face, "")


func _show_voxel_editor() -> void:
	_clear_page("Voxel Model Editor")
	if not _require_asset():
		return
	_add_authoring_mode_switcher()
	if current_asset.active_authoring_mode() == \
			ForgeAssetDefinition.AUTHORING_SURFACE:
		_add_body(
			"This asset is currently using Block Surface authoring. Choose Voxel "
			+ "Model above and press Switch authoring mode to create or reopen its "
			+ "3D microvoxel source.")
		return
	var volume := _editable_volume()
	if volume == null:
		_add_body("This asset has no editable voxel volume.")
		return
	var palette := _primary_palette()
	var controls := HFlowContainer.new()
	var axis := OptionButton.new()
	for axis_name in ["X", "Y", "Z"]:
		axis.add_item(axis_name)
	axis.select(2)
	var slice := HSlider.new()
	slice.min_value = 0
	slice.max_value = volume.dimensions.z - 1
	slice.step = 1
	slice.value = mini(volume.dimensions.z - 1, volume.dimensions.z / 2)
	slice.custom_minimum_size = Vector2(180, 0)
	var slice_label := Label.new()
	slice_label.text = "Z slice %d" % int(slice.value)
	axis.item_selected.connect(func(index: int) -> void:
		var dimension: int = [
			volume.dimensions.x,
			volume.dimensions.y,
			volume.dimensions.z,
		][index]
		_voxel_canvas.slice_axis = index
		slice.max_value = dimension - 1
		slice.value = mini(slice.value, slice.max_value)
		slice_label.text = "%s slice %d" % [
			axis.get_item_text(index), int(slice.value)]
		_voxel_canvas.slice_index = int(slice.value)
		_voxel_canvas.queue_redraw())
	slice.value_changed.connect(func(value: float) -> void:
		slice_label.text = "%s slice %d" % [
			axis.get_item_text(axis.selected), int(value)]
		_voxel_canvas.slice_index = int(value)
		_voxel_canvas.queue_redraw())
	controls.add_child(axis)
	controls.add_child(slice_label)
	controls.add_child(slice)
	var mirror := CheckButton.new()
	mirror.text = "Mirror X"
	mirror.toggled.connect(func(enabled: bool) -> void:
		_voxel_canvas.mirror_x = enabled
		_voxel_canvas.queue_redraw())
	controls.add_child(mirror)
	controls.add_child(_palette_selector(palette, func(index: int) -> void:
		_selected_palette_index = index
		_voxel_canvas.active_palette_index = index))
	var tool_option := OptionButton.new()
	for entry in [
		["Pencil", ForgeVoxelSliceCanvas.TOOL_PENCIL],
		["Square", ForgeVoxelSliceCanvas.TOOL_SQUARE],
		["Circle", ForgeVoxelSliceCanvas.TOOL_CIRCLE],
		["Diamond", ForgeVoxelSliceCanvas.TOOL_DIAMOND],
		["Fill bucket", ForgeVoxelSliceCanvas.TOOL_FILL],
	]:
		tool_option.add_item(str(entry[0]))
		tool_option.set_item_metadata(tool_option.item_count - 1, entry[1])
	controls.add_child(_labeled("Paint tool", tool_option))
	var brush_size := SpinBox.new()
	brush_size.min_value = 1
	brush_size.max_value = 8
	brush_size.step = 1
	brush_size.value = 1
	brush_size.tooltip_text = "Radius in slice cells for shape tools."
	controls.add_child(_labeled("Shape radius", brush_size))
	_page.add_child(controls)
	_voxel_canvas = ForgeVoxelSliceCanvas.new()
	_voxel_canvas.slice_index = int(slice.value)
	_voxel_canvas.active_palette_index = _selected_palette_index
	_voxel_canvas.configure(volume, palette)
	tool_option.item_selected.connect(func(index: int) -> void:
		_voxel_canvas.tool_mode = str(tool_option.get_item_metadata(index)))
	brush_size.value_changed.connect(func(value: float) -> void:
		_voxel_canvas.brush_size = int(value))
	_voxel_canvas.voxel_batch_edit_requested.connect(_paint_voxels)
	_voxel_canvas.voxel_values_edit_requested.connect(_paint_voxel_values)
	_page.add_child(_randomizer_controls(palette, true))
	_add_section("Layer clipboard")
	_add_body(
		"Copy the complete visible layer, move to another layer or axis with the "
		+ "same width and height, then paste. Empty cells and palette colours are "
		+ "included, and the paste can be undone in one step.")
	var layer_actions := HFlowContainer.new()
	layer_actions.add_child(_toolbar_button(
		"Copy current layer", func() -> void:
			_copy_voxel_layer(axis.selected, int(slice.value))))
	layer_actions.add_child(_toolbar_button(
		"Paste onto current layer", func() -> void:
			_paste_voxel_layer(axis.selected, int(slice.value))))
	_page.add_child(layer_actions)
	_add_voxel_pattern_controls(volume, palette, axis, slice)
	_page.add_child(_voxel_canvas)
	_add_body(
		"Hold and drag left-click to add or paint microvoxels; right-drag "
		+ "removes them. Shape size is a slice-cell radius. Mirror X applies "
		+ "the same batched command across the live symmetry plane.")


func _add_authoring_mode_switcher() -> void:
	if current_asset == null or current_asset.active_authoring_mode() == \
			ForgeAssetDefinition.AUTHORING_COMPOUND:
		return
	_add_section("Authoring mode")
	var row := HFlowContainer.new()
	var option := OptionButton.new()
	for entry in [
		["Block Surface", ForgeAssetDefinition.AUTHORING_SURFACE],
		["Voxel Model", ForgeAssetDefinition.AUTHORING_VOXEL],
	]:
		option.add_item(str(entry[0]))
		option.set_item_metadata(option.item_count - 1, entry[1])
		if current_asset.active_authoring_mode() == str(entry[1]):
			option.select(option.item_count - 1)
	row.add_child(_labeled("Active presentation source", option))
	var switch_button := _toolbar_button(
		"Switch authoring mode", func() -> void:
			_switch_authoring_mode(str(option.get_item_metadata(
				option.selected))))
	switch_button.custom_minimum_size = Vector2(190, 42)
	row.add_child(switch_button)
	_page.add_child(row)
	_add_body(
		"Switching preserves the inactive source, so you can return to it later. "
		+ "The live preview, validation and bake use only the active mode.")


func _switch_authoring_mode(mode: String) -> void:
	if current_asset == null or mode not in [
			ForgeAssetDefinition.AUTHORING_SURFACE,
			ForgeAssetDefinition.AUTHORING_VOXEL,
		]:
		return
	if current_asset.active_authoring_mode() == mode:
		_set_status("That authoring mode is already active.", false)
		_show_relevant_editor()
		return
	var previous_profile := current_asset.authoring_profile
	var previous_kind := current_asset.asset_kind
	var previous_surface := current_asset.surface_set
	var previous_volume := current_asset.voxel_volume
	command_service.execute(
		"Switch to %s authoring" % mode,
		func() -> void:
			document_service.ensure_authoring_mode(
				current_asset, mode, current_record)
			_after_edit()
			_show_relevant_editor(),
		func() -> void:
			current_asset.authoring_profile = previous_profile
			current_asset.asset_kind = previous_kind
			current_asset.surface_set = previous_surface
			current_asset.voxel_volume = previous_volume
			_after_edit()
			_show_relevant_editor())


func _copy_voxel_layer(axis: int, slice_index: int) -> void:
	var volume := _editable_volume()
	if volume == null:
		_set_status("Open a voxel-authored asset first.", true)
		return
	_voxel_layer_clipboard = volume.slice_cells_copy(axis, slice_index)
	_voxel_layer_clipboard_size = volume.slice_dimensions(axis)
	_voxel_layer_clipboard_source = "%s %s layer %d" % [
		current_asset.display_name, ["X", "Y", "Z"][axis], slice_index]
	_set_status("Copied %s." % _voxel_layer_clipboard_source, false)


func _paste_voxel_layer(axis: int, slice_index: int) -> void:
	var volume := _editable_volume()
	if volume == null:
		_set_status("Open a voxel-authored asset first.", true)
		return
	if _voxel_layer_clipboard.is_empty():
		_set_status("Copy a voxel layer before pasting.", true)
		return
	if volume.slice_dimensions(axis) != _voxel_layer_clipboard_size:
		_set_status(
			"The copied layer dimensions do not match this layer.", true)
		return
	var previous := volume.slice_cells_copy(axis, slice_index)
	if previous == _voxel_layer_clipboard:
		_set_status("The current layer already matches the clipboard.", false)
		return
	var pasted := _voxel_layer_clipboard.duplicate()
	command_service.execute(
		"Paste voxel layer",
		func() -> void:
			volume.set_slice_cells(axis, slice_index, pasted)
			_after_edit(),
		func() -> void:
			volume.set_slice_cells(axis, slice_index, previous)
			_after_edit())


func _add_surface_pattern_controls(
		surface: ForgeSurfaceSet, palette: ForgePaletteDefinition) -> void:
	_add_section("Reusable colour patterns")
	_add_body(
		"Save the current face as a named colour-and-material pattern. Applying "
		+ "it tiles the saved pattern across the current face and imports its "
		+ "palette role colours and Material DNA bindings.")
	var name_input := LineEdit.new()
	name_input.placeholder_text = "Oak plank"
	_page.add_child(_labeled("Pattern name", name_input))
	var pattern_option := _pattern_selector()
	_page.add_child(_labeled("Saved pattern", pattern_option))
	var actions := HFlowContainer.new()
	actions.add_child(_toolbar_button(
		"Save current face pattern", func() -> void:
			_save_surface_pattern(name_input.text, surface, palette)))
	var apply_button := _toolbar_button(
		"Apply pattern to current face", func() -> void:
			var pattern := _selected_pattern(pattern_option)
			if pattern != null:
				_apply_pattern_to_surface(pattern, surface, palette))
	apply_button.disabled = pattern_option.item_count == 0
	actions.add_child(apply_button)
	_page.add_child(actions)


func _add_voxel_pattern_controls(
		volume: ForgeVoxelVolume, palette: ForgePaletteDefinition,
		axis_option: OptionButton, slice_slider: HSlider) -> void:
	_add_section("Reusable colour patterns")
	_add_body(
		"Save the visible layer's colour layout as a reusable pattern. Applying "
		+ "a pattern recolours only occupied voxels, so an oak fence, stair and "
		+ "plank can share one material pattern without replacing their shapes.")
	var name_input := LineEdit.new()
	name_input.placeholder_text = "Oak plank"
	_page.add_child(_labeled("Pattern name", name_input))
	var pattern_option := _pattern_selector()
	_page.add_child(_labeled("Saved pattern", pattern_option))
	var actions := HFlowContainer.new()
	actions.add_child(_toolbar_button(
		"Save current layer pattern", func() -> void:
			_save_voxel_pattern(
				name_input.text, volume, palette,
				axis_option.selected, int(slice_slider.value))))
	var apply_button := _toolbar_button(
		"Recolour occupied voxels", func() -> void:
			var pattern := _selected_pattern(pattern_option)
			if pattern != null:
				_apply_pattern_to_voxel_layer(
					pattern, volume, palette,
					axis_option.selected, int(slice_slider.value)))
	apply_button.disabled = pattern_option.item_count == 0
	actions.add_child(apply_button)
	_page.add_child(actions)


func _pattern_selector() -> OptionButton:
	var option := OptionButton.new()
	for pattern in _pattern_library():
		option.add_item("%s — %d × %d" % [
			pattern.display_name, pattern.width, pattern.height])
		option.set_item_metadata(
			option.item_count - 1, pattern.resource_path)
	return option


func _selected_pattern(option: OptionButton) -> ForgePaintPatternDefinition:
	if option.item_count == 0 or option.selected < 0:
		_set_status("Save a colour pattern first.", true)
		return null
	var path := str(option.get_item_metadata(option.selected))
	var resource := ResourceLoader.load(
		path, "", ResourceLoader.CACHE_MODE_IGNORE)
	if not resource is ForgePaintPatternDefinition:
		_set_status("The selected colour pattern could not be loaded.", true)
		return null
	return resource


func _save_surface_pattern(
		display_name: String, surface: ForgeSurfaceSet,
		palette: ForgePaletteDefinition) -> void:
	var pattern := _new_pattern(display_name)
	if pattern == null:
		return
	if not pattern.capture_surface(surface, palette, _selected_face):
		_set_status("The current face could not be captured.", true)
		return
	_save_pattern(pattern, _show_surface_editor)


func _save_voxel_pattern(
		display_name: String, volume: ForgeVoxelVolume,
		palette: ForgePaletteDefinition, axis: int, slice_index: int) -> void:
	var pattern := _new_pattern(display_name)
	if pattern == null:
		return
	if not pattern.capture_voxel_slice(
			volume, palette, axis, slice_index):
		_set_status("The current voxel layer could not be captured.", true)
		return
	_save_pattern(pattern, _show_voxel_editor)


func _new_pattern(display_name_value: String) -> ForgePaintPatternDefinition:
	var display_name := display_name_value.strip_edges()
	var key := display_name.to_snake_case()
	if key.is_empty():
		_set_status("Enter a pattern name before saving.", true)
		return null
	var pattern := ForgePaintPatternDefinition.new()
	pattern.pattern_id = "pattern.%s" % key
	pattern.display_name = display_name
	return pattern


func _save_pattern(
		pattern: ForgePaintPatternDefinition, refresh_action: Callable) -> void:
	var make_error := DirAccess.make_dir_recursive_absolute(
		ProjectSettings.globalize_path(PATTERN_ROOT))
	if make_error not in [OK, ERR_ALREADY_EXISTS]:
		_set_status("Could not create the pattern library folder.", true)
		return
	var path := PATTERN_ROOT.path_join(
		"%s.tres" % ForgeId.safe_filename(pattern.pattern_id))
	var save_error := ResourceSaver.save(pattern, path)
	if save_error != OK:
		_set_status(
			"Pattern could not be saved: %s" % error_string(save_error), true)
		return
	_set_status("Saved %s." % pattern.display_name, false)
	refresh_action.call()


func _apply_pattern_to_surface(
		pattern: ForgePaintPatternDefinition, surface: ForgeSurfaceSet,
		palette: ForgePaletteDefinition) -> void:
	if not pattern.is_valid_pattern():
		_set_status("The selected pattern is invalid.", true)
		return
	var previous_pixels := surface.face_pixels_copy(_selected_face)
	var previous_entries: Array[Dictionary] = []
	for entry in palette.entries:
		previous_entries.append(entry.duplicate(true))
	var target_face := _selected_face
	command_service.execute(
		"Apply %s pattern" % pattern.display_name,
		func() -> void:
			var role_indices := palette.merge_entry_snapshots(
				pattern.palette_entries, true)
			var pixels := previous_pixels.duplicate()
			for y in surface.height:
				for x in surface.width:
					var role_key := pattern.role_at(x, y)
					if role_indices.has(role_key):
						pixels[y * surface.width + x] = int(
							role_indices[role_key])
			surface.set_face_pixels(target_face, pixels)
			_after_edit(),
		func() -> void:
			palette.entries = previous_entries
			surface.set_face_pixels(target_face, previous_pixels)
			_after_edit())


func _apply_pattern_to_voxel_layer(
		pattern: ForgePaintPatternDefinition, volume: ForgeVoxelVolume,
		palette: ForgePaletteDefinition, axis: int, slice_index: int) -> void:
	if not pattern.is_valid_pattern():
		_set_status("The selected pattern is invalid.", true)
		return
	var previous_cells := volume.slice_cells_copy(axis, slice_index)
	if previous_cells.is_empty():
		_set_status("The current voxel layer could not be read.", true)
		return
	var previous_entries: Array[Dictionary] = []
	for entry in palette.entries:
		previous_entries.append(entry.duplicate(true))
	var plane := volume.slice_dimensions(axis)
	command_service.execute(
		"Apply %s pattern to voxel layer" % pattern.display_name,
		func() -> void:
			var role_indices := palette.merge_entry_snapshots(
				pattern.palette_entries, true)
			var cells := previous_cells.duplicate()
			for y in plane.y:
				for x in plane.x:
					var offset := y * plane.x + x
					if cells[offset] == 0:
						continue
					var role_key := pattern.role_at(x, y)
					if role_indices.has(role_key):
						cells[offset] = int(role_indices[role_key]) + 1
			volume.set_slice_cells(axis, slice_index, cells)
			_after_edit(),
		func() -> void:
			palette.entries = previous_entries
			volume.set_slice_cells(axis, slice_index, previous_cells)
			_after_edit())


func _paint_voxel(position: Vector3i, value: int) -> void:
	_paint_voxels([position], value)


func _paint_voxels(positions: Array, value: int) -> void:
	var volume := _editable_volume()
	var previous := {}
	var changed: Array[Vector3i] = []
	for position_value in positions:
		var position := Vector3i(position_value)
		if previous.has(position):
			continue
		var old_value := volume.get_cell(position)
		if old_value == value:
			continue
		previous[position] = old_value
		changed.append(position)
	if changed.is_empty():
		return
	command_service.execute(
		"Edit %d voxel(s)" % changed.size(),
		func() -> void:
			for position in changed:
				if value < 0:
					volume.clear_cell(position)
				else:
					volume.set_cell(position, value)
			_after_edit(),
		func() -> void:
			for position in changed:
				var old_value := int(previous[position])
				if old_value < 0:
					volume.clear_cell(position)
				else:
					volume.set_cell(position, old_value)
			_after_edit())


func _paint_voxel_values(values: Dictionary) -> void:
	var volume := _editable_volume()
	if volume == null:
		return
	var previous := {}
	var changed: Array[Vector3i] = []
	for position_value in values:
		var position := Vector3i(position_value)
		var new_value := int(values[position_value])
		var old_value := volume.get_cell(position)
		if old_value == new_value:
			continue
		previous[position] = old_value
		changed.append(position)
	if changed.is_empty():
		return
	command_service.execute(
		"Randomize %d voxel(s)" % changed.size(),
		func() -> void:
			for position in changed:
				volume.set_cell(position, int(values[position]))
			_after_edit(),
		func() -> void:
			for position in changed:
				var old_value := int(previous[position])
				if old_value < 0:
					volume.clear_cell(position)
				else:
					volume.set_cell(position, old_value)
			_after_edit())


func _show_palette_material_editor() -> void:
	_clear_page("Palette Roles & Material DNA")
	if not _require_asset():
		return
	var palette := _primary_palette()
	palette.ensure_default_entries()
	_add_body(
		"Palette roles keep colour and material intent reusable. Material DNA "
		+ "bindings reference shared definitions instead of copying shader data "
		+ "into every asset.")
	var materials := _material_library()
	for index in palette.entries.size():
		var entry: Dictionary = palette.entries[index]
		var entry_index := index
		var row := HBoxContainer.new()
		var swatch := TextureRect.new()
		swatch.texture = _color_swatch(entry.get("albedo", Color.WHITE), 28)
		swatch.custom_minimum_size = Vector2(30, 30)
		swatch.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		row.add_child(swatch)
		var name := LineEdit.new()
		name.text = str(entry.get("entry_key", "role_%d" % index))
		name.custom_minimum_size = Vector2(180, 0)
		name.text_submitted.connect(func(value: String) -> void:
			palette.entries[entry_index]["entry_key"] = (
				value.strip_edges().to_snake_case())
			_after_edit())
		row.add_child(name)
		var color := ColorPickerButton.new()
		color.color = entry.get("albedo", Color.WHITE)
		color.custom_minimum_size = Vector2(90, 36)
		color.color_changed.connect(func(value: Color) -> void:
			palette.entries[entry_index]["albedo"] = value
			swatch.texture = _color_swatch(value, 28)
			_after_edit())
		row.add_child(color)
		var current_material_id := str(entry.get(
			"material_dna_id", "unbound"))
		var material_option := OptionButton.new()
		material_option.custom_minimum_size = Vector2(230, 0)
		var current_found := false
		for material in materials:
			material_option.add_item("%s — %s" % [
				material.display_name, material.material_id])
			material_option.set_item_metadata(
				material_option.item_count - 1, material.material_id)
			if material.material_id == current_material_id:
				material_option.select(material_option.item_count - 1)
				current_found = true
		if not current_found:
			material_option.add_item("Missing or custom — %s" % current_material_id)
			material_option.set_item_metadata(
				material_option.item_count - 1, current_material_id)
			material_option.select(material_option.item_count - 1)
		material_option.item_selected.connect(func(selected: int) -> void:
			palette.entries[entry_index]["material_dna_id"] = str(
				material_option.get_item_metadata(selected))
			_after_edit())
		row.add_child(material_option)
		_page.add_child(row)
	_add_action("Add palette role", func() -> void:
		var default_material_id := "material.mvp.stone"
		if not materials.is_empty():
			default_material_id = materials[0].material_id
		palette.entries.append({
			"entry_key": "role_%d" % palette.entries.size(),
			"albedo": Color("#8a8a8a"),
			"roughness": 0.8,
			"metallic": 0.0,
			"emission": Color.BLACK,
			"opacity": 1.0,
			"material_dna_id": default_material_id,
		})
		_after_edit()
		_show_palette_material_editor())
	_add_section("Shared Material DNA library")
	for material in materials:
		_add_body("%s — %s  | %s  | rough %.2f  | metal %.2f  | emission %.2f" % [
			material.display_name,
			material.material_id,
			material.rendering_class,
			material.roughness_default,
			material.metallic_default,
			material.emission_default,
		])
	_add_section("Create Material DNA")
	_add_body(
		"Create a reusable material definition once, then assign it to any "
		+ "palette role above. Use a stable lowercase ID such as "
		+ "material.project.oak.")
	var material_id_input := LineEdit.new()
	material_id_input.placeholder_text = "material.project.oak"
	var material_name_input := LineEdit.new()
	material_name_input.placeholder_text = "Oak Wood"
	var family_input := LineEdit.new()
	family_input.placeholder_text = "wood"
	var rendering_option := OptionButton.new()
	for rendering_class in ["opaque", "cutout", "transparent", "emissive"]:
		rendering_option.add_item(rendering_class.capitalize())
		rendering_option.set_item_metadata(
			rendering_option.item_count - 1, rendering_class)
	var roughness := SpinBox.new()
	roughness.min_value = 0.0
	roughness.max_value = 1.0
	roughness.step = 0.01
	roughness.value = 0.8
	var metallic := SpinBox.new()
	metallic.min_value = 0.0
	metallic.max_value = 1.0
	metallic.step = 0.01
	var emission := SpinBox.new()
	emission.min_value = 0.0
	emission.max_value = 8.0
	emission.step = 0.05
	_page.add_child(_labeled("Material ID", material_id_input))
	_page.add_child(_labeled("Display name", material_name_input))
	_page.add_child(_labeled("Family", family_input))
	var material_settings := HFlowContainer.new()
	material_settings.add_child(_labeled("Rendering class", rendering_option))
	material_settings.add_child(_labeled("Roughness", roughness))
	material_settings.add_child(_labeled("Metallic", metallic))
	material_settings.add_child(_labeled("Emission strength", emission))
	_page.add_child(material_settings)
	_add_action("Create Material DNA", func() -> void:
		_create_material_dna(
			material_id_input.text,
			material_name_input.text,
			family_input.text,
			str(rendering_option.get_item_metadata(
				rendering_option.selected)),
			float(roughness.value), float(metallic.value),
			float(emission.value)))


func _show_compound_editor() -> void:
	_clear_page("Compound, Parts, Pivots & Sockets")
	if not _require_asset():
		return
	_add_section("Named parts")
	if current_asset.parts.is_empty():
		_add_body("No parts yet.")
	for part_resource in current_asset.parts:
		if part_resource is ForgePartDefinition:
			var part: ForgePartDefinition = part_resource
			_add_body("%s  | parent: %s  | animated: %s" % [
				part.part_key,
				part.parent_part_key if not part.parent_part_key.is_empty() else "root",
				str(part.animated),
			])
	var part_name := LineEdit.new()
	part_name.placeholder_text = "part key, e.g. gear"
	_page.add_child(part_name)
	_add_action("Add voxel part", func() -> void:
		var key := part_name.text.strip_edges().to_snake_case()
		if key.is_empty():
			return
		var volume := ForgeVoxelVolume.new()
		volume.dimensions = Vector3i(16, 16, 16)
		volume.voxel_size_meters = 0.03125
		volume.ensure_storage()
		for z in range(4, 12):
			for y in range(4, 12):
				for x in range(4, 12):
					volume.set_cell(Vector3i(x, y, z), 0)
		var part := ForgePartDefinition.new()
		part.part_key = key
		part.source_volume = volume
		part.animated = key in ["gear", "piston", "door", "handle"]
		current_asset.parts.append(part)
		_after_edit()
		_show_compound_editor())
	_add_section("Stable sockets")
	for socket_resource in current_asset.sockets:
		if socket_resource is ForgeSocketDefinition:
			var socket: ForgeSocketDefinition = socket_resource
			_add_body("%s  | %s  | parent: %s" % [
				socket.socket_key, socket.socket_type,
				socket.parent_part_key if not socket.parent_part_key.is_empty()
					else "root",
			])
	var socket_row := HBoxContainer.new()
	var socket_name := LineEdit.new()
	socket_name.placeholder_text = "socket key, e.g. smoke"
	socket_name.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	socket_row.add_child(socket_name)
	var socket_type := OptionButton.new()
	for value in ["effect", "audio", "item_input", "item_output", "power"]:
		socket_type.add_item(value)
	socket_row.add_child(socket_type)
	_page.add_child(socket_row)
	_add_action("Add socket", func() -> void:
		var key := socket_name.text.strip_edges().to_snake_case()
		if key.is_empty():
			return
		var socket := ForgeSocketDefinition.new()
		socket.socket_key = key
		socket.socket_type = socket_type.get_item_text(socket_type.selected)
		current_asset.sockets.append(socket)
		_after_edit()
		_show_compound_editor())
	_add_section("Collision & placement")
	var collision_count := 0
	if current_asset.collision_profile is ForgeCollisionProfile:
		collision_count = current_asset.collision_profile.boxes.size()
	_add_body((
		"%d authored collision box(es). Footprint changes are contract-sensitive "
		+ "and are elevated by validation.") % collision_count)
	_add_action("Centre pivots on part volumes", func() -> void:
		for part_resource in current_asset.parts:
			if not part_resource is ForgePartDefinition \
					or not part_resource.source_volume is ForgeVoxelVolume:
				continue
			var part: ForgePartDefinition = part_resource
			var volume: ForgeVoxelVolume = part.source_volume
			var centre := Vector3(volume.dimensions) \
				* volume.voxel_size_meters * 0.5
			part.pivot_transform = Transform3D(Basis.IDENTITY, centre)
		_after_edit()
		_show_compound_editor())


func _show_collision_placement_editor() -> void:
	_clear_page("Collision & Placement Footprint")
	if not _require_asset():
		return
	if not current_asset.collision_profile is ForgeCollisionProfile:
		current_asset.collision_profile = ForgeCollisionProfile.new()
		current_asset.collision_profile.collision_profile_id = (
			"collision.%s" % current_asset.presentation_id)
	if not current_asset.footprint_profile is ForgeFootprintProfile:
		current_asset.footprint_profile = ForgeFootprintProfile.new()
		current_asset.footprint_profile.footprint_profile_id = (
			"footprint.%s" % current_asset.presentation_id)
	var collision: ForgeCollisionProfile = current_asset.collision_profile
	var footprint: ForgeFootprintProfile = current_asset.footprint_profile
	_add_section("Simple collision boxes")
	for index in collision.boxes.size():
		var box: Dictionary = collision.boxes[index]
		_add_body("Box %d  | min %s  | max %s" % [
			index + 1,
			str(box.get("minimum", [])),
			str(box.get("maximum", [])),
		])
	_add_action("Add unit collision box", func() -> void:
		collision.boxes.append({
			"minimum": [0.0, 0.0, 0.0],
			"maximum": [1.0, 1.0, 1.0],
		})
		_after_edit()
		_show_collision_placement_editor())
	_add_action("Remove last collision box", func() -> void:
		if not collision.boxes.is_empty():
			collision.boxes.pop_back()
			_after_edit()
			_show_collision_placement_editor())
	_add_section("Grid occupancy")
	_add_body((
		"Profile: %s\nAnchor: %s\nOccupied: %s\nClearance: %s\nRotations: %s\n"
		+ "Support required: %s") % [
			footprint.footprint_profile_id,
			str(footprint.anchor_cell),
			str(footprint.occupied_cells),
			str(footprint.clearance_cells),
			str(footprint.allowed_rotations),
			str(footprint.support_required),
		])
	_add_body(
		"Footprints reserve world-grid cells independently of microvoxel "
		+ "dimensions. Doors and other tall objects must include the upper "
		+ "cell so placement, saves, and blueprints cannot overlap it.")
	var templates := HFlowContainer.new()
	for template in [
		["1 × 1 × 1", [Vector3i.ZERO]],
		["Tall 1 × 2", [Vector3i.ZERO, Vector3i.UP]],
		["Wide 2 × 1", [Vector3i.ZERO, Vector3i.RIGHT]],
		["Large 2 × 2", [
			Vector3i.ZERO, Vector3i.RIGHT,
			Vector3i.FORWARD, Vector3i.RIGHT + Vector3i.FORWARD,
		]],
	]:
		var template_name := str(template[0])
		var template_cells: Array = template[1]
		var template_button := Button.new()
		template_button.text = template_name
		template_button.pressed.connect(
			_apply_footprint_template.bind(footprint, template_cells))
		templates.add_child(template_button)
	_page.add_child(_labeled("Footprint presets", templates))
	var cell_row := HFlowContainer.new()
	var x := SpinBox.new()
	var y := SpinBox.new()
	var z := SpinBox.new()
	for control in [x, y, z]:
		control.min_value = -16
		control.max_value = 16
		cell_row.add_child(control)
	_page.add_child(_labeled("Add occupied cell (x, y, z)", cell_row))
	_add_action("Add occupied cell", func() -> void:
		var cell := Vector3i(int(x.value), int(y.value), int(z.value))
		if cell not in footprint.occupied_cells:
			footprint.occupied_cells.append(cell)
			_after_edit()
			_show_collision_placement_editor())
	_add_action("Remove last occupied cell", func() -> void:
		if footprint.occupied_cells.size() > 1:
			footprint.occupied_cells.pop_back()
			if footprint.anchor_cell not in footprint.occupied_cells:
				footprint.anchor_cell = footprint.occupied_cells[0]
			_after_edit()
			_show_collision_placement_editor())
	var support := CheckButton.new()
	support.text = "Requires supporting placement surface"
	support.button_pressed = footprint.support_required
	support.toggled.connect(func(value: bool) -> void:
		footprint.support_required = value
		_after_edit())
	_page.add_child(support)


func _apply_footprint_template(
		footprint: ForgeFootprintProfile, cells: Array) -> void:
	footprint.anchor_cell = Vector3i.ZERO
	footprint.occupied_cells.assign(cells)
	_after_edit()
	_show_collision_placement_editor()


func _show_item_preview() -> void:
	_clear_page("Item, Held, Drop & Icon Preview")
	if not _require_asset():
		return
	_add_body(
		"Representation profiles share one stable item identity while allowing "
		+ "distinct world, held, dropped and icon presentation transforms.")
	for profile_name in ["held", "dropped", "icon", "preview"]:
		var profile: Dictionary = current_asset.representation_profiles.get(
			profile_name, {})
		_add_body("%s: %s" % [profile_name.capitalize(), str(profile)])
	var package := ForgeRuntime.package_for(
		str(current_asset.gameplay_links[0])
		if not current_asset.gameplay_links.is_empty() else "")
	if package != null and FileAccess.file_exists(package.icon_path):
		var image := Image.load_from_file(
			ProjectSettings.globalize_path(package.icon_path))
		var texture_rect := TextureRect.new()
		texture_rect.texture = ImageTexture.create_from_image(image) \
			if not image.is_empty() else null
		texture_rect.custom_minimum_size = Vector2(112, 112)
		texture_rect.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
		texture_rect.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		_page.add_child(texture_rect)
	_add_action("Bake fresh item and icon preview", _bake_preview)


func _show_world_test_preview() -> void:
	_clear_page("World & Machine Test Preview")
	if not _require_asset():
		return
	if current_asset.gameplay_links.is_empty():
		_add_body("Link this visual asset to a gameplay record before world testing.")
		return
	var gameplay_id := str(current_asset.gameplay_links[0])
	var resolution := ForgeRuntime.resolve(gameplay_id, "world_test", {
		"context": "forge_studio",
	})
	_add_body(
		"Stable gameplay ID: %s\nPresentation: %s\nFallback: %s" % [
			gameplay_id,
			str(resolution.get("presentation_id", "")),
			str(resolution.get("fallback", "legacy_runtime")),
		])
	_add_action("Preview approved runtime package", func() -> void:
		_preview.show_runtime_package(gameplay_id, 1)
		_set_status("Loaded approved package in the test preview.", false))
	_add_action("Preview three-instance machine line", func() -> void:
		_preview.show_runtime_package(gameplay_id, 3)
		_set_status("Loaded a three-instance presentation test line.", false))
	_add_action("Return to editable source preview", func() -> void:
		_preview.show_asset(current_asset))


func _show_animation_editor() -> void:
	_clear_page("Animation, Effects & Runtime States")
	if not _require_asset():
		return
	if current_asset.animation_set == null:
		current_asset.animation_set = ForgeAnimationSet.new()
		current_asset.animation_set.animation_set_id = "animations.%s" % (
			current_asset.presentation_id)
	var animations: ForgeAnimationSet = current_asset.animation_set
	_add_section("Transform and material timeline")
	for clip in animations.clips:
		_add_body("%s  | %.2fs  | %d track(s)  | %s" % [
			str(clip.get("clip_id", "")),
			float(clip.get("length", 0.0)),
			clip.get("tracks", []).size(),
			"loop" if bool(clip.get("loop", false)) else "one-shot",
		])
	_add_action("Add rotating gear clip", func() -> void:
		animations.upsert_clip({
			"clip_id": "work_cycle",
			"length": 1.0,
			"loop": true,
			"tracks": [{
				"type": "rotation",
				"target": "Gear",
				"interpolation": "linear",
				"keys": [
					{"time": 0.0, "value": [0.0, 0.0, 0.0, 1.0]},
					{"time": 0.25, "value": [
						0.0, 0.0, 0.7071068, 0.7071068]},
					{"time": 0.5, "value": [0.0, 0.0, 1.0, 0.0]},
					{"time": 0.75, "value": [
						0.0, 0.0, 0.7071068, -0.7071068]},
					{"time": 1.0, "value": [0.0, 0.0, 0.0, -1.0]},
				],
			}],
			"audio_cues": [{"time": 0.0, "cue_id": "machine.work_loop"}],
		})
		_after_edit()
		_show_animation_editor())
	_add_section("Voxel-frame timeline")
	_add_body(
		"Shape-changing frames remain bounded source volumes. Onion skin is an "
		+ "authoring aid; Bake Preview writes one immutable mesh per frame and "
		+ "runtime playback only swaps those products.")
	for resource in animations.voxel_frame_clips:
		if resource is ForgeVoxelFrameClip:
			var frame_clip: ForgeVoxelFrameClip = resource
			_add_body(("%s  | %d frame(s)  | %.2fs  | onion skin %s  | "
				+ "reduced-motion frame %d") % [
					frame_clip.clip_id,
					frame_clip.frames.size(),
					frame_clip.total_duration(),
					"on" if frame_clip.onion_skin_enabled else "off",
					frame_clip.reduced_motion_frame,
				])
	_add_action("Add two-frame voxel effect from current volume", func() -> void:
		var source := _editable_volume()
		if source == null or source.occupied_count() == 0:
			_set_status("A non-empty voxel volume is required.", true)
			return
		var frame_clip := ForgeVoxelFrameClip.new()
		frame_clip.clip_id = "voxel_effect_%d" % (
			animations.voxel_frame_clips.size() + 1)
		frame_clip.frames = [source.duplicate(true), source.duplicate(true)]
		frame_clip.frame_durations = PackedFloat32Array([0.12, 0.18])
		frame_clip.onion_skin_enabled = true
		frame_clip.reduced_motion_frame = 0
		animations.voxel_frame_clips.append(frame_clip)
		_after_edit()
		_show_animation_editor())
	_add_section("One-way gameplay state binding")
	if current_asset.state_binding == null:
		current_asset.state_binding = ForgeStateBindingDefinition.new()
		current_asset.state_binding.state_binding_id = "statebinding.%s" % (
			current_asset.presentation_id)
	_add_body(
		"Bindings read authoritative snapshots and emit presentation actions. "
		+ "They cannot alter recipes, transfer speed, inventory or power.")
	for binding in current_asset.state_binding.bindings:
		_add_body("%s %s %s → %d action(s)" % [
			str(binding.get("field", "")),
			str(binding.get("operator", "equals")),
			str(binding.get("value")),
			binding.get("actions", []).size(),
		])
	_add_action("Bind processing = true to work_cycle", func() -> void:
		current_asset.state_binding.bindings.append({
			"field": "processing",
			"operator": "equals",
			"value": true,
			"actions": [
				{
					"type": "animation",
					"player": "AnimationPlayer",
					"clip": "work_cycle",
				},
				{
					"type": "visibility",
					"target": "Flame",
					"value": true,
				},
				{
					"type": "audio_cue",
					"cue_id": "machine.work_loop",
					"socket": "work_audio",
				},
			],
		})
		_after_edit()
		_show_animation_editor())
	_add_section("State simulator")
	_add_body(
		"These mock values are read-only presentation inputs. They never touch "
		+ "the live machine, inventory, recipe, power or save state.")
	var processing_toggle := CheckButton.new()
	processing_toggle.text = "Processing"
	_page.add_child(processing_toggle)
	var blocked_toggle := CheckButton.new()
	blocked_toggle.text = "Blocked"
	_page.add_child(blocked_toggle)
	var damaged_slider := HSlider.new()
	damaged_slider.min_value = 0.0
	damaged_slider.max_value = 1.0
	damaged_slider.step = 0.1
	_page.add_child(_labeled("Damage ratio", damaged_slider))
	var simulate := func(_value: Variant = null) -> void:
		_simulate_current_state({
			"processing": processing_toggle.button_pressed,
			"blocked": blocked_toggle.button_pressed,
			"damaged": damaged_slider.value,
		})
	processing_toggle.toggled.connect(simulate)
	blocked_toggle.toggled.connect(simulate)
	damaged_slider.value_changed.connect(simulate)
	var reduced_motion := CheckButton.new()
	reduced_motion.text = (
		"Preview reduced motion (static voxel-frame fallback)")
	reduced_motion.button_pressed = UIState.setting_bool("reduced_motion")
	reduced_motion.toggled.connect(func(enabled: bool) -> void:
		UIState.set_setting("reduced_motion", enabled)
		_set_status(
			"Reduced-motion preview %s." % (
				"enabled" if enabled else "disabled"), false))
	_page.add_child(reduced_motion)


func _simulate_current_state(snapshot: Dictionary) -> void:
	if current_asset == null \
			or not current_asset.state_binding is ForgeStateBindingDefinition:
		_set_status("This asset has no state binding to simulate.", true)
		return
	var before := snapshot.duplicate(true)
	var adapter := ForgeStateAdapter.new()
	adapter.state_binding = current_asset.state_binding
	var actions := adapter.apply_snapshot(snapshot)
	adapter.free()
	_set_status(
		"State preview resolved %d visual action(s); gameplay snapshot %s." % [
			actions.size(),
			"unchanged" if snapshot == before else "INVALID",
		],
		snapshot != before)


func _show_override_editor() -> void:
	_clear_page("Overrides, Variants & Provenance")
	if not _require_asset():
		return
	_ensure_preview_override()
	_add_section("Safe editing commands")
	_add_action("Open registry original read-only", _show_original_record)
	_add_action("Mark source as project override", func() -> void:
		current_asset.source_pack_id = "pack.leyforge.project_visuals"
		current_asset.provenance_note = (
			"Project presentation override for %s; gameplay identity unchanged."
			% (str(current_asset.gameplay_links[0])
				if not current_asset.gameplay_links.is_empty()
				else "unlinked visual"))
		_after_edit()
		_show_override_editor())
	_add_action("Duplicate as unlinked visual draft", _duplicate_visual_draft)
	_add_section("Resolved provenance")
	for entry in [
		["Gameplay identity", current_asset.gameplay_links[0]
			if not current_asset.gameplay_links.is_empty() else "unlinked",
			"registry — immutable from Forge"],
		["Presentation", current_asset.presentation_id,
			"project source — replaceable"],
		["Source pack", current_asset.source_pack_id,
			"project override layer"],
		["Fallback", "legacy_runtime",
			"active whenever package validation fails"],
	]:
		_add_body("%s: %s\n    provenance: %s" % entry)
	_add_section("Deterministic variants")
	for variant_resource in current_asset.variant_sets:
		if variant_resource is ForgeVariantSet:
			var variant: ForgeVariantSet = variant_resource
			_add_body("%s  | %s  | %d entries" % [
				variant.variant_set_id, variant.dimension, variant.entries.size(),
			])
	_add_action("Add oak/pine material variant set", func() -> void:
		var variants := ForgeVariantSet.new()
		variants.variant_set_id = "variantset.%s.material" % (
			current_asset.presentation_id)
		variants.parent_presentation_id = current_asset.presentation_id
		variants.dimension = "material"
		variants.seed_salt = "leyforge-material"
		variants.default_variant_id = "oak"
		variants.entries = [
			{"variant_id": "oak", "weight": 3.0,
				"field_operations": {"material_family": "oak"}},
			{"variant_id": "pine", "weight": 1.0,
				"field_operations": {"material_family": "pine"}},
		]
		current_asset.variant_sets.append(variants)
		_after_edit()
		_show_override_editor())
	_add_body(
		"Field-level inherit, replace, clear and stable-key merge operations are "
		+ "resolved by ForgeOverrideResolver. Equal-priority conflicts are errors "
		+ "and fall back to the last valid presentation.")
	_add_section("Preview override compare & revert")
	var field_name := OptionButton.new()
	for field in [
		"display_name", "material_bindings", "animation_set",
		"representation_profiles"]:
		field_name.add_item(field)
	var replacement := LineEdit.new()
	replacement.placeholder_text = "Preview replacement value"
	_page.add_child(_labeled("Field", field_name))
	_page.add_child(_labeled("Replacement", replacement))
	_add_action("Apply preview field replacement", func() -> void:
		var field := field_name.get_item_text(field_name.selected)
		current_preview_override.field_operations[field] = {
			"op": "replace", "value": replacement.text,
		}
		_show_override_editor())
	var base_record := current_asset.to_record()
	var resolution := ForgeOverrideResolver.new().resolve(
		base_record, [current_preview_override], base_record)
	for field in current_preview_override.field_operations:
		_add_body("%s\n    base: %s\n    preview: %s\n    source: %s" % [
			str(field),
			str(base_record.get(field)),
			str(resolution["record"].get(field)),
			str(resolution["provenance"].get(field, {})),
		])
	var revert_field := OptionButton.new()
	for field in current_preview_override.field_operations:
		revert_field.add_item(str(field))
	_page.add_child(_labeled("Selected changed field", revert_field))
	var revert_button := Button.new()
	revert_button.text = "Revert selected field to inherited value"
	revert_button.disabled = revert_field.item_count == 0
	revert_button.pressed.connect(func() -> void:
		if revert_field.item_count > 0:
			ForgeOverrideResolver.new().revert_field(
				current_preview_override,
				revert_field.get_item_text(revert_field.selected))
			_show_override_editor())
	_page.add_child(revert_button)
	_add_action("Revert entire preview override", func() -> void:
		current_preview_override.field_operations.clear()
		current_preview_override.source_revision += 1
		_show_override_editor())


func _show_validation() -> void:
	_clear_page("Validation Centre")
	if not _require_asset():
		return
	_validate_current(false)
	var summary := validation_service.summarize(current_diagnostics)
	_add_body("Info %d  |  Warnings %d  |  Errors %d  |  Critical %d" % [
		summary["info"], summary["warning"],
		summary["error"], summary["critical"],
	])
	if current_diagnostics.is_empty():
		_add_body("No current validation findings.")
	for diagnostic in current_diagnostics:
		var panel := PanelContainer.new()
		var label := Label.new()
		label.text = "[%s] %s — %s\nConsequence: %s\nSuggested fix: %s" % [
			diagnostic.code, diagnostic.severity.to_upper(),
			diagnostic.message, diagnostic.consequence,
			diagnostic.suggested_fix,
		]
		label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
		panel.add_child(label)
		_page.add_child(panel)


func _ensure_preview_override() -> void:
	if current_preview_override != null \
			and current_preview_override.target_presentation_id \
				== current_asset.presentation_id:
		return
	current_preview_override = ForgeOverrideDefinition.new()
	current_preview_override.override_id = "override.preview.%s" % (
		current_asset.presentation_id.trim_prefix("presentation."))
	current_preview_override.target_presentation_id = (
		current_asset.presentation_id)
	current_preview_override.source_layer = "preview"
	current_preview_override.source_pack_id = "pack.forge.preview"


func _show_original_record() -> void:
	_clear_page("Registry Original — Read Only")
	_add_body(
		"This canonical gameplay record is never edited by the Forge. Use Back "
		+ "to return to the project presentation source.")
	for key in current_record.keys():
		_add_body("%s: %s" % [str(key), str(current_record[key])])
	_add_action("Back to Overrides", _show_override_editor)


func _duplicate_visual_draft() -> void:
	var suffix := str(Time.get_unix_time_from_system()).replace(".", "_")
	var duplicate: ForgeAssetDefinition = current_asset.duplicate(true)
	duplicate.forge_asset_id = "%s_copy_%s" % [
		current_asset.forge_asset_id, suffix]
	duplicate.presentation_id = "%s_copy_%s" % [
		current_asset.presentation_id, suffix]
	duplicate.display_name = "%s Copy" % current_asset.display_name
	duplicate.gameplay_links = PackedStringArray()
	duplicate.source_status = "draft"
	duplicate.source_revision = 1
	duplicate.provenance_note = (
		"Unlinked visual duplicate; assign a new canonical gameplay identity "
		+ "before approval.")
	var result := document_service.save_draft(duplicate)
	if not bool(result.get("ok", false)):
		_set_status("Could not duplicate visual draft.", true)
		return
	current_asset = duplicate
	current_record = {}
	asset_index.rebuild()
	_after_open_asset()
	_show_override_editor()


func _show_blueprint_catalogue() -> void:
	_clear_page("Blueprint Catalogue")
	_ensure_presentation_workspace()
	_add_body(
		"Read-only catalogue from the unified Forge foundation index. These are the "
		+ "real blueprint, module, state and compiled-product sources; this view does "
		+ "not create a competing building schema.")
	_add_foundation_catalogue([
		"blueprint_definition", "blueprint_module_definition",
		"blueprint_state_definition", "blueprint_runtime_product",
	], 18)


func _show_entity_catalogue() -> void:
	_clear_page("Entity Catalogue")
	_ensure_presentation_workspace()
	_add_body(
		"Read-only entity records from the shared source index. Stable IDs, gameplay "
		+ "proxy links and publication status remain owned by their canonical sources.")
	_add_foundation_catalogue([
		"entity_definition", "entity_assembly_profile", "gameplay_proxy_profile",
	], 18)


func _show_body_rig_catalogue() -> void:
	_clear_page("Body Plans & Rigs")
	_ensure_presentation_workspace()
	_add_body(
		"Inspect anatomy, body-part, semantic rig, retargeting and foot-placement "
		+ "records. Editing belongs to the future specialist Entity studio tools.")
	_add_foundation_catalogue([
		"body_plan", "body_part", "rig_profile", "retarget_map",
		"foot_placement_profile", "entity_animation_library",
	], 18)


func _show_entity_equipment_catalogue() -> void:
	_clear_page("Equipment & Variants")
	_ensure_presentation_workspace()
	_add_body(
		"Inspect equipment-fit and appearance-variant sources against the same stable "
		+ "entity identities. This catalogue is not a visual fitting editor.")
	_add_foundation_catalogue([
		"equipment_fit_profile", "entity_variant_profile",
	], 18)


func _add_foundation_catalogue(kinds: Array, record_limit: int) -> void:
	for kind_value in kinds:
		var kind := str(kind_value)
		_add_stat_card(
			kind.replace("_", " ").capitalize(),
			presentation_workspace.filtered_list(kind).size())
	_add_section("Indexed source records")
	var remaining := record_limit
	for kind_value in kinds:
		if remaining <= 0:
			break
		var kind := str(kind_value)
		var records := presentation_workspace.filtered_list(kind)
		for record in records.slice(0, mini(records.size(), remaining)):
			var source_id := ForgeRuntimeRegistryGeneration._record_id(record)
			_add_body("[INSPECT] %s  |  %s  |  %s" % [
				source_id,
				str(record.get("display_name", kind.replace("_", " "))),
				str(record.get("source_status", "unknown")),
			])
			remaining -= 1


func _show_planned_capability() -> void:
	_clear_page("Planned Specialist Editor")
	_add_hub_banner(_active_section_id, "Planned Capability",
		"This specialist authoring surface is intentionally disabled. Use the "
		+ "available inspect catalogue and shared Test & Delivery tools until its "
		+ "source editor, undo contract and validation coverage are complete.")


func _show_blueprint_handoff() -> void:
	_clear_page("Blueprint Designer Handoff")
	_add_body(
		"This controlled handoff reads the existing settlement blueprint registry. "
		+ "It does not create a second blueprint system. Approved packages refresh "
		+ "by stable block ID, so blueprint records are not rewritten.")
	var blueprint_ids: Array[String] = []
	for value in SettlementContentRegistry.blueprints.keys():
		blueprint_ids.append(str(value))
	blueprint_ids.sort()
	_add_stat_card("Registered blueprints", blueprint_ids.size())
	for blueprint_id in blueprint_ids.slice(0, mini(20, blueprint_ids.size())):
		var blueprint := SettlementContentRegistry.get_blueprint(blueprint_id)
		var button := Button.new()
		button.text = "%s  |  %s" % [
			blueprint_id, str(blueprint.get("display_name",
				blueprint.get("name", "Blueprint"))),
		]
		button.alignment = HORIZONTAL_ALIGNMENT_LEFT
		button.pressed.connect(_show_blueprint_context.bind(blueprint_id))
		_page.add_child(button)
	if blueprint_ids.size() > 20:
		_add_body(
			"Showing the first 20 of %d registry blueprints." % blueprint_ids.size())


func _show_blueprint_context(blueprint_id: String) -> void:
	_clear_page("Blueprint Context — %s" % blueprint_id)
	var blueprint := SettlementContentRegistry.get_blueprint(blueprint_id)
	var validation := SettlementContentRegistry.validate_blueprint(blueprint_id)
	_add_body("Stable blueprint ID: %s" % blueprint_id)
	_add_body("Validation: %s" % (
		"valid" if bool(validation.get("ok", false))
		else ", ".join(validation.get("errors", []))))
	var palette: Dictionary = blueprint.get("palette", {})
	_add_section("Canonical material/block references")
	for role in palette:
		_add_body("%s → %s" % [str(role), str(palette[role])])
	_add_body(
		"Open any referenced gameplay ID in Asset Browser, approve its "
		+ "presentation, then return here. The same blueprint ID and palette role "
		+ "remain intact.")
	_add_action("Back to Blueprint Handoff", _show_blueprint_handoff)


func _show_recovery() -> void:
	_clear_page("Recovery & Basic History")
	var candidates := autosave_service.recovery_candidates()
	if candidates.is_empty():
		_add_body("No recoverable Forge autosaves were found.")
	for candidate in candidates:
		var panel := VBoxContainer.new()
		panel.add_theme_constant_override("separation", 5)
		_add_child_note(panel, "%s  | revision %d" % [
			str(candidate.get("display_name", candidate.get("asset_id", ""))),
			int(candidate.get("source_revision", 0)),
		])
		var actions := HBoxContainer.new()
		var recover := Button.new()
		recover.text = "Recover"
		recover.pressed.connect(_recover_autosave.bind(str(candidate["path"])))
		actions.add_child(recover)
		var discard := Button.new()
		discard.text = "Discard autosave"
		discard.pressed.connect(func() -> void:
			autosave_service.discard(str(candidate["path"]))
			_show_recovery())
		actions.add_child(discard)
		panel.add_child(actions)
		_page.add_child(panel)
	_add_section("Current session")
	_add_body("Undo: %s\nRedo: %s" % [
		command_service.undo_label() if not command_service.undo_label().is_empty()
			else "none",
		command_service.redo_label() if not command_service.redo_label().is_empty()
			else "none",
	])


func _show_migration_register() -> void:
	_clear_page("21G Migration Register")
	var path := "res://content/forge/migration/registry_migration_register.json"
	if not FileAccess.file_exists(path):
		_add_body("Migration register has not been generated.")
		return
	var payload: Variant = JSON.parse_string(
		FileAccess.get_file_as_string(path))
	if not payload is Dictionary:
		_add_body("Migration register is unreadable.")
		return
	var records: Array = payload.get("records", [])
	var statuses := {}
	for record in records:
		var status := str(record.get("status", "unknown"))
		statuses[status] = int(statuses.get(status, 0)) + 1
	_add_body(
		"The register inventories the live block/item registries without "
		+ "starting bulk replacement. Stable IDs and legacy fallbacks remain active.")
	_add_stat_card("Registry presentations", records.size())
	_add_stat_card("MVP golden approved", int(statuses.get("approved", 0)))
	_add_stat_card("Deferred / unreviewed", int(statuses.get("unreviewed", 0)))
	_add_body("Bulk 21G migration started: %s" % str(
		payload.get("bulk_migration_started", false)))
	_add_section("Approved representative set")
	for record in records:
		if str(record.get("status", "")) == "approved":
			_add_body("%s — %s" % [
				str(record.get("gameplay_id", "")),
				str(record.get("display_name", "")),
			])


func _show_presentation_forge() -> void:
	_clear_page("Presentation Forge")
	var report := presentation_workspace.load_and_validate()
	var summary := presentation_workspace.source_summary()
	_add_body(
		"The Presentation Forge shares the project manifest, source index, stable "
		+ "IDs, dependency graph and validation pipeline used by Entity and Blueprint "
		+ "Forge. Active legacy effects and sounds remain fallbacks until their "
		+ "individual replacement evidence is approved.")
	_add_stat_card("Indexed Forge sources", int(report.get("record_count", 0)))
	_add_stat_card("Presentation profiles", int(summary.counts.get(
		"presentation_profile", 0)))
	_add_stat_card("VFX definitions", int(summary.counts.get("vfx_effect", 0)))
	_add_stat_card("Sound events", int(summary.counts.get("sound_event", 0)))
	_add_stat_card("Open diagnostics", presentation_workspace.diagnostics.size())
	_add_section("Publication state")
	_add_body("Known-good registry generation: %s" % str(
		report.get("generation_id", "not published")))
	_add_body(
		"Generated products remain replaceable output. Source hash changes make "
		+ "approval stale and require comparison plus human review.")


func _show_presentation_spatial() -> void:
	_show_presentation_catalogue("Spatial Roles", "spatial_map",
		"Inspect shared owner-local anchors, sockets, regions, paths, masks, zones, "
		+ "audio portals and runtime contacts. Scene paths are not stable identity.")


func _show_presentation_events() -> void:
	_clear_page("Events & Profiles")
	_ensure_presentation_workspace()
	_add_body(
		"Inspect typed event/state contracts, context requirements, bindings and "
		+ "resolved presentation profiles. Gameplay remains authoritative; these "
		+ "records only request presentation.")
	for kind in ["event_contract", "state_contract", "context_schema",
			"presentation_binding", "presentation_profile"]:
		_add_stat_card(str(kind).capitalize(),
			presentation_workspace.filtered_list(kind).size())
	_add_presentation_records("presentation_profile", 16)


func _show_presentation_vfx() -> void:
	_clear_page("VFX Graph Authoring")
	_ensure_presentation_workspace()
	_add_body(
		"Review bounded graph source, voxel forms, families, surface layers, LOD and "
		+ "budget contracts. Cycles and unbounded spawn, lifetime or node limits block "
		+ "publication. Editing remains non-destructive and legacy VFX stays active.")
	for kind in ["vfx_effect", "vfx_family", "vfx_graph", "vfx_form",
			"surface_layer"]:
		_add_stat_card(str(kind).capitalize(),
			presentation_workspace.filtered_list(kind).size())
	_add_presentation_records("vfx_effect", 16)


func _show_presentation_audio() -> void:
	_clear_page("Sound Event Authoring")
	_ensure_presentation_workspace()
	_add_body(
		"Review seeded Sound Events, source provenance, managed-loop ownership, "
		+ "spatial profiles, concurrency, buses and captions. The 700-1,100 source "
		+ "figure is planning guidance; it is never treated as a completion count.")
	for kind in ["sound_event", "sound_source", "audio_family",
			"spatial_audio_profile", "acoustic_profile", "ambience_plan"]:
		_add_stat_card(str(kind).capitalize(),
			presentation_workspace.filtered_list(kind).size())
	_add_presentation_records("sound_event", 16)


func _show_presentation_accessibility() -> void:
	_clear_page("Accessibility Preview")
	_ensure_presentation_workspace()
	_add_body(
		"Preview declared reduced-motion, reduced-flash, colour-independent, muted "
		+ "audio, caption and directional equivalents per listener. Automated checks "
		+ "do not close listening or accessibility approval.")
	_add_stat_card("Accessibility profiles",
		presentation_workspace.filtered_list("accessibility_profile").size())
	_add_stat_card("Budget / quality profiles",
		presentation_workspace.filtered_list("budget_profile").size())
	_add_section("Human evidence")
	for gate in ["Visual", "Listening", "Accessibility", "Rights",
			"Performance tier", "Owner"]:
		_add_body("%s approval: open" % gate)


func _show_presentation_capture() -> void:
	_clear_page("Capture & Replay")
	_ensure_presentation_workspace()
	var scenarios := _load_presentation_scenarios()
	var report := presentation_laboratory.load_and_validate(scenarios)
	_add_body(
		"Capture stable contract IDs, payloads, timestamps, seeds, context and "
		+ "resolver commands. Rendered particles, voices and scene instances are not "
		+ "capture identity.")
	_add_stat_card("Available scenarios", int(report.get("scenario_count", 0)))
	for scenario in scenarios.slice(0, mini(scenarios.size(), 12)):
		_add_action("Capture %s" % scenario.display_name,
			_capture_presentation_scenario.bind(scenario.stable_id))


func _capture_presentation_scenario(scenario_id: String) -> void:
	var generation := presentation_workspace.registry_publisher.current_generation()
	var result := presentation_laboratory.capture(scenario_id,
		str(generation.get("generation_id", "registry.presentation.preview")), 23006)
	_set_status("Captured %s" % str(result.get("capture_id", scenario_id)),
		not bool(result.get("ok", false)))


func _show_presentation_test_laboratory() -> void:
	_clear_page("Test Laboratory")
	_ensure_presentation_workspace()
	var scenarios := _load_presentation_scenarios()
	var report := presentation_laboratory.load_and_validate(scenarios)
	_add_body(
		"Run deterministic scenario matrices across quality and accessibility modes, "
		+ "compare registry generations, multiply density, and keep manual visual and "
		+ "listening review visible.")
	_add_stat_card("Regression and stress scenarios",
		int(report.get("scenario_count", 0)))
	if not scenarios.is_empty():
		var matrix := presentation_laboratory.accessibility_matrix(
			scenarios[0].stable_id)
		_add_stat_card("First scenario matrix cells",
			int(matrix.get("cell_count", 0)))
	_add_presentation_records("test_scenario", 20)


func _show_presentation_hot_reload() -> void:
	_clear_page("Hot Reload & Repair")
	_ensure_presentation_workspace()
	_add_body(
		"Validate and delta-stage changes before an atomic registry swap. The previous "
		+ "known-good generation stays available until verification and can be restored "
		+ "without deleting sources or active legacy fallbacks.")
	var generation := presentation_workspace.registry_publisher.current_generation()
	_add_body("Published generation: %s" % str(
		generation.get("generation_id", "none")))
	_add_action("Stage current sources", func() -> void:
		var result := presentation_workspace.stage_current_sources()
		_set_status("Staged generation %s" % str(result.get("generation_id", "")),
			not bool(result.get("ok", false))))
	_add_action("Publish validated generation", func() -> void:
		var result := presentation_workspace.publish_staged()
		_set_status("Published generation %s" % str(result.get("generation_id", "")),
			not bool(result.get("ok", false))))
	_add_action("Roll back to previous known-good generation", func() -> void:
		var result := presentation_workspace.rollback_generation()
		_set_status("Rollback generation %s" % str(result.get("generation_id", "")),
			not bool(result.get("ok", false))))
	_add_section("Repair policy")
	_add_body(
		"Repairs are proposed as explicit non-destructive actions. Missing dependencies, "
		+ "aliases or products are never silently removed or rewritten.")


func _show_presentation_catalogue(
		title: String, kind: String, description: String) -> void:
	_clear_page(title)
	_ensure_presentation_workspace()
	_add_body(description)
	_add_stat_card("Indexed records", presentation_workspace.filtered_list(kind).size())
	_add_presentation_records(kind, 20)


func _add_presentation_records(kind: String, limit: int) -> void:
	var records := presentation_workspace.filtered_list(kind)
	for record in records.slice(0, mini(records.size(), limit)):
		var source_id := ForgeRuntimeRegistryGeneration._record_id(record)
		_add_body("%s  |  %s  |  %s" % [source_id,
			str(record.get("display_name", kind)),
			str(record.get("source_status", "unknown"))])
	if records.size() > limit:
		_add_body("Showing %d of %d records." % [limit, records.size()])


func _ensure_presentation_workspace() -> void:
	if presentation_workspace.registry_publisher.current_generation().is_empty():
		presentation_workspace.load_and_validate()


func _load_presentation_scenarios() -> Array[ForgePresentationTestScenario]:
	var scenarios: Array[ForgePresentationTestScenario] = []
	for record in presentation_workspace.asset_index.filtered_list("test_scenario"):
		var path := presentation_workspace.asset_index.foundation_path_for(
			str(record.get("source_id", "")))
		var resource := ResourceLoader.load(
			path, "", ResourceLoader.CACHE_MODE_IGNORE)
		if resource is ForgePresentationTestScenario:
			scenarios.append(resource)
	scenarios.sort_custom(func(a: ForgePresentationTestScenario,
			b: ForgePresentationTestScenario) -> bool:
		return a.stable_id < b.stable_id)
	return scenarios


func _recover_autosave(path: String) -> void:
	current_asset = document_service.open_path(path)
	if current_asset == null:
		_set_status("Recovery source could not be read.", true)
		return
	current_record = registry_bridge.record_for(
		current_asset.gameplay_links[0]
		if not current_asset.gameplay_links.is_empty() else "")
	document_service.source_paths[current_asset.forge_asset_id] = (
		document_service.default_path(current_asset))
	document_service.mark_dirty(current_asset.forge_asset_id)
	_after_open_asset()
	_show_relevant_editor()
	_set_status("Recovered autosave; Save Draft to promote it.", false)


func _save_current() -> void:
	if not _require_asset():
		return
	var result := document_service.save_draft(current_asset)
	if bool(result.get("ok", false)):
		autosave_service.discard(
			ForgeAutosaveService.AUTOSAVE_ROOT.path_join(
				"%s.autosave.tres" % ForgeId.safe_filename(
					current_asset.forge_asset_id)))
		asset_index.rebuild()
		_set_status("Draft saved.", false)
	else:
		_set_status("Save failed: %s" % str(result.get("error", "")), true)


func _validate_current(show_page := true) -> void:
	if not _require_asset():
		return
	var contract := _load_contract(current_asset.presentation_contract_id)
	current_diagnostics = validation_service.validate_asset(
		current_asset, contract)
	var summary := validation_service.summarize(current_diagnostics)
	_set_status("Validation: %d warning(s), %d blocker(s)." % [
		summary["warning"], summary["error"] + summary["critical"],
	], summary["error"] + summary["critical"] > 0)
	if show_page:
		_show_validation()


func _bake_preview() -> void:
	_bake(false)


func _approve_and_bake() -> void:
	_bake(true)


func _bake(approve: bool) -> void:
	if not _require_asset():
		return
	var result := bake_service.bake(
		current_asset,
		_load_contract(current_asset.presentation_contract_id),
		approve)
	if not bool(result.get("ok", false)):
		current_diagnostics.assign(result.get("diagnostics", []))
		_set_status("Bake failed: %s" % str(result.get("error", "")), true)
		_show_validation()
		return
	if approve:
		document_service.mark_dirty(current_asset.forge_asset_id)
		_save_current()
	if has_node("/root/ForgeRuntime"):
		ForgeRuntime.reload_packages()
	asset_baked.emit(current_asset.presentation_id)
	_set_status(
		"%s bake ready." % ("Approved" if approve else "Preview"), false)


func _load_contract(contract_id: String) -> ForgePresentationContract:
	if contract_id.is_empty():
		return null
	var path := "res://content/forge/contracts/%s.tres" % (
		ForgeId.safe_filename(contract_id))
	if not ResourceLoader.exists(path):
		return null
	var resource := ResourceLoader.load(
		path, "", ResourceLoader.CACHE_MODE_IGNORE)
	return resource if resource is ForgePresentationContract else null


func _after_open_asset() -> void:
	command_service.clear()
	current_diagnostics.clear()
	_asset_heading.text = "%s\n%s\n%s" % [
		current_asset.display_name,
		current_asset.presentation_id,
		current_asset.source_status,
	]
	_preview.show_asset(current_asset)
	_save_button.disabled = false
	_validate_button.disabled = false
	_bake_preview_button.disabled = false
	_approve_button.disabled = false
	_rebuild_navigation()
	_refresh_context_ribbon()
	_set_status("Opened %s." % current_asset.display_name, false)
	asset_opened.emit(current_asset.forge_asset_id)


func _after_edit() -> void:
	if current_asset == null:
		return
	if current_asset.source_status == "approved":
		current_asset.source_status = "draft"
	document_service.mark_dirty(current_asset.forge_asset_id)
	_preview.show_asset(current_asset)
	_refresh_context_ribbon()
	_set_status("Unsaved changes.", false)
	if is_instance_valid(_surface_canvas):
		_surface_canvas.queue_redraw()
	if is_instance_valid(_voxel_canvas):
		_voxel_canvas.queue_redraw()
	if not _pending_autosave:
		_pending_autosave = true
		get_tree().create_timer(0.35).timeout.connect(_autosave_current)


func _autosave_current() -> void:
	_pending_autosave = false
	if current_asset != null \
			and document_service.is_dirty(current_asset.forge_asset_id):
		autosave_service.autosave(current_asset)


func _primary_palette() -> ForgePaletteDefinition:
	if current_asset != null:
		for resource in current_asset.palettes:
			if resource is ForgePaletteDefinition:
				return resource
	var palette := ForgePaletteDefinition.new()
	palette.ensure_default_entries()
	return palette


func _editable_volume() -> ForgeVoxelVolume:
	if current_asset == null:
		return null
	if current_asset.voxel_volume is ForgeVoxelVolume:
		return current_asset.voxel_volume
	for part_resource in current_asset.parts:
		if part_resource is ForgePartDefinition \
				and part_resource.source_volume is ForgeVoxelVolume:
			return part_resource.source_volume
	return null


func _palette_selector(
		palette: ForgePaletteDefinition, action: Callable) -> Control:
	var option := OptionButton.new()
	palette.ensure_default_entries()
	for index in palette.entries.size():
		var entry: Dictionary = palette.entries[index]
		option.add_icon_item(
			_color_swatch(entry.get("albedo", Color.MAGENTA)),
			str(entry.get("entry_key", "role_%d" % index)))
		option.set_item_metadata(option.item_count - 1, index)
	option.select(clampi(_selected_palette_index, 0, option.item_count - 1))
	option.item_selected.connect(func(index: int) -> void:
		action.call(int(option.get_item_metadata(index))))
	return _labeled("Palette role", option)


func _randomizer_controls(
		palette: ForgePaletteDefinition, voxel_mode: bool) -> Control:
	var panel := PanelContainer.new()
	var stack := VBoxContainer.new()
	stack.add_theme_constant_override("separation", 6)
	panel.add_child(stack)
	var title := Label.new()
	title.text = "Colour randomizer"
	title.add_theme_font_size_override("font_size", 18)
	title.add_theme_color_override("font_color", Color("#e8d6a4"))
	stack.add_child(title)
	var enabled := CheckButton.new()
	enabled.text = "Randomize left-click painting between selected roles"
	stack.add_child(enabled)
	var toggles: Array[CheckButton] = []
	var roles := HFlowContainer.new()
	palette.ensure_default_entries()
	for index in palette.entries.size():
		var entry: Dictionary = palette.entries[index]
		var role := CheckButton.new()
		role.text = str(entry.get("entry_key", "role_%d" % index))
		role.icon = _color_swatch(entry.get("albedo", Color.MAGENTA))
		role.set_meta("palette_index", index)
		role.button_pressed = true
		toggles.append(role)
		roles.add_child(role)
	stack.add_child(roles)
	var update := func(_pressed: bool) -> void:
		_configure_randomizer(enabled.button_pressed, toggles, voxel_mode)
	enabled.toggled.connect(update)
	for role in toggles:
		role.toggled.connect(update)
	var hint := Label.new()
	hint.text = (
		"Select two or more colours for natural grain, stone speckle, wear, "
		+ "foliage or other detailed textures. Right-click still removes or "
		+ "restores normally.")
	hint.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	hint.add_theme_color_override("font_color", Color("#94aab3"))
	stack.add_child(hint)
	_configure_randomizer(false, toggles, voxel_mode)
	return panel


func _configure_randomizer(
		enabled: bool, toggles: Array[CheckButton], voxel_mode: bool) -> void:
	var indices := PackedInt32Array()
	for toggle in toggles:
		if toggle.button_pressed:
			indices.append(int(toggle.get_meta("palette_index", 0)))
	if voxel_mode and is_instance_valid(_voxel_canvas):
		_voxel_canvas.randomizer_enabled = enabled
		_voxel_canvas.random_palette_indices = indices
	elif not voxel_mode and is_instance_valid(_surface_canvas):
		_surface_canvas.randomizer_enabled = enabled
		_surface_canvas.random_palette_indices = indices


func _require_asset() -> bool:
	if current_asset != null:
		return true
	if is_instance_valid(_page):
		_add_body("Open or create an asset from the Asset Browser first.")
	if is_instance_valid(_status_label):
		_set_status("No asset is open.", true)
	return false


func _show_access_denied() -> void:
	var label := Label.new()
	label.text = (
		"Leyforge Forge is unavailable in this build.\n"
		+ "It is restricted to editor/development configurations.")
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	add_child(label)


func _offer_recovery() -> void:
	if not autosave_service.recovery_candidates().is_empty():
		_set_status("Recoverable autosaves are available.", false)


func _on_history_changed(can_undo: bool, can_redo: bool) -> void:
	if is_instance_valid(_undo_button):
		_undo_button.disabled = not can_undo
	if is_instance_valid(_redo_button):
		_redo_button.disabled = not can_redo


func _on_document_saved(_asset_id: String, _path: String) -> void:
	pass


func _on_bake_completed(_result: Dictionary) -> void:
	pass


func _set_status(message: String, is_error: bool) -> void:
	if not is_instance_valid(_status_label):
		return
	_status_label.text = message
	_status_label.add_theme_color_override(
		"font_color", ForgeVisualTheme.ERROR if is_error else ForgeVisualTheme.MUTED)
	_refresh_context_ribbon()


func _add_section(text: String) -> void:
	var label := Label.new()
	label.text = text
	label.add_theme_font_size_override("font_size", 20)
	label.add_theme_color_override("font_color", _active_accent.lightened(0.2))
	_page.add_child(label)


func _add_body(text: String) -> void:
	var label := Label.new()
	label.text = text
	label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	label.add_theme_color_override("font_color", ForgeVisualTheme.PARCHMENT.darkened(0.08))
	_page.add_child(label)


func _add_stat_card(label_text: String, value: int) -> void:
	var panel := PanelContainer.new()
	panel.add_theme_stylebox_override(
		"panel", ForgeVisualTheme.panel_style(
			ForgeVisualTheme.RAISED, _active_accent.darkened(0.42), 1))
	var row := HBoxContainer.new()
	row.add_theme_constant_override("separation", 12)
	var label := Label.new()
	label.text = label_text
	label.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	var value_label := Label.new()
	value_label.text = str(value)
	value_label.add_theme_font_size_override("font_size", 21)
	value_label.add_theme_color_override("font_color", _active_accent.lightened(0.2))
	row.add_child(label)
	row.add_child(value_label)
	panel.add_child(row)
	_page.add_child(panel)


func _add_action(label: String, action: Callable) -> void:
	var button := Button.new()
	button.text = label
	button.custom_minimum_size = Vector2(0, 42)
	button.pressed.connect(action)
	ForgeVisualTheme.apply_button(button, _active_accent)
	_page.add_child(button)


func _add_child_note(parent: Node, text: String) -> void:
	var label := Label.new()
	label.text = text
	label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	label.add_theme_color_override("font_color", ForgeVisualTheme.MUTED)
	parent.add_child(label)


func _resource_paths_in(root_path: String) -> PackedStringArray:
	var result := PackedStringArray()
	var directory := DirAccess.open(root_path)
	if directory == null:
		return result
	directory.list_dir_begin()
	var entry := directory.get_next()
	while not entry.is_empty():
		if not directory.current_is_dir() \
				and (entry.ends_with(".tres") or entry.ends_with(".res")) \
				and not entry.ends_with(".previous.tres"):
			result.append(root_path.path_join(entry))
		entry = directory.get_next()
	directory.list_dir_end()
	result.sort()
	return result


func _material_library() -> Array[ForgeMaterialDefinition]:
	var materials: Array[ForgeMaterialDefinition] = []
	for path in _resource_paths_in(MATERIAL_ROOT):
		var resource := ResourceLoader.load(
			path, "", ResourceLoader.CACHE_MODE_IGNORE)
		if resource is ForgeMaterialDefinition:
			materials.append(resource)
	materials.sort_custom(func(a: ForgeMaterialDefinition,
			b: ForgeMaterialDefinition) -> bool:
		return a.material_id < b.material_id)
	return materials


func _pattern_library() -> Array[ForgePaintPatternDefinition]:
	var patterns: Array[ForgePaintPatternDefinition] = []
	for path in _resource_paths_in(PATTERN_ROOT):
		var resource := ResourceLoader.load(
			path, "", ResourceLoader.CACHE_MODE_IGNORE)
		if resource is ForgePaintPatternDefinition \
				and resource.is_valid_pattern():
			patterns.append(resource)
	patterns.sort_custom(func(a: ForgePaintPatternDefinition,
			b: ForgePaintPatternDefinition) -> bool:
		return a.display_name.naturalnocasecmp_to(b.display_name) < 0)
	return patterns


func _create_material_dna(
		material_id_value: String, display_name_value: String,
		family_value: String, rendering_class: String,
		roughness: float, metallic: float, emission: float) -> void:
	var material_id := material_id_value.strip_edges().to_lower()
	if not ForgeId.is_valid(material_id, "material."):
		_set_status(
			"Material ID must be lowercase and begin with material.", true)
		return
	var path := MATERIAL_ROOT.path_join(
		"%s.tres" % ForgeId.safe_filename(material_id))
	if ResourceLoader.exists(path) or FileAccess.file_exists(path):
		_set_status("That Material DNA ID already exists.", true)
		return
	var make_error := DirAccess.make_dir_recursive_absolute(
		ProjectSettings.globalize_path(MATERIAL_ROOT))
	if make_error not in [OK, ERR_ALREADY_EXISTS]:
		_set_status("Could not create the material library folder.", true)
		return
	var material := ForgeMaterialDefinition.new()
	material.material_id = material_id
	material.display_name = display_name_value.strip_edges()
	if material.display_name.is_empty():
		material.display_name = material_id.trim_prefix(
			"material.").replace(".", " ").capitalize()
	material.family = family_value.strip_edges().to_snake_case()
	material.rendering_class = rendering_class
	material.roughness_default = clampf(roughness, 0.0, 1.0)
	material.metallic_default = clampf(metallic, 0.0, 1.0)
	material.emission_default = maxf(0.0, emission)
	material.opacity_mode = (
		"alpha" if rendering_class == "transparent" else "opaque")
	var save_error := ResourceSaver.save(material, path)
	if save_error != OK:
		_set_status(
			"Material DNA could not be saved: %s" % error_string(save_error),
			true)
		return
	_set_status("Created %s." % material_id, false)
	_show_palette_material_editor()


func _color_swatch(color: Color, swatch_size := 18) -> Texture2D:
	var image := Image.create(
		maxi(2, swatch_size), maxi(2, swatch_size), false,
		Image.FORMAT_RGBA8)
	image.fill(color)
	return ImageTexture.create_from_image(image)


func _labeled(label_text: String, control: Control) -> Control:
	var stack := VBoxContainer.new()
	var label := Label.new()
	label.text = label_text
	label.add_theme_color_override("font_color", Color("#9db1ba"))
	stack.add_child(label)
	stack.add_child(control)
	return stack


func _return_to_main_menu() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _unhandled_key_input(event: InputEvent) -> void:
	if not event.pressed or event.echo:
		return
	if event.ctrl_pressed and event.keycode == KEY_S:
		_save_current()
		get_viewport().set_input_as_handled()
	elif event.ctrl_pressed and event.keycode == KEY_Z:
		command_service.undo()
		get_viewport().set_input_as_handled()
	elif event.ctrl_pressed and event.keycode == KEY_Y:
		command_service.redo()
		get_viewport().set_input_as_handled()
	elif event.ctrl_pressed and event.keycode == KEY_ENTER:
		_validate_current()
		get_viewport().set_input_as_handled()
