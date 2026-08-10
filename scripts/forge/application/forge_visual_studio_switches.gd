class_name ForgeVisualStudioSwitches
extends RefCounted
## Local internal rollout switches. They never enter source documents or runtime
## products, and the canonical form editor remains available when disabled.

const PREFERENCES_PATH := "user://leyforge/forge/visual_studios.cfg"
const DEFAULTS := {
	"structures": true,
	"characters": true,
	"vfx": true,
	"audio": true,
	"library": true,
	"test_delivery": true,
}


static func is_enabled(studio_id: String) -> bool:
	var config := ConfigFile.new()
	if config.load(PREFERENCES_PATH) != OK:
		return bool(DEFAULTS.get(studio_id, false))
	return bool(config.get_value("visual_studios", studio_id,
		DEFAULTS.get(studio_id, false)))


static func set_enabled(studio_id: String, enabled: bool) -> int:
	var config := ConfigFile.new()
	config.load(PREFERENCES_PATH)
	config.set_value("visual_studios", studio_id, enabled)
	return config.save(PREFERENCES_PATH)
