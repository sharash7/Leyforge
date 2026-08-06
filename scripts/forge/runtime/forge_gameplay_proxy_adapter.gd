class_name ForgeGameplayProxyAdapter
extends RefCounted
## Builds non-authoritative collision/readback nodes from proxy contracts.


func build(
		actor: ForgeRuntimeActor,
		profile: ForgeGameplayProxyProfile) -> Dictionary:
	if actor == null or profile == null or actor.entity_definition == null \
			or actor.entity_definition.entity_definition_id != profile.entity_definition_id:
		return {"ok": false, "reason": "profile_entity_mismatch"}
	var root := Node3D.new()
	root.name = "ForgeGameplayProxy"
	root.set_meta("presentation_only", true)
	root.set_meta("forge_gameplay_proxy_profile_id",
		profile.gameplay_proxy_profile_id)
	actor.add_child(root)
	var body := StaticBody3D.new()
	body.name = "PresentationCollisionReadback"
	body.collision_layer = 0
	body.collision_mask = 0
	root.add_child(body)
	var shape_node := CollisionShape3D.new()
	shape_node.shape = _shape(profile)
	body.add_child(shape_node)
	for region in profile.region_proxies:
		var marker := Marker3D.new()
		marker.name = ForgeId.safe_filename(str(region.get("role_id", "region")))
		marker.position = region.get("local_position", Vector3.ZERO)
		marker.set_meta("forge_region_role_id", region.get("role_id", ""))
		root.add_child(marker)
	return {
		"ok": true,
		"proxy_profile_id": profile.gameplay_proxy_profile_id,
		"collision_shape": profile.collision_shape,
		"region_count": profile.region_proxies.size(),
		"presentation_only": true,
	}


func _shape(profile: ForgeGameplayProxyProfile) -> Shape3D:
	if profile.collision_shape == "box":
		var shape := BoxShape3D.new()
		shape.size = profile.collision_size_meters
		return shape
	if profile.collision_shape == "sphere":
		var shape := SphereShape3D.new()
		shape.radius = maxf(profile.collision_size_meters.x,
			profile.collision_size_meters.z) * 0.5
		return shape
	var shape := CapsuleShape3D.new()
	shape.radius = maxf(profile.collision_size_meters.x,
		profile.collision_size_meters.z) * 0.5
	shape.height = maxf(profile.collision_size_meters.y, shape.radius * 2.0)
	return shape
