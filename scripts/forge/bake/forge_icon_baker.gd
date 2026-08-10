class_name ForgeIconBaker
extends RefCounted
## Software-rendered orthographic icons keep headless and editor bakes identical
## while depicting the same authored geometry as the live Forge preview.

const BAKER_VERSION := "forge-icon-v2"
const CAMERA_DIRECTION := Vector3(1.8, 2.2, -5.0)
const FACE_KEYS := ["east", "west", "top", "bottom", "south", "north"]


static func bake(
		asset: ForgeAssetDefinition,
		palette: ForgePaletteDefinition,
		size := 64) -> Image:
	var image := Image.create(size, size, false, Image.FORMAT_RGBA8)
	image.fill(Color(0, 0, 0, 0))
	var faces: Array[Dictionary] = []
	if asset != null and asset.uses_surface_authoring():
		_append_surface_faces(faces, asset.surface_set, palette)
	elif asset != null and asset.uses_voxel_authoring():
		_append_volume_faces(
			faces, asset.voxel_volume, palette, Transform3D.IDENTITY)
	elif asset != null:
		for resource in asset.parts:
			if resource is ForgePartDefinition \
					and resource.source_volume is ForgeVoxelVolume:
				var part: ForgePartDefinition = resource
				_append_volume_faces(
					faces, part.source_volume, palette, part.local_transform)
	if faces.is_empty():
		return image
	_rasterize_faces(image, faces)
	return image


static func _append_volume_faces(
		faces: Array[Dictionary], volume: ForgeVoxelVolume,
		palette: ForgePaletteDefinition, transform: Transform3D) -> void:
	if volume == null:
		return
	volume.ensure_storage()
	var cell_size := maxf(volume.voxel_size_meters, 0.0001)
	for z in volume.dimensions.z:
		for y in volume.dimensions.y:
			for x in volume.dimensions.x:
				var cell := Vector3i(x, y, z)
				var palette_index := volume.get_cell(cell)
				if palette_index < 0:
					continue
				var color := palette.color_for(palette_index) \
					if palette != null else Color("#8a8a8a")
				for face in ForgeMeshBaker.FACE_DEFINITIONS:
					var neighbor := cell + Vector3i(face["normal"])
					if volume.contains(neighbor) \
							and volume.get_cell(neighbor) >= 0:
						continue
					var points := PackedVector3Array()
					for corner in face["corners"]:
						points.append(transform * (
							(Vector3(cell) + Vector3(corner)) * cell_size))
					var normal := (transform.basis \
						* Vector3(face["normal"])).normalized()
					_append_face(faces, points, normal, color)


static func _append_surface_faces(
		faces: Array[Dictionary], surface: ForgeSurfaceSet,
		palette: ForgePaletteDefinition) -> void:
	if surface == null:
		return
	surface.ensure_faces()
	for face_index in ForgeMeshBaker.FACE_DEFINITIONS.size():
		var definition: Dictionary = ForgeMeshBaker.FACE_DEFINITIONS[face_index]
		var corners := PackedVector3Array()
		for corner in definition["corners"]:
			corners.append(Vector3(corner))
		var face_key: String = FACE_KEYS[face_index]
		for y in surface.height:
			for x in surface.width:
				var u0 := float(x) / float(surface.width)
				var u1 := float(x + 1) / float(surface.width)
				var v0 := float(y) / float(surface.height)
				var v1 := float(y + 1) / float(surface.height)
				var points := PackedVector3Array([
					_surface_point(corners, u0, v1),
					_surface_point(corners, u0, v0),
					_surface_point(corners, u1, v0),
					_surface_point(corners, u1, v1),
				])
				var palette_index := surface.get_pixel(face_key, x, y)
				var color := palette.color_for(palette_index) \
					if palette != null else Color("#8a8a8a")
				_append_face(
					faces, points, Vector3(definition["normal"]), color, false)


static func _surface_point(
		corners: PackedVector3Array, u: float, v: float) -> Vector3:
	var top := corners[1].lerp(corners[2], u)
	var bottom := corners[0].lerp(corners[3], u)
	return top.lerp(bottom, v)


static func _append_face(
		faces: Array[Dictionary], points: PackedVector3Array,
		normal: Vector3, color: Color, outline := true) -> void:
	var camera_axis := CAMERA_DIRECTION.normalized()
	if normal.dot(camera_axis) <= 0.0001:
		return
	var depth := 0.0
	for point in points:
		depth += point.dot(camera_axis)
	faces.append({
		"points": points,
		"color": _lit_color(color, normal),
		"depth": depth / float(maxi(1, points.size())),
		"outline": outline,
	})


static func _lit_color(color: Color, normal: Vector3) -> Color:
	var light_direction := Vector3(0.45, 0.82, -0.35).normalized()
	var energy := 0.70 + maxf(0.0, normal.dot(light_direction)) * 0.30
	return Color(
		clampf(color.r * energy, 0.0, 1.0),
		clampf(color.g * energy, 0.0, 1.0),
		clampf(color.b * energy, 0.0, 1.0), color.a)


static func _rasterize_faces(
		image: Image, faces: Array[Dictionary]) -> void:
	var camera_forward := -CAMERA_DIRECTION.normalized()
	var camera_right := camera_forward.cross(Vector3.UP).normalized()
	var camera_up := camera_right.cross(camera_forward).normalized()
	var projected_faces: Array[Dictionary] = []
	var minimum := Vector2(INF, INF)
	var maximum := Vector2(-INF, -INF)
	for face in faces:
		var projected := PackedVector2Array()
		for point in face["points"]:
			var screen_point := Vector2(
				Vector3(point).dot(camera_right),
				-Vector3(point).dot(camera_up))
			projected.append(screen_point)
			minimum = minimum.min(screen_point)
			maximum = maximum.max(screen_point)
		projected_faces.append({
			"points": projected,
			"color": face["color"],
			"depth": face["depth"],
			"outline": face.get("outline", true),
		})
	projected_faces.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return float(a["depth"]) < float(b["depth"]))
	var span := maximum - minimum
	var padding := maxf(3.0, float(image.get_width()) * 0.10)
	var available := Vector2(image.get_size()) - Vector2.ONE * padding * 2.0
	var scale_value := minf(
		available.x / maxf(span.x, 0.0001),
		available.y / maxf(span.y, 0.0001))
	var source_center := (minimum + maximum) * 0.5
	var target_center := Vector2(image.get_size()) * 0.5
	for face in projected_faces:
		var pixels := PackedVector2Array()
		for point in face["points"]:
			pixels.append(
				(Vector2(point) - source_center) * scale_value + target_center)
		var color: Color = face["color"]
		_fill_polygon(image, pixels, color)
		if bool(face.get("outline", true)):
			_draw_polygon_outline(image, pixels, color.darkened(0.34))


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
