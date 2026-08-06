class_name ForgeEquipmentFittingService
extends RefCounted
## Semantic-socket equipment fitting and deterministic release contacts.

var _attachments: Dictionary = {}


func fit(
		actor: ForgeRuntimeActor, profile: ForgeEquipmentFitProfile,
		spatial_resolver: ForgeSpatialResolver) -> Dictionary:
	if actor == null or profile == null or spatial_resolver == null \
			or actor.rig_profile == null \
			or actor.rig_profile.rig_profile_id not in profile.compatible_rig_profile_ids:
		return {"ok": false, "reason": "incompatible_actor_or_profile"}
	var resolved := spatial_resolver.resolve(
		actor.instance_id, profile.socket_role_id)
	if not bool(resolved.get("ok", false)):
		resolved = spatial_resolver.resolve(
			actor.instance_id, profile.fallback_socket_role_id)
	if not bool(resolved.get("ok", false)) or not resolved.has("transform"):
		return {"ok": false, "reason": "socket_unresolved"}
	var attachment := Node3D.new()
	attachment.name = "ForgeEquipment_%s" % ForgeId.safe_filename(
		profile.equipment_profile_id)
	actor.add_child(attachment)
	attachment.global_transform = resolved["transform"]
	attachment.position += profile.local_position
	attachment.rotation_degrees += profile.local_rotation_degrees
	attachment.scale = profile.local_scale
	attachment.set_meta("forge_equipment_asset_id", profile.equipment_asset_id)
	attachment.set_meta("forge_equipment_profile_id", profile.equipment_profile_id)
	_attachments[actor.instance_id] = attachment
	return {
		"ok": true,
		"equipment_profile_id": profile.equipment_profile_id,
		"equipment_asset_id": profile.equipment_asset_id,
		"socket_role_id": profile.socket_role_id,
		"spatial_quality": resolved.get("quality", ""),
	}


func release(
		actor: ForgeRuntimeActor, profile: ForgeEquipmentFitProfile,
		spatial_resolver: ForgeSpatialResolver, event_instance_id: String,
		contact: ForgeRuntimeContactRecord = null) -> Dictionary:
	if actor == null or profile == null:
		return {"ok": false}
	var resolved := spatial_resolver.resolve(
		actor.instance_id, profile.release_spatial_role_id, contact)
	if not bool(resolved.get("ok", false)):
		return {"ok": false, "reason": "release_role_unresolved"}
	var release_contact := contact
	if release_contact == null:
		release_contact = ForgeRuntimeContactRecord.new()
		release_contact.runtime_anchor_id = profile.release_spatial_role_id
		release_contact.event_instance_id = event_instance_id
		release_contact.source_owner_id = actor.instance_id
		release_contact.source_spatial_id = profile.socket_role_id
		release_contact.world_position = (resolved.get("transform") as Transform3D).origin
		release_contact.surface_normal = Vector3.UP
		release_contact.target_region_id = "contact.equipment_release"
		release_contact.lifetime_seconds = 0.5
	return {"ok": true, "contact": release_contact,
		"contact_hash": release_contact.canonical_hash()}


func clear(actor_instance_id: String) -> void:
	var attachment := _attachments.get(actor_instance_id) as Node3D
	if attachment != null:
		attachment.free()
	_attachments.erase(actor_instance_id)
