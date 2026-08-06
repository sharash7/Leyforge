class_name ForgePresentationProductionValidationService
extends RefCounted
## Production-library and runtime-publication contract validation.

const REQUIRED_TARGETS := {
	"vfx_catalogue": 178,
	"sound_events": 300,
	"presentation_profiles": 150,
	"material_profiles": 24,
	"spatial_templates": 12,
	"acoustic_profiles": 22,
	"ambience_components": 36,
	"accessibility_profiles": 24,
	"budget_profiles": 16,
	"test_scenarios": 20,
}


func validate_library_manifest(
		manifest: ForgePresentationLibraryManifest) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if manifest == null:
		diagnostics.append(_diagnostic(
			"PAK-001", ForgeDiagnostic.CRITICAL, "",
			"Presentation production library manifest is missing."))
		return diagnostics
	if manifest.schema_version != 1 \
			or manifest.contract_version != ForgePresentationLibraryManifest.CONTRACT_VERSION:
		diagnostics.append(_diagnostic(
			"REG-002", ForgeDiagnostic.ERROR, manifest.library_id,
			"Presentation production library schema is unsupported."))
	if not ForgeId.is_valid(manifest.library_id, "presentation.library."):
		diagnostics.append(_diagnostic(
			"REG-001", ForgeDiagnostic.ERROR, manifest.library_id,
			"Presentation production library ID is invalid."))
	for key in REQUIRED_TARGETS:
		if int(manifest.target_counts.get(key, -1)) != int(REQUIRED_TARGETS[key]):
			diagnostics.append(_diagnostic(
				"PAK-002", ForgeDiagnostic.ERROR, manifest.library_id,
				"Presentation catalogue target is missing or differs: %s" % key))
		var ids: Array = manifest.catalogue_ids.get(key, [])
		if ids.size() != int(REQUIRED_TARGETS[key]):
			diagnostics.append(_diagnostic(
				"PAK-002", ForgeDiagnostic.ERROR, manifest.library_id,
				"Presentation catalogue membership is incomplete: %s" % key))
		elif _has_duplicate(ids):
			diagnostics.append(_diagnostic(
				"REG-001", ForgeDiagnostic.ERROR, manifest.library_id,
				"Presentation catalogue membership contains duplicates: %s" % key))
	if manifest.audio_source_count_is_completion_gate \
			or manifest.audio_source_planning_range != Vector2i(700, 1100):
		diagnostics.append(_diagnostic(
			"SRC-002", ForgeDiagnostic.ERROR, manifest.library_id,
			"Audio-source planning guidance was incorrectly made a completion gate."))
	for gate in ["visual", "listening", "accessibility", "rights",
			"performance_tier", "owner"]:
		if str(manifest.review_gates.get(gate, "")) != "open":
			diagnostics.append(_diagnostic(
				"PAK-003", ForgeDiagnostic.ERROR, manifest.library_id,
				"Human evidence gate must remain explicitly open: %s" % gate))
	return diagnostics


func validate_generation(
		generation: ForgeRuntimeRegistryGeneration) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if generation == null or generation.schema_version != 1 \
			or generation.contract_version != ForgeRuntimeRegistryGeneration.CONTRACT_VERSION:
		diagnostics.append(_diagnostic(
			"REG-002", ForgeDiagnostic.ERROR, "",
			"Runtime registry generation schema is unsupported."))
		return diagnostics
	if not ForgeId.is_valid(generation.generation_id, "registry.presentation."):
		diagnostics.append(_diagnostic(
			"REG-001", ForgeDiagnostic.ERROR, generation.generation_id,
			"Runtime registry generation ID is invalid."))
	var ids := {}
	for record in generation.records:
		var source_id := ForgeRuntimeRegistryGeneration._record_id(record)
		if source_id.is_empty() or ids.has(source_id):
			diagnostics.append(_diagnostic(
				"REG-001", ForgeDiagnostic.CRITICAL, source_id,
				"Runtime registry source ID is missing or duplicated."))
		else:
			ids[source_id] = true
	for alias_id in generation.aliases:
		var target_id := str(generation.aliases[alias_id])
		if alias_id == target_id or not ids.has(target_id):
			diagnostics.append(_diagnostic(
				"REG-004", ForgeDiagnostic.ERROR, str(alias_id),
				"Runtime registry alias is self-directed or unresolved."))
	if _dictionary_cycle(generation.aliases):
		diagnostics.append(_diagnostic(
			"REG-004", ForgeDiagnostic.ERROR, generation.generation_id,
			"Runtime registry aliases contain a cycle."))
	return diagnostics


func _has_duplicate(values: Array) -> bool:
	var seen := {}
	for value in values:
		var key := str(value)
		if seen.has(key):
			return true
		seen[key] = true
	return false


func _dictionary_cycle(edges: Dictionary) -> bool:
	for source in edges:
		var current := str(source)
		var visited := {}
		while edges.has(current):
			if visited.has(current):
				return true
			visited[current] = true
			current = str(edges[current])
	return false


func _diagnostic(code: String, severity: String, target_id: String,
		message: String) -> ForgeDiagnostic:
	return ForgeDiagnostic.create(code, severity, target_id, message)
