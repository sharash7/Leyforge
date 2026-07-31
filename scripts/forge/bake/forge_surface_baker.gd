class_name ForgeSurfaceBaker
extends RefCounted
## Deterministic nearest-neighbour texture output for the six standard faces.

const BAKER_VERSION := "forge-surface-v1"


static func bake_images(
		surface: ForgeSurfaceSet,
		palette: ForgePaletteDefinition) -> Dictionary:
	if surface == null:
		return {"ok": false, "error": "Surface source is missing."}
	surface.ensure_faces()
	var images := {}
	for face in ForgeSurfaceSet.FACE_KEYS:
		var image := Image.create(
			surface.width, surface.height, false, Image.FORMAT_RGBA8)
		for y in surface.height:
			for x in surface.width:
				image.set_pixel(
					x, y,
					_palette_color(palette, surface.get_pixel(face, x, y)))
		images[face] = image
	return {
		"ok": true,
		"images": images,
		"metrics": {
			"face_count": images.size(),
			"width": surface.width,
			"height": surface.height,
			"filtering": "nearest",
			"baker_version": BAKER_VERSION,
		},
	}


static func average_face_color(
		surface: ForgeSurfaceSet, face: String,
		palette: ForgePaletteDefinition) -> Color:
	if surface == null:
		return Color("#8a8a8a")
	surface.ensure_faces()
	var sum := Color(0, 0, 0, 0)
	var count := maxi(1, surface.width * surface.height)
	for y in surface.height:
		for x in surface.width:
			sum += _palette_color(palette, surface.get_pixel(face, x, y))
	return sum / float(count)


static func runtime_face_colors(
		surface: ForgeSurfaceSet,
		palette: ForgePaletteDefinition) -> Dictionary:
	var result := {}
	for face in ForgeSurfaceSet.FACE_KEYS:
		var color := average_face_color(surface, face, palette)
		result[face] = [color.r, color.g, color.b, color.a]
	return result


static func _palette_color(
		palette: ForgePaletteDefinition, palette_index: int) -> Color:
	if palette == null:
		return Color("#8a8a8a")
	return palette.color_for(palette_index)
