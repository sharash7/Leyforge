@tool
class_name ForgeSpatialReference
extends ForgePresentationDefinition

const TYPES: PackedStringArray = [
	"anchor", "socket", "region", "path", "mask", "zone", "portal",
	"runtime_anchor",
]

@export var owner_asset_id := ""
@export var spatial_type := "anchor"
@export var semantic_role_id := ""
@export var coordinate_space := "owner_local"
@export var mapping_mode := "coordinate_bound"
@export var local_position := Vector3.ZERO
@export var local_rotation_degrees := Vector3.ZERO
@export var local_scale := Vector3.ONE
@export var required_status := "optional"
@export var approximation_policy := "declared_fallback_only"
@export var fallback_reference_id := ""
@export var mirror_partner_id := ""
@export var point_records: Array[Dictionary] = []
@export var variant_mappings: Array[Dictionary] = []
@export var lod_mappings: Array[Dictionary] = []
@export var compatibility_version := 1


func _init() -> void:
	schema_id = "leyforge.forge.spatial-reference"
	asset_class = "spatial_reference"


func to_record() -> Dictionary:
	return _record({
		"owner_asset_id": owner_asset_id,
		"spatial_type": spatial_type,
		"semantic_role_id": semantic_role_id,
		"coordinate_space": coordinate_space,
		"mapping_mode": mapping_mode,
		"local_position": local_position,
		"local_rotation_degrees": local_rotation_degrees,
		"local_scale": local_scale,
		"required_status": required_status,
		"approximation_policy": approximation_policy,
		"fallback_reference_id": fallback_reference_id,
		"mirror_partner_id": mirror_partner_id,
		"point_records": point_records.duplicate(true),
		"variant_mappings": variant_mappings.duplicate(true),
		"lod_mappings": lod_mappings.duplicate(true),
		"compatibility_version": compatibility_version,
	})
