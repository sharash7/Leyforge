class_name ForgeFootPlacementService
extends RefCounted
## Bounded deterministic foot/contact adjustment. It never changes gameplay state.


func resolve(
		actor: ForgeRuntimeActor, profile: ForgeFootPlacementProfile,
		ground_samples: Dictionary, event_instance_id: String) -> Dictionary:
	if actor == null or profile == null or actor.rig_profile == null \
			or profile.rig_profile_id != actor.rig_profile.rig_profile_id:
		return {"ok": false, "contacts": [], "adjustments": {}}
	if actor.lod_level > profile.lod_max:
		return {"ok": true, "contacts": [], "adjustments": {},
			"fallback": profile.failure_fallback}
	var adjustments := {}
	var contacts: Array[ForgeRuntimeContactRecord] = []
	for role_id in profile.contact_role_ids:
		var node := actor.role_node(role_id)
		var sample: Dictionary = ground_samples.get(role_id, {})
		var confidence := float(sample.get("confidence", 0.0))
		if node == null or confidence < profile.minimum_confidence:
			continue
		var requested_offset := float(sample.get("height_offset", 0.0))
		var bounded_offset := clampf(requested_offset,
			-profile.maximum_offset_meters, profile.maximum_step_height_meters)
		node.position.y += bounded_offset
		adjustments[role_id] = bounded_offset
		var contact := ForgeRuntimeContactRecord.new()
		contact.runtime_anchor_id = "runtime_anchor.movement.foot_contact"
		contact.event_instance_id = "%s:%s" % [event_instance_id, role_id]
		contact.source_owner_id = actor.instance_id
		contact.source_spatial_id = role_id
		contact.world_position = node.global_position
		contact.surface_normal = _normal(sample.get("normal", Vector3.UP))
		contact.target_material_id = str(sample.get(
			"surface_material_id", "material.presentation.unknown"))
		contact.target_region_id = "contact.foot"
		contact.lifetime_seconds = 0.25
		contacts.append(contact)
	return {"ok": true, "contacts": contacts, "adjustments": adjustments,
		"result_hash": ForgeStableRecord.hash_record({
			"actor": actor.instance_id,
			"adjustments": adjustments,
			"contacts": _contact_records(contacts),
		})}


func _normal(value: Variant) -> Vector3:
	var result := value as Vector3 if value is Vector3 else Vector3.UP
	return result.normalized() if result.length_squared() > 0.0 else Vector3.UP


func _contact_records(contacts: Array[ForgeRuntimeContactRecord]) -> Array:
	var records := []
	for contact in contacts:
		records.append(contact.to_record())
	return records
