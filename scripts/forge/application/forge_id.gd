class_name ForgeId
extends RefCounted

const PREFIXES: PackedStringArray = [
	"presentation.profile.", "presentation.binding.",
	"presentation.library.", "registry.presentation.", "capture.presentation.",
	"presentation.contract.", "presentation.", "event.", "state.",
	"parameter.", "context.schema.", "vfx.effect.", "vfx.family.",
	"vfx.graph.", "vfx.form.", "vfx.", "sound.event.", "sound.family.",
	"sound.source.", "sound.", "surface.layer.", "surface.",
	"material.presentation.", "acoustic.profile.", "acoustic.zone.",
	"acoustic.portal.", "acoustic.", "audio.snapshot.", "audio.bus.",
	"budget.profile.", "access.profile.", "test.presentation.",
	"pack.presentation.", "migration.presentation.", "spatial.reference.",
	"spatial.map.",
	"anchor.", "socket.", "region.", "path.", "mask.", "zone.",
	"portal.audio.", "runtime_anchor.",
	"forge_asset.", "material.", "palette.", "clip.",
	"statebinding.", "contract.", "variantset.", "override.", "pack.",
	"pattern.", "entity.definition.", "entity.body_plan.",
	"entity.body_part.", "entity.rig.", "entity.animation_set.",
	"entity.customisation.", "entity.equipment_profile.",
	"entity.contract.", "entity.assembly_profile.",
	"entity.animation.clip.", "entity.retarget_map.",
	"entity.foot_placement.", "entity.variant.",
	"entity.gameplay_proxy.",
	"blueprint.leyforge.", "blueprint.module.",
	"blueprint.material_role_set.", "blueprint.construction_profile.",
	"blueprint.placement_profile.", "blueprint.state.",
	"marker.role.", "zone.role.",
	"socket.role.", "network.role.", "material_role.", "entity_role.",
	"capture.profile.", "density.profile.", "anatomy.role.", "template.",
	"runtime.vfx.", "runtime.sound.", "runtime.blueprint.",
	"surface.record.",
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


static func canonical_id(value: String, aliases: Dictionary = {}) -> String:
	var current := value
	var visited := {}
	while aliases.has(current) and not visited.has(current):
		visited[current] = true
		current = str(aliases[current])
	return current


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
