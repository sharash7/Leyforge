class_name ForgeId
extends RefCounted

const PREFIXES: PackedStringArray = [
	"forge_asset.", "presentation.", "material.", "palette.", "clip.",
	"statebinding.", "contract.", "variantset.", "override.", "pack.",
	"pattern.", "entity.definition.", "entity.body_plan.",
	"entity.body_part.", "entity.rig.", "entity.animation_set.",
	"entity.customisation.", "entity.equipment_profile.",
	"entity.contract.", "blueprint.leyforge.", "blueprint.module.",
	"blueprint.material_role_set.", "blueprint.construction_profile.",
	"blueprint.placement_profile.", "marker.role.", "zone.role.",
	"socket.role.", "network.role.", "material_role.", "entity_role.",
	"capture.profile.", "density.profile.", "anatomy.role.", "template.",
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


static func is_supported_family(value: String) -> bool:
	for prefix in PREFIXES:
		if value.begins_with(prefix):
			return true
	return false


static func family_for(value: String) -> String:
	for prefix in PREFIXES:
		if value.begins_with(prefix):
			return prefix
	return ""
