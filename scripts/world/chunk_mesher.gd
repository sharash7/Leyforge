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
	var glass_vertices := PackedVector3Array()
	var glass_normals := PackedVector3Array()
	var glass_colors := PackedColorArray()
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
				glass_vertices, glass_normals, glass_colors,
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
		"glass_vertices": glass_vertices,
		"glass_normals": glass_normals,
		"glass_colors": glass_colors,
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


static func _is_item_connector(snapshot: Dictionary, id: int) -> bool:
	var connectors: PackedByteArray = snapshot.get(
		"item_connectors", PackedByteArray())
	return id >= 0 and id < connectors.size() and connectors[id] != 0


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
		glass_vertices: PackedVector3Array,
		glass_normals: PackedVector3Array, glass_colors: PackedColorArray,
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
					water_vertices, water_normals, water_colors,
					glass_vertices, glass_normals, glass_colors,
					collision_triangles)
				iu += width


static func _emit_quad(snapshot: Dictionary, axis: int, u: int, v: int,
		sign_value: int, slice: int, iu: int, iv: int, width: int, height: int, id: int,
		opaque_vertices: PackedVector3Array, opaque_normals: PackedVector3Array,
		opaque_colors: PackedColorArray, opaque_uvs: PackedVector2Array,
		opaque_uv2s: PackedVector2Array, water_vertices: PackedVector3Array,
		water_normals: PackedVector3Array, water_colors: PackedColorArray,
		glass_vertices: PackedVector3Array,
		glass_normals: PackedVector3Array, glass_colors: PackedColorArray,
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
	var water_surface := _is_water(snapshot, id)
	var glass_surface := _is_transparent(snapshot, id) and not water_surface
	var vertices := glass_vertices if glass_surface else (
		water_vertices if water_surface else opaque_vertices)
	var normals := glass_normals if glass_surface else (
		water_normals if water_surface else opaque_normals)
	var vertex_colors := glass_colors if glass_surface else (
		water_colors if water_surface else opaque_colors)
	var uv00 := _face_uv(c00, axis, sign_value)
	var uv10 := _face_uv(c10, axis, sign_value)
	var uv11 := _face_uv(c11, axis, sign_value)
	var uv01 := _face_uv(c01, axis, sign_value)
	# Godot treats clockwise triangles as front-facing. Keep both the rendered
	# surface and its one-sided concave collision facing out of the solid voxel.
	if sign_value > 0:
		vertices.append_array([c00, c11, c10, c00, c01, c11])
		if not water_surface and not glass_surface:
			opaque_uvs.append_array([
				uv00, uv11, uv10, uv00, uv01, uv11,
			])
	else:
		vertices.append_array([c00, c10, c11, c00, c11, c01])
		if not water_surface and not glass_surface:
			opaque_uvs.append_array([
				uv00, uv10, uv11, uv00, uv11, uv01,
			])
	for i in 6:
		normals.append(normal)
		vertex_colors.append(color)
		if not water_surface and not glass_surface:
			opaque_uv2s.append(Vector2(
				_material_layer(snapshot, id, axis, sign_value), 0.0))
	if not _is_water(snapshot, id):
		# Collision uses the same outward winding as the visible surface.
		if sign_value > 0:
			collision_triangles.append_array([c00, c11, c10, c00, c01, c11])
		else:
			collision_triangles.append_array([c00, c10, c11, c00, c11, c01])


static func _face_uv(point: Vector3, axis: int, sign_value: int) -> Vector2:
	## Match the Forge surface-cube convention exactly on every world face.
	## Integer world coordinates preserve tile repetition across greedy quads.
	match axis:
		0:
			return Vector2(
				point.z if sign_value > 0 else -point.z,
				-point.y)
		1:
			return Vector2(
				-point.z if sign_value > 0 else point.z,
				-point.x)
		_:
			return Vector2(
				-point.x if sign_value > 0 else point.x,
				-point.y)


static func _material_layer(
		snapshot: Dictionary, id: int,
		axis := -1, sign_value := 1) -> float:
	var face_layers: PackedInt32Array = snapshot.get(
		"forge_face_layers", PackedInt32Array())
	if axis >= 0:
		var face_index := 0
		if axis == 1:
			face_index = 0 if sign_value > 0 else 1
		elif axis == 2:
			face_index = 3 if sign_value > 0 else 2
		else:
			face_index = 4 if sign_value > 0 else 5
		var lookup := id * 6 + face_index
		if lookup >= 0 and lookup < face_layers.size():
			return float(face_layers[lookup])
	var layers: PackedInt32Array = snapshot.get("layers", PackedInt32Array())
	return float(layers[id]) if id >= 0 and id < layers.size() else 0.0


static func _emit_shaped_blocks(snapshot: Dictionary,
		vertices: PackedVector3Array, normals: PackedVector3Array,
		colors: PackedColorArray, uvs: PackedVector2Array,
		uv2s: PackedVector2Array, collision: PackedVector3Array) -> void:
	var blocks: PackedInt32Array = snapshot["blocks"]
	var orientations: PackedByteArray = snapshot.get(
		"orientations", PackedByteArray())
	var door_parts: PackedByteArray = snapshot.get(
		"door_parts", PackedByteArray())
	var door_states: PackedByteArray = snapshot.get(
		"door_states", PackedByteArray())
	for y in SIZE:
		for z in SIZE:
			for x in SIZE:
				var id := blocks[_index(x, y, z)]
				var shape := _shape(snapshot, id)
				if shape == 0:
					continue
				var block_index := _index(x, y, z)
				var facing := int(orientations[block_index]) \
					if block_index < orientations.size() else 0
				var door_part := int(door_parts[block_index]) \
					if block_index < door_parts.size() else 0
				var door_state := int(door_states[block_index]) \
					if block_index < door_states.size() else 0
				var door_open := (door_state & 1) != 0
				var door_hinge := (door_state >> 1) & 1
				var origin := Vector3(x, y, z)
				_emit_authored_shape(
					snapshot, origin, id, shape, facing, door_part, door_open,
					door_hinge,
					vertices, normals, colors, uvs, uv2s, collision)


static func _emit_authored_shape(
		snapshot: Dictionary, origin: Vector3, id: int, shape: int,
		facing: int, door_part: int, door_open: bool, door_hinge: int,
		vertices: PackedVector3Array, normals: PackedVector3Array,
		colors: PackedColorArray, uvs: PackedVector2Array,
		uv2s: PackedVector2Array, collision: PackedVector3Array) -> void:
	var palette: PackedColorArray = snapshot["colors"]
	var base := palette[id] if id >= 0 and id < palette.size() else Color(1, 0, 1)
	if shape == 9:
		_emit_forge_mesh(
			snapshot, origin, id, facing,
			vertices, normals, colors, uvs, uv2s, collision)
		return
	if shape == 10:
		# Compound Forge machines render as scene presentations managed by the
		# world. Keep only their solid voxel collision in the chunk mesh.
		var discard_vertices := PackedVector3Array()
		var discard_normals := PackedVector3Array()
		var discard_colors := PackedColorArray()
		var discard_uvs := PackedVector2Array()
		var discard_uv2s := PackedVector2Array()
		_emit_box(
			snapshot, origin, Vector3.ZERO, Vector3.ONE, id,
			discard_vertices, discard_normals, discard_colors,
			discard_uvs, discard_uv2s, collision)
		return
	match shape:
		1:
			_emit_box(
				snapshot, origin, Vector3.ZERO, Vector3(1.0, 0.5, 1.0), id,
				vertices, normals, colors, uvs, uv2s, collision)
		2:
			_emit_rotated_box(
				snapshot, origin, Vector3.ZERO, Vector3(1.0, 0.5, 1.0), id,
				facing,
				vertices, normals, colors, uvs, uv2s, collision)
			_emit_rotated_box(
				snapshot, origin, Vector3(0.0, 0.5, 0.5), Vector3.ONE, id,
				facing,
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
			_emit_rotated_box(
				snapshot, origin, Vector3(0.28, 0.18, 0.015),
				Vector3(0.72, 0.52, 0.065), id,
				facing,
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
			_emit_rotated_box(
				snapshot, origin, Vector3(0.44, 0.42, 0.015),
				Vector3(0.56, 0.66, 0.075), id,
				facing,
				vertices, normals, colors, uvs, uv2s, collision,
				Color(0.72, 0.48, 0.10), false)
		5:
			_emit_connected_chute(
				snapshot, origin, id, facing,
				vertices, normals, colors, uvs, uv2s, collision)
		6:
			# Each inventory door places two saved voxel halves, yielding a
			# logical 32x64 door assembled from two 32x32 material cells.
			_emit_rotated_box(
				snapshot, origin, Vector3(0.08, 0.0, 0.42),
				Vector3(0.92, 1.0, 0.58), id,
				posmod(
					facing + (
						1 if door_hinge == 0 else -1) if door_open else 0,
					4),
				vertices, normals, colors, uvs, uv2s, collision,
				Color(-1.0, -1.0, -1.0, -1.0), not door_open)
			if door_part != 2:
				# The handle sits near the upper edge of the lower 32x32 cell
				# and protrudes on both faces of the two-cell door.
				_emit_rotated_box(
					snapshot, origin, Vector3(0.70, 0.68, 0.35),
					Vector3(0.80, 0.82, 0.43), id,
					posmod(
						facing + (
							1 if door_hinge == 0 else -1)
							if door_open else 0,
						4),
					vertices, normals, colors, uvs, uv2s, collision,
					Color(0.74, 0.55, 0.16), false)
				_emit_rotated_box(
					snapshot, origin, Vector3(0.70, 0.68, 0.57),
					Vector3(0.80, 0.82, 0.65), id,
					posmod(
						facing + (
							1 if door_hinge == 0 else -1)
							if door_open else 0,
						4),
					vertices, normals, colors, uvs, uv2s, collision,
					Color(0.74, 0.55, 0.16), false)
			else:
				for panel_x in [0.22, 0.56]:
					_emit_rotated_box(
						snapshot, origin,
						Vector3(panel_x, 0.28, 0.405),
						Vector3(panel_x + 0.20, 0.72, 0.595), id,
						facing,
						vertices, normals, colors, uvs, uv2s, collision,
						base.lightened(0.16), false)
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


static func _emit_connected_chute(
		snapshot: Dictionary, origin: Vector3, id: int, facing: int,
		vertices: PackedVector3Array, normals: PackedVector3Array,
		colors: PackedColorArray, uvs: PackedVector2Array,
		uv2s: PackedVector2Array, collision: PackedVector3Array) -> void:
	var directions: Array[Vector3i] = [
		Vector3i(0, 0, -1), Vector3i(1, 0, 0),
		Vector3i(0, 0, 1), Vector3i(-1, 0, 0),
	]
	var connected: Array[bool] = [false, false, false, false]
	var connection_profile := chute_connection_profile(
		snapshot, int(origin.x), int(origin.y), int(origin.z), facing)
	var connection_mask := int(connection_profile["mask"]) & 15
	var slopes: Dictionary = connection_profile.get("slopes", {})
	var connection_count := 0
	for i in directions.size():
		connected[i] = (connection_mask & (1 << i)) != 0
		if connected[i]:
			connection_count += 1
	var straight_ns := connection_count == 2 and connected[0] and connected[2]
	var straight_ew := connection_count == 2 and connected[1] and connected[3]
	if (straight_ns or straight_ew) and _has_slope(slopes):
		_emit_stepped_chute(
			snapshot, origin, id, straight_ew, slopes,
			vertices, normals, colors, uvs, uv2s, collision)
		return
	if straight_ns:
		_emit_box(
			snapshot, origin, Vector3(0.30, 0.08, 0.0),
			Vector3(0.70, 0.20, 1.0), id,
			vertices, normals, colors, uvs, uv2s, collision)
		for rail_x in [0.23, 0.70]:
			_emit_box(
				snapshot, origin, Vector3(rail_x, 0.20, 0.0),
				Vector3(rail_x + 0.07, 0.45, 1.0), id,
				vertices, normals, colors, uvs, uv2s, collision)
		return
	if straight_ew:
		_emit_box(
			snapshot, origin, Vector3(0.0, 0.08, 0.30),
			Vector3(1.0, 0.20, 0.70), id,
			vertices, normals, colors, uvs, uv2s, collision)
		for rail_z in [0.23, 0.70]:
			_emit_box(
				snapshot, origin, Vector3(0.0, 0.20, rail_z),
				Vector3(1.0, 0.45, rail_z + 0.07), id,
				vertices, normals, colors, uvs, uv2s, collision)
		return

	# Corner/T/cross junctions share one exact central square. Branch floors
	# meet its edges, while rails stop there instead of overlapping halfway
	# through neighbouring branches.
	_emit_box(
		snapshot, origin, Vector3(0.30, 0.08, 0.30),
		Vector3(0.70, 0.20, 0.70), id,
		vertices, normals, colors, uvs, uv2s, collision)
	for direction_index in directions.size():
		if not connected[direction_index]:
			continue
		var minimum := Vector3.ZERO
		var maximum := Vector3.ZERO
		if direction_index == 0:
			minimum = Vector3(0.30, 0.08, 0.0)
			maximum = Vector3(0.70, 0.20, 0.30)
		elif direction_index == 1:
			minimum = Vector3(0.70, 0.08, 0.30)
			maximum = Vector3(1.0, 0.20, 0.70)
		elif direction_index == 2:
			minimum = Vector3(0.30, 0.08, 0.70)
			maximum = Vector3(0.70, 0.20, 1.0)
		else:
			minimum = Vector3(0.0, 0.08, 0.30)
			maximum = Vector3(0.30, 0.20, 0.70)
		_emit_box(
			snapshot, origin, minimum, maximum, id,
			vertices, normals, colors, uvs, uv2s, collision)
		if direction_index in [0, 2]:
			for rail_x in [0.23, 0.70]:
				_emit_box(
					snapshot, origin,
					Vector3(rail_x, 0.20, minimum.z),
					Vector3(rail_x + 0.07, 0.45, maximum.z), id,
					vertices, normals, colors, uvs, uv2s, collision)
		else:
			for rail_z in [0.23, 0.70]:
				_emit_box(
					snapshot, origin,
					Vector3(minimum.x, 0.20, rail_z),
					Vector3(maximum.x, 0.45, rail_z + 0.07), id,
					vertices, normals, colors, uvs, uv2s, collision)

	# Every side without a connection needs a retaining wall. Without these
	# centre-edge rails, L and T pieces leave an open notch where loose batches
	# visually look able to fall out of the trough.
	for direction_index in directions.size():
		if connected[direction_index]:
			continue
		var wall_minimum := Vector3.ZERO
		var wall_maximum := Vector3.ZERO
		if direction_index == 0:
			wall_minimum = Vector3(0.23, 0.20, 0.23)
			wall_maximum = Vector3(0.77, 0.45, 0.30)
		elif direction_index == 1:
			wall_minimum = Vector3(0.70, 0.20, 0.23)
			wall_maximum = Vector3(0.77, 0.45, 0.77)
		elif direction_index == 2:
			wall_minimum = Vector3(0.23, 0.20, 0.70)
			wall_maximum = Vector3(0.77, 0.45, 0.77)
		else:
			wall_minimum = Vector3(0.23, 0.20, 0.23)
			wall_maximum = Vector3(0.30, 0.45, 0.77)
		_emit_box(
			snapshot, origin, wall_minimum, wall_maximum, id,
			vertices, normals, colors, uvs, uv2s, collision)


static func chute_connection_mask(
		snapshot: Dictionary, x: int, y: int, z: int, facing: int) -> int:
	return int(chute_connection_profile(snapshot, x, y, z, facing)["mask"]) & 15


static func chute_connection_profile(
		snapshot: Dictionary, x: int, y: int, z: int, facing: int) -> Dictionary:
	var origin := Vector3i(x, y, z)
	return ForgeConnectionResolver.resolve(
		origin, facing,
		func(position: Vector3i) -> bool:
			var neighbor_id := _get_block(
				snapshot, position.x, position.y, position.z)
			return _is_item_connector(snapshot, neighbor_id))


static func _has_slope(slopes: Dictionary) -> bool:
	for value in slopes.values():
		if int(value) != 0:
			return true
	return false


static func _emit_stepped_chute(
		snapshot: Dictionary, origin: Vector3, id: int,
		east_west: bool, slopes: Dictionary,
		vertices: PackedVector3Array, normals: PackedVector3Array,
		colors: PackedColorArray, uvs: PackedVector2Array,
		uv2s: PackedVector2Array, collision: PackedVector3Array) -> void:
	var negative_index := 3 if east_west else 0
	var positive_index := 1 if east_west else 2
	var negative_height := float(slopes.get(negative_index, 0)) * 0.5
	var positive_height := float(slopes.get(positive_index, 0)) * 0.5
	var steps := 4
	for step in steps:
		var start := float(step) / steps
		var finish := float(step + 1) / steps
		var height := lerpf(negative_height, positive_height, (start + finish) * 0.5)
		var minimum := Vector3.ZERO
		var maximum := Vector3.ZERO
		if east_west:
			minimum = Vector3(start, 0.08 + height, 0.30)
			maximum = Vector3(finish, 0.20 + height, 0.70)
		else:
			minimum = Vector3(0.30, 0.08 + height, start)
			maximum = Vector3(0.70, 0.20 + height, finish)
		_emit_box(
			snapshot, origin, minimum, maximum, id,
			vertices, normals, colors, uvs, uv2s, collision)
		if east_west:
			for rail_z in [0.23, 0.70]:
				_emit_box(
					snapshot, origin,
					Vector3(start, 0.20 + height, rail_z),
					Vector3(finish, 0.45 + height, rail_z + 0.07), id,
					vertices, normals, colors, uvs, uv2s, collision)
		else:
			for rail_x in [0.23, 0.70]:
				_emit_box(
					snapshot, origin,
					Vector3(rail_x, 0.20 + height, start),
					Vector3(rail_x + 0.07, 0.45 + height, finish), id,
					vertices, normals, colors, uvs, uv2s, collision)


static func _emit_rotated_box(
		snapshot: Dictionary, origin: Vector3, minimum: Vector3,
		maximum: Vector3, id: int, facing: int,
		vertices: PackedVector3Array, normals: PackedVector3Array,
		colors: PackedColorArray, uvs: PackedVector2Array,
		uv2s: PackedVector2Array, collision: PackedVector3Array,
		color_override: Color = Color(-1.0, -1.0, -1.0, -1.0),
		collision_enabled: bool = true) -> void:
	var rotated_min := minimum
	var rotated_max := maximum
	match posmod(facing, 4):
		1:
			rotated_min = Vector3(1.0 - maximum.z, minimum.y, minimum.x)
			rotated_max = Vector3(1.0 - minimum.z, maximum.y, maximum.x)
		2:
			rotated_min = Vector3(
				1.0 - maximum.x, minimum.y, 1.0 - maximum.z)
			rotated_max = Vector3(
				1.0 - minimum.x, maximum.y, 1.0 - minimum.z)
		3:
			rotated_min = Vector3(minimum.z, minimum.y, 1.0 - maximum.x)
			rotated_max = Vector3(maximum.z, maximum.y, 1.0 - minimum.x)
	_emit_box(
		snapshot, origin, rotated_min, rotated_max, id,
		vertices, normals, colors, uvs, uv2s, collision,
		color_override, collision_enabled)


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
	var uv00 := _face_uv(c00, axis, sign_value)
	var uv10 := _face_uv(c10, axis, sign_value)
	var uv11 := _face_uv(c11, axis, sign_value)
	var uv01 := _face_uv(c01, axis, sign_value)
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
		uv2s.append(Vector2(
			_material_layer(snapshot, id, axis, sign_value), 0.0))


static func _emit_forge_mesh(
		snapshot: Dictionary, origin: Vector3, id: int, facing: int,
		vertices: PackedVector3Array, normals: PackedVector3Array,
		colors: PackedColorArray, uvs: PackedVector2Array,
		uv2s: PackedVector2Array, collision: PackedVector3Array) -> void:
	var meshes: Dictionary = snapshot.get("forge_meshes", {})
	var source: Dictionary = meshes.get(id, {})
	if source.is_empty():
		_emit_box(
			snapshot, origin, Vector3.ZERO, Vector3.ONE, id,
			vertices, normals, colors, uvs, uv2s, collision)
		return
	var source_vertices: PackedVector3Array = source.get(
		"vertices", PackedVector3Array())
	var source_normals: PackedVector3Array = source.get(
		"normals", PackedVector3Array())
	var source_colors: PackedColorArray = source.get(
		"colors", PackedColorArray())
	var source_uvs: PackedVector2Array = source.get(
		"uvs", PackedVector2Array())
	var source_indices: PackedInt32Array = source.get(
		"indices", PackedInt32Array())
	var palette: PackedColorArray = snapshot["colors"]
	var fallback := palette[id] \
		if id >= 0 and id < palette.size() else Color(1, 0, 1)
	var element_count := source_indices.size() \
		if not source_indices.is_empty() else source_vertices.size()
	for element_index in element_count:
		var source_index := int(source_indices[element_index]) \
			if not source_indices.is_empty() else element_index
		if source_index < 0 or source_index >= source_vertices.size():
			continue
		var vertex := _rotate_forge_point(
			source_vertices[source_index], facing) + origin
		vertices.append(vertex)
		collision.append(vertex)
		var normal := source_normals[source_index] \
			if source_index < source_normals.size() else Vector3.UP
		normals.append(_rotate_forge_normal(normal, facing))
		colors.append(
			source_colors[source_index]
			if source_index < source_colors.size() else fallback)
		uvs.append(
			source_uvs[source_index]
			if source_index < source_uvs.size() else Vector2.ZERO)
		uv2s.append(Vector2(_material_layer(snapshot, id), 0.0))


static func _rotate_forge_point(point: Vector3, facing: int) -> Vector3:
	match posmod(facing, 4):
		1:
			return Vector3(1.0 - point.z, point.y, point.x)
		2:
			return Vector3(1.0 - point.x, point.y, 1.0 - point.z)
		3:
			return Vector3(point.z, point.y, 1.0 - point.x)
	return point


static func _rotate_forge_normal(normal: Vector3, facing: int) -> Vector3:
	match posmod(facing, 4):
		1:
			return Vector3(-normal.z, normal.y, normal.x)
		2:
			return Vector3(-normal.x, normal.y, -normal.z)
		3:
			return Vector3(normal.z, normal.y, -normal.x)
	return normal
