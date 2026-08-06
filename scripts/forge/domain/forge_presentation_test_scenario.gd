@tool
class_name ForgePresentationTestScenario
extends ForgePresentationDefinition

@export var fixture_ids: PackedStringArray = []
@export var action_records: Array[Dictionary] = []
@export var expected_trace_records: Array[Dictionary] = []
@export var quality_tiers: PackedStringArray = []
@export var accessibility_modes: PackedStringArray = []
@export var duration_seconds := 0.0
@export var manual_review_status := "open"


func _init() -> void:
	schema_id = "leyforge.forge.presentation-test-scenario"
	asset_class = "test_scenario"


func to_record() -> Dictionary:
	return _record({
		"fixture_ids": Array(fixture_ids),
		"action_records": action_records.duplicate(true),
		"expected_trace_records": expected_trace_records.duplicate(true),
		"quality_tiers": Array(quality_tiers),
		"accessibility_modes": Array(accessibility_modes),
		"duration_seconds": duration_seconds,
		"manual_review_status": manual_review_status,
	})
