extends Node
## Authoritative Stage 4 state for the Controlled POC Forest Hamlet.
##
## Nearby NPC actors are only views of these records. Warehouse contents,
## request delivery, reputation, permissions, schedules, and project progress
## remain here when actors or voxel chunks are unloaded.

signal state_changed
signal warehouse_changed
signal requests_changed
signal reputation_changed
signal project_changed
signal npc_changed(npc_id: String)
signal delivery_ledger_changed

const VILLAGE_ID := "village.poc.forest_hamlet"
const WAREHOUSE_SIZE := 54
const MINUTES_PER_REAL_SECOND := 1.0

const REP_STRANGER := "rep.village.stranger"
const REP_HELPFUL := "rep.village.helpful_outsider"
const REP_SUPPLIER := "rep.village.trusted_supplier"
const REP_ALLY := "rep.village.trusted_ally"
const PROJECT_SCHEMA_VERSION := 2

# Each watchtower stage is independently deliverable and reservable. These are
# the exact POC project-recipe quantities from the build documents, split so
# the foundation can begin before frame/platform/finishing stock exists.
const PROJECT_STAGES: Array[Dictionary] = [
	{
		"index": 1,
		"id": "foundation",
		"name": "Foundation",
		"request_id": "request.watchtower.stage.foundation",
		"description": "Stage 1/4: stone footings, starter beams, and foundation fasteners.",
		"reward": 8,
		"requirements": [
			{"kind": "item", "stable_id": "item.material.stone_brick", "count": 24},
			{"kind": "item", "stable_id": "item.material.beam_oak", "count": 8},
			{"kind": "item", "stable_id": "item.material.iron_nails", "count": 8},
		],
	},
	{
		"index": 2,
		"id": "frame",
		"name": "Timber Frame",
		"request_id": "request.watchtower.stage.frame",
		"description": "Stage 2/4: structural beams, planking, and frame fasteners.",
		"reward": 8,
		"requirements": [
			{"kind": "item", "stable_id": "item.material.beam_oak", "count": 20},
			{"kind": "item", "stable_id": "item.material.plank_oak", "count": 12},
			{"kind": "item", "stable_id": "item.material.iron_nails", "count": 8},
		],
	},
	{
		"index": 3,
		"id": "platform",
		"name": "Guard Platform",
		"request_id": "request.watchtower.stage.platform",
		"description": "Stage 3/4: upper masonry, platform boards, and iron reinforcement.",
		"reward": 10,
		"requirements": [
			{"kind": "item", "stable_id": "item.material.stone_brick", "count": 24},
			{"kind": "item", "stable_id": "item.material.plank_oak", "count": 12},
			{"kind": "item", "stable_id": "item.material.iron_plate", "count": 8},
		],
	},
	{
		"index": 4,
		"id": "finishing",
		"name": "Lighting and Inspection",
		"request_id": "request.watchtower.stage.finishing",
		"description": "Stage 4/4: platform lights and final inspection fasteners.",
		"reward": 9,
		"requirements": [
			{"kind": "block", "stable_id": "light.torch.basic", "count": 4},
			{"kind": "item", "stable_id": "item.material.iron_nails", "count": 4},
		],
	},
]

const ROSTER: Array[Dictionary] = [
	{
		"id": "npc.poc.forest_hamlet.elder_rowan",
		"name": "Elder Rowan",
		"job_id": "job.leader.elder",
		"job": "Village Elder",
		"color": Color(0.64, 0.34, 0.18),
		"offset": Vector2i(0, 1),
	},
	{
		"id": "npc.poc.forest_hamlet.builder_talia",
		"name": "Talia Stonehand",
		"job_id": "job.builder.basic",
		"job": "Builder",
		"color": Color(0.78, 0.52, 0.22),
		"offset": Vector2i(3, 1),
	},
	{
		"id": "npc.poc.forest_hamlet.farmer_bram",
		"name": "Bram Reed",
		"job_id": "job.farmer.basic",
		"job": "Farmer",
		"color": Color(0.36, 0.62, 0.24),
		"offset": Vector2i(-4, 3),
	},
	{
		"id": "npc.poc.forest_hamlet.guard_elric",
		"name": "Elric Vale",
		"job_id": "job.guard.militia",
		"job": "Militia Guard",
		"color": Color(0.42, 0.47, 0.56),
		"offset": Vector2i(5, -2),
	},
	{
		"id": "npc.poc.forest_hamlet.merchant_lysa",
		"name": "Lysa Fen",
		"job_id": "job.merchant.basic",
		"job": "Merchant",
		"color": Color(0.52, 0.30, 0.64),
		"offset": Vector2i(-3, -3),
	},
	{
		"id": "npc.poc.forest_hamlet.mage_serin",
		"name": "Serin Ashglow",
		"job_id": "job.mage.apprentice",
		"job": "Village Mage",
		"color": Color(0.34, 0.62, 0.76),
		"offset": Vector2i(-6, 0),
	},
	{
		"id": "npc.poc.forest_hamlet.miner_doran",
		"name": "Doran Flint",
		"job_id": "job.miner.basic",
		"job": "Miner",
		"color": Color(0.40, 0.36, 0.32),
		"offset": Vector2i(2, -5),
	},
	{
		"id": "npc.poc.forest_hamlet.lumberjack_fen",
		"name": "Fen Oakwise",
		"job_id": "job.lumberjack.basic",
		"job": "Lumberjack",
		"color": Color(0.28, 0.48, 0.23),
		"offset": Vector2i(6, 3),
	},
]

var world_seed := 0
var initialized := false
var hamlet_anchor := Vector2i.ZERO
var warehouse_anchor := Vector2i.ZERO
var watchtower_anchor := Vector2i.ZERO
var clock_minutes := 8.0 * 60.0
var day := 1

var npc_records: Dictionary = {}
var warehouse_slots: Array = []
var requests: Dictionary = {}
var request_order: Array[String] = []
var reputation_points := 0
var reputation_state := REP_STRANGER
var permissions: Dictionary = {}
var project: Dictionary = {}
var delivery_ledger: Array[Dictionary] = []
var _automation_correlations: Dictionary = {}
var _needs_accumulator := 0.0


func _ready() -> void:
	_reset_collections()


func _empty_slots(size: int) -> Array:
	var slots: Array = []
	slots.resize(size)
	for i in size:
		slots[i] = {}
	return slots


func _reset_collections() -> void:
	warehouse_slots = _empty_slots(WAREHOUSE_SIZE)
	npc_records.clear()
	requests.clear()
	request_order.clear()
	delivery_ledger.clear()
	_automation_correlations.clear()
	permissions = {
		"request_delivery": false,
		"warehouse_deposit": false,
		"warehouse_view": false,
		"warehouse_withdraw": false,
		"automation_import": false,
	}
	project = {
		"id": "project.watchtower.basic",
		"name": "Forest Watchtower",
		"schema_version": PROJECT_SCHEMA_VERSION,
		"stage": "foundation",
		"stage_index": 1,
		"stage_progress": 0.0,
		"complete": false,
		"awaiting_supplies": true,
		"reserved": {},
		"placed_blocks": 0,
		"total_blocks": 0,
	}


func initialize(seed_value: int, anchors: Dictionary) -> void:
	if initialized and world_seed == seed_value \
			and npc_records.size() == ROSTER.size() \
			and warehouse_slots.size() == WAREHOUSE_SIZE \
			and not requests.is_empty():
		return
	world_seed = seed_value
	initialized = true
	hamlet_anchor = _anchor_from(anchors, "hamlet")
	warehouse_anchor = _anchor_from(anchors, "warehouse")
	watchtower_anchor = _anchor_from(anchors, "watchtower_site")
	clock_minutes = 8.0 * 60.0
	day = 1
	reputation_points = 0
	reputation_state = REP_STRANGER
	_reset_collections()
	_create_roster()
	_create_requests()
	_refresh_permissions()
	state_changed.emit()


func _anchor_from(anchors: Dictionary, key: String) -> Vector2i:
	var value: Variant = anchors.get(key, Vector2i.ZERO)
	if value is Vector2i:
		return value
	if value is Array and value.size() >= 2:
		return Vector2i(int(value[0]), int(value[1]))
	return Vector2i.ZERO


func _create_roster() -> void:
	for definition in ROSTER:
		var offset: Vector2i = definition["offset"]
		var home := hamlet_anchor + offset
		var work := _work_anchor_for(str(definition["job_id"]), home)
		npc_records[str(definition["id"])] = {
			"id": str(definition["id"]),
			"name": str(definition["name"]),
			"job_id": str(definition["job_id"]),
			"job": str(definition["job"]),
			"color": definition["color"].to_html(),
			"position": [float(home.x) + 0.5, 0.0, float(home.y) + 0.5],
			"home": [home.x, home.y],
			"work": [work.x, work.y],
			"schedule_state": "work",
			"alive": true,
			"health": 30.0,
			"max_health": 30.0,
			"injured": false,
			"injury": "",
			"activity": "idle",
			"need_profile": _need_profile_for(str(definition["job_id"])),
			"needs": {
				"food": 0.82,
				"shelter": 1.0,
				"safety": 0.72,
				"morale": 0.76,
				"work_access": 1.0,
			},
			"last_dialogue": "",
		}


func _work_anchor_for(job_id: String, fallback: Vector2i) -> Vector2i:
	if job_id == "job.builder.basic":
		# Keep the builder on the outside of the footprint rather than steering
		# them into the foundation and making their collision body jitter.
		return watchtower_anchor + Vector2i(4, 0)
	if job_id in ["job.leader.elder", "job.merchant.basic"]:
		return hamlet_anchor
	if job_id == "job.guard.militia":
		return hamlet_anchor + Vector2i(5, 0)
	if job_id == "job.farmer.basic":
		return hamlet_anchor + Vector2i(-7, 5)
	if job_id == "job.mage.apprentice":
		return hamlet_anchor + Vector2i(-7, -2)
	if job_id == "job.miner.basic":
		return hamlet_anchor + Vector2i(7, -6)
	if job_id == "job.lumberjack.basic":
		return hamlet_anchor + Vector2i(8, 5)
	return fallback


func _need_profile_for(job_id: String) -> String:
	if job_id == "job.guard.militia":
		return "need.profile.guard"
	if job_id == "job.mage.apprentice":
		return "need.profile.specialist_mage"
	if job_id in [
		"job.builder.basic", "job.farmer.basic",
		"job.miner.basic", "job.lumberjack.basic",
	]:
		return "need.profile.worker"
	return "need.profile.standard_resident"


func _request(id: String, name: String, description: String, requirements: Array,
		reward: int) -> void:
	requests[id] = {
		"id": id,
		"name": name,
		"description": description,
		"requirements": requirements,
		"delivered": {},
		"reward_reputation": reward,
		"complete": false,
	}
	request_order.append(id)


func _ref(kind: String, stable_id: String, count: int) -> Dictionary:
	return {"kind": kind, "stable_id": stable_id, "count": count}


func _create_requests() -> void:
	for definition in PROJECT_STAGES:
		_request(
			str(definition["request_id"]),
			"Stage %d/4 - %s Supplies" % [
				int(definition["index"]), str(definition["name"])],
			str(definition["description"]),
			definition["requirements"].duplicate(true),
			int(definition["reward"]))
	_request(
		"request.hamlet.food",
		"Pantry Restock",
		"Bram asks for a small reserve while everyone works on the tower.",
		[_ref("item", "item.food.wild_berries", 12)],
		5)


func advance_time(delta: float) -> void:
	if not initialized or delta <= 0.0:
		return
	clock_minutes += delta * MINUTES_PER_REAL_SECOND
	while clock_minutes >= 1440.0:
		clock_minutes -= 1440.0
		day += 1
		_consume_daily_food()
	_needs_accumulator += delta
	if _needs_accumulator >= 15.0:
		_needs_accumulator = 0.0
		_refresh_needs()
	var schedule_changed := false
	var current_schedule := get_schedule_state()
	for npc_id in npc_records:
		var record: Dictionary = npc_records[npc_id]
		if str(record.get("schedule_state", "")) != current_schedule:
			record["schedule_state"] = current_schedule
			npc_records[npc_id] = record
			npc_changed.emit(str(npc_id))
			schedule_changed = true
	if schedule_changed:
		state_changed.emit()


func _consume_daily_food() -> void:
	var food_refs := [
		_ref("item", "item.food.village_meal_pack", 1),
		_ref("item", "item.food.simple_stew", 1),
		_ref("item", "item.food.bread", 1),
		_ref("item", "item.food.cooked_meat", 1),
		_ref("item", "item.food.wild_berries", 1),
	]
	var meals := 0
	for _npc_id in get_npc_ids():
		for food_ref in food_refs:
			if warehouse_remove_ref(food_ref, 1):
				meals += 1
				break
	for npc_id in npc_records:
		var record: Dictionary = npc_records[npc_id]
		var needs: Dictionary = record["needs"]
		if meals >= npc_records.size():
			needs["food"] = minf(1.0, float(needs.get("food", 0.8)) + 0.08)
		else:
			needs["food"] = maxf(0.0, float(needs.get("food", 0.8)) - 0.12)
		record["needs"] = needs
		npc_records[npc_id] = record


func _refresh_needs() -> void:
	var tower_complete := bool(project.get("complete", false))
	for npc_id in npc_records:
		var record: Dictionary = npc_records[npc_id]
		var needs: Dictionary = record["needs"]
		needs["safety"] = move_toward(
			float(needs.get("safety", 0.7)), 0.94 if tower_complete else 0.70, 0.01)
		var morale_target := (
			float(needs.get("food", 0.8))
			+ float(needs.get("safety", 0.7))
			+ float(needs.get("shelter", 1.0))
		) / 3.0
		needs["morale"] = move_toward(
			float(needs.get("morale", 0.75)), morale_target, 0.01)
		record["needs"] = needs
		npc_records[npc_id] = record


func get_schedule_state() -> String:
	var minute := int(clock_minutes)
	if minute < 360 or minute >= 1260:
		return "sleep"
	if minute < 480:
		return "morning"
	if minute < 720:
		return "work"
	if minute < 780:
		return "midday"
	if minute < 1020:
		return "work"
	return "social"


func get_clock_text() -> String:
	var hours := int(clock_minutes) / 60
	var minutes := int(clock_minutes) % 60
	return "Day %d  %02d:%02d" % [day, hours, minutes]


func get_npc_ids() -> Array[String]:
	var ids: Array[String] = []
	for definition in ROSTER:
		ids.append(str(definition["id"]))
	return ids


func get_npc_record(npc_id: String) -> Dictionary:
	return npc_records.get(npc_id, {}).duplicate(true)


func update_npc_position(npc_id: String, position: Vector3) -> void:
	if not npc_records.has(npc_id):
		return
	var record: Dictionary = npc_records[npc_id]
	record["position"] = [position.x, position.y, position.z]
	npc_records[npc_id] = record


func update_npc_activity(npc_id: String, activity: String) -> void:
	if not npc_records.has(npc_id):
		return
	var record: Dictionary = npc_records[npc_id]
	if str(record.get("activity", "")) == activity:
		return
	record["activity"] = activity
	npc_records[npc_id] = record
	npc_changed.emit(npc_id)


func apply_npc_damage(
		npc_id: String, amount: float, source: String = "",
		allow_death: bool = false) -> Dictionary:
	if not npc_records.has(npc_id) or amount <= 0.0:
		return {"ok": false}
	var record: Dictionary = npc_records[npc_id]
	if not bool(record.get("alive", true)):
		return {"ok": false}
	var maximum := maxf(1.0, float(record.get("max_health", 30.0)))
	var health := maxf(0.0, float(record.get("health", maximum)) - amount)
	if health <= 0.0 and not allow_death:
		health = 1.0
		record["injured"] = true
		record["injury"] = "Severe raid injury"
	if health <= 0.0 and allow_death:
		record["alive"] = false
		record["activity"] = "fallen"
	else:
		record["activity"] = "hurt"
	record["health"] = health
	record["last_damage_source"] = source
	npc_records[npc_id] = record
	npc_changed.emit(npc_id)
	state_changed.emit()
	return {
		"ok": true,
		"health": health,
		"alive": bool(record.get("alive", true)),
		"injured": bool(record.get("injured", false)),
	}


func apply_raid_aftermath(
		outcome_id: String, injured_ids: Array[String],
		theft_limit: int, reputation_delta: int) -> Array[Dictionary]:
	var injuries := {}
	for injured_id in injured_ids:
		injuries[injured_id] = true
	for npc_id in npc_records:
		var record: Dictionary = npc_records[npc_id]
		if injuries.has(str(npc_id)):
			record["injured"] = true
			record["injury"] = "Recovering after the goblin raid"
			record["health"] = minf(
				float(record.get("health", 30.0)),
				maxf(1.0, float(record.get("max_health", 30.0)) * 0.45))
		record["last_raid_outcome"] = outcome_id
		var needs: Dictionary = record.get("needs", {})
		needs["safety"] = clampf(
			float(needs.get("safety", 0.7))
			+ (0.12 if outcome_id == "prepared_victory" else -0.16),
			0.0, 1.0)
		record["needs"] = needs
		npc_records[npc_id] = record
	var stolen: Array[Dictionary] = []
	var remaining := maxi(0, theft_limit)
	for index in warehouse_slots.size():
		if remaining <= 0:
			break
		var stack: Dictionary = warehouse_slots[index]
		if stack.is_empty():
			continue
		var taken := mini(remaining, int(stack.get("count", 0)))
		var stolen_stack := stack.duplicate(true)
		stolen_stack["count"] = taken
		stolen.append(stolen_stack)
		stack["count"] = int(stack.get("count", 0)) - taken
		warehouse_slots[index] = {} if int(stack["count"]) <= 0 else stack
		remaining -= taken
	reputation_points = maxi(0, reputation_points + reputation_delta)
	_refresh_reputation_state()
	warehouse_changed.emit()
	for injured_id in injured_ids:
		npc_changed.emit(injured_id)
	state_changed.emit()
	return stolen


func get_npc_target(npc_id: String) -> Vector2:
	var record := get_npc_record(npc_id)
	if record.is_empty():
		return Vector2(hamlet_anchor)
	if CombatState.is_raid_active():
		if str(record.get("job_id", "")) == "job.guard.militia":
			return Vector2(float(hamlet_anchor.x) + 5.5, float(hamlet_anchor.y) + 0.5)
		# Non-combatants shelter around the warehouse while the guard intercepts.
		var shelter_hash := absi(npc_id.hash())
		return Vector2(
			float(warehouse_anchor.x) + 0.5 + float(shelter_hash % 3 - 1),
			float(warehouse_anchor.y) + 0.5
				+ float(int(shelter_hash / 7) % 3 - 1))
	var state := str(record.get("schedule_state", "work"))
	var source: Array = record.get("home", [hamlet_anchor.x, hamlet_anchor.y])
	if state == "work":
		source = record.get("work", source)
	elif state in ["morning", "midday", "social"]:
		source = [hamlet_anchor.x, hamlet_anchor.y]
	return Vector2(float(source[0]) + 0.5, float(source[1]) + 0.5)


func get_project_stage_definition(stage_index: int = -1) -> Dictionary:
	var wanted := int(project.get("stage_index", 1)) if stage_index < 0 else stage_index
	for definition in PROJECT_STAGES:
		if int(definition["index"]) == wanted:
			return definition.duplicate(true)
	return {}


func is_project_request(request_id: String) -> bool:
	for definition in PROJECT_STAGES:
		if str(definition["request_id"]) == request_id:
			return true
	return false


func is_request_available(request_id: String) -> bool:
	if not requests.has(request_id):
		return false
	var request: Dictionary = requests[request_id]
	if bool(request.get("complete", false)):
		return false
	if not is_project_request(request_id):
		return true
	if bool(project.get("complete", false)) \
			or not bool(project.get("awaiting_supplies", true)):
		return false
	var current := get_project_stage_definition()
	return not current.is_empty() and str(current["request_id"]) == request_id


func project_is_building() -> bool:
	return not bool(project.get("complete", false)) \
		and not bool(project.get("awaiting_supplies", true))


func project_status_text() -> String:
	if bool(project.get("complete", false)):
		return "Forest Watchtower: Complete (100%)"
	var definition := get_project_stage_definition()
	if definition.is_empty():
		return "Forest Watchtower: Waiting for project data"
	var index := int(definition["index"])
	var name := str(definition["name"])
	if bool(project.get("awaiting_supplies", true)):
		return "Forest Watchtower: Stage %d/4 - %s (awaiting supplies)" % [
			index, name]
	var stage_percent := clampi(
		roundi(float(project.get("stage_progress", 0.0)) * 100.0), 0, 100)
	var overall_percent := clampi(
		roundi((float(index - 1) + float(project.get("stage_progress", 0.0))) / 4.0 * 100.0),
		0, 100)
	return "Forest Watchtower: Stage %d/4 - %s (%d%%; overall %d%%)" % [
		index, name, stage_percent, overall_percent]


func get_dialogue(npc_id: String) -> String:
	var record := get_npc_record(npc_id)
	if record.is_empty():
		return "The villager has nothing to say."
	var job_id := str(record["job_id"])
	if job_id == "job.leader.elder":
		if reputation_state == REP_STRANGER:
			return "Welcome to Hearthplain. Goblins have been scouting us, and a watchtower would buy us time."
		if bool(project.get("complete", false)):
			return "You helped give this hamlet a future. The guard can see danger before it reaches our homes."
		return "The request board shows what the watchtower still needs. Every honest delivery earns trust."
	if job_id == "job.builder.basic":
		if bool(project.get("complete", false)):
			return "The watchtower is complete. Every supplied stage became a real part of the hamlet."
		var definition := get_project_stage_definition()
		if bool(project.get("awaiting_supplies", true)):
			return "The next job is %s. Deliver only this stage's supplies and I can begin." % [
				str(definition.get("name", "the next stage"))]
		return "I am placing the %s blocks one at a time. This stage is at %d%%." % [
			str(definition.get("name", "current stage")),
			roundi(float(project.get("stage_progress", 0.0)) * 100.0)]
	if job_id == "job.farmer.basic":
		return "Work goes easier when the pantry is steady. The board lists what we are short of."
	if job_id == "job.guard.militia":
		if CombatState.phase == "warning":
			return "The horn is sounded. Take position; the goblins are on the raid road."
		if CombatState.phase == "assault":
			return "Hearthplain is under attack. Press F to strike with your held item, or use Spark Bolt."
		if CombatState.phase == "resolved":
			return "The raid ended as %s. %d damaged voxel%s still need Oak Beams." % [
				str(CombatState.outcome.get("title", "an uncertain outcome")),
				CombatState.unresolved_damage_count(),
				"" if CombatState.unresolved_damage_count() == 1 else "s",
			]
		return "A completed watchtower will improve our warning time. Until then, I patrol the road."
	if job_id == "job.merchant.basic":
		return "Trust opens doors here. Help the hamlet first; better trade can follow."
	if job_id == "job.mage.apprentice":
		if reputation_state == REP_STRANGER:
			return "There is mana in this valley, but trust and the hamlet's safety come before deeper study."
		if ProgressionState.has_basic_magic_knowledge():
			return "The Basic Rune links crystal, conduit, furnace, and ward. Keep the source visible and heed every fault."
		return "You have helped Hearthplain. I can teach the Basic Rune, Stone Sense, and Spark Bolt."
	if job_id == "job.miner.basic":
		return "Stone is plentiful near the cave. Good tools turn it into a proper foundation."
	return "Oak from the forest will make a strong frame. Replace what you take when you can."


func accept_introduction() -> bool:
	if reputation_state != REP_STRANGER:
		return false
	reputation_points = maxi(reputation_points, 1)
	reputation_state = REP_HELPFUL
	_refresh_permissions()
	reputation_changed.emit()
	state_changed.emit()
	return true


func _refresh_reputation_state() -> void:
	var previous := reputation_state
	if reputation_points >= 35 or bool(project.get("complete", false)):
		reputation_state = REP_ALLY
	elif reputation_points >= 16:
		reputation_state = REP_SUPPLIER
	elif reputation_points >= 1:
		reputation_state = REP_HELPFUL
	else:
		reputation_state = REP_STRANGER
	_refresh_permissions()
	if reputation_state != previous:
		reputation_changed.emit()


func _refresh_permissions() -> void:
	permissions["request_delivery"] = reputation_state != REP_STRANGER
	permissions["warehouse_deposit"] = reputation_state in [REP_SUPPLIER, REP_ALLY]
	permissions["warehouse_view"] = reputation_state in [REP_SUPPLIER, REP_ALLY]
	permissions["warehouse_withdraw"] = reputation_state == REP_ALLY
	permissions["automation_import"] = reputation_state in [REP_SUPPLIER, REP_ALLY]


func reputation_name() -> String:
	return {
		REP_STRANGER: "Stranger",
		REP_HELPFUL: "Helpful Outsider",
		REP_SUPPLIER: "Trusted Supplier",
		REP_ALLY: "Trusted Ally",
	}.get(reputation_state, "Stranger")


func permission_enabled(permission_id: String) -> bool:
	return bool(permissions.get(permission_id, false))


func get_request(request_id: String) -> Dictionary:
	return requests.get(request_id, {}).duplicate(true)


func get_requests() -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	for request_id in request_order:
		out.append(get_request(request_id))
	return out


func request_progress_text(request_id: String) -> String:
	var request := get_request(request_id)
	if request.is_empty():
		return ""
	var parts: Array[String] = []
	for content_ref in request["requirements"]:
		var stable_id := str(content_ref["stable_id"])
		var delivered := int(request["delivered"].get(stable_id, 0))
		var needed := int(content_ref["count"])
		var stack := Inventory.make_stack_from_ref(content_ref)
		parts.append("%s %d/%d" % [Inventory.stack_name(stack), delivered, needed])
	return ", ".join(parts)


func deliver_request(request_id: String) -> Dictionary:
	## Moves only available missing goods, with warehouse capacity checked before
	## player inventory is mutated. Returns a compact transaction summary.
	if not permission_enabled("request_delivery") or not requests.has(request_id):
		return {"moved": 0, "complete": false, "message": "Earn the elder's trust first."}
	var request: Dictionary = requests[request_id]
	if bool(request.get("complete", false)):
		return {"moved": 0, "complete": true, "message": "Request already complete."}
	if not is_request_available(request_id):
		var current := get_project_stage_definition()
		return {
			"moved": 0,
			"complete": false,
			"message": "Finish %s before supplying a later tower stage." % [
				str(current.get("name", "the current stage"))],
		}
	var moved_total := 0
	for content_ref in request["requirements"]:
		var stable_id := str(content_ref["stable_id"])
		var needed := int(content_ref["count"]) - int(request["delivered"].get(stable_id, 0))
		if needed <= 0:
			continue
		var available := Inventory.count_ref(content_ref)
		var move := mini(needed, available)
		if move <= 0:
			continue
		var stack := Inventory.make_stack_from_ref({
			"kind": content_ref["kind"],
			"stable_id": stable_id,
			"count": move,
		})
		if warehouse_capacity_for(stack) < move:
			continue
		if not Inventory.remove_ref(content_ref, move):
			continue
		var leftover := warehouse_add_stack(stack)
		if not leftover.is_empty():
			# Defensive rollback; capacity was checked before consumption.
			Inventory.add_stack(stack)
			continue
		request["delivered"][stable_id] = int(request["delivered"].get(stable_id, 0)) + move
		moved_total += move
	request["complete"] = _request_is_complete(request)
	requests[request_id] = request
	if bool(request["complete"]):
		reputation_points += int(request["reward_reputation"])
		_refresh_reputation_state()
	_try_reserve_current_stage()
	requests_changed.emit()
	state_changed.emit()
	return {
		"moved": moved_total,
		"complete": bool(request["complete"]),
		"message": "Delivered %d item%s." % [moved_total, "" if moved_total == 1 else "s"] \
			if moved_total > 0 else "You do not carry any missing supplies.",
	}


func _request_is_complete(request: Dictionary) -> bool:
	for content_ref in request["requirements"]:
		if int(request["delivered"].get(str(content_ref["stable_id"]), 0)) \
				< int(content_ref["count"]):
			return false
	return true


func _try_reserve_current_stage() -> bool:
	if bool(project.get("complete", false)) \
			or not bool(project.get("awaiting_supplies", true)):
		return false
	var definition := get_project_stage_definition()
	if definition.is_empty():
		return false
	var request_id := str(definition["request_id"])
	if not bool(requests.get(request_id, {}).get("complete", false)):
		return false
	var requirements: Array = definition["requirements"]
	for content_ref in requirements:
		if warehouse_count_ref(content_ref) < int(content_ref["count"]):
			return false
	var reserved := {}
	for content_ref in requirements:
		var count := int(content_ref["count"])
		if not warehouse_remove_ref(content_ref, count):
			push_error("HamletState: project reservation changed during commit")
			return false
		var stable_id := str(content_ref["stable_id"])
		reserved[stable_id] = int(reserved.get(stable_id, 0)) + count
	project["reserved"] = reserved
	project["awaiting_supplies"] = false
	project["stage_progress"] = 0.0
	project["placed_blocks"] = 0
	project["total_blocks"] = 0
	project_changed.emit()
	state_changed.emit()
	return true


func set_project_stage_total(total_blocks: int) -> void:
	if not project_is_building():
		return
	var total := maxi(1, total_blocks)
	var placed := clampi(int(project.get("placed_blocks", 0)), 0, total)
	if int(project.get("total_blocks", 0)) == total \
			and int(project.get("placed_blocks", 0)) == placed:
		return
	project["total_blocks"] = total
	project["placed_blocks"] = placed
	project["stage_progress"] = float(placed) / float(total)
	project_changed.emit()


func record_project_block_placed(total_blocks: int) -> bool:
	## Called only after one blueprint voxel was confirmed in the world. Project
	## progress therefore cannot outrun visible builder work.
	if not project_is_building():
		return false
	var total := maxi(1, total_blocks)
	project["total_blocks"] = total
	project["placed_blocks"] = mini(
		total, int(project.get("placed_blocks", 0)) + 1)
	project["stage_progress"] = float(project["placed_blocks"]) / float(total)
	if int(project["placed_blocks"]) >= total:
		_complete_current_project_stage()
	else:
		project_changed.emit()
	return true


func _complete_current_project_stage() -> void:
	var current_index := int(project.get("stage_index", 1))
	if current_index >= PROJECT_STAGES.size():
		project["stage"] = "complete"
		project["complete"] = true
		project["awaiting_supplies"] = false
		project["stage_progress"] = 1.0
		project["placed_blocks"] = int(project.get("total_blocks", 1))
		project["reserved"] = {}
		reputation_points += 12
		_refresh_reputation_state()
	else:
		var next := get_project_stage_definition(current_index + 1)
		project["stage_index"] = current_index + 1
		project["stage"] = str(next["id"])
		project["stage_progress"] = 0.0
		project["awaiting_supplies"] = true
		project["reserved"] = {}
		project["placed_blocks"] = 0
		project["total_blocks"] = 0
		# Migrated saves may already contain later-stage deliveries.
		_try_reserve_current_stage()
	project_changed.emit()
	state_changed.emit()


# ---------- Authoritative warehouse transactions ----------

func get_warehouse_slot(index: int) -> Dictionary:
	if index < 0 or index >= warehouse_slots.size():
		return {}
	return warehouse_slots[index]


func set_warehouse_slot(index: int, stack: Dictionary) -> bool:
	if index < 0 or index >= warehouse_slots.size():
		return false
	var normal := Inventory._normalise_stack(stack)
	if not stack.is_empty() and normal.is_empty():
		return false
	warehouse_slots[index] = normal
	warehouse_changed.emit()
	state_changed.emit()
	return true


func warehouse_capacity_for(value: Dictionary) -> int:
	var incoming := Inventory._normalise_stack(value)
	if incoming.is_empty():
		return 0
	var capacity := 0
	for current in warehouse_slots:
		if current.is_empty():
			capacity += Inventory.stack_max_count(incoming)
		elif Inventory._can_merge(current, incoming):
			capacity += maxi(
				0, Inventory.stack_max_count(current) - int(current.get("count", 0)))
	return capacity


func warehouse_add_stack(value: Dictionary) -> Dictionary:
	var incoming := Inventory._normalise_stack(value)
	if incoming.is_empty():
		return value.duplicate(true)
	var remaining := int(incoming["count"])
	for i in warehouse_slots.size():
		var current: Dictionary = warehouse_slots[i]
		if not Inventory._can_merge(current, incoming):
			continue
		var move := mini(
			Inventory.stack_max_count(current) - int(current["count"]), remaining)
		if move <= 0:
			continue
		current["count"] = int(current["count"]) + move
		warehouse_slots[i] = current
		remaining -= move
		if remaining <= 0:
			break
	for i in warehouse_slots.size():
		if remaining <= 0:
			break
		if not warehouse_slots[i].is_empty():
			continue
		var placed := incoming.duplicate(true)
		var move := mini(Inventory.stack_max_count(placed), remaining)
		placed["count"] = move
		warehouse_slots[i] = placed
		remaining -= move
	warehouse_changed.emit()
	state_changed.emit()
	if remaining <= 0:
		return {}
	incoming["count"] = remaining
	return incoming


func warehouse_count_ref(content_ref: Dictionary) -> int:
	var count := 0
	for stack in warehouse_slots:
		if Inventory.stack_matches_ref(stack, content_ref):
			count += int(stack.get("count", 0))
	return count


func warehouse_remove_ref(content_ref: Dictionary, count: int) -> bool:
	if count <= 0 or warehouse_count_ref(content_ref) < count:
		return false
	var remaining := count
	for i in warehouse_slots.size():
		if remaining <= 0:
			break
		var stack: Dictionary = warehouse_slots[i]
		if not Inventory.stack_matches_ref(stack, content_ref):
			continue
		var move := mini(remaining, int(stack["count"]))
		stack["count"] = int(stack["count"]) - move
		remaining -= move
		warehouse_slots[i] = {} if int(stack["count"]) <= 0 else stack
	warehouse_changed.emit()
	state_changed.emit()
	return remaining == 0


func deposit_selected_to_warehouse() -> Dictionary:
	if not permission_enabled("warehouse_deposit"):
		return {"ok": false, "message": "Direct warehouse delivery requires Trusted Supplier status."}
	var selected := Inventory.get_selected_stack()
	if selected.is_empty():
		return {"ok": false, "message": "Select an item to deposit."}
	if warehouse_capacity_for(selected) < int(selected["count"]):
		return {"ok": false, "message": "The warehouse has no room for that stack."}
	var taken := Inventory.take_selected_stack(int(selected["count"]))
	if taken.is_empty() or not warehouse_add_stack(taken).is_empty():
		if not taken.is_empty():
			Inventory.add_stack(taken)
		return {"ok": false, "message": "The deposit could not be completed."}
	return {"ok": true, "message": "Deposited %s." % Inventory.stack_name(taken)}


func can_automation_project_accept(value: Dictionary) -> bool:
	if not permission_enabled("automation_import") \
			or bool(project.get("complete", false)) \
			or not bool(project.get("awaiting_supplies", true)):
		return false
	var incoming := Inventory._normalise_stack(value)
	if incoming.is_empty():
		return false
	var definition := get_project_stage_definition()
	var request_id := str(definition.get("request_id", ""))
	var request: Dictionary = requests.get(request_id, {})
	for content_ref in request.get("requirements", []):
		if not Inventory.stack_matches_ref(incoming, content_ref):
			continue
		var stable_id := str(content_ref["stable_id"])
		var missing := int(content_ref["count"]) \
			- int(request.get("delivered", {}).get(stable_id, 0))
		return missing >= int(incoming["count"])
	return false


func automation_import_stack(value: Dictionary, mode: String, source: String,
		correlation_id: String) -> Dictionary:
	## Idempotent warehouse transaction used by unloaded and visible logistics.
	## Retrying the same batch after a save or permission change cannot duplicate
	## stock because the correlation is recorded only after a successful commit.
	if not correlation_id.is_empty() and _automation_correlations.has(correlation_id):
		return {"ok": true, "duplicate": true, "message": "Delivery already committed."}
	if not permission_enabled("automation_import"):
		return {"ok": false, "reason": "permission_blocked"}
	var incoming := Inventory._normalise_stack(value)
	if incoming.is_empty():
		return {"ok": false, "reason": "invalid_input"}
	var delivery_mode := mode if mode in ["donation", "project"] else "donation"
	if delivery_mode == "project" and not can_automation_project_accept(incoming):
		return {"ok": false, "reason": "invalid_project_input"}
	if warehouse_capacity_for(incoming) < int(incoming["count"]):
		return {"ok": false, "reason": "full_storage"}

	var leftover := warehouse_add_stack(incoming)
	if not leftover.is_empty():
		# Defensive rollback. The preflight capacity check should make this
		# unreachable, but a failed commit must not strand a partial delivery.
		var inserted := int(incoming["count"]) - int(leftover.get("count", 0))
		if inserted > 0:
			warehouse_remove_ref({
				"kind": Inventory.stack_kind(incoming),
				"stable_id": Inventory.stack_stable_id(incoming),
			}, inserted)
		return {"ok": false, "reason": "commit_failed"}

	var request_id := ""
	var reservation_destination := ""
	if delivery_mode == "project":
		var definition := get_project_stage_definition()
		request_id = str(definition.get("request_id", ""))
		var request: Dictionary = requests[request_id]
		for content_ref in request["requirements"]:
			if not Inventory.stack_matches_ref(incoming, content_ref):
				continue
			var stable_id := str(content_ref["stable_id"])
			request["delivered"][stable_id] = int(
				request["delivered"].get(stable_id, 0)) + int(incoming["count"])
			break
		var was_complete := bool(request.get("complete", false))
		request["complete"] = _request_is_complete(request)
		requests[request_id] = request
		if bool(request["complete"]) and not was_complete:
			reputation_points += int(request["reward_reputation"])
			_refresh_reputation_state()
		reservation_destination = str(project.get("id", ""))
		_try_reserve_current_stage()
		requests_changed.emit()

	var stable_id := Inventory.stack_stable_id(incoming)
	var category := ""
	if Inventory.stack_kind(incoming) == "item":
		category = str(ItemRegistry.get_definition(
			int(incoming["id"])).get("category", ""))
	else:
		category = str(BlockRegistry.get_definition(
			int(incoming["id"])).get("category", ""))
	var entry := {
		"correlation_id": correlation_id,
		"contributor": "player.local",
		"owner": VILLAGE_ID,
		"mode": delivery_mode,
		"category": category,
		"kind": Inventory.stack_kind(incoming),
		"stable_id": stable_id,
		"count": int(incoming["count"]),
		"source": source,
		"request_id": request_id,
		"reservation_destination": reservation_destination,
		"day": day,
		"clock_minutes": clock_minutes,
	}
	delivery_ledger.append(entry)
	if delivery_ledger.size() > 128:
		delivery_ledger.pop_front()
	if not correlation_id.is_empty():
		_automation_correlations[correlation_id] = true
	delivery_ledger_changed.emit()
	state_changed.emit()
	return {
		"ok": true,
		"duplicate": false,
		"request_id": request_id,
		"message": "Imported %d x %s." % [
			int(incoming["count"]), Inventory.stack_name(incoming)],
	}


func get_recent_automation_deliveries(limit: int = 5) -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	var start := maxi(0, delivery_ledger.size() - maxi(0, limit))
	for index in range(start, delivery_ledger.size()):
		out.append(delivery_ledger[index].duplicate(true))
	return out


func serialize_state() -> Dictionary:
	var saved_warehouse: Array = []
	for stack in warehouse_slots:
		saved_warehouse.append(Inventory.serialize_stack(stack))
	return {
		"version": 2,
		"village_id": VILLAGE_ID,
		"world_seed": world_seed,
		"anchors": {
			"hamlet": [hamlet_anchor.x, hamlet_anchor.y],
			"warehouse": [warehouse_anchor.x, warehouse_anchor.y],
			"watchtower_site": [watchtower_anchor.x, watchtower_anchor.y],
		},
		"clock_minutes": clock_minutes,
		"day": day,
		"npc_records": npc_records.duplicate(true),
		"warehouse": saved_warehouse,
		"requests": requests.duplicate(true),
		"request_order": request_order.duplicate(),
		"reputation_points": reputation_points,
		"reputation_state": reputation_state,
		"permissions": permissions.duplicate(true),
		"project": project.duplicate(true),
		"delivery_ledger": delivery_ledger.duplicate(true),
		"automation_correlations": _automation_correlations.keys(),
	}


func restore_state(value: Variant, expected_seed: int) -> bool:
	if not (value is Dictionary):
		return false
	var data: Dictionary = value
	if str(data.get("village_id", "")) != VILLAGE_ID \
			or int(data.get("world_seed", -1)) != expected_seed:
		return false
	var saved_project_value: Variant = data.get("project", {})
	var saved_project: Dictionary = saved_project_value \
		if saved_project_value is Dictionary else {}
	var legacy_project := int(saved_project.get("schema_version", 1)) \
		< PROJECT_SCHEMA_VERSION
	var anchors_value: Variant = data.get("anchors", {})
	var anchors: Dictionary = anchors_value if anchors_value is Dictionary else {}
	initialize(expected_seed, anchors)
	clock_minutes = clampf(float(data.get("clock_minutes", 480.0)), 0.0, 1439.999)
	day = maxi(1, int(data.get("day", 1)))
	var npc_value: Variant = data.get("npc_records", {})
	if npc_value is Dictionary:
		for npc_id in npc_records.keys():
			if npc_value.has(npc_id) and npc_value[npc_id] is Dictionary:
				var restored: Dictionary = npc_value[npc_id].duplicate(true)
				# Authored identity/job data remains authoritative across saves.
				for field in ["id", "name", "job_id", "job", "color", "home", "work", "need_profile"]:
					restored[field] = npc_records[npc_id][field]
				for field in [
					"alive", "health", "max_health", "injured", "injury",
					"activity",
				]:
					if not restored.has(field):
						restored[field] = npc_records[npc_id][field]
				npc_records[npc_id] = restored
	warehouse_slots = _empty_slots(WAREHOUSE_SIZE)
	var stored_slots: Variant = data.get("warehouse", [])
	if stored_slots is Array:
		for i in mini(stored_slots.size(), WAREHOUSE_SIZE):
			warehouse_slots[i] = Inventory.deserialize_stack(stored_slots[i])
	var request_value: Variant = data.get("requests", {})
	if request_value is Dictionary:
		for request_id in request_order:
			if request_value.has(request_id) and request_value[request_id] is Dictionary:
				var restored_request: Dictionary = request_value[request_id].duplicate(true)
				# Definitions cannot be replaced by save data.
				for field in ["id", "name", "description", "requirements", "reward_reputation"]:
					restored_request[field] = requests[request_id][field]
				requests[request_id] = restored_request
	reputation_points = maxi(0, int(data.get("reputation_points", 0)))
	reputation_state = str(data.get("reputation_state", REP_STRANGER))
	delivery_ledger.clear()
	_automation_correlations.clear()
	var correlations_value: Variant = data.get("automation_correlations", [])
	if correlations_value is Array:
		for correlation_value in correlations_value:
			var correlation_id := str(correlation_value)
			if not correlation_id.is_empty():
				_automation_correlations[correlation_id] = true
	var ledger_value: Variant = data.get("delivery_ledger", [])
	if ledger_value is Array:
		for raw_entry in ledger_value:
			if not (raw_entry is Dictionary):
				continue
			var entry: Dictionary = raw_entry.duplicate(true)
			delivery_ledger.append(entry)
			var correlation_id := str(entry.get("correlation_id", ""))
			if not correlation_id.is_empty():
				_automation_correlations[correlation_id] = true
	if legacy_project:
		_migrate_legacy_watchtower_state(request_value, saved_project)
	else:
		project.merge(saved_project, true)
		project["schema_version"] = PROJECT_SCHEMA_VERSION
		project["stage_index"] = clampi(
			int(project.get("stage_index", 1)), 1, PROJECT_STAGES.size())
		if bool(project.get("complete", false)):
			project["stage"] = "complete"
			project["stage_progress"] = 1.0
			project["awaiting_supplies"] = false
		else:
			var definition := get_project_stage_definition()
			project["stage"] = str(definition.get("id", "foundation"))
			project["stage_progress"] = clampf(
				float(project.get("stage_progress", 0.0)), 0.0, 1.0)
			project["placed_blocks"] = maxi(0, int(project.get("placed_blocks", 0)))
			project["total_blocks"] = maxi(0, int(project.get("total_blocks", 0)))
			if bool(project.get("awaiting_supplies", true)):
				_try_reserve_current_stage()
	_refresh_reputation_state()
	initialized = true
	warehouse_changed.emit()
	requests_changed.emit()
	project_changed.emit()
	delivery_ledger_changed.emit()
	state_changed.emit()
	return true


func _migrate_legacy_watchtower_state(
		saved_requests_value: Variant, saved_project: Dictionary) -> void:
	## Version-1 saves reserved the entire tower up front. Completed projects
	## remain complete; incomplete stock is reconstructed into the four staged
	## requests without duplicating or losing the previously delivered goods.
	if bool(saved_project.get("complete", false)):
		for definition in PROJECT_STAGES:
			var request_id := str(definition["request_id"])
			var request: Dictionary = requests[request_id]
			for content_ref in request["requirements"]:
				request["delivered"][str(content_ref["stable_id"])] = int(content_ref["count"])
			request["complete"] = true
			requests[request_id] = request
		project["stage"] = "complete"
		project["stage_index"] = PROJECT_STAGES.size()
		project["stage_progress"] = 1.0
		project["complete"] = true
		project["awaiting_supplies"] = false
		project["placed_blocks"] = 1
		project["total_blocks"] = 1
		return
	var available := {}
	var reserved_value: Variant = saved_project.get("reserved", {})
	var reserved: Dictionary = reserved_value if reserved_value is Dictionary else {}
	if not reserved.is_empty():
		for stable_value in reserved:
			var stable_id := str(stable_value)
			var count := maxi(0, int(reserved[stable_value]))
			if count <= 0:
				continue
			available[stable_id] = count
			var content_ref := _project_ref_for_stable_id(stable_id, count)
			if content_ref.is_empty():
				continue
			var leftover := warehouse_add_stack(Inventory.make_stack_from_ref(content_ref))
			if not leftover.is_empty():
				push_warning("HamletState: legacy reserved project stock exceeded warehouse capacity")
	else:
		var saved_requests: Dictionary = saved_requests_value \
			if saved_requests_value is Dictionary else {}
		for old_request_value in saved_requests.values():
			if not (old_request_value is Dictionary):
				continue
			var delivered_value: Variant = old_request_value.get("delivered", {})
			if not (delivered_value is Dictionary):
				continue
			for stable_value in delivered_value:
				var stable_id := str(stable_value)
				available[stable_id] = int(available.get(stable_id, 0)) \
					+ maxi(0, int(delivered_value[stable_value]))
	for definition in PROJECT_STAGES:
		var request_id := str(definition["request_id"])
		var request: Dictionary = requests[request_id]
		for content_ref in request["requirements"]:
			var stable_id := str(content_ref["stable_id"])
			var move := mini(
				int(content_ref["count"]), int(available.get(stable_id, 0)))
			if move > 0:
				request["delivered"][stable_id] = move
				available[stable_id] = int(available.get(stable_id, 0)) - move
		request["complete"] = _request_is_complete(request)
		requests[request_id] = request
	project["schema_version"] = PROJECT_SCHEMA_VERSION
	_try_reserve_current_stage()


func _project_ref_for_stable_id(stable_id: String, count: int) -> Dictionary:
	for definition in PROJECT_STAGES:
		for content_ref in definition["requirements"]:
			if str(content_ref["stable_id"]) == stable_id:
				return {
					"kind": content_ref["kind"],
					"stable_id": stable_id,
					"count": count,
				}
	return {}
