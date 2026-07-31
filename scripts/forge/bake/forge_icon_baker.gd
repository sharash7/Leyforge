class_name ForgeIconBaker
extends RefCounted
## Software-rendered icon output keeps headless and editor bakes identical.

const BAKER_VERSION := "forge-icon-v1"


static func bake(
		asset: ForgeAssetDefinition,
		palette: ForgePaletteDefinition,
		size := 64) -> Image:
	var image := Image.create(size, size, false, Image.FORMAT_RGBA8)
	image.fill(Color(0, 0, 0, 0))
	var base := _base_color(asset, palette)
	var top := base.lightened(0.16)
	var side := base.darkened(0.17)
	var outline := base.darkened(0.42)
	var center := Vector2i(size / 2, size / 2 + size / 10)
	var radius := maxi(8, size / 3)
	var top_points := PackedVector2Array([
		Vector2(center.x, center.y - radius),
		Vector2(center.x + radius, center.y - radius / 2),
		Vector2(center.x, center.y),
		Vector2(center.x - radius, center.y - radius / 2),
	])
	var left_points := PackedVector2Array([
		Vector2(center.x - radius, center.y - radius / 2),
		Vector2(center.x, center.y),
		Vector2(center.x, center.y + radius),
		Vector2(center.x - radius, center.y + radius / 2),
	])
	var right_points := PackedVector2Array([
		Vector2(center.x, center.y),
		Vector2(center.x + radius, center.y - radius / 2),
		Vector2(center.x + radius, center.y + radius / 2),
		Vector2(center.x, center.y + radius),
	])
	_fill_polygon(image, top_points, top)
	_fill_polygon(image, left_points, base)
	_fill_polygon(image, right_points, side)
	_draw_polygon_outline(image, top_points, outline)
	_draw_polygon_outline(image, left_points, outline)
	_draw_polygon_outline(image, right_points, outline)
	return image


static func _base_color(
		asset: ForgeAssetDefinition,
		palette: ForgePaletteDefinition) -> Color:
	if asset.surface_set is ForgeSurfaceSet:
		return ForgeSurfaceBaker.average_face_color(
			asset.surface_set, "north", palette)
	if palette != null:
		return palette.color_for(0)
	return Color("#8a8a8a")


static func _fill_polygon(
		image: Image, points: PackedVector2Array, color: Color) -> void:
	var minimum := Vector2i(image.get_width(), image.get_height())
	var maximum := Vector2i.ZERO
	for point in points:
		minimum.x = mini(minimum.x, floori(point.x))
		minimum.y = mini(minimum.y, floori(point.y))
		maximum.x = maxi(maximum.x, ceili(point.x))
		maximum.y = maxi(maximum.y, ceili(point.y))
	for y in range(maxi(0, minimum.y), mini(image.get_height(), maximum.y + 1)):
		for x in range(maxi(0, minimum.x), mini(image.get_width(), maximum.x + 1)):
			if Geometry2D.is_point_in_polygon(Vector2(x + 0.5, y + 0.5), points):
				image.set_pixel(x, y, color)


static func _draw_polygon_outline(
		image: Image, points: PackedVector2Array, color: Color) -> void:
	for index in points.size():
		var start := Vector2i(points[index])
		var finish := Vector2i(points[(index + 1) % points.size()])
		_draw_line(image, start, finish, color)


static func _draw_line(
		image: Image, start: Vector2i, finish: Vector2i, color: Color) -> void:
	var x0 := start.x
	var y0 := start.y
	var x1 := finish.x
	var y1 := finish.y
	var dx := absi(x1 - x0)
	var sx := 1 if x0 < x1 else -1
	var dy := -absi(y1 - y0)
	var sy := 1 if y0 < y1 else -1
	var error := dx + dy
	while true:
		if x0 >= 0 and y0 >= 0 and x0 < image.get_width() \
				and y0 < image.get_height():
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
