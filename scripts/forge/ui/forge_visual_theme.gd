class_name ForgeVisualTheme
extends RefCounted
## Shared fantasy-voxel visual tokens for both Forge hosts.

const INK := Color("#0B1116")
const PANEL := Color("#121C22")
const RAISED := Color("#17242B")
const PARCHMENT := Color("#E8DEC7")
const MUTED := Color("#9EB0B8")
const FOCUS_GOLD := Color("#F2D17B")
const ERROR := Color("#F0A3A3")


static func panel_style(
		background := PANEL, border := Color("#263840"), width := 1) -> StyleBoxFlat:
	var style := StyleBoxFlat.new()
	style.bg_color = background
	style.border_color = border
	style.border_width_left = width
	style.border_width_top = width
	style.border_width_right = width
	style.border_width_bottom = width
	style.corner_radius_top_left = 2
	style.corner_radius_top_right = 2
	style.corner_radius_bottom_left = 2
	style.corner_radius_bottom_right = 2
	style.content_margin_left = 10.0
	style.content_margin_top = 8.0
	style.content_margin_right = 10.0
	style.content_margin_bottom = 8.0
	return style


static func apply_button(button: Button, accent: Color, active := false) -> void:
	button.focus_mode = Control.FOCUS_ALL
	button.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	var base := RAISED.lightened(0.025) if not active else accent.darkened(0.58)
	var border := accent.darkened(0.22) if active else Color("#2B3A41")
	button.add_theme_stylebox_override("normal", panel_style(base, border, 1))
	button.add_theme_stylebox_override(
		"hover", panel_style(base.lightened(0.08), accent.darkened(0.05), 1))
	button.add_theme_stylebox_override(
		"pressed", panel_style(accent.darkened(0.52), accent, 2))
	button.add_theme_stylebox_override(
		"focus", panel_style(base, FOCUS_GOLD, 2))
	button.add_theme_stylebox_override(
		"disabled", panel_style(PANEL.darkened(0.08), Color("#273139"), 1))
	button.add_theme_color_override("font_color", PARCHMENT)
	button.add_theme_color_override("font_hover_color", Color.WHITE)
	button.add_theme_color_override("font_pressed_color", Color.WHITE)
	button.add_theme_color_override("font_focus_color", Color.WHITE)
	button.add_theme_color_override("font_disabled_color", Color("#78868C"))
	button.add_theme_color_override("icon_normal_color", PARCHMENT)
	button.add_theme_color_override("icon_hover_color", Color.WHITE)
	button.add_theme_color_override("icon_pressed_color", Color.WHITE)
	button.add_theme_color_override("icon_disabled_color", Color("#66747A"))


static func apply_input(control: Control, accent: Color) -> void:
	control.add_theme_stylebox_override("normal", panel_style(RAISED, Color("#31434B"), 1))
	control.add_theme_stylebox_override("focus", panel_style(RAISED, accent, 2))
	control.add_theme_color_override("font_color", PARCHMENT)
	control.add_theme_color_override("font_placeholder_color", MUTED.darkened(0.15))


static func availability_prefix(availability: String) -> String:
	match availability:
		ForgeNavigationCatalog.AUTHOR:
			return "[AUTHOR]"
		ForgeNavigationCatalog.INSPECT:
			return "[INSPECT]"
		ForgeNavigationCatalog.PLANNED:
			return "[PLANNED]"
	return "[INFO]"
