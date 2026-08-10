class_name ForgeStructureVoxelValidationService
extends RefCounted
## Validates visually authored building cells without rewriting unresolved data.


func validate(source: ForgeStructureVoxelSource, target_id: String) \
		-> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if source == null:
		return [_diag("STR-VOX-001", ForgeDiagnostic.ERROR, target_id,
			"Visual structure mode has no voxel source.")]
	if source.schema_version != 1 or source.dimensions.x <= 0 \
			or source.dimensions.y <= 0 or source.dimensions.z <= 0:
		diagnostics.append(_diag("STR-VOX-001", ForgeDiagnostic.ERROR,
			target_id, "Structure voxel source bounds are invalid."))
	var stages := {}
	for stage_id in source.stage_ids:
		var normalized := str(stage_id)
		if normalized.is_empty() or stages.has(normalized):
			diagnostics.append(_diag("STR-STAGE-001", ForgeDiagnostic.ERROR,
				target_id, "Construction stage IDs must be present and unique."))
		stages[normalized] = true
	if stages.is_empty():
		diagnostics.append(_diag("STR-STAGE-001", ForgeDiagnostic.ERROR,
			target_id, "Visual structures require at least one construction stage."))
	var block_ids := {}
	for record in ForgeRegistryBridge.new().all_gameplay_records():
		if str(record.get("kind", "")) == "block":
			block_ids[str(record.get("gameplay_id", ""))] = true
	var ids := {}
	var positions := {}
	for cell in source.cells:
		if cell == null:
			diagnostics.append(_diag("STR-VOX-002", ForgeDiagnostic.ERROR,
				target_id, "Structure voxel source contains an empty cell record."))
			continue
		var position_key := "%d,%d,%d" % [
			cell.position.x, cell.position.y, cell.position.z]
		if cell.cell_id.is_empty() or ids.has(cell.cell_id):
			diagnostics.append(_diag("STR-VOX-002", ForgeDiagnostic.CRITICAL,
				target_id, "Structure cell identity is missing or duplicated."))
		ids[cell.cell_id] = true
		if positions.has(position_key):
			diagnostics.append(_diag("STR-VOX-003", ForgeDiagnostic.CRITICAL,
				target_id, "Two structure cells occupy the same grid position."))
		positions[position_key] = true
		if not source.contains(cell.position):
			diagnostics.append(_diag("STR-VOX-004", ForgeDiagnostic.ERROR,
				cell.cell_id, "Structure cell lies outside the declared source bounds."))
		if not block_ids.has(cell.block_id):
			diagnostics.append(_diag("STR-BLOCK-001", ForgeDiagnostic.ERROR,
				cell.cell_id,
				"Structure cell references a missing canonical block: %s" % cell.block_id))
		var placed_index := source.stage_ids.find(cell.placed_stage_id)
		var removed_index := source.stage_ids.find(cell.removed_stage_id) \
			if not cell.removed_stage_id.is_empty() else -1
		if placed_index < 0:
			diagnostics.append(_diag("STR-STAGE-002", ForgeDiagnostic.ERROR,
				cell.cell_id, "Structure cell placement stage does not exist."))
		if not cell.removed_stage_id.is_empty() and removed_index < 0:
			diagnostics.append(_diag("STR-STAGE-002", ForgeDiagnostic.ERROR,
				cell.cell_id, "Structure cell removal stage does not exist."))
		elif removed_index >= 0 and removed_index <= placed_index:
			diagnostics.append(_diag("STR-STAGE-003", ForgeDiagnostic.ERROR,
				cell.cell_id, "A structure cell cannot be removed before it is placed."))
	return diagnostics


func validate_deltas(
		deltas: Array[ForgeConstructionDelta], target_id: String) \
		-> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	var stages := {}
	var sequence_values := {}
	for delta in deltas:
		if delta == null:
			continue
		if delta.stage_id.is_empty() or stages.has(delta.stage_id):
			diagnostics.append(_diag("STR-STAGE-001", ForgeDiagnostic.ERROR,
				target_id, "Construction stage identity is missing or duplicated."))
		stages[delta.stage_id] = delta
		if delta.schema_version >= 2:
			if delta.sequence_index < 0 or sequence_values.has(delta.sequence_index):
				diagnostics.append(_diag("STR-STAGE-004", ForgeDiagnostic.ERROR,
					delta.stage_id, "Construction stage sequence is invalid or duplicated."))
			sequence_values[delta.sequence_index] = true
	for delta in deltas:
		if delta == null:
			continue
		for dependency_id in delta.dependency_stage_ids:
			if not stages.has(dependency_id):
				diagnostics.append(_diag("STR-STAGE-005", ForgeDiagnostic.ERROR,
					delta.stage_id, "Construction stage dependency is missing."))
				continue
			var dependency: ForgeConstructionDelta = stages[dependency_id]
			if delta.schema_version >= 2 and dependency.schema_version >= 2 \
					and dependency.sequence_index >= delta.sequence_index:
				diagnostics.append(_diag("STR-STAGE-006", ForgeDiagnostic.ERROR,
					delta.stage_id, "Construction stage dependency creates a cycle."))
	return diagnostics


func _diag(code: String, severity: String, target_id: String,
		message: String) -> ForgeDiagnostic:
	return ForgeDiagnostic.create(code, severity, target_id, message)
