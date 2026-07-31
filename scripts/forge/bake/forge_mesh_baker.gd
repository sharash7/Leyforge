class_name ForgeMeshBaker
extends RefCounted
## Deterministic first-pass voxel mesher. It removes hidden faces and emits
## one indexed surface with palette colours; runtime never spawns source cells.

const BAKER_VERSION := "forge-mesh-v2"

const FACE_DEFINITIONS := [
	{
		"normal": Vector3i(1, 0, 0),
		"corners": [
			Vector3(1, 0, 0), Vector3(1, 1, 0),
			Vector3(1, 1, 1), Vector3(1, 0, 1),
		],
	},
	{
		"normal": Vector3i(-1, 0, 0),
		"corners": [
			Vector3(0, 0, 1), Vector3(0, 1, 1),
			Vector3(0, 1, 0), Vector3(0, 0, 0),
		],
	},
	{
		"normal": Vector3i(0, 1, 0),
		"corners": [
			Vector3(0, 1, 1), Vector3(1, 1, 1),
			Vector3(1, 1, 0), Vector3(0, 1, 0),
		],
	},
	{
		"normal": Vector3i(0, -1, 0),
		"corners": [
			Vector3(0, 0, 0), Vector3(1, 0, 0),
			Vector3(1, 0, 1), Vector3(0, 0, 1),
		],
	},
	{
		"normal": Vector3i(0, 0, 1),
		"corners": [
			Vector3(1, 0, 1), Vector3(1, 1, 1),
			Vector3(0, 1, 1), Vector3(0, 0, 1),
		],
	},
	{
		"normal": Vector3i(0, 0, -1),
		"corners": [
			Vector3(0, 0, 0), Vector3(0, 1, 0),
			Vector3(1, 1, 0), Vector3(1, 0, 0),
		],
	},
]


static func bake(
		volume: ForgeVoxelVolume,
		palette: ForgePaletteDefinition) -> Dictionary:
	if volume == null:
		return {"ok": false, "error": "Voxel volume is missing."}
	volume.ensure_storage()
	var vertices := PackedVector3Array()
	var normals := PackedVector3Array()
	var colors := PackedColorArray()
	var uvs := PackedVector2Array()
	var indices := PackedInt32Array()
	var occupied := 0
	var face_count := 0
	var bounds_started := false
	var minimum := Vector3.ZERO
	var maximum := Vector3.ZERO
	var cell_size := maxf(volume.voxel_size_meters, 0.0001)
	for z in volume.dimensions.z:
		for y in volume.dimensions.y:
			for x in volume.dimensions.x:
				var cell := Vector3i(x, y, z)
				var palette_index := volume.get_cell(cell)
				if palette_index < 0:
					continue
				occupied += 1
				var cell_min := Vector3(cell) * cell_size
				var cell_max := Vector3(cell + Vector3i.ONE) * cell_size
				if not bounds_started:
					minimum = cell_min
					maximum = cell_max
					bounds_started = true
				else:
					minimum = minimum.min(cell_min)
					maximum = maximum.max(cell_max)
				for face in FACE_DEFINITIONS:
					var neighbour := cell + Vector3i(face["normal"])
					if volume.contains(neighbour) and volume.get_cell(neighbour) >= 0:
						continue
					_append_face(
						vertices, normals, colors, uvs, indices,
						Vector3(cell), face, cell_size,
						_palette_color(palette, palette_index))
					face_count += 1
	if vertices.is_empty():
		return {"ok": false, "error": "Voxel volume has no visible cells."}
	var arrays := []
	arrays.resize(Mesh.ARRAY_MAX)
	arrays[Mesh.ARRAY_VERTEX] = vertices
	arrays[Mesh.ARRAY_NORMAL] = normals
	arrays[Mesh.ARRAY_COLOR] = colors
	arrays[Mesh.ARRAY_TEX_UV] = uvs
	arrays[Mesh.ARRAY_INDEX] = indices
	var mesh := ArrayMesh.new()
	mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
	var material := StandardMaterial3D.new()
	material.resource_name = "ForgePaletteVertexMaterial"
	material.vertex_color_use_as_albedo = true
	material.shading_mode = BaseMaterial3D.SHADING_MODE_PER_PIXEL
	material.roughness = 0.82
	mesh.surface_set_material(0, material)
	return {
		"ok": true,
		"mesh": mesh,
		"bounds": AABB(minimum, maximum - minimum),
		"metrics": {
			"occupied_cells": occupied,
			"exposed_faces": face_count,
			"vertices": vertices.size(),
			"triangles": indices.size() / 3,
			"hidden_face_removal": true,
			"baker_version": BAKER_VERSION,
		},
	}


static func bake_surface_cube(
		surface: ForgeSurfaceSet,
		palette: ForgePaletteDefinition) -> Dictionary:
	if surface == null:
		return {"ok": false, "error": "Surface source is missing."}
	surface.ensure_faces()
	var volume := ForgeVoxelVolume.new()
	volume.dimensions = Vector3i.ONE
	volume.voxel_size_meters = 1.0
	volume.ensure_storage()
	volume.set_cell(Vector3i.ZERO, 0)
	var result := bake(volume, palette)
	if not bool(result.get("ok", false)):
		return result
	var mesh: ArrayMesh = result["mesh"]
	var arrays := mesh.surface_get_arrays(0)
	var colors := PackedColorArray()
	var face_order := ["east", "west", "top", "bottom", "south", "north"]
	for face_key in face_order:
		var face_color := ForgeSurfaceBaker.average_face_color(
			surface, face_key, palette)
		for _vertex in 4:
			colors.append(face_color)
	arrays[Mesh.ARRAY_COLOR] = colors
	var recolored := ArrayMesh.new()
	recolored.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
	recolored.surface_set_material(0, mesh.surface_get_material(0))
	result["mesh"] = recolored
	result["metrics"]["surface_source"] = true
	return result


static func bake_textured_surface_cube(
		surface: ForgeSurfaceSet,
		palette: ForgePaletteDefinition) -> Dictionary:
	if surface == null:
		return {"ok": false, "error": "Surface source is missing."}
	surface.ensure_faces()
	var surface_result := ForgeSurfaceBaker.bake_images(surface, palette)
	if not bool(surface_result.get("ok", false)):
		return surface_result
	var face_order := ["east", "west", "top", "bottom", "south", "north"]
	var mesh := ArrayMesh.new()
	for face_index in FACE_DEFINITIONS.size():
		var face: Dictionary = FACE_DEFINITIONS[face_index]
		var vertices := PackedVector3Array()
		var normals := PackedVector3Array()
		var uvs := PackedVector2Array([
			Vector2(0, 1), Vector2(0, 0),
			Vector2(1, 0), Vector2(1, 1),
		])
		for corner in face["corners"]:
			vertices.append(Vector3(corner))
			normals.append(Vector3(face["normal"]))
		var arrays := []
		arrays.resize(Mesh.ARRAY_MAX)
		arrays[Mesh.ARRAY_VERTEX] = vertices
		arrays[Mesh.ARRAY_NORMAL] = normals
		arrays[Mesh.ARRAY_TEX_UV] = uvs
		# Godot treats clockwise triangles as front-facing. FACE_DEFINITIONS
		# list corners in outward-normal (counter-clockwise) order, so reverse
		# the indices while retaining their authored outward normals.
		arrays[Mesh.ARRAY_INDEX] = PackedInt32Array([0, 2, 1, 0, 3, 2])
		mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, arrays)
		var face_key: String = face_order[face_index]
		var material := StandardMaterial3D.new()
		material.resource_name = "ForgePreview_%s" % face_key
		material.albedo_texture = ImageTexture.create_from_image(
			surface_result["images"][face_key])
		material.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
		material.texture_repeat = false
		material.roughness = 0.82
		mesh.surface_set_material(face_index, material)
		mesh.surface_set_name(face_index, face_key)
	return {
		"ok": true,
		"mesh": mesh,
		"bounds": AABB(Vector3.ZERO, Vector3.ONE),
		"metrics": {
			"surface_source": true,
			"textured_preview": true,
			"face_count": face_order.size(),
			"vertices": face_order.size() * 4,
			"triangles": face_order.size() * 2,
			"filtering": "nearest",
			"baker_version": BAKER_VERSION,
		},
	}


static func _append_face(
		vertices: PackedVector3Array, normals: PackedVector3Array,
		colors: PackedColorArray, uvs: PackedVector2Array,
		indices: PackedInt32Array, cell: Vector3, face: Dictionary,
		cell_size: float, color: Color) -> void:
	var base := vertices.size()
	var uv_values := [
		Vector2(0, 1), Vector2(0, 0), Vector2(1, 0), Vector2(1, 1),
	]
	var normal := Vector3(face["normal"])
	for corner_index in 4:
		vertices.append((cell + Vector3(face["corners"][corner_index])) * cell_size)
		normals.append(normal)
		colors.append(color)
		uvs.append(uv_values[corner_index])
	indices.append_array(PackedInt32Array([
		base, base + 2, base + 1, base, base + 3, base + 2,
	]))


static func _palette_color(
		palette: ForgePaletteDefinition, palette_index: int) -> Color:
	if palette == null:
		return Color("#8a8a8a")
	return palette.color_for(palette_index)
