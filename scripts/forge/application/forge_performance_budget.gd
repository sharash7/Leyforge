@tool
class_name ForgePerformanceBudget
extends RefCounted

const LIMITS := {
	"unique_block_triangles": 12000,
	"item_triangles": 8000,
	"compound_triangles": 24000,
	"parts": 24,
	"sockets": 32,
	"animation_clips": 32,
}


func evaluate(
		asset: ForgeAssetDefinition, bake_metrics: Dictionary) -> Array[Dictionary]:
	var findings: Array[Dictionary] = []
	var triangle_limit := int(LIMITS["unique_block_triangles"])
	if asset.asset_kind == "item_model":
		triangle_limit = int(LIMITS["item_triangles"])
	elif asset.asset_kind == "compound_machine":
		triangle_limit = int(LIMITS["compound_triangles"])
	var triangles := int(bake_metrics.get("triangles", 0))
	if triangles > triangle_limit:
		findings.append(_finding(
			"FORGE-PERF-001", "error",
			"Triangle budget exceeded: %d > %d." % [
				triangles, triangle_limit]))
	if asset.parts.size() > int(LIMITS["parts"]):
		findings.append(_finding(
			"FORGE-PERF-002", "warning",
			"Compound part budget exceeded."))
	if asset.sockets.size() > int(LIMITS["sockets"]):
		findings.append(_finding(
			"FORGE-PERF-003", "warning",
			"Socket budget exceeded."))
	if asset.animation_set is ForgeAnimationSet \
			and asset.animation_set.clips.size() > int(LIMITS["animation_clips"]):
		findings.append(_finding(
			"FORGE-PERF-004", "warning",
			"Animation clip budget exceeded."))
	return findings


func _finding(code: String, severity: String, message: String) -> Dictionary:
	return {"code": code, "severity": severity, "message": message}
