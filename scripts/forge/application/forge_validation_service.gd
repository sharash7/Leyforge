class_name ForgeValidationService
extends RefCounted


func validate_entity_definition_source(
		entity: ForgeEntityDefinition,
		semantic_registry: ForgeSemanticRegistry = null,
		density_registry: ForgeDensityProfileRegistry = null) \
		-> Array[ForgeDiagnostic]:
	return ForgeFoundationValidationService.new().validate_entity_definition(
		entity, semantic_registry, density_registry)


func validate_entity_source(
		entity: ForgeEntityPresentation,
		semantic_registry: ForgeSemanticRegistry = null) -> Array[ForgeDiagnostic]:
	return ForgeFoundationValidationService.new().validate_entity(
		entity, semantic_registry)


func validate_blueprint_source(
		blueprint: ForgeBlueprintDefinition,
		semantic_registry: ForgeSemanticRegistry = null) -> Array[ForgeDiagnostic]:
	return ForgeFoundationValidationService.new().validate_blueprint(
		blueprint, semantic_registry)


func validate_body_plan_source(
		body_plan: ForgeBodyPlanDefinition,
		semantic_registry: ForgeSemanticRegistry = null,
		density_registry: ForgeDensityProfileRegistry = null) \
		-> Array[ForgeDiagnostic]:
	return ForgeFoundationValidationService.new().validate_body_plan(
		body_plan, semantic_registry, density_registry)


func validate_body_part_source(
		part: ForgeBodyPartDefinition,
		body_plan: ForgeBodyPlanDefinition = null,
		semantic_registry: ForgeSemanticRegistry = null,
		density_registry: ForgeDensityProfileRegistry = null) \
		-> Array[ForgeDiagnostic]:
	return ForgeFoundationValidationService.new().validate_body_part(
		part, body_plan, semantic_registry, density_registry)


func validate_density_profile_source(
		profile: ForgeDensityProfile) -> Array[ForgeDiagnostic]:
	return ForgeFoundationValidationService.new().validate_density_profile(profile)


func validate_blueprint_material_role_set_source(
		role_set: ForgeBlueprintMaterialRoleSet,
		semantic_registry: ForgeSemanticRegistry = null) \
		-> Array[ForgeDiagnostic]:
	return ForgeFoundationValidationService.new().validate_material_role_set(
		role_set, semantic_registry)


func validate_placement_profile_source(
		profile: ForgePlacementProfile,
		semantic_registry: ForgeSemanticRegistry = null) -> Array[ForgeDiagnostic]:
	return ForgeFoundationValidationService.new().validate_placement_profile(
		profile, semantic_registry)


func validate_asset(
		asset: ForgeAssetDefinition,
		contract: ForgePresentationContract = null) -> Array[ForgeDiagnostic]:
	var diagnostics: Array[ForgeDiagnostic] = []
	if asset == null:
		diagnostics.append(ForgeDiagnostic.create(
			"FORGE-SCHEMA-001", ForgeDiagnostic.ERROR, "",
			"No Forge asset is open.", "Validation cannot continue."))
		return diagnostics
	if asset.schema_version != ForgeAssetDefinition.CURRENT_SCHEMA_VERSION:
		diagnostics.append(ForgeDiagnostic.create(
			"FORGE-SCHEMA-001", ForgeDiagnostic.ERROR, asset.forge_asset_id,
			"Unsupported Forge asset schema.",
			"The source cannot be approved until migrated.",
			"Run the registered source migration.", "schema_version"))
	if not ForgeId.is_valid(asset.forge_asset_id, "forge_asset."):
		diagnostics.append(ForgeDiagnostic.create(
			"FORGE-ID-001", ForgeDiagnostic.ERROR, asset.forge_asset_id,
			"Forge asset ID is invalid.",
			"The asset cannot be indexed or approved.",
			"Use a lower-case namespaced ID.", "forge_asset_id"))
	if not ForgeId.is_valid(asset.presentation_id, "presentation."):
		diagnostics.append(ForgeDiagnostic.create(
			"FORGE-ID-002", ForgeDiagnostic.ERROR, asset.forge_asset_id,
			"Presentation ID is invalid.",
			"Runtime resolution cannot find this presentation.",
			"Assign a stable presentation.* ID.", "presentation_id"))
	if asset.gameplay_links.is_empty():
		diagnostics.append(ForgeDiagnostic.create(
			"FORGE-REGISTRY-001", ForgeDiagnostic.WARNING, asset.forge_asset_id,
			"Asset is not linked to a gameplay definition.",
			"It remains an unlinked presentation draft.",
			"Link a block/item definition or document the visual-only asset."))
	if asset.surface_set == null and asset.voxel_volume == null \
			and asset.parts.is_empty():
		diagnostics.append(ForgeDiagnostic.create(
			"FORGE-GEO-001", ForgeDiagnostic.ERROR, asset.forge_asset_id,
			"Asset has no visible authoring source.",
			"No mesh or surface product can be baked.",
			"Add a surface set, voxel volume or compound part."))
	if asset.uses_surface_authoring():
		var surface: ForgeSurfaceSet = asset.surface_set
		if surface.width != 32 or surface.height != 32:
			diagnostics.append(ForgeDiagnostic.create(
				"FORGE-MAT-010", ForgeDiagnostic.WARNING, asset.forge_asset_id,
				"Standard block surfaces are not 32 x 32.",
				"The asset needs an approved non-standard profile.",
				"Return to 32 x 32 or document the exception."))
	if asset.uses_voxel_authoring():
		var volume: ForgeVoxelVolume = asset.voxel_volume
		var dimensions := volume.dimensions
		if dimensions.x > 64 or dimensions.y > 64 or dimensions.z > 64:
			diagnostics.append(ForgeDiagnostic.create(
				"FORGE-GEO-010", ForgeDiagnostic.WARNING, asset.forge_asset_id,
				"Voxel volume exceeds the normal MVP bounds.",
				"Interactive baking and memory use may exceed the target.",
				"Split the asset into bounded compound parts."))
		if volume.occupied_count() == 0:
			diagnostics.append(ForgeDiagnostic.create(
				"FORGE-GEO-001", ForgeDiagnostic.ERROR, asset.forge_asset_id,
				"Voxel model contains no occupied cells.",
				"No mesh can be baked.", "Add visible voxels."))
	_validate_parts_and_sockets(asset, diagnostics)
	_validate_animation_and_states(asset, diagnostics)
	if asset.collision_profile is ForgeCollisionProfile \
			and asset.collision_profile.boxes.is_empty():
		diagnostics.append(ForgeDiagnostic.create(
			"FORGE-COLL-001", ForgeDiagnostic.WARNING, asset.forge_asset_id,
			"Collision profile has no authored boxes.",
			"Placement may fall back to visual mesh collision.",
			"Author a bounded collision box set.", "collision_profile"))
	_validate_footprint(asset, diagnostics)
	if contract != null:
		_validate_contract(asset, contract, diagnostics)
	return diagnostics


func _validate_footprint(
		asset: ForgeAssetDefinition,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	if not asset.footprint_profile is ForgeFootprintProfile:
		diagnostics.append(ForgeDiagnostic.create(
			"FORGE-FOOT-001", ForgeDiagnostic.ERROR, asset.forge_asset_id,
			"Asset has no placement footprint.",
			"World placement and blueprint occupancy are undefined.",
			"Author an occupied-cell footprint.", "footprint_profile"))
		return
	var footprint: ForgeFootprintProfile = asset.footprint_profile
	if footprint.occupied_cells.is_empty():
		diagnostics.append(ForgeDiagnostic.create(
			"FORGE-FOOT-001", ForgeDiagnostic.ERROR, asset.forge_asset_id,
			"Placement footprint contains no occupied cells.",
			"The asset could overlap other world objects.",
			"Add the anchor and every occupied grid cell.",
			"footprint_profile"))
		return
	if footprint.anchor_cell not in footprint.occupied_cells:
		diagnostics.append(ForgeDiagnostic.create(
			"FORGE-FOOT-002", ForgeDiagnostic.ERROR, asset.forge_asset_id,
			"Footprint anchor is not an occupied cell.",
			"Rotation and placement would use an unoccupied origin.",
			"Add the anchor cell or choose an occupied anchor.",
			"footprint_profile"))
	var unique := {}
	for cell in footprint.occupied_cells:
		if unique.has(cell):
			diagnostics.append(ForgeDiagnostic.create(
				"FORGE-FOOT-003", ForgeDiagnostic.WARNING,
				asset.forge_asset_id,
				"Placement footprint contains duplicate occupied cells.",
				"Coverage and rotation checks can become ambiguous.",
				"Remove duplicate cells.", "footprint_profile"))
			break
		unique[cell] = true
	var is_door := false
	for gameplay_id in asset.gameplay_links:
		if ".door." in gameplay_id and "trapdoor" not in gameplay_id:
			is_door = true
			break
	if is_door:
		var upper_cell := footprint.anchor_cell + Vector3i.UP
		if upper_cell not in footprint.occupied_cells:
			diagnostics.append(ForgeDiagnostic.create(
				"FORGE-FOOT-004", ForgeDiagnostic.ERROR,
				asset.forge_asset_id,
				"Door footprint is not two world cells tall.",
				"The upper half could overlap another placed block.",
				"Use the Tall 1 x 2 footprint preset.",
				"footprint_profile"))


func has_blockers(diagnostics: Array[ForgeDiagnostic]) -> bool:
	for diagnostic in diagnostics:
		if diagnostic.severity in [ForgeDiagnostic.ERROR, ForgeDiagnostic.CRITICAL]:
			return true
	return false


func summarize(diagnostics: Array[ForgeDiagnostic]) -> Dictionary:
	var summary := {
		"info": 0, "warning": 0, "error": 0, "critical": 0,
	}
	for diagnostic in diagnostics:
		summary[diagnostic.severity] = int(
			summary.get(diagnostic.severity, 0)) + 1
	return summary


func _validate_contract(
		asset: ForgeAssetDefinition, contract: ForgePresentationContract,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	var part_keys: Array[String] = []
	var socket_keys: Array[String] = []
	var state_fields: Array[String] = []
	for part_resource in asset.parts:
		if part_resource is ForgePartDefinition:
			var part: ForgePartDefinition = part_resource
			part_keys.append(part.part_key)
	for socket_resource in asset.sockets:
		if socket_resource is ForgeSocketDefinition:
			var socket: ForgeSocketDefinition = socket_resource
			socket_keys.append(socket.socket_key)
	for required_part in contract.required_parts:
		if required_part not in part_keys:
			diagnostics.append(ForgeDiagnostic.create(
				"FORGE-CONTRACT-001", ForgeDiagnostic.ERROR,
				asset.forge_asset_id,
				"Required part %s is missing." % required_part,
				"Animation or interaction using this part cannot resolve.",
				"Add or remap the part.", "parts"))
	for required_socket in contract.required_sockets:
		if required_socket not in socket_keys:
			diagnostics.append(ForgeDiagnostic.create(
				"FORGE-CONTRACT-002", ForgeDiagnostic.ERROR,
				asset.forge_asset_id,
				"Required socket %s is missing." % required_socket,
				"Gameplay presentation cannot attach at the required location.",
				"Add or remap the socket.", "sockets"))
	if asset.state_binding is ForgeStateBindingDefinition:
		for binding in asset.state_binding.bindings:
			var field := str(binding.get("field", ""))
			if not field.is_empty() and field not in state_fields:
				state_fields.append(field)
	for required_state in contract.required_states:
		if required_state not in state_fields:
			diagnostics.append(ForgeDiagnostic.create(
				"FORGE-STATE-001", ForgeDiagnostic.ERROR,
				asset.forge_asset_id,
				"Required runtime state %s is not bound." % required_state,
				"The presentation cannot communicate an authoritative state.",
				"Add a one-way state binding.", "state_binding"))
	if not contract.footprint_profile_id.is_empty():
		var actual_footprint_id: String = (
			asset.footprint_profile.footprint_profile_id
			if asset.footprint_profile is ForgeFootprintProfile else "")
		if actual_footprint_id != contract.footprint_profile_id:
			diagnostics.append(ForgeDiagnostic.create(
				"FORGE-CONTRACT-010", ForgeDiagnostic.CRITICAL,
				asset.forge_asset_id,
				"Placement footprint does not match the presentation contract.",
				"Existing placements or blueprint occupancy could become invalid.",
				"Restore the contract footprint or register a migration.",
				"footprint_profile"))


func _validate_parts_and_sockets(
		asset: ForgeAssetDefinition,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	var part_keys := {}
	for resource in asset.parts:
		if not resource is ForgePartDefinition:
			continue
		var part: ForgePartDefinition = resource
		if part.part_key.is_empty() or part_keys.has(part.part_key):
			diagnostics.append(ForgeDiagnostic.create(
				"FORGE-PART-001", ForgeDiagnostic.ERROR,
				asset.forge_asset_id,
				"Part keys must be non-empty and unique.",
				"Animation targets cannot resolve deterministically.",
				"Rename the duplicate part.", "parts"))
		part_keys[part.part_key] = true
	var socket_keys := {}
	for resource in asset.sockets:
		if not resource is ForgeSocketDefinition:
			continue
		var socket: ForgeSocketDefinition = resource
		if socket.socket_key.is_empty() or socket_keys.has(socket.socket_key):
			diagnostics.append(ForgeDiagnostic.create(
				"FORGE-SOCKET-001", ForgeDiagnostic.ERROR,
				asset.forge_asset_id,
				"Socket keys must be non-empty and unique.",
				"Effects, audio or logistics attachments are ambiguous.",
				"Rename the duplicate socket.", "sockets"))
		socket_keys[socket.socket_key] = true
		if not socket.parent_part_key.is_empty() \
				and not part_keys.has(socket.parent_part_key):
			diagnostics.append(ForgeDiagnostic.create(
				"FORGE-SOCKET-002", ForgeDiagnostic.ERROR,
				asset.forge_asset_id,
				"Socket parent part is missing.",
				"The socket cannot follow its intended part.",
				"Choose an existing parent part.", "sockets"))


func _validate_animation_and_states(
		asset: ForgeAssetDefinition,
		diagnostics: Array[ForgeDiagnostic]) -> void:
	var part_keys := {}
	for resource in asset.parts:
		if resource is ForgePartDefinition:
			part_keys[resource.part_key] = true
	if asset.animation_set is ForgeAnimationSet:
		var clip_ids := {}
		for clip in asset.animation_set.clips:
			var clip_id := str(clip.get("clip_id", ""))
			if clip_id.is_empty() or clip_ids.has(clip_id):
				diagnostics.append(ForgeDiagnostic.create(
					"FORGE-ANIM-001", ForgeDiagnostic.ERROR,
					asset.forge_asset_id,
					"Animation clip IDs must be non-empty and unique.",
					"Runtime clip lookup is ambiguous.",
					"Rename the duplicate clip.", "animation_set"))
			clip_ids[clip_id] = true
			for track in clip.get("tracks", []):
				var target := str(track.get("target", ""))
				var node_path := target.get_slice(":", 0)
				var node_name := node_path.get_slice("/", 0).to_snake_case()
				if not node_name.is_empty() and not part_keys.has(node_name) \
						and node_name not in [
							"static_geometry", "frame_geometry"]:
					diagnostics.append(ForgeDiagnostic.create(
						"FORGE-ANIM-002", ForgeDiagnostic.ERROR,
						asset.forge_asset_id,
						"Animation target %s does not resolve." % target,
						"The baked clip cannot control its intended part.",
						"Retarget the track to a stable part key.",
						"animation_set"))
		for resource in asset.animation_set.voxel_frame_clips:
			if not resource is ForgeVoxelFrameClip:
				diagnostics.append(ForgeDiagnostic.create(
					"FORGE-FRAME-002", ForgeDiagnostic.ERROR,
					asset.forge_asset_id,
					"Voxel-frame clip contains an invalid source resource.",
					"The clip cannot produce runtime frame meshes.",
					"Replace it with a ForgeVoxelFrameClip.",
					"animation_set"))
				continue
			var frame_clip: ForgeVoxelFrameClip = resource
			if frame_clip.clip_id.is_empty() \
					or clip_ids.has(frame_clip.clip_id):
				diagnostics.append(ForgeDiagnostic.create(
					"FORGE-FRAME-001", ForgeDiagnostic.ERROR,
					asset.forge_asset_id,
					"Voxel-frame clip IDs must be non-empty and unique.",
					"Runtime frame lookup is ambiguous.",
					"Rename the duplicate frame clip.", "animation_set"))
			clip_ids[frame_clip.clip_id] = true
			if frame_clip.frames.is_empty():
				diagnostics.append(ForgeDiagnostic.create(
					"FORGE-FRAME-001", ForgeDiagnostic.ERROR,
					asset.forge_asset_id,
					"Voxel-frame clip has no frames.",
					"No shape-changing animation can be baked.",
					"Add at least one bounded voxel frame.", "animation_set"))
				continue
			var expected_dimensions := Vector3i.ZERO
			for frame_index in frame_clip.frames.size():
				var frame := frame_clip.frames[frame_index]
				if not frame is ForgeVoxelVolume:
					diagnostics.append(ForgeDiagnostic.create(
						"FORGE-FRAME-002", ForgeDiagnostic.ERROR,
						asset.forge_asset_id,
						"Voxel frame %d has no volume." % frame_index,
						"The frame cannot be baked.",
						"Create or relink the frame volume.", "animation_set"))
					continue
				if expected_dimensions == Vector3i.ZERO:
					expected_dimensions = frame.dimensions
				elif frame.dimensions != expected_dimensions:
					diagnostics.append(ForgeDiagnostic.create(
						"FORGE-FRAME-003", ForgeDiagnostic.ERROR,
						asset.forge_asset_id,
						"Voxel-frame dimensions are inconsistent.",
						"Stable frame playback cannot preserve the effect bounds.",
						"Resize frames to one bounded volume.", "animation_set"))
				if frame.occupied_count() == 0:
					diagnostics.append(ForgeDiagnostic.create(
						"FORGE-FRAME-004", ForgeDiagnostic.ERROR,
						asset.forge_asset_id,
						"Voxel frame %d is empty." % frame_index,
						"The frame has no visible product.",
						"Add visible voxels or remove the frame.",
						"animation_set"))
			if frame_clip.reduced_motion_frame < 0 \
					or frame_clip.reduced_motion_frame >= frame_clip.frames.size():
				diagnostics.append(ForgeDiagnostic.create(
					"FORGE-A11Y-010", ForgeDiagnostic.ERROR,
					asset.forge_asset_id,
					"Voxel-frame clip has no valid reduced-motion fallback.",
					"Reduced-motion playback would lose the visual state.",
					"Select a representative static frame.", "animation_set"))
	if not asset.state_binding is ForgeStateBindingDefinition:
		return
	for binding in asset.state_binding.bindings:
		var actions: Array = binding.get("actions", [])
		var has_audio := false
		var has_visual := false
		for action in actions:
			match str(action.get("type", "")):
				"audio_cue":
					has_audio = true
				"visibility", "animation", "material_parameter", "effect_cue":
					has_visual = true
		if has_audio and not has_visual:
			diagnostics.append(ForgeDiagnostic.create(
				"FORGE-A11Y-001", ForgeDiagnostic.WARNING,
				asset.forge_asset_id,
				"An audio state cue has no paired visual response.",
				"Players who cannot hear the cue may miss the state.",
				"Add text, motion, icon or material feedback.",
				"state_binding"))
