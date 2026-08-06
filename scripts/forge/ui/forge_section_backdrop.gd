class_name ForgeSectionBackdrop
extends PanelContainer
## Static decorative motifs for studio landing pages. The component never
## captures input and deliberately has no animation, so reduced-motion users
## receive the same readable layout without a separate code path.

var motif_id := "forge_hall"
var accent := Color("#D9A441")


func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	resized.connect(queue_redraw)
	queue_redraw()


func configure(new_motif_id: String, new_accent: Color) -> void:
	motif_id = new_motif_id
	accent = new_accent
	add_theme_stylebox_override(
		"panel", ForgeVisualTheme.panel_style(
			ForgeVisualTheme.RAISED, accent.darkened(0.42), 2))
	queue_redraw()


func _draw() -> void:
	var faint := Color(accent, 0.10)
	var line := Color(accent, 0.26)
	for x in range(0, int(size.x), 32):
		draw_line(Vector2(x, 0), Vector2(x, size.y), faint, 1.0)
	for y in range(0, int(size.y), 32):
		draw_line(Vector2(0, y), Vector2(size.x, y), faint, 1.0)
	var origin := Vector2(maxf(0.0, size.x - 190.0), 18.0)
	match motif_id:
		"archive":
			_draw_archive(origin, line)
		"workbench":
			_draw_cubes(origin, line)
		"drafting_table":
			_draw_structure(origin, line)
		"bestiary":
			_draw_bestiary(origin, line)
		"arcane_lab":
			_draw_arcane(origin, line)
		"resonance":
			_draw_waveform(origin, line)
		"proving_ground":
			_draw_checklist(origin, line)
		_:
			_draw_hearth(origin, line)


func _draw_archive(origin: Vector2, colour: Color) -> void:
	for row in 3:
		draw_line(origin + Vector2(10, 24 + row * 34),
			origin + Vector2(158, 24 + row * 34), colour, 3.0)
		for column in 5:
			draw_rect(Rect2(origin + Vector2(16 + column * 28, 4 + row * 34),
				Vector2(17, 20)), colour, false, 2.0)


func _draw_cubes(origin: Vector2, colour: Color) -> void:
	for offset in [Vector2(20, 44), Vector2(66, 22), Vector2(112, 50)]:
		_draw_isometric_cube(origin + offset, 24.0, colour)


func _draw_structure(origin: Vector2, colour: Color) -> void:
	draw_rect(Rect2(origin + Vector2(18, 28), Vector2(132, 82)), colour, false, 3.0)
	draw_line(origin + Vector2(18, 28), origin + Vector2(84, 2), colour, 3.0)
	draw_line(origin + Vector2(84, 2), origin + Vector2(150, 28), colour, 3.0)
	draw_rect(Rect2(origin + Vector2(68, 68), Vector2(34, 42)), colour, false, 3.0)
	for x in [42, 116]:
		draw_rect(Rect2(origin + Vector2(x, 48), Vector2(18, 18)), colour, false, 2.0)


func _draw_bestiary(origin: Vector2, colour: Color) -> void:
	draw_circle(origin + Vector2(84, 30), 20.0, Color(colour, 0.35), false, 3.0)
	draw_rect(Rect2(origin + Vector2(56, 54), Vector2(56, 48)), colour, false, 3.0)
	draw_line(origin + Vector2(56, 64), origin + Vector2(30, 92), colour, 3.0)
	draw_line(origin + Vector2(112, 64), origin + Vector2(138, 92), colour, 3.0)
	draw_line(origin + Vector2(70, 102), origin + Vector2(58, 126), colour, 3.0)
	draw_line(origin + Vector2(98, 102), origin + Vector2(110, 126), colour, 3.0)


func _draw_arcane(origin: Vector2, colour: Color) -> void:
	draw_circle(origin + Vector2(84, 65), 50.0, Color(colour, 0.28), false, 3.0)
	draw_circle(origin + Vector2(84, 65), 28.0, Color(colour, 0.40), false, 2.0)
	for point in [Vector2(84, 8), Vector2(142, 65), Vector2(84, 122), Vector2(26, 65)]:
		draw_rect(Rect2(origin + point - Vector2(5, 5), Vector2(10, 10)), colour, false, 2.0)
		draw_line(origin + Vector2(84, 65), origin + point, colour, 2.0)


func _draw_waveform(origin: Vector2, colour: Color) -> void:
	var heights := [18, 34, 62, 42, 78, 52, 28, 68, 38, 20]
	for index in heights.size():
		var height := float(heights[index])
		draw_rect(Rect2(origin + Vector2(12 + index * 14, 68 - height * 0.5),
			Vector2(8, height)), Color(colour, 0.42), true)


func _draw_checklist(origin: Vector2, colour: Color) -> void:
	draw_rect(Rect2(origin + Vector2(24, 10), Vector2(126, 112)), colour, false, 3.0)
	for row in 3:
		var y := 34.0 + row * 28.0
		draw_rect(Rect2(origin + Vector2(40, y - 9), Vector2(17, 17)), colour, false, 2.0)
		draw_line(origin + Vector2(67, y), origin + Vector2(132, y), colour, 3.0)
	draw_line(origin + Vector2(42, 62), origin + Vector2(48, 68), colour, 2.0)
	draw_line(origin + Vector2(48, 68), origin + Vector2(58, 54), colour, 2.0)


func _draw_hearth(origin: Vector2, colour: Color) -> void:
	draw_rect(Rect2(origin + Vector2(30, 68), Vector2(108, 54)), colour, false, 3.0)
	draw_line(origin + Vector2(30, 68), origin + Vector2(52, 30), colour, 3.0)
	draw_line(origin + Vector2(138, 68), origin + Vector2(116, 30), colour, 3.0)
	draw_line(origin + Vector2(52, 30), origin + Vector2(116, 30), colour, 3.0)
	draw_rect(Rect2(origin + Vector2(66, 76), Vector2(36, 46)), colour, false, 3.0)


func _draw_isometric_cube(origin: Vector2, radius: float, colour: Color) -> void:
	var top := origin + Vector2(0, -radius)
	var right := origin + Vector2(radius, -radius * 0.5)
	var bottom_right := origin + Vector2(radius, radius * 0.5)
	var bottom := origin + Vector2(0, radius)
	var bottom_left := origin + Vector2(-radius, radius * 0.5)
	var left := origin + Vector2(-radius, -radius * 0.5)
	for pair in [[top, right], [right, bottom_right], [bottom_right, bottom],
			[bottom, bottom_left], [bottom_left, left], [left, top],
			[left, origin], [right, origin], [origin, bottom]]:
		draw_line(pair[0], pair[1], colour, 2.0)
