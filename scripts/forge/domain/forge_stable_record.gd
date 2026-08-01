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
