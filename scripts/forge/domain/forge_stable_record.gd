class_name ForgeStableRecord
extends RefCounted
## Canonical serialisation shared by Set 22 foundation Resources.


static func normalise(value: Variant) -> Variant:
	if value is Dictionary:
		var keys: Array = value.keys()
		keys.sort_custom(func(a: Variant, b: Variant) -> bool:
			return str(a) < str(b))
		var out := {}
		for key in keys:
			out[key] = normalise(value[key])
		return out
	if value is Array:
		var out: Array = []
		for child in value:
			out.append(normalise(child))
		return out
	if value is PackedStringArray:
		return Array(value)
	if value is Vector3i:
		return [value.x, value.y, value.z]
	if value is Vector3:
		return [value.x, value.y, value.z]
	return value


static func serialise(record: Dictionary) -> String:
	return JSON.stringify(normalise(record))


static func hash_record(record: Dictionary) -> String:
	return serialise(record).sha256_text()


static func normalise_json_data(value: Variant) -> Variant:
	## JSON.parse_string() represents JSON integers as floats. Restore integral
	## values before hashing artifacts emitted by non-Godot tooling so their
	## canonical JSON digest is portable across both toolchains.
	if value is Dictionary:
		var keys: Array = value.keys()
		keys.sort_custom(func(a: Variant, b: Variant) -> bool:
			return str(a) < str(b))
		var out := {}
		for key in keys:
			out[key] = normalise_json_data(value[key])
		return out
	if value is Array:
		var out: Array = []
		for child in value:
			out.append(normalise_json_data(child))
		return out
	if value is float and is_equal_approx(value, round(value)):
		return int(value)
	return value


static func hash_json_record(record: Dictionary) -> String:
	return JSON.stringify(normalise_json_data(record)).sha256_text()
