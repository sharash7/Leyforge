@tool
class_name ForgeAcousticZoneGraph
extends ForgePresentationDefinition
## Authored acoustic zones and bounded portal connectivity for one structure.

@export var owner_blueprint_id := ""
@export var zones: Array[Dictionary] = []
@export var portals: Array[Dictionary] = []
@export_range(1, 8) var maximum_path_depth := 4
@export var exterior_zone_id := "acoustic.zone.exterior"


func _init() -> void:
	schema_id = "leyforge.forge.acoustic-zone-graph"
	asset_class = "acoustic_zone_graph"


func to_record() -> Dictionary:
	return _record({
		"owner_blueprint_id": owner_blueprint_id,
		"zones": zones.duplicate(true),
		"portals": portals.duplicate(true),
		"maximum_path_depth": maximum_path_depth,
		"exterior_zone_id": exterior_zone_id,
	})
