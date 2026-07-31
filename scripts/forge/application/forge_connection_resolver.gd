class_name ForgeConnectionResolver
extends RefCounted
## One connection truth for routing, previews and meshing.

const NORTH := 1
const EAST := 2
const SOUTH := 4
const WEST := 8
const UP := 16
const DOWN := 32
const HORIZONTAL_DIRECTIONS: Array[Vector3i] = [
	Vector3i(0, 0, -1),
	Vector3i(1, 0, 0),
	Vector3i(0, 0, 1),
	Vector3i(-1, 0, 0),
]
const HORIZONTAL_BITS: PackedInt32Array = [NORTH, EAST, SOUTH, WEST]


static func item_connection_offsets() -> Array[Vector3i]:
	var offsets: Array[Vector3i] = [Vector3i.UP, Vector3i.DOWN]
	for direction in HORIZONTAL_DIRECTIONS:
		offsets.append(direction)
		offsets.append(direction + Vector3i.UP)
		offsets.append(direction + Vector3i.DOWN)
	return offsets


static func resolve(
		position: Vector3i, facing: int,
		is_connector_at: Callable) -> Dictionary:
	var mask := 0
	var slopes := {}
	for index in HORIZONTAL_DIRECTIONS.size():
		var direction := HORIZONTAL_DIRECTIONS[index]
		var adjacent := position + direction
		if bool(is_connector_at.call(adjacent)):
			mask |= HORIZONTAL_BITS[index]
			slopes[index] = 0
			continue
		if bool(is_connector_at.call(adjacent + Vector3i.UP)):
			mask |= HORIZONTAL_BITS[index] | UP
			slopes[index] = 1
			continue
		if bool(is_connector_at.call(adjacent + Vector3i.DOWN)):
			mask |= HORIZONTAL_BITS[index] | DOWN
			slopes[index] = -1
	if (mask & 15) == 0:
		var forward := posmod(facing, 4)
		var backward := posmod(forward + 2, 4)
		mask |= HORIZONTAL_BITS[forward] | HORIZONTAL_BITS[backward]
		slopes[forward] = 0
		slopes[backward] = 0
	elif _horizontal_count(mask) == 1:
		for index in HORIZONTAL_DIRECTIONS.size():
			if (mask & HORIZONTAL_BITS[index]) != 0:
				var opposite := posmod(index + 2, 4)
				mask |= HORIZONTAL_BITS[opposite]
				slopes[opposite] = 0
				break
	return {
		"mask": mask,
		"slopes": slopes,
		"shape": shape_for_mask(mask),
	}


static func shape_for_mask(mask: int) -> String:
	var horizontal := mask & 15
	var count := _horizontal_count(mask)
	if count <= 1:
		return "endpoint"
	if count == 2:
		if horizontal in [NORTH | SOUTH, EAST | WEST]:
			return "slope" if (mask & (UP | DOWN)) != 0 else "straight"
		return "corner"
	if count == 3:
		return "tee"
	return "cross"


static func _horizontal_count(mask: int) -> int:
	var count := 0
	for bit in HORIZONTAL_BITS:
		if (mask & bit) != 0:
			count += 1
	return count
