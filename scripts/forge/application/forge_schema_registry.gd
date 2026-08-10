class_name ForgeSchemaRegistry
extends RefCounted
## Narrow schema lookup used by both Entity and Blueprint Forge foundations.

const SUPPORTED := {
	"leyforge.forge.project-manifest": {"version": 2, "domain": "shared"},
	"leyforge.forge.semantic-registry": {"version": 1, "domain": "shared"},
	"leyforge.forge.entity-presentation": {"version": 1, "domain": "entity"},
	"leyforge.forge.entity-definition": {"version": 1, "domain": "entity"},
	"leyforge.forge.body-plan": {"version": 1, "domain": "entity"},
	"leyforge.forge.body-part": {"version": 1, "domain": "entity"},
	"leyforge.forge.density-profile": {"version": 1, "domain": "entity"},
	"leyforge.forge.blueprint-definition": {"version": 2, "domain": "blueprint"},
	"leyforge.forge.blueprint-element": {"version": 1, "domain": "blueprint"},
	"leyforge.forge.construction-delta": {"version": 2, "domain": "blueprint"},
	"leyforge.forge.structure-voxel-source": {
		"version": 1, "domain": "blueprint_authoring"},
	"leyforge.forge.structure-voxel-cell": {
		"version": 1, "domain": "blueprint_authoring"},
	"leyforge.forge.placement-profile": {"version": 1, "domain": "blueprint"},
	"leyforge.forge.blueprint-material-role-set": {
		"version": 1, "domain": "blueprint"},
	"leyforge.forge.blueprint-module-definition": {
		"version": 2, "domain": "blueprint_runtime"},
	"leyforge.forge.blueprint-connector-definition": {
		"version": 1, "domain": "blueprint_authoring"},
	"leyforge.forge.blueprint-module-set": {
		"version": 1, "domain": "blueprint_authoring"},
	"leyforge.forge.procedural-structure-rule-set": {
		"version": 1, "domain": "blueprint_authoring"},
	"leyforge.forge.blueprint-state-definition": {
		"version": 1, "domain": "blueprint_runtime"},
	"leyforge.forge.blueprint-runtime-product": {
		"version": 1, "domain": "blueprint_runtime"},
	"leyforge.forge.blueprint-instance-snapshot": {
		"version": 1, "domain": "blueprint_runtime"},
	"leyforge.forge.migration-record": {"version": 2, "domain": "shared"},
	"leyforge.forge.content-pack": {"version": 2, "domain": "shared"},
	"leyforge.forge.presentation-profile": {
		"version": 1, "domain": "presentation"},
	"leyforge.forge.presentation-binding": {
		"version": 1, "domain": "presentation"},
	"leyforge.forge.presentation-event-contract": {
		"version": 1, "domain": "presentation"},
	"leyforge.forge.presentation-state-contract": {
		"version": 1, "domain": "presentation"},
	"leyforge.forge.presentation-parameter-contract": {
		"version": 1, "domain": "presentation"},
	"leyforge.forge.presentation-context-schema": {
		"version": 1, "domain": "presentation"},
	"leyforge.forge.spatial-reference": {
		"version": 1, "domain": "presentation"},
	"leyforge.forge.vfx-definition": {
		"version": 1, "domain": "presentation"},
	"leyforge.forge.vfx-family": {
		"version": 1, "domain": "presentation"},
	"leyforge.forge.vfx-graph": {
		"version": 1, "domain": "presentation"},
	"leyforge.forge.vfx-form": {
		"version": 1, "domain": "presentation"},
	"leyforge.forge.surface-layer": {
		"version": 1, "domain": "presentation"},
	"leyforge.forge.sound-event": {
		"version": 1, "domain": "presentation"},
	"leyforge.forge.sound-source": {
		"version": 1, "domain": "presentation"},
	"leyforge.forge.synth-patch": {
		"version": 1, "domain": "presentation"},
	"leyforge.forge.audio-family": {
		"version": 1, "domain": "presentation"},
	"leyforge.forge.spatial-audio-profile": {
		"version": 1, "domain": "presentation"},
	"leyforge.forge.material-response-table": {
		"version": 1, "domain": "presentation"},
	"leyforge.forge.acoustic-profile": {
		"version": 1, "domain": "presentation"},
	"leyforge.forge.mix-snapshot": {
		"version": 1, "domain": "presentation"},
	"leyforge.forge.presentation-budget-profile": {
		"version": 1, "domain": "presentation"},
	"leyforge.forge.accessibility-profile": {
		"version": 1, "domain": "presentation"},
	"leyforge.forge.presentation-test-scenario": {
		"version": 1, "domain": "presentation"},
	"leyforge.forge.rig-joint": {
		"version": 1, "domain": "entity_runtime"},
	"leyforge.forge.rig-role-binding": {
		"version": 1, "domain": "entity_runtime"},
	"leyforge.forge.rig-profile": {
		"version": 1, "domain": "entity_runtime"},
	"leyforge.forge.entity-assembly-profile": {
		"version": 1, "domain": "entity_runtime"},
	"leyforge.forge.actor-snapshot": {
		"version": 1, "domain": "entity_runtime"},
	"leyforge.forge.spatial-map": {
		"version": 1, "domain": "spatial_runtime"},
	"leyforge.forge.runtime-contact": {
		"version": 1, "domain": "spatial_runtime"},
	"leyforge.forge.animation-event-marker": {
		"version": 1, "domain": "animation_runtime"},
	"leyforge.forge.entity-animation-clip": {
		"version": 1, "domain": "animation_runtime"},
	"leyforge.forge.entity-animation-library": {
		"version": 1, "domain": "animation_runtime"},
	"leyforge.forge.retarget-map": {
		"version": 1, "domain": "animation_runtime"},
	"leyforge.forge.foot-placement-profile": {
		"version": 1, "domain": "animation_runtime"},
	"leyforge.forge.equipment-fit-profile": {
		"version": 1, "domain": "entity_customisation_runtime"},
	"leyforge.forge.entity-variant-profile": {
		"version": 1, "domain": "entity_customisation_runtime"},
	"leyforge.forge.gameplay-proxy-profile": {
		"version": 1, "domain": "entity_customisation_runtime"},
	"leyforge.forge.presentation-trace": {
		"version": 1, "domain": "event_runtime"},
	"leyforge.forge.compiled-vfx-product": {
		"version": 1, "domain": "vfx_runtime"},
	"leyforge.forge.compiled-sound-plan": {
		"version": 1, "domain": "audio_runtime"},
	"leyforge.forge.acoustic-zone-graph": {
		"version": 1, "domain": "acoustic_runtime"},
	"leyforge.forge.ambience-plan": {
		"version": 1, "domain": "acoustic_runtime"},
	"leyforge.forge.persistent-surface-record": {
		"version": 1, "domain": "surface_runtime"},
	"leyforge.forge.persistent-surface-state": {
		"version": 1, "domain": "surface_runtime"},
	"leyforge.forge.world-presentation-state": {
		"version": 1, "domain": "world_presentation_runtime"},
	"leyforge.forge.presentation-library-manifest": {
		"version": 1, "domain": "presentation_production"},
	"leyforge.forge.runtime-registry-generation": {
		"version": 1, "domain": "presentation_runtime_registry"},
	"leyforge.forge.creator-bake-receipt": {
		"version": 1, "domain": "creator_runtime"},
	"leyforge.forge.procedural-structure-product": {
		"version": 1, "domain": "blueprint_runtime"},
	"leyforge.forge.approval-batch-manifest": {
		"version": 1, "domain": "production_governance"},
}

var _records: Dictionary = {}


func _init() -> void:
	for schema_id in SUPPORTED:
		var record: Dictionary = SUPPORTED[schema_id].duplicate(true)
		record["id"] = schema_id
		_records[schema_id] = record


func load_and_validate(manifest: ForgeProjectManifest) -> Dictionary:
	var diagnostics: Array[Dictionary] = []
	if manifest == null:
		diagnostics.append(_diagnostic(
			"EFB-SCHEMA-001", "critical", "", "Project manifest is missing."))
		return {"ok": false, "diagnostics": diagnostics}
	for schema_id in manifest.supported_schema_ids:
		if not has(schema_id):
			diagnostics.append(_diagnostic(
				"EFB-SCHEMA-001", "error", schema_id,
				"Manifest requests an unsupported schema."))
	return {"ok": diagnostics.is_empty(), "diagnostics": diagnostics}


func resolve(schema_id: String) -> Dictionary:
	return _records.get(schema_id, {}).duplicate(true)


func has(schema_id: String) -> bool:
	return _records.has(schema_id)


func filtered_list(domain := "") -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	for record in _records.values():
		if domain.is_empty() or str(record.get("domain", "")) == domain:
			out.append(record.duplicate(true))
	out.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return str(a.get("id", "")) < str(b.get("id", "")))
	return out


func _diagnostic(code: String, severity: String, target_id: String,
		message: String) -> Dictionary:
	return {
		"code": code,
		"severity": severity,
		"target_id": target_id,
		"message": message,
	}
