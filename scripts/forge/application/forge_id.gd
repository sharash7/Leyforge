class_name ForgeId
extends RefCounted

const PREFIXES: PackedStringArray = [
	"forge_asset.", "presentation.", "material.", "palette.", "clip.",
	"statebinding.", "contract.", "variantset.", "override.", "pack.",
]


static func is_valid(value: String, required_prefix := "") -> bool:
	if value.is_empty() or value != value.to_lower():
		return false
	if required_prefix != "" and not value.begins_with(required_prefix):
		return false
	for character in value:
		if not (
				character >= "a" and character <= "z"
				or character >= "0" and character <= "9"
				or character in [".", "_", "-"]):
			return false
	return ".." not in value and not value.ends_with(".")


static func source_id_for(gameplay_id: String) -> String:
	return "forge_asset.%s" % gameplay_id


static func presentation_id_for(gameplay_id: String) -> String:
	return "presentation.%s" % gameplay_id


static func safe_filename(value: String) -> String:
	var result := value.to_lower()
	for character in [".", "/", "\\", ":", " "]:
		result = result.replace(character, "_")
	return result
