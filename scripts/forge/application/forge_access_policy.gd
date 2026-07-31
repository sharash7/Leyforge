class_name ForgeAccessPolicy
extends RefCounted
## Central gate for developer-only authoring and file-writing capabilities.

static var test_override: Variant = null


static func is_development_enabled() -> bool:
	if test_override is bool:
		return bool(test_override)
	if OS.has_feature("editor") or OS.has_feature("development"):
		return true
	var channel := str(ProjectSettings.get_setting(
		"application/config/release_channel", ""))
	return OS.is_debug_build() and channel == "dev"


static func can_author() -> bool:
	return is_development_enabled()


static func can_approve() -> bool:
	return is_development_enabled()


static func clear_test_override() -> void:
	test_override = null
