class_name StackIconRenderer
extends RefCounted
## Cached, static isometric inventory thumbnails generated from registry colour
## and shape data. This avoids one live SubViewport per slot while still
## presenting blocks/items as dimensional objects instead of flat colour tiles.

const ICON_SIZE := 56

var _cache: Dictionary = {}


func get_icon(stack: Dictionary) -> Texture2D:
	if stack.is_empty():
		return null
	var key := "%s:%d" % [Inventory.stack_kind(stack), int(stack.get("id", -1))]
	if _cache.has(key):
		return _cache[key]
	var image := Image.create(ICON_SIZE, ICON_SIZE, false, Image.FORMAT_RGBA8)
	image.fill(Color(0, 0, 0, 0))
	var color := Inventory.stack_color(stack)
	# Registry colours are material-oriented. A small lift keeps inventory
	# thumbnails readable without changing their world appearance.
	color = color.lightened(0.12)
	if Inventory.stack_kind(stack) == "block":
		var block_id := int(stack.get("id", -1))
		_draw_block(
			image, color, BlockRegistry.get_shape(block_id),
			BlockRegistry.get_stable_id(block_id))
	else:
		_draw_item(
			image, color, ItemRegistry.is_tool(int(stack.get("id", -1))))
	var texture := ImageTexture.create_from_image(image)
	_cache[key] = texture
	return texture


func _draw_block(
		image: Image, color: Color, shape: String,
		stable_id: String = "") -> void:
	var top_offset := 0
	var depth := 20
	if shape == "slab":
		top_offset = 10
		depth = 11
	elif shape in ["chest", "chute"]:
		top_offset = 7
		depth = 15
	elif shape == "door":
		top_offset = 2
		depth = 25
	if "glass" in stable_id:
		color.a = 0.42
	_draw_iso_prism(image, color, top_offset, depth)
	if shape == "stair":
		# A lighter raised rear step distinguishes stairs from full cubes.
		var rear := color.lightened(0.10)
		var top := [
			Vector2(28, 7), Vector2(47, 16),
			Vector2(35, 22), Vector2(16, 13),
		]
		_fill_quad(image, top[0], top[1], top[2], top[3], rear.lightened(0.12))
		_draw_line(image, top[0], top[1], Color(0, 0, 0, 0.65))
		_draw_line(image, top[1], top[2], Color(0, 0, 0, 0.65))
	elif shape == "furnace":
		_fill_quad(
			image, Vector2(21, 29), Vector2(34, 35),
			Vector2(34, 45), Vector2(21, 39), Color(0.03, 0.02, 0.015))
	elif shape == "chest":
		_draw_line(image, Vector2(7, 28), Vector2(28, 39), Color(0, 0, 0, 0.72))
		_draw_line(image, Vector2(28, 39), Vector2(49, 28), Color(0, 0, 0, 0.72))
		_fill_quad(
			image, Vector2(26, 32), Vector2(31, 35),
			Vector2(31, 41), Vector2(26, 38), Color(0.75, 0.53, 0.14))
	elif shape == "chute":
		_fill_quad(
			image, Vector2(17, 16), Vector2(39, 16),
			Vector2(29, 22), Vector2(25, 22), Color(0.04, 0.05, 0.04, 0.9))
	elif shape == "door":
		_draw_line(image, Vector2(18, 18), Vector2(38, 28), Color(0, 0, 0, 0.45))
		_draw_line(image, Vector2(18, 27), Vector2(38, 37), Color(0, 0, 0, 0.45))


func _draw_iso_prism(image: Image, color: Color, top_offset: int, depth: int) -> void:
	var top := Vector2(28, 5 + top_offset)
	var right := Vector2(50, 16 + top_offset)
	var front := Vector2(28, 28 + top_offset)
	var left := Vector2(6, 16 + top_offset)
	var bottom := Vector2(28, 28 + top_offset + depth)
	var left_bottom := Vector2(6, 16 + top_offset + depth)
	var right_bottom := Vector2(50, 16 + top_offset + depth)
	var outline := Color(0, 0, 0, 0.68)
	_fill_quad(image, top, right, front, left, color.lightened(0.18))
	_fill_quad(image, left, front, bottom, left_bottom, color.darkened(0.16))
	_fill_quad(image, front, right, right_bottom, bottom, color.darkened(0.30))
	for edge in [
		[top, right], [right, front], [front, left], [left, top],
		[left, left_bottom], [left_bottom, bottom],
		[bottom, right_bottom], [right_bottom, right],
	]:
		_draw_line(image, edge[0], edge[1], outline)


func _draw_item(image: Image, color: Color, is_tool: bool) -> void:
	if is_tool:
		var outline := Color(0, 0, 0, 0.72)
		for offset in range(-2, 3):
			_draw_line(
				image, Vector2(20 + offset, 44), Vector2(36 + offset, 16),
				color.darkened(0.30) if absi(offset) == 2 else color)
		_fill_quad(
			image, Vector2(17, 13), Vector2(43, 9),
			Vector2(46, 17), Vector2(22, 22), color.lightened(0.18))
		_draw_line(image, Vector2(17, 13), Vector2(43, 9), outline)
		_draw_line(image, Vector2(43, 9), Vector2(46, 17), outline)
		_draw_line(image, Vector2(46, 17), Vector2(22, 22), outline)
		return
	var top := Vector2(27, 6)
	var right := Vector2(45, 22)
	var bottom := Vector2(29, 48)
	var left := Vector2(11, 28)
	var center := Vector2(28, 27)
	_fill_triangle(image, top, right, center, color.lightened(0.24))
	_fill_triangle(image, right, bottom, center, color.darkened(0.22))
	_fill_triangle(image, bottom, left, center, color.darkened(0.12))
	_fill_triangle(image, left, top, center, color.lightened(0.08))
	for edge in [[top, right], [right, bottom], [bottom, left], [left, top]]:
		_draw_line(image, edge[0], edge[1], Color(0, 0, 0, 0.70))


func _fill_quad(image: Image, a: Vector2, b: Vector2, c: Vector2, d: Vector2,
		color: Color) -> void:
	_fill_triangle(image, a, b, c, color)
	_fill_triangle(image, a, c, d, color)


func _fill_triangle(image: Image, a: Vector2, b: Vector2, c: Vector2,
		color: Color) -> void:
	var minimum_x := clampi(floori(minf(a.x, minf(b.x, c.x))), 0, ICON_SIZE - 1)
	var maximum_x := clampi(ceili(maxf(a.x, maxf(b.x, c.x))), 0, ICON_SIZE - 1)
	var minimum_y := clampi(floori(minf(a.y, minf(b.y, c.y))), 0, ICON_SIZE - 1)
	var maximum_y := clampi(ceili(maxf(a.y, maxf(b.y, c.y))), 0, ICON_SIZE - 1)
	for y in range(minimum_y, maximum_y + 1):
		for x in range(minimum_x, maximum_x + 1):
			var point := Vector2(float(x) + 0.5, float(y) + 0.5)
			var e0 := _edge(a, b, point)
			var e1 := _edge(b, c, point)
			var e2 := _edge(c, a, point)
			if (e0 >= 0.0 and e1 >= 0.0 and e2 >= 0.0) \
					or (e0 <= 0.0 and e1 <= 0.0 and e2 <= 0.0):
				image.set_pixel(x, y, color)


func _edge(a: Vector2, b: Vector2, point: Vector2) -> float:
	return (point.x - a.x) * (b.y - a.y) - (point.y - a.y) * (b.x - a.x)


func _draw_line(image: Image, from: Vector2, to: Vector2, color: Color) -> void:
	var x0 := roundi(from.x)
	var y0 := roundi(from.y)
	var x1 := roundi(to.x)
	var y1 := roundi(to.y)
	var dx := absi(x1 - x0)
	var sx := 1 if x0 < x1 else -1
	var dy := -absi(y1 - y0)
	var sy := 1 if y0 < y1 else -1
	var error := dx + dy
	while true:
		if x0 >= 0 and x0 < ICON_SIZE and y0 >= 0 and y0 < ICON_SIZE:
			image.set_pixel(x0, y0, color)
		if x0 == x1 and y0 == y1:
			break
		var doubled := 2 * error
		if doubled >= dy:
			error += dy
			x0 += sx
		if doubled <= dx:
			error += dx
			y0 += sy
