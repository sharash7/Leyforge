extends RefCounted
## Pure worker-safe greedy mesher. It reads an immutable chunk snapshot and
## returns packed geometry arrays; scene resources are committed on the main
## thread by Chunk.apply_geometry().

const SIZE := 16


func run(snapshot: Dictionary) -> Dictionary:
	return build(snapshot)


static func build(snapshot: Dictionary) -> Dictionary:
	var opaque_vertices := PackedVector3Array()
	var opaque_normals := PackedVector3Array()
	var opaque_colors := PackedColorArray()
	var opaque_uvs := PackedVector2Array()
	var opaque_uv2s := PackedVector2Array()
	var water_vertices := PackedVector3Array()
	var water_normals := PackedVector3Array()
	var water_colors := PackedColorArray()
	var collision_triangles := PackedVector3Array()
	var mask := PackedInt32Array()
	mask.resize(SIZE * SIZE)
	for axis in 3:
		var u := (axis + 1) % 3
		var v := (axis + 2) % 3
		for sign_value in [-1, 1]:
			_sweep_axis(
				snapshot, axis, u, v, sign_value, mask,
				opaque_vertices, opaque_normals, opaque_colors,
				opaque_uvs, opaque_uv2s,
				water_vertices, water_normals, water_colors,
				collision_triangles)
	_emit_shaped_blocks(
		snapshot, opaque_vertices, opaque_normals, opaque_colors,
		opaque_uvs, opaque_uv2s, collision_triangles)
	return {
		"opaque_vertices": opaque_vertices,
		"opaque_normals": opaque_normals,
		"opaque_colors": opaque_colors,
		"opaque_uvs": opaque_uvs,
		"opaque_uv2s": opaque_uv2s,
		"water_vertices": water_vertices,
		"water_normals": water_normals,
		"water_colors": water_colors,
		"collision_triangles": collision_triangles,
	}


static func _index(x: int, y: int, z: int) -> int:
	return (y * SIZE + z) * SIZE + x


static func _get_block(snapshot: Dictionary, x: int, y: int, z: int) -> int:
	var blocks: PackedInt32Array = snapshot["blocks"]
	if x >= 0 and y >= 0 and z >= 0 and x < SIZE and y < SIZE and z < SIZE:
		return blocks[_index(x, y, z)]
	var offset := Vector3i.ZERO
	var local := Vector3i(x, y, z)
	if x < 0:
		offset.x = -1
		local.x = SIZE - 1
	elif x >= SIZE:
		offset.x = 1
		local.x = 0
	elif y < 0:
		offset.y = -1
		local.y = SIZE - 1
	elif y >= SIZE:
		offset.y = 1
		local.y = 0
	elif z < 0:
		offset.z = -1
		local.z = SIZE - 1
	elif z >= SIZE:
		offset.z = 1
		local.z = 0
	var neighbors: Dictionary = snapshot["neighbors"]
	if not neighbors.has(offset):
		return 0
	var neighbor_blocks: PackedInt32Array = neighbors[offset]
	return neighbor_blocks[_index(local.x, local.y, local.z)]


static func _is_water(snapshot: Dictionary, id: int) -> bool:
	return id == int(snapshot["water_id"])


static func _is_transparent(snapshot: Dictionary, id: int) -> bool:
	var transparency: PackedByteArray = snapshot.get(
		"transparency", PackedByteArray())
	return id >= 0 and id < transparency.size() and transparency[id] != 0


static func _shape(snapshot: Dictionary, id: int) -> int:
	var shapes: PackedByteArray = snapshot.get("shapes", PackedByteArray())
	return int(shapes[id]) if id >= 0 and id < shapes.size() else 0


static func _face_visible(snapshot: Dictionary, id: int, neighbor_id: int) -> bool:
	if _is_water(snapshot, id):
		return neighbor_id == 0 or (
			not _is_water(snapshot, neighbor_id)
			and not _is_transparent(snapshot, neighbor_id))
	if _is_transparent(snapshot, id):
		return neighbor_id == 0 or (
			neighbor_id != id and not _is_transparent(snapshot, neighbor_id))
	return neighbor_id == 0 or _is_water(snapshot, neighbor_id) \
		or _is_transparent(snapshot, neighbor_id) \
		or _shape(snapshot, neighbor_id) != 0


static func _sweep_axis(snapshot: Dictionary, axis: int, u: int, v: int, sign_value: int,
		mask: PackedInt32Array,
		opaque_vertices: PackedVector3Array, opaque_normals: PackedVector3Array,
		opaque_colors: PackedColorArray, opaque_uvs: PackedVector2Array,
		opaque_uv2s: PackedVector2Array, water_vertices: PackedVector3Array,
		water_normals: PackedVector3Array, water_colors: PackedColorArray,
		collision_triangles: PackedVector3Array) -> void:
	var position := Vector3i.ZERO
	var neighbor_position := Vector3i.ZERO
	for slice in SIZE:
		position[axis] = slice
		neighbor_position[axis] = slice + sign_value
		for iv in SIZE:
			position[v] = iv
			neighbor_position[v] = iv
			for iu in SIZE:
				position[u] = iu
				neighbor_position[u] = iu
				var id := _get_block(snapshot, position.x, position.y, position.z)
				if id == 0 or _shape(snapshot, id) != 0:
					mask[iu + iv * SIZE] = 0
					continue
				var neighbor_id := _get_block(
					snapshot, neighbor_position.x, neighbor_position.y, neighbor_position.z)
				mask[iu + iv * SIZE] = id if _face_visible(snapshot, id, neighbor_id) else 0
		for iv in SIZE:
			var iu := 0
			while iu < SIZE:
				var id0 := mask[iu + iv * SIZE]
				if id0 == 0:
					iu += 1
					continue
				var width := 1
				while iu + width < SIZE and mask[iu + width + iv * SIZE] == id0:
					width += 1
				var height := 1
				var growing := true
				while iv + height < SIZE and growing:
					for k in width:
						if mask[iu + k + (iv + height) * SIZE] != id0:
							growing = false
							break
					if growing:
						height += 1
				for dv in height:
					for du in width:
						mask[iu + du + (iv + dv) * SIZE] = 0
				_emit_quad(
					snapshot, axis, u, v, sign_value, slice, iu, iv, width, height, id0,
					opaque_vertices, opaque_normals, opaque_colors,
					opaque_uvs, opaque_uv2s,
					water_vertices, water_normals, water_colors, collision_triangles)
				iu += width


static func _emit_quad(snapshot: Dictionary, axis: int, u: int, v: int,
		sign_value: int, slice: int, iu: int, iv: int, width: int, height: int, id: int,
		opaque_vertices: PackedVector3Array, opaque_normals: PackedVector3Array,
		opaque_colors: PackedColorArray, opaque_uvs: PackedVector2Array,
		opaque_uv2s: PackedVector2Array, water_vertices: PackedVector3Array,
		water_normals: PackedVector3Array, water_colors: PackedColorArray,
		collision_triangles: PackedVector3Array) -> void:
	var base := Vector3.ZERO
	base[axis] = float(slice + (1 if sign_value > 0 else 0))
	base[u] = float(iu)
	base[v] = float(iv)
	var du := Vector3.ZERO
	du[u] = float(width)
	var dv := Vector3.ZERO
	dv[v] = float(height)
	var c00 := base
	var c10 := base + du
	var c11 := base + du + dv
	var c01 := base + dv
	var normal := Vector3.ZERO
	normal[axis] = float(sign_value)
	var colors: PackedColorArray = snapshot["colors"]
	var color := colors[id] if id >= 0 and id < colors.size() else Color(1, 0, 1)
	var uses_transparent_surface := _is_water(snapshot, id) \
		or _is_transparent(snapshot, id)
	var vertices := water_vertices if uses_transparent_surface else opaque_vertices
	var normals := water_normals if uses_transparent_surface else opaque_normals
	var vertex_colors := water_colors if uses_transparent_surface else opaque_colors
	var uv_corners := [
		Vector2.ZERO,
		Vector2(float(width), 0.0),
		Vector2(float(width), float(height)),
		Vector2(0.0, float(height)),
	]
	# Godot treats clockwise triangles as front-facing. Keep both the rendered
	# surface and its one-sided concave collision facing out of the solid voxel.
	if sign_value > 0:
		vertices.append_array([c00, c11, c10, c00, c01, c11])
		if not uses_transparent_surface:
			opaque_uvs.append_array([
				uv_corners[0], uv_corners[2], uv_corners[1],
				uv_corners[0], uv_corners[3], uv_corners[2],
			])
	else:
		vertices.append_array([c00, c10, c11, c00, c11, c01])
		if not uses_transparent_surface:
			opaque_uvs.append_array([
				uv_corners[0], uv_corners[1], uv_corners[2],
				uv_corners[0], uv_corners[2], uv_corners[3],
			])
	for i in 6:
		normals.append(normal)
		vertex_colors.append(color)
		if not uses_transparent_surface:
			opaque_uv2s.append(Vector2(_material_layer(snapshot, id), 0.0))
	if not _is_water(snapshot, id):
		# Collision uses the same outward winding as the visible surface.
		if sign_value > 0:
			collision_triangles.append_array([c00, c11, c10, c00, c01, c11])
		else:
			collision_triangles.append_array([c00, c10, c11, c00, c11, c01])


static func _material_layer(snapshot: Dictionary, id: int) -> float:
	var layers: PackedInt32Array = snapshot.get("layers", PackedInt32Array())
	return float(layers[id]) if id >= 0 and id < layers.size() else 0.0


static func _emit_shaped_blocks(snapshot: Dictionary,
		vertices: PackedVector3Array, normals: PackedVector3Array,
		colors: PackedColorArray, uvs: PackedVector2Array,
		uv2s: PackedVector2Array, collision: PackedVector3Array) -> void:
	var blocks: PackedInt32Array = snapshot["blocks"]
	for y in SIZE:
		for z in SIZE:
			for x in SIZE:
				var id := blocks[_index(x, y, z)]
				var shape := _shape(snapshot, id)
				if shape == 0:
					continue
				var origin := Vector3(x, y, z)
				_emit_authored_shape(
					snapshot, origin, id, shape,
					vertices, normals, colors, uvs, uv2s, collision)


static func _emit_authored_shape(
		snapshot: Dictionary, origin: Vector3, id: int, shape: int,
		vertices: PackedVector3Array, normals: PackedVector3Array,
		colors: PackedColorArray, uvs: PackedVector2Array,
		uv2s: PackedVector2Array, collision: PackedVector3Array) -> void:
	var palette: PackedColorArray = snapshot["colors"]
	var base := palette[id] if id >= 0 and id < palette.size() else Color(1, 0, 1)
	match shape:
		1:
			_emit_box(
				snapshot, origin, Vector3.ZERO, Vector3(1.0, 0.5, 1.0), id,
				vertices, normals, colors, uvs, uv2s, collision)
		2:
			_emit_box(
				snapshot, origin, Vector3.ZERO, Vector3(1.0, 0.5, 1.0), id,
				vertices, normals, colors, uvs, uv2s, collision)
			# Fixed north-facing representative stair. Rotation state is
			# deferred until general per-block state metadata lands.
			_emit_box(
				snapshot, origin, Vector3(0.0, 0.5, 0.5), Vector3.ONE, id,
				vertices, normals, colors, uvs, uv2s, collision)
		3:
			# Furnace shell, rim, chimney cap, and dark front firebox.
			_emit_box(
				snapshot, origin, Vector3(0.05, 0.0, 0.05),
				Vector3(0.95, 0.82, 0.95), id,
				vertices, normals, colors, uvs, uv2s, collision)
			_emit_box(
				snapshot, origin, Vector3(0.12, 0.82, 0.12),
				Vector3(0.88, 0.96, 0.88), id,
				vertices, normals, colors, uvs, uv2s, collision,
				base.lightened(0.10))
			_emit_box(
				snapshot, origin, Vector3(0.28, 0.18, 0.015),
				Vector3(0.72, 0.52, 0.065), id,
				vertices, normals, colors, uvs, uv2s, collision,
				Color(0.035, 0.025, 0.018), false)
		4:
			# Storage base, raised lid, and front latch.
			_emit_box(
				snapshot, origin, Vector3(0.06, 0.0, 0.08),
				Vector3(0.94, 0.55, 0.92), id,
				vertices, normals, colors, uvs, uv2s, collision)
			_emit_box(
				snapshot, origin, Vector3(0.03, 0.55, 0.05),
				Vector3(0.97, 0.76, 0.95), id,
				vertices, normals, colors, uvs, uv2s, collision,
				base.lightened(0.12))
			_emit_box(
				snapshot, origin, Vector3(0.44, 0.42, 0.015),
				Vector3(0.56, 0.66, 0.075), id,
				vertices, normals, colors, uvs, uv2s, collision,
				Color(0.72, 0.48, 0.10), false)
		5:
			# An open, cross-connected trough rather than a solid green cube.
			_emit_box(
				snapshot, origin, Vector3(0.08, 0.08, 0.08),
				Vector3(0.92, 0.20, 0.92), id,
				vertices, normals, colors, uvs, uv2s, collision)
			_emit_box(
				snapshot, origin, Vector3(0.08, 0.20, 0.08),
				Vector3(0.18, 0.48, 0.92), id,
				vertices, normals, colors, uvs, uv2s, collision,
				base.darkened(0.10))
			_emit_box(
				snapshot, origin, Vector3(0.82, 0.20, 0.08),
				Vector3(0.92, 0.48, 0.92), id,
				vertices, normals, colors, uvs, uv2s, collision,
				base.darkened(0.10))
		6:
			# Fixed north-facing thin door panel with frame and handle.
			_emit_box(
				snapshot, origin, Vector3(0.08, 0.0, 0.42),
				Vector3(0.92, 1.0, 0.58), id,
				vertices, normals, colors, uvs, uv2s, collision)
			_emit_box(
				snapshot, origin, Vector3(0.70, 0.43, 0.37),
				Vector3(0.80, 0.55, 0.43), id,
				vertices, normals, colors, uvs, uv2s, collision,
				Color(0.74, 0.55, 0.16), false)
		7:
			# Work surface and four readable legs.
			_emit_box(
				snapshot, origin, Vector3(0.04, 0.68, 0.04),
				Vector3(0.96, 0.92, 0.96), id,
				vertices, normals, colors, uvs, uv2s, collision)
			for corner in [
				Vector2(0.10, 0.10), Vector2(0.70, 0.10),
				Vector2(0.10, 0.70), Vector2(0.70, 0.70),
			]:
				_emit_box(
					snapshot, origin, Vector3(corner.x, 0.0, corner.y),
					Vector3(corner.x + 0.20, 0.68, corner.y + 0.20), id,
					vertices, normals, colors, uvs, uv2s, collision,
					base.darkened(0.16))
		8:
			_emit_box(
				snapshot, origin, Vector3(0.39, 0.0, 0.39),
				Vector3(0.61, 0.78, 0.61), id,
				vertices, normals, colors, uvs, uv2s, collision)
			_emit_box(
				snapshot, origin, Vector3(0.24, 0.70, 0.24),
				Vector3(0.76, 1.0, 0.76), id,
				vertices, normals, colors, uvs, uv2s, collision,
				base.lightened(0.24))


static func _emit_box(snapshot: Dictionary, origin: Vector3, minimum: Vector3,
		maximum: Vector3, id: int, vertices: PackedVector3Array,
		normals: PackedVector3Array, colors: PackedColorArray,
		uvs: PackedVector2Array, uv2s: PackedVector2Array,
		collision: PackedVector3Array,
		color_override: Color = Color(-1.0, -1.0, -1.0, -1.0),
		collision_enabled: bool = true) -> void:
	for axis in 3:
		var u := (axis + 1) % 3
		var v := (axis + 2) % 3
		for sign_value in [-1, 1]:
			var boundary := minimum[axis] <= 0.0 \
				if sign_value < 0 else maximum[axis] >= 1.0
			if boundary:
				var neighbor_position := Vector3i(origin)
				neighbor_position[axis] += sign_value
				var neighbor_id := _get_block(
					snapshot, neighbor_position.x, neighbor_position.y, neighbor_position.z)
				if neighbor_id != 0 and not _is_water(snapshot, neighbor_id) \
						and _shape(snapshot, neighbor_id) == 0:
					continue
			var base := origin + minimum
			base[axis] = origin[axis] + (
				maximum[axis] if sign_value > 0 else minimum[axis])
			var du := Vector3.ZERO
			du[u] = maximum[u] - minimum[u]
			var dv := Vector3.ZERO
			dv[v] = maximum[v] - minimum[v]
			_emit_box_face(
				snapshot, base, du, dv, axis, sign_value, id,
				vertices, normals, colors, uvs, uv2s, collision,
				color_override, collision_enabled)


static func _emit_box_face(snapshot: Dictionary, c00: Vector3, du: Vector3,
		dv: Vector3, axis: int, sign_value: int, id: int,
		vertices: PackedVector3Array, normals: PackedVector3Array,
		colors: PackedColorArray, uvs: PackedVector2Array,
		uv2s: PackedVector2Array, collision: PackedVector3Array,
		color_override: Color = Color(-1.0, -1.0, -1.0, -1.0),
		collision_enabled: bool = true) -> void:
	var c10 := c00 + du
	var c11 := c00 + du + dv
	var c01 := c00 + dv
	var normal := Vector3.ZERO
	normal[axis] = float(sign_value)
	var palette: PackedColorArray = snapshot["colors"]
	var color := color_override if color_override.r >= 0.0 else (
		palette[id] if id >= 0 and id < palette.size() else Color(1, 0, 1))
	var uv00 := Vector2.ZERO
	var uv10 := Vector2(du.length(), 0.0)
	var uv11 := Vector2(du.length(), dv.length())
	var uv01 := Vector2(0.0, dv.length())
	if sign_value > 0:
		vertices.append_array([c00, c11, c10, c00, c01, c11])
		uvs.append_array([uv00, uv11, uv10, uv00, uv01, uv11])
		if collision_enabled:
			collision.append_array([c00, c11, c10, c00, c01, c11])
	else:
		vertices.append_array([c00, c10, c11, c00, c11, c01])
		uvs.append_array([uv00, uv10, uv11, uv00, uv11, uv01])
		if collision_enabled:
			collision.append_array([c00, c10, c11, c00, c11, c01])
	for i in 6:
		normals.append(normal)
		colors.append(color)
		uv2s.append(Vector2(_material_layer(snapshot, id), 0.0))
