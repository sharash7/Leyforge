extends RefCounted
## Reusable deterministic acceptance checks for the Phase 02 exit gate.
## Summer probes or future CI can call validate_seeds() without a scene change.

const ValleyPlanScript = preload("res://scripts/world/valley_plan.gd")
const VoxelWorldScript = preload("res://scripts/world/voxel_world.gd")


static func validate_seeds(seeds: Array[int]) -> Dictionary:
	var failures: Array[Dictionary] = []
	var fallback_count := 0
	var plan_ids := {}
	for seed_value in seeds:
		var first: RefCounted = ValleyPlanScript.new()
		first.generate(seed_value)
		var second: RefCounted = ValleyPlanScript.new()
		second.generate(seed_value)
		if first.identity() != second.identity():
			failures.append({"seed": seed_value, "errors": ["plan_is_not_deterministic"]})
			continue
		if first.fallback_used:
			fallback_count += 1
		var world: Node3D = VoxelWorldScript.new()
		world._resolve_ids()
		world.world_seed = seed_value
		world.valley_plan = first
		world._seed_noises()
		world._cache_anchor_heights()
		world._prepare_plan_runtime()
		var errors: Array[String] = world.validate_worldgen()
		if not errors.is_empty():
			failures.append({"seed": seed_value, "errors": errors})
		plan_ids[str(seed_value)] = first.identity()
		world.free()
	return {
		"passed": failures.is_empty(),
		"seed_count": seeds.size(),
		"fallback_count": fallback_count,
		"failures": failures,
		"plan_ids": plan_ids,
	}
