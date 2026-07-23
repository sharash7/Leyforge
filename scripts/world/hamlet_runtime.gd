class_name HamletRuntime
extends Node3D
## Promotes persistent NPC records into nearby actors and demotes them back to
## record-only simulation outside the hamlet's local range.

const NpcActorScript = preload("res://scripts/world/hamlet_npc_actor.gd")
const ACTOR_RANGE := 92.0
const DEMOTE_RANGE := 108.0
const BUILDER_ID := "npc.poc.forest_hamlet.builder_talia"
const BUILD_INTERVAL := 0.32
const BUILDER_WORK_RADIUS := 7.5

var world: VoxelWorld
var player: Player
var configured := false
var _actors: Dictionary = {}
var _visual_stage := -1
var _build_accumulator := 0.0


func configure(p_world: VoxelWorld, p_player: Player) -> void:
	world = p_world
	player = p_player
	configured = world != null and player != null
	if configured:
		_refresh_actor_lod()


func _process(delta: float) -> void:
	if not configured or not HamletState.initialized:
		return
	HamletState.advance_time(delta)
	_refresh_actor_lod()
	_sync_completed_project_stages()
	_advance_builder_construction(delta)


func _sync_completed_project_stages() -> void:
	if _actors.is_empty():
		return
	var completed_stages := HamletState.PROJECT_STAGES.size() \
		if bool(HamletState.project.get("complete", false)) \
		else maxi(0, int(HamletState.project.get("stage_index", 1)) - 1)
	if completed_stages == _visual_stage:
		return
	if world.apply_watchtower_project_stage(completed_stages):
		_visual_stage = completed_stages


func _advance_builder_construction(delta: float) -> void:
	if not HamletState.project_is_building() or not _actors.has(BUILDER_ID):
		_build_accumulator = 0.0
		return
	var actor: HamletNpcActor = _actors[BUILDER_ID]
	if not is_instance_valid(actor):
		return
	var builder_record := HamletState.get_npc_record(BUILDER_ID)
	if str(builder_record.get("schedule_state", "")) != "work":
		_build_accumulator = 0.0
		return
	var work: Array = builder_record.get("work", [])
	if work.size() < 2:
		return
	var work_target := Vector2(float(work[0]) + 0.5, float(work[1]) + 0.5)
	var builder_position := Vector2(actor.global_position.x, actor.global_position.z)
	if builder_position.distance_to(work_target) > BUILDER_WORK_RADIUS:
		_build_accumulator = 0.0
		return
	var stage_index := int(HamletState.project.get("stage_index", 1))
	var placements := world.get_watchtower_stage_placements(stage_index)
	if placements.is_empty():
		return
	HamletState.set_project_stage_total(placements.size())
	var placement_index := int(HamletState.project.get("placed_blocks", 0))
	if placement_index >= placements.size():
		return
	_build_accumulator += delta
	if _build_accumulator < BUILD_INTERVAL:
		return
	_build_accumulator = 0.0
	actor.play_action("build", 0.55)
	if world.place_watchtower_stage_block(stage_index, placement_index):
		HamletState.record_project_block_placed(placements.size())


func _refresh_actor_lod() -> void:
	var hamlet := Vector3(
		float(HamletState.hamlet_anchor.x) + 0.5,
		player.global_position.y,
		float(HamletState.hamlet_anchor.y) + 0.5)
	var distance := player.global_position.distance_to(hamlet)
	if distance <= ACTOR_RANGE:
		for npc_id in HamletState.get_npc_ids():
			if _actors.has(npc_id) or not bool(
					HamletState.get_npc_record(npc_id).get("alive", true)):
				continue
			var actor: HamletNpcActor = NpcActorScript.new()
			actor.setup(world, npc_id)
			add_child(actor)
			_actors[npc_id] = actor
	elif distance >= DEMOTE_RANGE:
		for npc_id in _actors.keys():
			var actor: HamletNpcActor = _actors[npc_id]
			if is_instance_valid(actor):
				HamletState.update_npc_position(str(npc_id), actor.global_position)
				actor.queue_free()
		_actors.clear()


func active_actor_count() -> int:
	return _actors.size()
