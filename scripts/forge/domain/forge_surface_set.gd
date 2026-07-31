@tool
class_name ForgeSurfaceSet
extends Resource
## Palette-indexed source pixels for a standard six-face block.

const FACE_KEYS: PackedStringArray = [
	"top", "bottom", "north", "south", "east", "west",
]

@export var schema_version := 1
@export var width := 32
@export var height := 32
@export var face_pixels: Dictionary = {}
@export var face_links: Dictionary = {
	"top": "top",
	"bottom": "bottom",
	"north": "sides",
	"south": "sides",
	"east": "sides",
	"west": "sides",
}
@export var material_dna_id := ""
@export var edge_link_rules: Dictionary = {}
@export var connected_texture_rules: Dictionary = {}
@export var random_variant_rules: Dictionary = {}


func ensure_faces() -> void:
	var required_size := width * height
	for face in FACE_KEYS:
		var pixels: PackedByteArray = face_pixels.get(face, PackedByteArray())
		if pixels.size() != required_size:
			var replacement := PackedByteArray()
			replacement.resize(required_size)
			for index in mini(pixels.size(), replacement.size()):
				replacement[index] = pixels[index]
			face_pixels[face] = replacement


func set_pixel(face: String, x: int, y: int, palette_index: int) -> bool:
	if face not in FACE_KEYS or x < 0 or y < 0 or x >= width or y >= height:
		return false
	ensure_faces()
	var pixels: PackedByteArray = face_pixels[face]
	pixels[y * width + x] = clampi(palette_index, 0, 255)
	face_pixels[face] = pixels
	return true


func get_pixel(face: String, x: int, y: int) -> int:
	if face not in FACE_KEYS or x < 0 or y < 0 or x >= width or y >= height:
		return 0
	ensure_faces()
	var pixels: PackedByteArray = face_pixels[face]
	return int(pixels[y * width + x])


func fill_face(face: String, palette_index: int) -> bool:
	if face not in FACE_KEYS:
		return false
	ensure_faces()
	var pixels: PackedByteArray = face_pixels[face]
	pixels.fill(clampi(palette_index, 0, 255))
	face_pixels[face] = pixels
	return true


func copy_face(source: String, target: String) -> bool:
	if source not in FACE_KEYS or target not in FACE_KEYS:
		return false
	ensure_faces()
	face_pixels[target] = face_pixels_copy(source)
	return true


func face_pixels_copy(face: String) -> PackedByteArray:
	if face not in FACE_KEYS:
		return PackedByteArray()
	ensure_faces()
	var pixels: PackedByteArray = face_pixels[face]
	return pixels.duplicate()


func set_face_pixels(face: String, pixels: PackedByteArray) -> bool:
	if face not in FACE_KEYS or pixels.size() != width * height:
		return false
	face_pixels[face] = pixels.duplicate()
	return true


func transformed_pixels(
		pixels: PackedByteArray, operation: String) -> PackedByteArray:
	if pixels.size() != width * height:
		return PackedByteArray()
	if operation in ["rotate_cw", "rotate_ccw"] and width != height:
		return PackedByteArray()
	var result := PackedByteArray()
	result.resize(pixels.size())
	for y in height:
		for x in width:
			var source := Vector2i(x, y)
			match operation:
				"mirror_horizontal":
					source.x = width - 1 - x
				"mirror_vertical":
					source.y = height - 1 - y
				"rotate_cw":
					source = Vector2i(y, height - 1 - x)
				"rotate_180":
					source = Vector2i(width - 1 - x, height - 1 - y)
				"rotate_ccw":
					source = Vector2i(width - 1 - y, x)
			result[y * width + x] = pixels[source.y * width + source.x]
	return result


func to_record() -> Dictionary:
	ensure_faces()
	var faces := {}
	for face in FACE_KEYS:
		faces[face] = Array(face_pixels[face])
	return {
		"schema_version": schema_version,
		"width": width,
		"height": height,
		"face_pixels": faces,
		"face_links": face_links.duplicate(true),
		"material_dna_id": material_dna_id,
		"edge_link_rules": edge_link_rules.duplicate(true),
		"connected_texture_rules": connected_texture_rules.duplicate(true),
		"random_variant_rules": random_variant_rules.duplicate(true),
	}
