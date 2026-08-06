@tool
class_name ForgeProjectManifest
extends Resource

@export var schema_id := "leyforge.forge.project-manifest"
@export var schema_version := 2
@export var project_id := "forge.project.leyforge"
@export var display_name := "Leyforge"
@export var contract_version := "22-foundation-v1"
@export var feature_contract_versions: Dictionary = {
	"set20": "20H-v0.2",
	"set22": "22-stage1-v1",
	"set22_stage2": "22-stage2-v1",
	"set22_stage3": "22-stage3-v1",
	"set23": "23-foundation-v1",
	"set23_spatial": "23-spatial-v1",
	"set23_events": "23-events-v1",
	"set23_vfx_runtime": "23-vfx-runtime-v1",
	"set23_audio_runtime": "23-audio-runtime-v1",
	"set23_material_runtime": "23-material-runtime-v1",
	"set23_production_library": "23-production-library-v1",
	"set23_runtime_registry": "23-runtime-registry-v1",
	"set23_multiplayer": "23-replication-v1",
	"set23_test_laboratory": "23-test-laboratory-v1",
}
@export var lifecycle := "foundation"
@export var supported_schema_ids: PackedStringArray = []
@export var semantic_registry_paths: PackedStringArray = []
@export var source_roots: PackedStringArray = []
@export var generated_roots: PackedStringArray = []
@export var migration_inventory_paths: PackedStringArray = []
@export var capture_profile_ids: PackedStringArray = []
@export var dependency_ids: PackedStringArray = []
@export var engine_feature := "4.6"
@export var rendering_method := "gl_compatibility"
@export var bake_schema_version := 1
@export var runtime_registry_version := 1
@export var generated_product_policy := "replaceable_output"


func to_record() -> Dictionary:
	return {
		"schema": schema_id,
		"schema_version": schema_version,
		"project_id": project_id,
		"display_name": display_name,
		"contract_version": contract_version,
		"feature_contract_versions": feature_contract_versions.duplicate(true),
		"lifecycle": lifecycle,
		"supported_schema_ids": Array(supported_schema_ids),
		"semantic_registry_paths": Array(semantic_registry_paths),
		"source_roots": Array(source_roots),
		"generated_roots": Array(generated_roots),
		"migration_inventory_paths": Array(migration_inventory_paths),
		"capture_profile_ids": Array(capture_profile_ids),
		"dependency_ids": Array(dependency_ids),
		"engine_feature": engine_feature,
		"rendering_method": rendering_method,
		"bake_schema_version": bake_schema_version,
		"runtime_registry_version": runtime_registry_version,
		"generated_product_policy": generated_product_policy,
	}


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
