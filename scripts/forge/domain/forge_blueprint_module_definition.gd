@tool
class_name ForgeBlueprintModuleDefinition
extends Resource
## Reusable semantic/physical Blueprint Forge module source.

const CONTRACT_VERSION := "22-stage5-v1"

@export var schema_version := 1
@export var module_id := ""
@export var display_name := ""
@export var module_kind := "assembly"
@export var elements: Array[ForgeBlueprintElement] = []
@export_enum("elements", "voxel_grid") var physical_authoring_mode := "elements"
@export var structure_voxel_source: ForgeStructureVoxelSource
@export var connectors: Array[ForgeBlueprintConnectorDefinition] = []
@export var aliases: PackedStringArray = []
@export var dependency_ids: PackedStringArray = []
@export var lifecycle := "runtime_candidate"
@export var contract_version := CONTRACT_VERSION


func to_record() -> Dictionary:
	var records: Array[Dictionary] = []
	for element in elements:
		if element != null:
			records.append(element.to_record())
	var connector_records: Array[Dictionary] = []
	for connector in connectors:
		if connector != null:
			connector_records.append(connector.to_record())
	var record := {
		"schema": "leyforge.forge.blueprint-module-definition",
		"schema_version": schema_version,
		"module_id": module_id,
		"display_name": display_name,
		"module_kind": module_kind,
		"elements": records,
		"connectors": connector_records,
		"aliases": Array(aliases),
		"dependency_ids": Array(dependency_ids),
		"lifecycle": lifecycle,
		"contract_version": contract_version,
	}
	if schema_version >= 2 or physical_authoring_mode != "elements" \
			or structure_voxel_source != null:
		record["physical_authoring_mode"] = physical_authoring_mode
		record["structure_voxel_source"] = structure_voxel_source.to_record() \
			if structure_voxel_source != null else {}
	return record


func canonical_hash() -> String:
	return ForgeStableRecord.hash_record(to_record())
