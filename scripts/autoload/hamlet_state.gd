extends Node
## Compatibility facade for the focused settlement and historical POC slice.
##
## Nearby NPC actors are views of persistent records. PeopleManager owns stable
## person, household, ordinary job and schedule truth. BiologyManager owns
## Health, nourishment and persistent injury truth. SocialManager owns
## relationships, knowledge, dialogue evidence, companion agreements and the
## canonical social-reputation record. PoliticalManager owns government,
## jurisdiction, law, office, citizenship and permission truth. MovementManager
## owns mover location, route/path, journey and authoritative arrival truth;
## this facade retains settlement, inventory, specialist-compatibility and
## project fields.

signal state_changed
signal warehouse_changed
signal requests_changed
signal reputation_changed
signal project_changed
signal npc_changed(npc_id: String)
signal delivery_ledger_changed

const PlanEngine = preload(
	"res://scripts/settlement/settlement_plan_engine.gd")
const ProfessionEngine = preload(
	"res://scripts/settlement/settlement_profession_engine.gd")

const VILLAGE_ID := "village.poc.forest_hamlet"
const WAREHOUSE_SIZE := 54
const MINUTES_PER_REAL_SECOND := 1.0

const REP_STRANGER := "rep.village.stranger"
const REP_HELPFUL := "rep.village.helpful_outsider"
const REP_SUPPLIER := "rep.village.trusted_supplier"
const REP_ALLY := "rep.village.trusted_ally"
const PROJECT_SCHEMA_VERSION := 3
# Retained only for legacy saves and the archived Forest Hamlet fixtures.
const DEFAULT_PROJECT_ID := "project.build.wooden_watchtower"
const DEFAULT_PROJECT_INSTANCE_ID := "project_instance.forest_hamlet.watchtower"
const PRODUCTION_PROJECT_ID := "project.build.catalogue_005"
const REQUEST_ACTIVE := "active"
const REQUEST_FAILED := "failed"
const REQUEST_COMPLETED := "completed"
const REQUEST_DEFERRED := "deferred"
const REQUEST_LIFECYCLE: Array[String] = [
	REQUEST_ACTIVE, REQUEST_FAILED, REQUEST_COMPLETED, REQUEST_DEFERRED,
]
const ROSTER_MODE_LEGACY := "legacy_hamlet"
const ROSTER_MODE_CAMP := "stage_b_camp"
const CAMP_ROSTER_SIZE := 3

# Compatibility surface for existing probes and UI. Its contents are loaded
# from the immutable project registry; HamletState no longer owns project
# recipes or stage definitions.
var PROJECT_STAGES: Array[Dictionary] = []

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

# Production worlds use role templates with world-derived identities and names.
# The immutable named roster above is reconstructed only for legacy fixtures.
const PRODUCTION_ROSTER: Array[Dictionary] = [
	{
		"id": "resident.template.leader_elder",
		"name": "Settlement Elder",
		"job_id": "job.leader.elder",
		"job": "Settlement Elder",
		"color": Color(0.64, 0.34, 0.18),
		"offset": Vector2i(0, 1),
	},
	{
		"id": "resident.template.builder_basic",
		"name": "Settlement Builder",
		"job_id": "job.builder.basic",
		"job": "Builder",
		"color": Color(0.78, 0.52, 0.22),
		"offset": Vector2i(3, 1),
	},
	{
		"id": "resident.template.farmer_basic",
		"name": "Settlement Farmer",
		"job_id": "job.farmer.basic",
		"job": "Farmer",
		"color": Color(0.36, 0.62, 0.24),
		"offset": Vector2i(-4, 3),
	},
]

const PRODUCTION_GIVEN_NAMES: Array[String] = [
	"Alden", "Bryn", "Cora", "Davin", "Elowen", "Fara", "Galen", "Hesta",
	"Ilan", "Jora", "Kellan", "Mira", "Neris", "Orin", "Pella", "Rian",
]
const PRODUCTION_FAMILY_NAMES: Array[String] = [
	"Ashbrook", "Briar", "Dunmere", "Emberfall", "Fielding", "Greenbank",
	"Hartwood", "Ironwell", "Juniper", "Keystone", "Mossvale", "Northwind",
	"Oakmere", "Rill", "Stoneford", "Willowmark",
]

var world_seed := 0
var initialized := false
var active_village_id := VILLAGE_ID
var roster_mode := ROSTER_MODE_LEGACY
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
# Settlement-operation compatibility evidence. These points are earned from
# confirmed delivery/defence/project evidence, never social trust. PoliticalManager
# converts the evidence into explicit capabilities and remains the permission owner.
var operational_access_points := 0
var permissions: Dictionary = {}
var project: Dictionary = {}
var runtime_projects: Dictionary = {}
var runtime_buildings: Dictionary = {}
var runtime_plans: Dictionary = {}
var active_project_instance_id := DEFAULT_PROJECT_INSTANCE_ID
var delivery_ledger: Array[Dictionary] = []
var _automation_correlations: Dictionary = {}
var _operational_access_evidence: Dictionary = {}
var _needs_accumulator := 0.0


func _ready() -> void:
	_load_project_contract(DEFAULT_PROJECT_ID)
	_reset_collections()


func _empty_slots(size: int) -> Array:
	var slots: Array = []
	slots.resize(size)
	for i in size:
		slots[i] = {}
	return slots


func _reset_collections() -> void:
	var project_definition_id := _active_project_definition_id()
	_load_project_contract(project_definition_id)
	warehouse_slots = _empty_slots(WAREHOUSE_SIZE)
	npc_records.clear()
	requests.clear()
	request_order.clear()
	delivery_ledger.clear()
	_automation_correlations.clear()
	operational_access_points = 0
	_operational_access_evidence.clear()
	runtime_projects.clear()
	runtime_buildings.clear()
	runtime_plans.clear()
	active_project_instance_id = _default_project_instance_id()
	permissions = {
		"request_delivery": false,
		"warehouse_deposit": false,
		"warehouse_view": false,
		"warehouse_withdraw": false,
		"automation_import": false,
	}
	var project_definition := SettlementContentRegistry.get_project(
		project_definition_id)
	project = {
		"id": project_definition_id,
		"instance_id": active_project_instance_id,
		"definition_id": project_definition_id,
		"building_definition_id": str(
			project_definition.get("building_id", "")),
		"blueprint_id": str(project_definition.get("blueprint_id", "")),
		"owner_id": active_village_id,
		"name": str(project_definition.get(
			"display_name", "Settlement Project")),
		"schema_version": PROJECT_SCHEMA_VERSION,
		"stage": "foundation",
		"stage_index": 1,
		"stage_progress": 0.0,
		"complete": false,
		"awaiting_supplies": true,
		"reserved": {},
		"placed_blocks": 0,
		"total_blocks": 0,
		"position": [watchtower_anchor.x, watchtower_anchor.y],
		"history": [],
	}
	runtime_projects[active_project_instance_id] = project


func _default_project_instance_id() -> String:
	if active_village_id == VILLAGE_ID:
		return DEFAULT_PROJECT_INSTANCE_ID
	return "%s.project.primitive_hut" % active_village_id


func _active_project_definition_id() -> String:
	return PRODUCTION_PROJECT_ID \
		if roster_mode == ROSTER_MODE_CAMP else DEFAULT_PROJECT_ID


func _load_project_contract(requested_id: String) -> bool:
	var canonical := SettlementContentRegistry.canonical_id(requested_id)
	var definition := SettlementContentRegistry.get_project(canonical)
	if definition.is_empty():
		push_error("HamletState: unknown settlement project %s" % requested_id)
		return false
	PROJECT_STAGES.clear()
	var stage_count := (definition.get("stages", []) as Array).size()
	for stage_value in definition.get("stages", []):
		if not (stage_value is Dictionary):
			continue
		var stage: Dictionary = stage_value.duplicate(true)
		stage["name"] = str(stage.get(
			"display_name", stage.get("name", stage.get("id", "Stage"))))
		if str(stage.get("description", "")).is_empty():
			stage["description"] = "Stage %d/%d: %s." % [
				int(stage.get("index", PROJECT_STAGES.size() + 1)),
				stage_count,
				str(stage["name"]),
			]
		PROJECT_STAGES.append(stage)
	PROJECT_STAGES.sort_custom(func(a: Dictionary, b: Dictionary) -> bool:
		return int(a.get("index", 0)) < int(b.get("index", 0)))
	return not PROJECT_STAGES.is_empty()


func initialize(
		seed_value: int,
		anchors: Dictionary,
		settlement_id: String = VILLAGE_ID,
		requested_roster_mode: String = ROSTER_MODE_LEGACY) -> void:
	var expected_roster_size := (
		CAMP_ROSTER_SIZE
		if requested_roster_mode == ROSTER_MODE_CAMP
		else ROSTER.size())
	if initialized and world_seed == seed_value \
			and active_village_id == settlement_id \
			and roster_mode == requested_roster_mode \
			and npc_records.size() == expected_roster_size \
			and warehouse_slots.size() == WAREHOUSE_SIZE \
			and not requests.is_empty():
		return
	world_seed = seed_value
	active_village_id = settlement_id if not settlement_id.is_empty() \
		else VILLAGE_ID
	roster_mode = (
		requested_roster_mode
		if requested_roster_mode in [ROSTER_MODE_LEGACY, ROSTER_MODE_CAMP]
		else ROSTER_MODE_LEGACY)
	initialized = true
	hamlet_anchor = _anchor_from(anchors, "hamlet")
	warehouse_anchor = _anchor_from(anchors, "warehouse")
	watchtower_anchor = _anchor_from(anchors, "watchtower_site")
	clock_minutes = 8.0 * 60.0
	day = 1
	reputation_points = 0
	reputation_state = REP_STRANGER
	_reset_collections()
	_register_seeded_warehouse_structure()
	_create_roster()
	reconcile_people_owner(false)
	reconcile_biology_owner(false)
	reconcile_social_owner(false)
	reconcile_political_owner(false)
	reconcile_movement_owner(false)
	_create_requests()
	_refresh_social_reputation_projection()
	_refresh_permissions()
	state_changed.emit()


func _anchor_from(anchors: Dictionary, key: String) -> Vector2i:
	var value: Variant = anchors.get(key, Vector2i.ZERO)
	if value is Vector2i:
		return value
	if value is Array and value.size() >= 2:
		return Vector2i(int(value[0]), int(value[1]))
	return Vector2i.ZERO


func _register_seeded_warehouse_structure() -> void:
	## Generated settlement assembly, rather than combat, hands the physical
	## warehouse or starter cache to the persistent StructureInstance owner.
	var definition_id := (
		"building.storage.small_storehouse"
		if roster_mode == ROSTER_MODE_CAMP
		else "building.storage.village_warehouse")
	var result := StructureManager.register_seeded_structure({
		"world_seed": world_seed,
		"settlement_id": active_village_id,
		"owner_id": active_village_id,
		"anchor_id": "warehouse",
		"definition_id": definition_id,
		"position": [warehouse_anchor.x, warehouse_anchor.y],
		"generation_evidence": "seed:%d:settlement:%s:warehouse" % [
			world_seed, active_village_id],
	})
	if not bool(result.get("ok", false)):
		push_warning("HamletState: warehouse StructureInstance handoff failed: %s" \
			% result)


func ensure_seeded_structure_owner() -> void:
	if initialized:
		_register_seeded_warehouse_structure()


func _create_roster() -> void:
	var definitions: Array[Dictionary] = ROSTER
	if roster_mode == ROSTER_MODE_CAMP:
		definitions = PRODUCTION_ROSTER
	for definition in definitions:
		var offset: Vector2i = definition["offset"]
		var home := hamlet_anchor + offset
		var work := _work_anchor_for(str(definition["job_id"]), home)
		var npc_id := _npc_id_for_definition(definition)
		var resident_index := definitions.find(definition)
		var residence_index := mini(1, floori(float(resident_index) / 2.0))
		var residence_id := "%s.residence.%s.%d" % [
			active_village_id,
			"tent" if roster_mode == ROSTER_MODE_CAMP else "legacy",
			residence_index,
		]
		npc_records[npc_id] = {
			"record_type": "Resident",
			"version": 1,
			"id": npc_id,
			"resident_id": npc_id,
			"name": _npc_name_for_definition(definition),
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
			"age_days": 7200 + int(
				ValleyPlan.derive_seed(world_seed, npc_id) % 9000),
			"age_band": "adult",
			"household_id": "%s.household.%d" % [
				active_village_id, residence_index],
			"residence_id": residence_id,
			"bed_id": "%s.bed.%d" % [residence_id, resident_index % 2],
			"displaced": false,
			"personal_inventory": [],
			"equipment": {},
			"current_task": {},
			"carried_stack": {},
			"source_storage_id": "",
			"destination": [],
			"transaction_history": [],
			"secondary_roles": (
				["leadership", "food", "hauling"]
				if resident_index == 0 else
				["building", "hauling"]
				if resident_index == 1 else
				["food", "hauling", "building"]),
		}
		npc_records[npc_id]["personal_inventory"] = _empty_slots(8)
		var equipment := _starting_equipment_for(
			str(definition["job_id"]), resident_index)
		npc_records[npc_id]["equipment"] = equipment


func _starting_equipment_for(job_id: String, resident_index: int) -> Dictionary:
	var stable_id: String = str({
		"job.builder.basic": "item.tool.hammer_basic",
		"job.farmer.basic": "item.tool.hoe_basic",
		"job.guard.militia": "item.weapon.iron_sword",
		"job.mage.apprentice": "item.weapon.apprentice_staff",
		"job.miner.basic": "item.tool.stone_pickaxe",
		"job.lumberjack.basic": "item.tool.stone_axe",
	}.get(job_id, ""))
	if stable_id.is_empty():
		return {}
	return {
		"primary": Inventory.serialize_stack(Inventory.make_stack_from_ref({
			"kind": "item",
			"stable_id": stable_id,
			"count": 1,
		})),
	}


func add_resident(record_value: Dictionary) -> bool:
	var resident_id := str(record_value.get(
		"resident_id", record_value.get("id", "")))
	if resident_id.is_empty() or npc_records.has(resident_id):
		return false
	var record := record_value.duplicate(true)
	record["record_type"] = "Resident"
	record["version"] = 1
	record["id"] = resident_id
	record["resident_id"] = resident_id
	record["personal_inventory"] = record.get(
		"personal_inventory", _empty_slots(8)).duplicate(true)
	record["equipment"] = record.get("equipment", {}).duplicate(true)
	record["current_task"] = record.get("current_task", {}).duplicate(true)
	record["carried_stack"] = record.get("carried_stack", {}).duplicate(true)
	record["transaction_history"] = record.get(
		"transaction_history", []).duplicate(true)
	_ensure_people_owner()
	var registration := PeopleManager.register_person_projection(
		active_village_id, record, "settlement_population")
	if not bool(registration.get("ok", false)):
		push_warning("HamletState: persistent person handoff failed: %s" \
			% registration)
		return false
	var person_view := PeopleManager.compatibility_person_view(
		resident_id, record)
	_ensure_biology_owner()
	var biological := BiologyManager.register_actor_projection(
		resident_id, person_view, "settlement_population", resident_id,
		active_village_id, "persistent")
	if not bool(biological.get("ok", false)):
		push_warning("HamletState: biological owner handoff failed: %s" \
			% biological)
		return false
	var resident_view := BiologyManager.compatibility_actor_view(
		resident_id, person_view)
	_ensure_social_owner()
	var social := SocialManager.register_profile(
		resident_id, resident_view, "settlement_population", resident_id,
		active_village_id, "person")
	if not bool(social.get("ok", false)):
		push_warning("HamletState: social owner handoff failed: %s" % social)
		return false
	npc_records[resident_id] = SocialManager.compatibility_person_view(
		resident_id, resident_view)
	npc_changed.emit(resident_id)
	state_changed.emit()
	return true


func update_resident_runtime(resident_id: String, changes: Dictionary) -> bool:
	if not npc_records.has(resident_id):
		return false
	var record: Dictionary = npc_records[resident_id]
	var owner_fields := [
		"residence_id", "bed_id", "household_id", "displaced",
		"age_days", "age_band", "job_id", "job", "job_assignment_id",
		"workplace_id", "workplace_role_ref",
		"work", "home", "schedule_state", "schedule_profile_ref",
		"schedule_target_ref", "current_task", "current_task_intent_ref",
		"existence_state",
	]
	for field in [
		"personal_inventory", "equipment", "current_task", "carried_stack",
		"source_storage_id", "destination", "transaction_history",
		"residence_id", "bed_id", "household_id", "displaced",
		"age_days", "age_band", "job_id", "job", "job_assignment_id",
		"workplace_id", "workplace_role_ref",
		"work", "home", "schedule_state", "schedule_profile_ref",
		"schedule_target_ref", "current_task_intent_ref", "existence_state",
	]:
		if changes.has(field):
			record[field] = changes[field]
	var mutates_people_owner := false
	for field in owner_fields:
		if changes.has(field):
			mutates_people_owner = true
			break
	if mutates_people_owner:
		_ensure_people_owner()
		var updated := PeopleManager.update_person_projection(
			resident_id, record, "hamlet_compatibility_mutation")
		if not bool(updated.get("ok", false)):
			push_warning("HamletState: rejected persistent person mutation: %s" \
				% updated)
			return false
		record = PeopleManager.compatibility_person_view(resident_id, record)
	if BiologyManager.initialized and BiologyManager.has_actor(resident_id):
		record = BiologyManager.compatibility_actor_view(resident_id, record)
	if SocialManager.initialized and SocialManager.has_profile(resident_id):
		record = SocialManager.compatibility_person_view(resident_id, record)
	npc_records[resident_id] = record
	npc_changed.emit(resident_id)
	state_changed.emit()
	return true


func _ensure_resident_fields(resident_id: String, record: Dictionary) -> Dictionary:
	var result := record.duplicate(true)
	var stable_index := maxi(0, get_npc_ids().find(resident_id))
	var residence_index := mini(3, floori(float(stable_index) / 2.0))
	var residence_id := str(result.get(
		"residence_id", "%s.residence.legacy.%d" % [
			active_village_id, residence_index]))
	result["record_type"] = "Resident"
	result["version"] = 1
	result["id"] = resident_id
	result["resident_id"] = resident_id
	result["age_days"] = maxi(0, int(result.get("age_days", 7200)))
	result["age_band"] = str(result.get("age_band", "adult"))
	result["household_id"] = str(result.get(
		"household_id", "%s.household.%d" % [
			active_village_id, residence_index]))
	result["residence_id"] = residence_id
	result["bed_id"] = str(result.get(
		"bed_id", "%s.bed.%d" % [residence_id, stable_index % 2]))
	result["displaced"] = bool(result.get("displaced", false))
	result["personal_inventory"] = result.get(
		"personal_inventory", _empty_slots(8)).duplicate(true)
	result["equipment"] = result.get("equipment", {}).duplicate(true)
	result["current_task"] = result.get("current_task", {}).duplicate(true)
	result["carried_stack"] = result.get("carried_stack", {}).duplicate(true)
	result["source_storage_id"] = str(result.get("source_storage_id", ""))
	result["destination"] = result.get("destination", []).duplicate(true)
	result["transaction_history"] = result.get(
		"transaction_history", []).duplicate(true)
	result["workplace_id"] = str(result.get("workplace_id", ""))
	result["workplace_role_ref"] = str(result.get(
		"workplace_role_ref", ""))
	return result


func _npc_id_for_definition(definition: Dictionary) -> String:
	if active_village_id == VILLAGE_ID:
		return str(definition["id"])
	var role := str(definition.get("job_id", "resident")) \
		.replace("job.", "").replace(".", "_")
	return "%s.npc.%s" % [active_village_id, role]


func _npc_name_for_definition(definition: Dictionary) -> String:
	if active_village_id == VILLAGE_ID:
		return str(definition["name"])
	var name_seed := ValleyPlan.derive_seed(
		world_seed, "resident_name:%s:%s" % [
			active_village_id, definition.get("job_id", "")])
	var given_name := PRODUCTION_GIVEN_NAMES[
		posmod(name_seed, PRODUCTION_GIVEN_NAMES.size())]
	var family_name := PRODUCTION_FAMILY_NAMES[
		posmod(floori(float(name_seed) / float(PRODUCTION_GIVEN_NAMES.size())),
			PRODUCTION_FAMILY_NAMES.size())]
	return "%s %s" % [given_name, family_name]


func get_npc_id_for_job(job_id: String) -> String:
	for npc_id in npc_records:
		if str(npc_records[npc_id].get("job_id", "")) == job_id:
			return str(npc_id)
	return ""


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
		"status": REQUEST_ACTIVE,
	}
	if id not in request_order:
		request_order.append(id)


func _ref(kind: String, stable_id: String, count: int) -> Dictionary:
	return {"kind": kind, "stable_id": stable_id, "count": count}


func _create_requests() -> void:
	for definition in PROJECT_STAGES:
		var project_request_id := str(definition["request_id"])
		_request(
			project_request_id,
			"Stage %d/%d - %s Supplies" % [
				int(definition["index"]), PROJECT_STAGES.size(),
				str(definition["name"])],
			str(definition["description"]),
			definition["requirements"].duplicate(true),
			int(definition["reward"]))
		requests[project_request_id]["project_definition_id"] = str(
			project.get("definition_id", DEFAULT_PROJECT_ID))
	_request(
		"request.hamlet.food",
		"Pantry Restock",
		"The settlement needs a small food reserve while work continues.",
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
			_ensure_people_owner()
			var schedule_result := PeopleManager.set_schedule_intent(
				str(npc_id), current_schedule, "",
				"hamlet_clock.day_%d.minute_%d" % [day, int(clock_minutes)])
			if not bool(schedule_result.get("ok", false)):
				push_warning("HamletState: rejected schedule intent: %s" \
					% schedule_result)
				continue
			record = PeopleManager.compatibility_person_view(str(npc_id), record)
			if BiologyManager.initialized and BiologyManager.has_actor(str(npc_id)):
				record = BiologyManager.compatibility_actor_view(
					str(npc_id), record)
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
	_ensure_biology_owner()
	for npc_id in get_npc_ids():
		var consumed_ref: Dictionary = {}
		for food_ref in food_refs:
			if warehouse_remove_ref(food_ref, 1):
				consumed_ref = food_ref.duplicate(true)
				break
		var result: Dictionary
		if not consumed_ref.is_empty():
			var stable_id := str(consumed_ref.get("stable_id", ""))
			result = BiologyManager.apply_consumed_serving({
				"transaction_id": "settlement_meal.%s.day_%d.%s" % [
					active_village_id, day, npc_id],
				"actor_id": npc_id,
				"source_item_ref": stable_id,
				"serving_count": 1,
				"resource_commit_status": "committed",
				"resource_commit_reference": "warehouse.%s.day_%d" % [
					active_village_id, day],
				"biological_payload": _legacy_food_biological_payload(stable_id),
			})
		else:
			result = BiologyManager.apply_nourishment_pressure({
				"transaction_id": "settlement_missed_meal.%s.day_%d.%s" % [
					active_village_id, day, npc_id],
				"actor_id": npc_id,
				"hunger_delta": 12.0,
				"elapsed_hours": 24.0,
				"source": "settlement_daily_provisions",
			})
		if not bool(result.get("ok", false)):
			push_warning("HamletState: biological meal handoff failed: %s" % result)
		var record: Dictionary = npc_records.get(npc_id, {}).duplicate(true)
		npc_records[npc_id] = BiologyManager.compatibility_actor_view(
			npc_id, record)


func _legacy_food_biological_payload(stable_id: String) -> Dictionary:
	## Compatibility traits supplied by the current settlement meal adapter.
	## Canonical item/recipe facets replace this table when their Set-29
	## biological payloads are admitted to the production registry.
	var groups: Array = {
		"item.food.village_meal_pack": [2.0, 2.0, 2.0],
		"item.food.simple_stew": [2.0, 2.0, 2.0],
		"item.food.bread": [2.0, 1.0, 0.5],
		"item.food.cooked_meat": [2.0, 3.0, 0.0],
		"item.food.wild_berries": [1.0, 0.5, 3.0],
	}.get(stable_id, [1.0, 1.0, 1.0])
	return {
		"source_definition_id": stable_id,
		"satiety_points": 8.0,
		"hydration_points": 0.0,
		"nutrition_energy_units": float(groups[0]),
		"nutrition_protein_units": float(groups[1]),
		"nutrition_produce_units": float(groups[2]),
		"food_family_tags": [stable_id.get_slice(".", 2)],
		"diet_tags": [],
		"safety_profile_id": "safety.food.compatibility",
	}


func _refresh_needs() -> void:
	var tower_complete := bool(project.get("complete", false))
	for npc_id in npc_records:
		var record: Dictionary = get_npc_record(str(npc_id))
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
		var npc_id := _npc_id_for_definition(definition)
		if npc_records.has(npc_id):
			ids.append(npc_id)
	# Preserve any future or migrated residents that are not part of the
	# founding roster without changing the historical roster ordering.
	var additional_ids: Array[String] = []
	for npc_id in npc_records:
		if str(npc_id) not in ids:
			additional_ids.append(str(npc_id))
	additional_ids.sort()
	ids.append_array(additional_ids)
	return ids


func get_npc_record(npc_id: String) -> Dictionary:
	var compatibility: Dictionary = npc_records.get(npc_id, {}).duplicate(true)
	if PeopleManager.initialized and PeopleManager.has_person(npc_id):
		compatibility = PeopleManager.compatibility_person_view(
			npc_id, compatibility)
	if BiologyManager.initialized and BiologyManager.has_actor(npc_id):
		compatibility = BiologyManager.compatibility_actor_view(
			npc_id, compatibility)
	if SocialManager.initialized and SocialManager.has_profile(npc_id):
		compatibility = SocialManager.compatibility_person_view(
			npc_id, compatibility)
	return compatibility


func npc_lod_snapshot(npc_id: String) -> Dictionary:
	## Owner-supplied partition used by SimulationLodManager. Presentation may
	## change across LOD, while these identity, ownership, quantity, history and
	## irreversible partitions must survive the transition exactly.
	if not npc_records.has(npc_id):
		return {}
	var record := get_npc_record(npc_id)
	var biological_snapshot: Dictionary = BiologyManager.lod_snapshot(npc_id) \
		if BiologyManager.has_actor(npc_id) else {}
	var social_snapshot: Dictionary = SocialManager.lod_snapshot(npc_id) \
		if SocialManager.has_profile(npc_id) else {}
	var movement_snapshot: Dictionary = MovementManager.lod_snapshot(npc_id) \
		if MovementManager.has_mover(npc_id) else {}
	return {
		"identity": {
			"record_type": str(record.get("record_type", "Resident")),
			"version": int(record.get("version", 1)),
			"resident_id": str(record.get("resident_id", npc_id)),
			"name": str(record.get("name", "")),
			"social_profile_ref": str(record.get("social_profile_ref", "")),
		},
		"ownership": {
			"settlement_id": active_village_id,
			"household_id": str(record.get("household_id", "")),
			"residence_id": str(record.get("residence_id", "")),
			"bed_id": str(record.get("bed_id", "")),
			"job_id": str(record.get("job_id", "")),
			"job_assignment_id": str(record.get("job_assignment_id", "")),
			"home": (record.get("home", []) as Array).duplicate(true),
			"work": (record.get("work", []) as Array).duplicate(true),
			"movement_record_ref": str(movement_snapshot.get(
				"identity", {}).get("movement_record_ref", "")),
			"movement_owner": (
				movement_snapshot.get("ownership", {}) as Dictionary).duplicate(true),
		},
		"quantities": {
			"health": float(record.get("health", 0.0)),
			"max_health": float(record.get("max_health", 0.0)),
			"biological_owner": (
				biological_snapshot.get("quantities", {}) as Dictionary
			).duplicate(true),
			"needs": (record.get("needs", {}) as Dictionary).duplicate(true),
			"personal_inventory": (
				record.get("personal_inventory", []) as Array).duplicate(true),
			"equipment": (
				record.get("equipment", {}) as Dictionary).duplicate(true),
			"carried_stack": (
				record.get("carried_stack", {}) as Dictionary).duplicate(true),
		},
		"history": (
			record.get("transaction_history", []) as Array).duplicate(true),
		"irreversible": {
			"alive": bool(record.get("alive", true)),
			"resident_id": str(record.get("resident_id", npc_id)),
			"social_owner": (
				social_snapshot.get("irreversible", {}) as Dictionary).duplicate(true),
			"movement_owner": (
				movement_snapshot.get("irreversible", {}) as Dictionary).duplicate(true),
		},
		"state": {
			"position": (record.get("position", []) as Array).duplicate(true),
			"activity": str(record.get("activity", "")),
			"schedule_state": str(record.get("schedule_state", "")),
			"current_task": (
				record.get("current_task", {}) as Dictionary).duplicate(true),
			"source_storage_id": str(record.get("source_storage_id", "")),
			"destination": (
				record.get("destination", []) as Array).duplicate(true),
			"displaced": bool(record.get("displaced", false)),
			"social_owner_history": (
				social_snapshot.get("history", {}) as Dictionary).duplicate(true),
			"social_owner_state": (
				social_snapshot.get("state", {}) as Dictionary).duplicate(true),
			"movement_owner_state": (
				movement_snapshot.get("state", {}) as Dictionary).duplicate(true),
			"representation": "record",
		},
	}


func update_npc_position(
		npc_id: String,
		position: Vector3,
		movement_velocity: Vector3 = Vector3.ZERO,
		movement_state: String = "",
		movement_mode: String = "") -> void:
	if not npc_records.has(npc_id):
		return
	var record: Dictionary = npc_records[npc_id]
	record["position"] = [position.x, position.y, position.z]
	npc_records[npc_id] = record
	if MovementManager.initialized and MovementManager.has_mover(npc_id):
		var current := MovementManager.current_movement_mode(npc_id)
		var result := MovementManager.commit_physical_snapshot({
			"entity_ref": npc_id,
			"position": position,
			"velocity": movement_velocity,
			"movement_mode": movement_mode if not movement_mode.is_empty() \
				else str(current.get("movement_mode", "Ground")),
			"movement_provider_ref": str(current.get(
				"movement_provider_ref", "")),
			"movement_state": movement_state if not movement_state.is_empty() \
				else str(record.get("activity", "Idle")).capitalize(),
			"semantic_location": {
				"kind": "settlement",
				"ref": active_village_id,
				"settlement_ref": active_village_id,
				"position": position,
			},
		})
		if not bool(result.get("ok", false)):
			push_warning("HamletState: movement snapshot rejected: %s" % result)


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
	var record: Dictionary = get_npc_record(npc_id)
	if not bool(record.get("alive", true)):
		return {"ok": false}
	_ensure_biology_owner()
	if not BiologyManager.has_actor(npc_id):
		var registration := BiologyManager.register_actor_projection(
			npc_id, record, "hamlet_damage_compatibility", npc_id,
			active_village_id, "persistent")
		if not bool(registration.get("ok", false)):
			return registration
	var current_before := BiologyManager.current_health(npc_id)
	var would_deplete := current_before - amount <= 0.0
	var source_token := source if not source.is_empty() else "unknown"
	var transaction_id := "combat_damage.%s.%s.revision_%d" % [
		npc_id, source_token, int(BiologyManager.get_record(npc_id).get(
			"revision", 0)) + 1]
	var biological := BiologyManager.apply_resolved_biological_damage({
		"transaction_id": transaction_id,
		"actor_id": npc_id,
		"source_actor_ref": source,
		"source_system": "document16.combat",
		"resolved_health_damage": amount,
		"damage_tags": ["physical.combat"],
		"trauma_tags": ["impact"],
		"impact_class": (
			"heavy" if amount >= 20.0 else
			"significant" if amount >= 8.0 else "light"),
		"injury_permitted": amount >= 8.0 or would_deplete,
		"minimum_injury_severity": (
			"severe" if would_deplete and not allow_death else ""),
		"biological_region_id": "region.general",
		"minimum_health": 0.0 if allow_death else 1.0,
		"world_time": ProductionKernel.world_time_reference(),
	})
	if not bool(biological.get("ok", false)):
		return biological
	var health := float(biological.get("current_health", current_before))
	if health <= 0.0 and allow_death:
		_ensure_people_owner()
		var lifecycle := PeopleManager.set_existence_state(
			npc_id, "dead", "%s.death_decision" % transaction_id)
		if not bool(lifecycle.get("ok", false)):
			return {"ok": false, "reason": lifecycle.get(
				"error", "people_owner_rejected")}
		record["activity"] = "fallen"
	else:
		record["activity"] = "hurt"
	record["last_damage_source"] = source
	record = PeopleManager.compatibility_person_view(npc_id, record) \
		if PeopleManager.has_person(npc_id) else record
	record = BiologyManager.compatibility_actor_view(npc_id, record)
	npc_records[npc_id] = record
	npc_changed.emit(npc_id)
	state_changed.emit()
	return {
		"ok": true,
		"health": health,
		"alive": bool(record.get("alive", true)),
		"injured": bool(record.get("injured", false)),
		"biological_result_ref": str(biological.get("evidence_id", "")),
	}


func apply_raid_aftermath(
		outcome_id: String, injured_ids: Array[String],
		theft_limit: int, reputation_delta: int,
		raid_event_ref: String = "") -> Array[Dictionary]:
	var stable_event_ref := raid_event_ref if not raid_event_ref.is_empty() \
		else "%s.%s.day_%d" % [active_village_id, outcome_id, day]
	var injuries := {}
	for injured_id in injured_ids:
		injuries[injured_id] = true
	for npc_id in npc_records:
		var record: Dictionary = npc_records[npc_id]
		if injuries.has(str(npc_id)):
			_ensure_biology_owner()
			if not BiologyManager.has_actor(str(npc_id)):
				var registration := BiologyManager.register_actor_projection(
					str(npc_id), record, "raid_aftermath", str(npc_id),
					active_village_id, "persistent")
				if not bool(registration.get("ok", false)):
					push_warning(
						"HamletState: raid biology registration failed: %s" \
						% registration)
					continue
			var current := BiologyManager.current_health(str(npc_id))
			var maximum := maxf(1.0, BiologyManager.max_health(str(npc_id)))
			var target := maxf(1.0, maximum * 0.45)
			var biological := BiologyManager.apply_resolved_biological_damage({
				"transaction_id": "raid_aftermath.%s.%s" % [
					stable_event_ref, str(npc_id)],
				"actor_id": str(npc_id),
				"source_system": "document16.raid_resolution",
				"source_actor_ref": "raid.%s" % outcome_id,
				"resolved_health_damage": maxf(0.0, current - target),
				"damage_tags": ["physical.raid"],
				"trauma_tags": ["impact"],
				"impact_class": "heavy",
				"injury_permitted": true,
				"minimum_injury_severity": "moderate",
				"biological_region_id": "region.general",
				"minimum_health": 1.0,
			})
			if not bool(biological.get("ok", false)):
				push_warning("HamletState: raid biology handoff failed: %s" \
					% biological)
			record = BiologyManager.compatibility_actor_view(str(npc_id), record)
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
	var raid_reputation_event := "raid_aftermath:%s" % stable_event_ref
	_commit_social_reputation_delta(
		reputation_delta,
		raid_reputation_event,
		"social.hamlet.raid_reputation.%s" % stable_event_ref)
	_commit_operational_access_delta(reputation_delta, raid_reputation_event)
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
	var current_task: Dictionary = record.get("current_task", {})
	var task_status := str(current_task.get("status", ""))
	var destination: Array = current_task.get("destination", [])
	if task_status in ["reserved", "traveling", "active"] \
			and destination.size() >= 2:
		if destination.size() >= 3:
			return Vector2(
				float(destination[0]) + 0.5,
				float(destination[2]) + 0.5)
		return Vector2(
			float(destination[0]) + 0.5,
			float(destination[1]) + 0.5)
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
	var project_name := str(project.get("name", "Settlement Project"))
	var stage_count := maxi(1, PROJECT_STAGES.size())
	if bool(project.get("complete", false)):
		return "%s: Complete (100%%)" % project_name
	if bool(project.get("cancelled", false)):
		return "%s: Failed or cancelled" % project_name
	var definition := get_project_stage_definition()
	if definition.is_empty():
		return "%s: Waiting for project data" % project_name
	var index := int(definition["index"])
	var name := str(definition["name"])
	if bool(project.get("awaiting_supplies", true)):
		return "%s: Stage %d/%d - %s (awaiting supplies)" % [
			project_name, index, stage_count, name]
	var stage_percent := clampi(
		roundi(float(project.get("stage_progress", 0.0)) * 100.0), 0, 100)
	var overall_percent := clampi(
		roundi((float(index - 1) + float(project.get("stage_progress", 0.0)))
			/ float(stage_count) * 100.0),
		0, 100)
	return "%s: Stage %d/%d - %s (%d%%; overall %d%%)" % [
		project_name, index, stage_count, name, stage_percent, overall_percent]


func get_dialogue(npc_id: String) -> String:
	var record := get_npc_record(npc_id)
	if record.is_empty():
		return "The villager has nothing to say."
	_ensure_social_owner()
	if not SocialManager.has_profile(npc_id):
		reconcile_social_owner(false)
	var social_reputation := SocialManager.social_reputation(
		active_village_id, SocialManager.PLAYER_ACTOR_ID)
	var preview := SocialManager.dialogue_preview(
		npc_id,
		SocialManager.PLAYER_ACTOR_ID,
		{
			"job_id": str(record.get("job_id", "")),
			"reputation_band": str(social_reputation.get("band", "stranger")),
			"project_complete": bool(project.get("complete", false)),
			"awaiting_supplies": bool(project.get("awaiting_supplies", true)),
			"basic_magic_known": ProgressionState.has_basic_magic_knowledge(),
			"combat_phase": CombatState.phase,
		})
	if not bool(preview.get("available", false)):
		return "They are in no condition for a conversation right now."
	var semantic_line_id := str(preview.get(
		"semantic_line_id", "dialogue.hamlet.resident.default"))
	var production_profile := roster_mode == ROSTER_MODE_CAMP
	var project_name := str(project.get("name", "the settlement project"))
	match semantic_line_id:
		"dialogue.hamlet.elder.introduction":
			return (
				"Welcome to our frontier camp. A proper shelter would let this settlement grow."
				if production_profile else
				"Welcome to Hearthplain. Goblins have been scouting us, and a watchtower would buy us time.")
		"dialogue.hamlet.elder.project_complete":
			return (
				"You helped turn a temporary camp into a safer home."
				if production_profile else
				"You helped give this hamlet a future. The guard can see danger before it reaches our homes.")
		"dialogue.hamlet.elder.requests":
			return "The request board shows what %s still needs. Every honest delivery earns trust." % project_name
		"dialogue.hamlet.builder.project_complete":
			return "%s is complete. Every supplied stage became a real part of the settlement." % project_name
		"dialogue.hamlet.builder.awaiting_supplies":
			var definition := get_project_stage_definition()
			return "The next job is %s. Deliver only this stage's supplies and I can begin." % [
				str(definition.get("name", "the next stage"))]
		"dialogue.hamlet.builder.building":
			var definition := get_project_stage_definition()
			return "I am placing the %s blocks one at a time. This stage is at %d%%." % [
				str(definition.get("name", "current stage")),
				roundi(float(project.get("stage_progress", 0.0)) * 100.0)]
		"dialogue.hamlet.farmer.pantry":
			return "Work goes easier when the pantry is steady. The board lists what we are short of."
		"dialogue.hamlet.guard.warning":
			return "The warning is sounded. Take position; raiders are approaching."
		"dialogue.hamlet.guard.assault":
			return "The settlement is under attack. Use LMB with the item bar, or press Q, select Spark Bolt on the skill bar, and use LMB."
		"dialogue.hamlet.guard.resolved":
			return "The raid ended as %s. %d damaged voxel%s still need Oak Beams." % [
				str(CombatState.outcome.get("title", "an uncertain outcome")),
				CombatState.unresolved_damage_count(),
				"" if CombatState.unresolved_damage_count() == 1 else "s",
			]
		"dialogue.hamlet.guard.patrol":
			return (
				"A secure settlement needs clear approaches. I will keep watch while the camp grows."
				if production_profile else
				"A completed watchtower will improve our warning time. Until then, I patrol the road.")
		"dialogue.hamlet.merchant.trust":
			return "Trust opens doors here. Help the hamlet first; better trade can follow."
		"dialogue.hamlet.mage.introduction":
			return "There is mana in this valley, but trust and the hamlet's safety come before deeper study."
		"dialogue.hamlet.mage.known_rune":
			return "The Basic Rune links crystal, conduit, furnace, and ward. Keep the source visible and heed every fault."
		"dialogue.hamlet.mage.teaching_offer":
			return (
				"You have helped this settlement. I can teach the Basic Rune, Stone Sense, and Spark Bolt."
				if production_profile else
				"You have helped Hearthplain. I can teach the Basic Rune, Stone Sense, and Spark Bolt.")
		"dialogue.hamlet.miner.stone":
			return "Stone is plentiful near the cave. Good tools turn it into a proper foundation."
	return "Oak from the forest will make a strong frame. Replace what you take when you can."


func accept_introduction() -> bool:
	_refresh_social_reputation_projection()
	if reputation_state != REP_STRANGER:
		return false
	_ensure_social_owner()
	if not reconcile_social_owner(false):
		return false
	var elder_id := "npc.poc.forest_hamlet.elder_rowan" if active_village_id == VILLAGE_ID \
		else "%s.npc.elder" % active_village_id
	if not SocialManager.has_profile(elder_id):
		var resident_ids := get_npc_ids()
		if resident_ids.is_empty():
			return false
		elder_id = resident_ids[0]
	var session_id := "conversation.%s.player_introduction" % active_village_id
	var begin := SocialManager.begin_conversation({
		"transaction_id": "social.hamlet.introduction.begin.%s" % active_village_id,
		"session_id": session_id,
		"template_id": "dialogue.hamlet.elder.introduction",
		"participant_ids": [elder_id, SocialManager.PLAYER_ACTOR_ID],
		"initiator_id": SocialManager.PLAYER_ACTOR_ID,
		"primary_addressee_id": elder_id,
		"candidate_choice_ids": ["choice.introduce_self"],
		"context_snapshot": {"settlement_ref": active_village_id},
		"save_policy": "consequential",
	})
	if not bool(begin.get("ok", false)):
		push_warning("HamletState: introduction conversation failed: %s" % begin)
		return false
	var commit := SocialManager.commit_dialogue_choice({
		"transaction_id": "social.hamlet.introduction.commit.%s" % active_village_id,
		"session_id": session_id,
		"choice_id": "choice.introduce_self",
		"chooser_id": SocialManager.PLAYER_ACTOR_ID,
		"semantic_action_id": "social.introduction.accepted",
		"semantic_claims": [{
			"predicate": "person.introduced_to_settlement",
			"subject_ref": SocialManager.PLAYER_ACTOR_ID,
			"object_ref": active_village_id,
		}],
		"expected_revision": int(begin.get("result_revision", 1)),
		"close_after_commit": true,
		"end_reason": "introduction_accepted",
	})
	if not bool(commit.get("ok", false)):
		push_warning("HamletState: introduction choice failed: %s" % commit)
		return false
	var relationship := SocialManager.apply_relationship_event({
		"transaction_id": "social.hamlet.introduction.relationship.%s" % active_village_id,
		"subject_id": elder_id,
		"target_id": SocialManager.PLAYER_ACTOR_ID,
		"source_event_id": str(commit.get("evidence_id", "")),
		"event_family": "introduction",
		"dimension_deltas": {
			"trust": 1.0,
			"familiarity": 12.0,
			"gratitude": 1.0,
		},
	})
	if not bool(relationship.get("ok", false)):
		push_warning("HamletState: introduction relationship failed: %s" % relationship)
		return false
	if not _commit_social_reputation_delta(
			1, str(commit.get("evidence_id", "")),
			"social.hamlet.introduction.reputation.%s" % active_village_id):
		return false
	_commit_operational_access_delta(
		1, "hamlet.introduction.accepted.%s" % active_village_id)
	state_changed.emit()
	return true


func _refresh_reputation_state() -> void:
	var previous := reputation_state
	_refresh_social_reputation_projection()
	_refresh_permissions()
	if reputation_state != previous:
		reputation_changed.emit()


func _refresh_permissions() -> void:
	# The compatibility ledger supplies evidence only. PoliticalManager commits
	# and answers the capability facts; social reputation never grants access.
	if not _sync_operational_access_authority():
		for permission_id in permissions:
			permissions[permission_id] = false
		return
	var government := PoliticalManager.government_for_settlement(active_village_id)
	var government_ref := str(government.get("government_id", ""))
	var jurisdiction_refs: Array = government.get("jurisdiction_refs", [])
	var jurisdiction_ref := str(jurisdiction_refs.front()) \
		if not jurisdiction_refs.is_empty() else ""
	var capability_map := {
		"request_delivery": "settlement.request_delivery",
		"warehouse_deposit": "settlement.warehouse.deposit",
		"warehouse_view": "settlement.warehouse.view",
		"warehouse_withdraw": "settlement.warehouse.withdraw",
		"automation_import": "settlement.automation.import",
	}
	for permission_id in capability_map:
		var decision := PoliticalManager.permission_query({
			"actor_ref": SocialManager.PLAYER_ACTOR_ID,
			"capability_id": capability_map[permission_id],
			"government_ref": government_ref,
			"jurisdiction_ref": jurisdiction_ref,
			"subject_ref": active_village_id,
		})
		permissions[permission_id] = bool(decision.get("allowed", false))


func _refresh_social_reputation_projection() -> void:
	_ensure_social_owner()
	var view := SocialManager.social_reputation(
		active_village_id, SocialManager.PLAYER_ACTOR_ID)
	var score := float(view.get("score", 0.0))
	# Legacy UI exposed only non-negative helpfulness points. The canonical
	# social record may retain a negative score and projects it as Stranger here.
	reputation_points = maxi(0, roundi(score))
	match str(view.get("band", "stranger")):
		"trusted_ally":
			reputation_state = REP_ALLY
		"trusted_supplier":
			reputation_state = REP_SUPPLIER
		"helpful_outsider":
			reputation_state = REP_HELPFUL
		_:
			reputation_state = REP_STRANGER


func _commit_social_reputation_delta(
		delta: int,
		source_event_id: String,
		transaction_id: String) -> bool:
	if source_event_id.is_empty() or transaction_id.is_empty():
		return false
	_ensure_social_owner()
	var result := SocialManager.apply_reputation_event({
		"transaction_id": transaction_id,
		"scope_ref": active_village_id,
		"target_ref": SocialManager.PLAYER_ACTOR_ID,
		"dimension": "community_helpfulness",
		"delta": delta,
		"source_event_id": source_event_id,
		"reason_code": "social.reputation.confirmed_settlement_action",
	})
	if not bool(result.get("ok", false)):
		push_warning("HamletState: social-reputation handoff failed: %s" % result)
		return false
	_refresh_social_reputation_projection()
	return true


func _commit_operational_access_delta(delta: int, evidence_ref: String) -> bool:
	if evidence_ref.is_empty():
		return false
	if _operational_access_evidence.has(evidence_ref):
		return true
	_operational_access_evidence[evidence_ref] = delta
	operational_access_points = maxi(0, operational_access_points + delta)
	_refresh_permissions()
	return bool(permissions.get("request_delivery", false)) \
		or operational_access_points == 0


func _sync_operational_access_authority() -> bool:
	if not initialized:
		return false
	_ensure_political_owner()
	if PoliticalManager.government_for_settlement(active_village_id).is_empty() \
			and not reconcile_political_owner(false):
		return false
	var result := PoliticalManager.reconcile_operational_access({
		"world_seed": world_seed,
		"world_id": str(WorldManager.active_world.get("world_id", "")),
		"settlement_ref": active_village_id,
		"actor_ref": SocialManager.PLAYER_ACTOR_ID,
		"access_points": operational_access_points,
		"project_complete": bool(project.get("complete", false)),
		"evidence_refs": _operational_access_evidence.keys(),
	})
	if not bool(result.get("ok", false)):
		push_warning("HamletState: political access reconciliation failed: %s" % result)
		return false
	return true


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
	var request: Dictionary = requests.get(request_id, {}).duplicate(true)
	if not request.is_empty():
		request["lifecycle_status"] = request_lifecycle_status(request_id)
	return request


func get_requests(status_filter: String = "") -> Array[Dictionary]:
	var out: Array[Dictionary] = []
	for request_id in request_order:
		var request := get_request(request_id)
		if request.is_empty() or (not status_filter.is_empty() \
				and str(request.get("lifecycle_status", "")) != status_filter):
			continue
		out.append(request)
	return out


func request_lifecycle_status(request_id: String) -> String:
	if not requests.has(request_id):
		return ""
	var request: Dictionary = requests[request_id]
	if bool(request.get("complete", false)):
		return REQUEST_COMPLETED
	var stored_status := str(request.get("status", REQUEST_ACTIVE))
	if stored_status == REQUEST_FAILED:
		return REQUEST_FAILED
	var project_definition_id := str(request.get("project_definition_id", ""))
	if not project_definition_id.is_empty():
		if project_definition_id != str(project.get("definition_id", "")):
			return REQUEST_FAILED
		if bool(project.get("cancelled", false)):
			return REQUEST_FAILED
		return REQUEST_ACTIVE if is_request_available(request_id) \
			else REQUEST_DEFERRED
	return REQUEST_ACTIVE


func request_status_counts() -> Dictionary:
	var counts := {
		REQUEST_ACTIVE: 0,
		REQUEST_FAILED: 0,
		REQUEST_COMPLETED: 0,
		REQUEST_DEFERRED: 0,
	}
	for request_id in request_order:
		var status := request_lifecycle_status(request_id)
		if counts.has(status):
			counts[status] = int(counts[status]) + 1
	return counts


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
	if request_lifecycle_status(request_id) != REQUEST_ACTIVE:
		return {
			"moved": 0,
			"complete": false,
			"message": "This request is not currently active.",
		}
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
	if bool(request["complete"]):
		request["status"] = REQUEST_COMPLETED
	requests[request_id] = request
	if bool(request["complete"]):
		var completion_event := "settlement_request_complete:%s:%s" % [
			active_village_id, request_id]
		var event_result := _register_settlement_event(
			"request_complete",
			"request_complete",
			"Request Complete",
			"Settlement request %s completed." % request_id,
			{
				"request_id": request_id,
				"reward_reputation": int(request["reward_reputation"]),
				"delivered": request.get("delivered", {}).duplicate(true),
			},
			"request.%s.complete" % request_id)
		_commit_social_reputation_delta(
			int(request["reward_reputation"]), completion_event,
			"social.hamlet.request_reputation.%s.%s" % [
				active_village_id, request_id])
		_commit_operational_access_delta(
			int(request["reward_reputation"]), completion_event)
		_append_delivery_event_ref(
			request_id,
			str(event_result.get("event_id", "")),
			str(event_result.get("history_id", "")))
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
	_append_project_history("stage_reserved", {
		"stage_index": int(project.get("stage_index", 1)),
		"reserved": reserved.duplicate(true),
	})
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
		_append_project_history("project_activated", {
			"definition_id": str(project.get("definition_id", "")),
		})
		_activate_project_building()
		var completion_event := "settlement_project_complete:%s:%s" % [
			active_village_id, str(project.get("instance_id", ""))]
		_commit_social_reputation_delta(
			12, completion_event,
			"social.hamlet.project_reputation.%s.%s" % [
				active_village_id, str(project.get("instance_id", ""))])
		_commit_operational_access_delta(12, completion_event)
	else:
		var next := get_project_stage_definition(current_index + 1)
		project["stage_index"] = current_index + 1
		project["stage"] = str(next["id"])
		project["stage_progress"] = 0.0
		project["awaiting_supplies"] = true
		project["reserved"] = {}
		project["placed_blocks"] = 0
		project["total_blocks"] = 0
		_append_project_history("stage_completed", {
			"stage_index": current_index,
		})
		# Migrated saves may already contain later-stage deliveries.
		_try_reserve_current_stage()
	project_changed.emit()
	state_changed.emit()


func _append_project_history(event_id: String, details: Dictionary = {}) -> void:
	var history_value: Variant = project.get("history", [])
	var history: Array = history_value if history_value is Array else []
	var stable_token := "project.%s.%s" % [active_project_instance_id, event_id]
	if event_id in ["stage_reserved", "stage_completed"]:
		stable_token += ".stage_%02d" % int(details.get(
			"stage_index", project.get("stage_index", 0)))
	var event_result := _register_settlement_event(
		"settlement_project",
		event_id,
		"Project %s" % event_id.replace("_", " ").capitalize(),
		"Project %s recorded for %s." % [event_id, active_project_instance_id],
		details,
		stable_token)
	history.append({
		"event": event_id,
		"day": day,
		"clock_minutes": clock_minutes,
		"details": details.duplicate(true),
		"event_ref": str(event_result.get("event_id", "")),
		"history_ref": str(event_result.get("history_id", "")),
	})
	if history.size() > 128:
		history.pop_front()
	project["history"] = history


func _register_settlement_event(event_family: String, event_type: String,
		title: String, summary: String, metadata: Dictionary,
		stable_token: String) -> Dictionary:
	var settlement_ref := active_village_id \
		if not active_village_id.is_empty() else "settlement.legacy"
	var event_id := "event.settlement.%s.%s.%s" % [
		active_village_id if not active_village_id.is_empty() else "legacy",
		event_family,
		stable_token.replace(" ", "_"),
	]
	var result := EventManager.register_event({
		"event_id": event_id,
		"transaction_id": "settlement.event.%s" % event_id,
		"definition_ref": "leyforge.core.event.settlement.%s" % event_family,
		"event_family": event_family,
		"event_type": event_type,
		"status": "resolved",
		"source_owner": "document15.settlement",
		"settlement_ref": settlement_ref,
		"participant_refs": [settlement_ref],
		"metadata": metadata.duplicate(true),
		"title": title,
		"summary": summary,
		"history_kind": event_family,
	})
	if not bool(result.get("ok", false)):
		push_warning("HamletState: canonical settlement event commit failed: %s" % result)
	return result


func _append_delivery_event_ref(request_id: String,
		event_ref: String, history_ref: String) -> void:
	if event_ref.is_empty() and history_ref.is_empty():
		return
	for index in range(delivery_ledger.size() - 1, -1, -1):
		var entry: Dictionary = delivery_ledger[index]
		if str(entry.get("request_id", "")) != request_id:
			continue
		entry["event_ref"] = event_ref
		entry["history_ref"] = history_ref
		delivery_ledger[index] = entry
		return


func _import_legacy_project_history() -> void:
	var history_value: Variant = project.get("history", [])
	if not (history_value is Array):
		return
	var history: Array = history_value
	for index in history.size():
		if not (history[index] is Dictionary):
			continue
		var entry: Dictionary = history[index].duplicate(true)
		if not str(entry.get("event_ref", "")).is_empty():
			continue
		var stable_token := "legacy.project.%s.%d" % [
			active_project_instance_id, index]
		var result := EventManager.import_legacy_history_entry({
			"history_id": "history.%s" % stable_token,
			"kind": "settlement_project",
			"title": "Legacy Project %s" % str(entry.get("event", "history")),
			"summary": "Imported legacy settlement project history entry.",
			"settlement_ref": active_village_id,
			"time_ref": {
				"day": int(entry.get("day", 0)),
				"clock_minutes": float(entry.get("clock_minutes", 0.0)),
			},
			"tags": ["legacy_import", "settlement_project"],
			"metadata": {
				"event": str(entry.get("event", "")),
				"details": entry.get("details", {}).duplicate(true),
			},
		})
		entry["event_ref"] = ""
		entry["history_ref"] = str(result.get("history_id", ""))
		history[index] = entry
	project["history"] = history


func _activate_project_building() -> void:
	var definition_id := str(project.get("building_definition_id", ""))
	if definition_id.is_empty():
		return
	var instance_id := "building_instance.%s" % str(
		project.get("instance_id", active_project_instance_id)).trim_prefix(
			"project_instance.")
	var existing: Dictionary = runtime_buildings.get(instance_id, {})
	var handoff := StructureManager.handoff_completed_project(project, {
		"structure_instance_id": instance_id,
		"world_seed": world_seed,
		"settlement_id": str(project.get("owner_id", active_village_id)),
		"day": day,
		"clock_minutes": clock_minutes,
	})
	if not bool(handoff.get("ok", false)):
		push_error("HamletState: completed project StructureInstance handoff failed: %s" \
			% handoff)
		return
	var record := {
		"instance_id": instance_id,
		"definition_id": definition_id,
		"blueprint_id": str(project.get("blueprint_id", "")),
		"owner_id": str(project.get("owner_id", active_village_id)),
		"condition": clampf(float(existing.get("condition", 1.0)), 0.0, 1.0),
		"staffing": clampf(float(existing.get("staffing", 1.0)), 0.0, 1.0),
		"inputs_available": clampf(
			float(existing.get("inputs_available", 1.0)), 0.0, 1.0),
		"access": clampf(float(existing.get("access", 1.0)), 0.0, 1.0),
		"utilities": clampf(float(existing.get("utilities", 1.0)), 0.0, 1.0),
		"suitability": clampf(float(existing.get("suitability", 1.0)), 0.0, 1.0),
		"active": true,
		"service_active": bool(existing.get("service_active", false)),
		"service_status": str(existing.get("service_status", "unknown")),
		"service_record": existing.get(
			"service_record", {}).duplicate(true),
		"position": project.get("position", []).duplicate(true),
		"buffers": existing.get("buffers", {}).duplicate(true),
		"resource_sources": existing.get(
			"resource_sources", {}).duplicate(true),
		"history": existing.get("history", []).duplicate(true),
		"lod_state": str(existing.get("lod_state", "record")),
	}
	if (record["resource_sources"] as Dictionary).is_empty():
		var survey_hash := str(project.get("site_survey_hash", ""))
		var evidence_id := "survey.%s" % survey_hash \
			if not survey_hash.is_empty() else "project_completion.%s" % str(
				project.get("instance_id", active_project_instance_id))
		record["resource_sources"] = ProfessionEngine.initial_resource_sources(
			definition_id, instance_id, str(record.get("owner_id", active_village_id)),
			evidence_id, active_village_id)
	record = StructureManager.compatibility_building_view(instance_id, record)
	runtime_buildings[instance_id] = record


func create_project_instance(
		definition_id: String,
		instance_id: String,
		position: Array,
		owner_id: String = "") -> Dictionary:
	if owner_id.is_empty():
		owner_id = active_village_id
	var canonical := SettlementContentRegistry.canonical_id(definition_id)
	var definition := SettlementContentRegistry.get_project(canonical)
	if definition.is_empty() or instance_id.is_empty():
		return {"ok": false, "reason": "invalid_project_definition"}
	if runtime_projects.has(instance_id):
		return {"ok": false, "reason": "duplicate_project_instance"}
	var stages: Array = definition.get("stages", [])
	if stages.is_empty():
		return {"ok": false, "reason": "project_has_no_stages"}
	var first: Dictionary = stages[0]
	var record := {
		"id": canonical,
		"instance_id": instance_id,
		"definition_id": canonical,
		"building_definition_id": str(definition.get("building_id", "")),
		"blueprint_id": str(definition.get("blueprint_id", "")),
		"owner_id": owner_id,
		"name": str(definition.get("display_name", canonical)),
		"schema_version": PROJECT_SCHEMA_VERSION,
		"stage": str(first.get("id", "")),
		"stage_index": int(first.get("index", 1)),
		"stage_progress": 0.0,
		"complete": false,
		"cancelled": false,
		"awaiting_supplies": true,
		"reserved": {},
		"placed_blocks": 0,
		"total_blocks": 0,
		"position": position.duplicate(true),
		"history": [],
		"lod_state": "record",
	}
	runtime_projects[instance_id] = record
	state_changed.emit()
	return {"ok": true, "project": record.duplicate(true)}


func activate_project_instance(instance_id: String) -> bool:
	if not runtime_projects.has(instance_id):
		return false
	var next: Dictionary = runtime_projects[instance_id]
	var next_definition := str(next.get("definition_id", next.get("id", "")))
	if not _load_project_contract(next_definition):
		return false
	if instance_id == active_project_instance_id \
			and next_definition == str(project.get("definition_id", "")):
		project = next
		return true
	var previous_definition := str(project.get("definition_id", ""))
	for request_id in request_order:
		if requests.has(request_id) \
				and str(request_id).begins_with("request.") \
				and (requests[request_id].get("project_definition_id", "") != ""
					or str(request_id).begins_with("request.watchtower.stage.")
					or str(request_id).begins_with("request.cottage.stage.")):
			var previous_request: Dictionary = requests[request_id]
			if bool(previous_request.get("complete", false)):
				previous_request["status"] = REQUEST_COMPLETED
			elif str(previous_request.get(
					"project_definition_id", previous_definition)) == previous_definition:
				previous_request["status"] = REQUEST_FAILED
			requests[request_id] = previous_request
	project = next
	active_project_instance_id = instance_id
	var project_position: Array = project.get("position", [])
	var builder_id := get_npc_id_for_job("job.builder.basic")
	if project_position.size() >= 2 and npc_records.has(builder_id):
		var builder: Dictionary = npc_records[builder_id]
		builder["work"] = [int(project_position[0]), int(project_position[1])]
		npc_records[builder_id] = builder
		npc_changed.emit(builder_id)
	for definition in PROJECT_STAGES:
		var request_id := str(definition.get("request_id", ""))
		_request(
			request_id,
			"Stage %d/%d - %s Supplies" % [
				int(definition.get("index", 1)), PROJECT_STAGES.size(),
				str(definition.get("name", "Stage"))],
			str(definition.get("description", "")),
			(definition.get("requirements", []) as Array).duplicate(true),
			int(definition.get("reward", 0)))
		requests[request_id]["project_definition_id"] = next_definition
	project_changed.emit()
	requests_changed.emit()
	state_changed.emit()
	return true


func cancel_project_instance(instance_id: String) -> Dictionary:
	if not runtime_projects.has(instance_id):
		return {"ok": false, "reason": "unknown_project"}
	var record: Dictionary = runtime_projects[instance_id]
	if bool(record.get("complete", false)) or bool(record.get("cancelled", false)):
		return {"ok": false, "reason": "project_not_cancellable"}
	var before := warehouse_slots.duplicate(true)
	var definition_id := str(record.get("definition_id", record.get("id", "")))
	for stable_value in (record.get("reserved", {}) as Dictionary):
		var stable_id := str(stable_value)
		var count := maxi(0, int(record["reserved"][stable_value]))
		var content_ref := _project_ref_for_definition(
			definition_id, stable_id, count)
		if content_ref.is_empty():
			warehouse_slots = before
			return {"ok": false, "reason": "unknown_reserved_content"}
		var leftover := warehouse_add_stack(
			Inventory.make_stack_from_ref(content_ref))
		if not leftover.is_empty():
			warehouse_slots = before
			return {"ok": false, "reason": "warehouse_capacity"}
	record["reserved"] = {}
	record["cancelled"] = true
	record["awaiting_supplies"] = false
	record["stage_progress"] = 0.0
	runtime_projects[instance_id] = record
	if instance_id == active_project_instance_id:
		project = record
		for request_id in request_order:
			if not requests.has(request_id):
				continue
			var request: Dictionary = requests[request_id]
			if str(request.get("project_definition_id", "")) == definition_id \
					and not bool(request.get("complete", false)):
				request["status"] = REQUEST_FAILED
				requests[request_id] = request
		_append_project_history("project_cancelled")
	warehouse_changed.emit()
	project_changed.emit()
	requests_changed.emit()
	state_changed.emit()
	return {"ok": true}


func apply_building_damage(
		instance_id: String,
		amount: float,
		source: String = "") -> Dictionary:
	if not runtime_buildings.has(instance_id) or amount <= 0.0:
		return {"ok": false}
	var record: Dictionary = runtime_buildings[instance_id]
	if not StructureManager.has_structure(instance_id):
		StructureManager.adopt_legacy_building(record, {
			"world_seed": world_seed,
			"settlement_id": active_village_id,
			"migration_id": "runtime.compatibility.damage",
		})
	var canonical := StructureManager.get_structure(instance_id)
	var consequence_id := "settlement.damage.%s.%d" % [
		instance_id, (canonical.get("damage_history", []) as Array).size()]
	var consequence := StructureManager.record_damage(instance_id, amount, {
		"consequence_id": consequence_id,
		"source_owner": "settlement",
		"source_event_id": source,
		"day": day,
		"clock_minutes": clock_minutes,
	})
	if not bool(consequence.get("ok", false)):
		return consequence
	var event_result := _register_settlement_event(
		"building_damage",
		"building_damage",
		"Building Damaged",
		"Settlement building %s was damaged." % instance_id,
		{
			"instance_id": instance_id,
			"amount": amount,
			"source": source,
		},
		"building.%s.damage.%s" % [instance_id, consequence_id])
	var event_ref := str(event_result.get("event_id", ""))
	var event_link_error := str(event_result.get("error", ""))
	if not event_ref.is_empty():
		var event_link := EventManager.attach_consequence({
			"event_id": event_ref,
			"transaction_id": "settlement.building.damage.attach.%s" % consequence_id,
			"consequence_ref": consequence_id,
			"owner_ref": instance_id,
			"kind": "structure_damage",
			"evidence_ref": str(consequence.get("evidence_id", "")),
			"metadata": {"source": source, "amount": amount},
		})
		if not bool(event_link.get("ok", false)):
			event_link_error = str(event_link.get(
				"error", "event.consequence_link_failed"))
			push_warning("HamletState: structure damage event link failed: %s" %
				event_link)
	record = StructureManager.compatibility_building_view(instance_id, record)
	var history: Array = record.get("history", [])
	history.append({
		"event": "damaged",
		"source": source,
		"amount": amount,
		"day": day,
		"clock_minutes": clock_minutes,
		"evidence_id": str(consequence.get("evidence_id", "")),
		"event_ref": event_ref,
		"history_ref": str(event_result.get("history_id", "")),
		"event_link_error": event_link_error,
	})
	record["history"] = history
	runtime_buildings[instance_id] = record
	state_changed.emit()
	return {
		"ok": true,
		"condition": record["condition"],
		"evidence_id": consequence.get("evidence_id", ""),
		"event_ref": event_ref,
		"event_link_error": event_link_error,
	}


func repair_building(instance_id: String, amount: float) -> Dictionary:
	if not runtime_buildings.has(instance_id) or amount <= 0.0:
		return {"ok": false}
	var record: Dictionary = runtime_buildings[instance_id]
	if not StructureManager.has_structure(instance_id):
		StructureManager.adopt_legacy_building(record, {
			"world_seed": world_seed,
			"settlement_id": active_village_id,
			"migration_id": "runtime.compatibility.repair",
		})
	var canonical := StructureManager.get_structure(instance_id)
	var consequence_id := "settlement.repair.%s.%d" % [
		instance_id, (canonical.get("repair_history", []) as Array).size()]
	var source_event_ref := ""
	var existing_history: Array = record.get("history", [])
	for index in range(existing_history.size() - 1, -1, -1):
		var entry: Dictionary = existing_history[index]
		source_event_ref = str(entry.get("event_ref", ""))
		if not source_event_ref.is_empty():
			break
	var consequence := StructureManager.record_repair(instance_id, amount, {
		"consequence_id": consequence_id,
		"source_owner": "settlement",
		"source_event_id": source_event_ref,
		"day": day,
		"clock_minutes": clock_minutes,
	})
	if not bool(consequence.get("ok", false)):
		return consequence
	var event_result := _register_settlement_event(
		"building_repair",
		"building_repair",
		"Building Repaired",
		"Settlement building %s was repaired." % instance_id,
		{
			"instance_id": instance_id,
			"amount": amount,
		},
		"building.%s.repair.%s" % [instance_id, consequence_id])
	var event_ref := str(event_result.get("event_id", ""))
	var event_link_error := str(event_result.get("error", ""))
	if not event_ref.is_empty():
		var event_link := EventManager.attach_consequence({
			"event_id": event_ref,
			"transaction_id": "settlement.building.repair.attach.%s" % consequence_id,
			"consequence_ref": consequence_id,
			"owner_ref": instance_id,
			"kind": "structure_repair",
			"evidence_ref": str(consequence.get("evidence_id", "")),
			"metadata": {"amount": amount},
		})
		if not bool(event_link.get("ok", false)):
			event_link_error = str(event_link.get(
				"error", "event.consequence_link_failed"))
			push_warning("HamletState: structure repair event link failed: %s" %
				event_link)
	record = StructureManager.compatibility_building_view(instance_id, record)
	var history: Array = record.get("history", [])
	history.append({
		"event": "repaired",
		"amount": amount,
		"day": day,
		"clock_minutes": clock_minutes,
		"evidence_id": str(consequence.get("evidence_id", "")),
		"event_ref": event_ref,
		"history_ref": str(event_result.get("history_id", "")),
		"event_link_error": event_link_error,
	})
	record["history"] = history
	runtime_buildings[instance_id] = record
	state_changed.emit()
	return {
		"ok": true,
		"condition": record["condition"],
		"evidence_id": consequence.get("evidence_id", ""),
		"event_ref": event_ref,
		"event_link_error": event_link_error,
	}


func aggregate_settlement_needs(
		demand_by_need: Dictionary,
		previous_ratios: Dictionary = {}) -> Dictionary:
	var definitions := {}
	var records: Array = []
	for instance_id in runtime_buildings:
		var record: Dictionary = runtime_buildings[instance_id]
		var definition_id := str(record.get("definition_id", ""))
		if not definitions.has(definition_id):
			definitions[definition_id] = SettlementContentRegistry.get_building(
				definition_id)
		records.append(record.duplicate(true))
	return SettlementSimulationRules.aggregate_needs(
		definitions, records, demand_by_need, previous_ratios)


func rank_settlement_projects(
		settlement_stage: String,
		context_by_id: Dictionary) -> Array[Dictionary]:
	var definitions: Array = []
	for definition in SettlementContentRegistry.all_definitions():
		if str(definition.get("kind", "")) in ["building", "project", "plan"]:
			definitions.append(definition)
	return SettlementSimulationRules.rank_projects(
		definitions, settlement_stage, context_by_id)


func create_plan_instance(
		definition_id: String,
		instance_id: String,
		boundary: Array = [],
		owner_id: String = "") -> Dictionary:
	if owner_id.is_empty():
		owner_id = active_village_id
	if runtime_plans.has(instance_id):
		return {"ok": false, "reason": "duplicate_plan_instance"}
	var runtime: Dictionary = PlanEngine.create_runtime(
		definition_id, instance_id, owner_id, boundary)
	if runtime.is_empty():
		return {"ok": false, "reason": "invalid_plan_definition"}
	runtime_plans[instance_id] = runtime
	state_changed.emit()
	return {"ok": true, "plan": runtime.duplicate(true)}


func reserve_plan_component(
		instance_id: String,
		component_id: String) -> Dictionary:
	if not runtime_plans.has(instance_id):
		return {"ok": false, "reason": "unknown_plan"}
	var runtime: Dictionary = runtime_plans[instance_id]
	var plan := SettlementContentRegistry.get_plan(str(
		runtime.get("definition_id", "")))
	var component := _plan_component(plan, component_id)
	if component.is_empty():
		return {"ok": false, "reason": "unknown_component"}
	var warehouse_before := warehouse_slots.duplicate(true)
	for requirement_value in component.get("requirements", []):
		var requirement: Dictionary = requirement_value
		if warehouse_count_ref(requirement) < int(requirement.get("count", 0)):
			return {"ok": false, "reason": "insufficient_resources"}
	for requirement_value in component.get("requirements", []):
		var requirement: Dictionary = requirement_value
		if not warehouse_remove_ref(
				requirement, int(requirement.get("count", 0))):
			warehouse_slots = warehouse_before
			return {"ok": false, "reason": "transaction_changed"}
	var result: Dictionary = PlanEngine.reserve_component(
		runtime, component_id, _warehouse_resource_ledger(warehouse_before))
	if not bool(result.get("ok", false)):
		warehouse_slots = warehouse_before
		return result
	runtime_plans[instance_id] = result.get("runtime", runtime)
	warehouse_changed.emit()
	state_changed.emit()
	return {"ok": true}


func advance_plan_component(
		instance_id: String,
		component_id: String,
		progress_delta: float) -> bool:
	if not runtime_plans.has(instance_id):
		return false
	runtime_plans[instance_id] = PlanEngine.advance_component(
		runtime_plans[instance_id], component_id, progress_delta)
	state_changed.emit()
	return true


func cancel_plan_component(
		instance_id: String,
		component_id: String) -> Dictionary:
	if not runtime_plans.has(instance_id):
		return {"ok": false, "reason": "unknown_plan"}
	var runtime: Dictionary = runtime_plans[instance_id]
	var records: Dictionary = runtime.get("component_records", {})
	var record: Dictionary = records.get(component_id, {})
	if str(record.get("status", "")) != "building":
		return {"ok": false, "reason": "component_not_cancellable"}
	var plan := SettlementContentRegistry.get_plan(str(
		runtime.get("definition_id", "")))
	var component := _plan_component(plan, component_id)
	var before := warehouse_slots.duplicate(true)
	for stable_value in (record.get("reserved", {}) as Dictionary):
		var stable_id := str(stable_value)
		var requirement_kind := "item"
		for requirement_value in component.get("requirements", []):
			if str((requirement_value as Dictionary).get(
					"stable_id", "")) == stable_id:
				requirement_kind = str((requirement_value as Dictionary).get(
					"kind", "item"))
				break
		var leftover := warehouse_add_stack(Inventory.make_stack_from_ref({
			"kind": requirement_kind,
			"stable_id": stable_id,
			"count": int(record["reserved"][stable_value]),
		}))
		if not leftover.is_empty():
			warehouse_slots = before
			return {"ok": false, "reason": "warehouse_capacity"}
	var result: Dictionary = PlanEngine.cancel_component(
		runtime, component_id, _warehouse_resource_ledger(before))
	if not bool(result.get("ok", false)):
		warehouse_slots = before
		return result
	runtime_plans[instance_id] = result.get("runtime", runtime)
	warehouse_changed.emit()
	state_changed.emit()
	return {"ok": true}


func damage_plan_component(
		instance_id: String,
		component_id: String,
		amount: float) -> bool:
	if not runtime_plans.has(instance_id):
		return false
	runtime_plans[instance_id] = PlanEngine.damage_component(
		runtime_plans[instance_id], component_id, amount)
	state_changed.emit()
	return true


func restore_plan_component(
		instance_id: String,
		component_id: String,
		amount: float) -> bool:
	if not runtime_plans.has(instance_id):
		return false
	runtime_plans[instance_id] = PlanEngine.restore_component(
		runtime_plans[instance_id], component_id, amount)
	state_changed.emit()
	return true


func _plan_component(plan: Dictionary, component_id: String) -> Dictionary:
	for component_value in plan.get("components", []):
		if str((component_value as Dictionary).get("id", "")) == component_id:
			return (component_value as Dictionary).duplicate(true)
	return {}


func _warehouse_resource_ledger(
		slots_value: Array = []) -> Dictionary:
	var ledger := {}
	var source := warehouse_slots if slots_value.is_empty() else slots_value
	for stack_value in source:
		if not (stack_value is Dictionary) or stack_value.is_empty():
			continue
		var stack: Dictionary = stack_value
		var stable_id := Inventory.stack_stable_id(stack)
		ledger[stable_id] = int(ledger.get(stable_id, 0)) \
			+ int(stack.get("count", 0))
	return ledger


func advance_material_profession(
		resident_id: String,
		elapsed_minutes: float,
		arrival_evidence: Dictionary = {}) -> Dictionary:
	if not npc_records.has(resident_id) or elapsed_minutes < 0.0:
		return {"ok": false, "reason": "unknown_resident_or_invalid_time"}
	var resident_before: Dictionary = npc_records[resident_id].duplicate(true)
	var buildings_before := runtime_buildings.duplicate(true)
	var warehouse_before := warehouse_slots.duplicate(true)
	var buildings: Array = []
	for value in runtime_buildings.values():
		if value is Dictionary:
			buildings.append(value)
	var result := ProfessionEngine.advance_profession(
		resident_before, buildings, _warehouse_resource_ledger(),
		elapsed_minutes, arrival_evidence,
		SettlementSimulationEngine.MODE_NEAR)
	if not bool(result.get("changed", false)):
		return result
	if not _apply_profession_ledger(result.get("ledger", {})):
		warehouse_slots = warehouse_before
		result["ok"] = false
		result["reason"] = "warehouse_output_capacity_exhausted"
		return result
	var rebuilt := {}
	for value in result.get("buildings", []):
		if value is Dictionary:
			var building: Dictionary = value
			rebuilt[str(building.get("instance_id", ""))] = building
	runtime_buildings = rebuilt
	var resident: Dictionary = result.get("resident", resident_before)
	if not update_resident_runtime(resident_id, {
		"current_task": (
			resident.get("current_task", {}) as Dictionary).duplicate(true),
		"destination": (resident.get("destination", []) as Array).duplicate(true),
		"transaction_history": (
			resident.get("transaction_history", []) as Array).duplicate(true),
	}):
		warehouse_slots = warehouse_before
		runtime_buildings = buildings_before
		result["ok"] = false
		result["reason"] = "people_owner_rejected_task_update"
		return result
	warehouse_changed.emit()
	state_changed.emit()
	return result


func _apply_profession_ledger(target_value: Dictionary) -> bool:
	var target := {}
	for stable_value in target_value:
		var stable_id := str(stable_value)
		var count := maxi(0, int(target_value[stable_value]))
		if not stable_id.is_empty() and count > 0:
			target[stable_id] = count
	var before := _warehouse_resource_ledger()
	var stable_ids: Array = before.keys()
	for stable_value in target:
		if not stable_ids.has(stable_value):
			stable_ids.append(stable_value)
	stable_ids.sort()
	for stable_value in stable_ids:
		var stable_id := str(stable_value)
		var difference := int(target.get(stable_id, 0)) \
			- int(before.get(stable_id, 0))
		if difference >= 0:
			continue
		var content_ref := _profession_content_ref(stable_id, -difference)
		if content_ref.is_empty() \
				or not warehouse_remove_ref(content_ref, -difference):
			return false
	for stable_value in stable_ids:
		var stable_id := str(stable_value)
		var difference := int(target.get(stable_id, 0)) \
			- int(before.get(stable_id, 0))
		if difference <= 0:
			continue
		var content_ref := _profession_content_ref(stable_id, difference)
		if content_ref.is_empty():
			return false
		var leftover := warehouse_add_stack(
			Inventory.make_stack_from_ref(content_ref))
		if not leftover.is_empty():
			return false
	return _warehouse_resource_ledger() == target


func _profession_content_ref(stable_id: String, count: int) -> Dictionary:
	var kind := ""
	if ItemRegistry.get_id_by_stable_id(stable_id) >= 0:
		kind = "item"
	elif BlockRegistry.get_id_by_stable_id(stable_id) >= 0:
		kind = "block"
	if kind.is_empty() or count <= 0:
		return {}
	return {"kind": kind, "stable_id": stable_id, "count": count}


func _project_ref_for_definition(
		definition_id: String,
		stable_id: String,
		count: int) -> Dictionary:
	var definition := SettlementContentRegistry.get_project(definition_id)
	for stage in definition.get("stages", []):
		for content_ref in (stage as Dictionary).get("requirements", []):
			if str((content_ref as Dictionary).get("stable_id", "")) == stable_id:
				return {
					"kind": str((content_ref as Dictionary).get("kind", "item")),
					"stable_id": stable_id,
					"count": count,
				}
	return {}


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
	var completion_event_result := {}
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
			var completion_event := "settlement_request_complete:%s:%s" % [
				active_village_id, request_id]
			completion_event_result = _register_settlement_event(
				"settlement_request",
				"request_complete",
				"Request Complete",
				"Settlement request %s completed." % request_id,
				{
					"request_id": request_id,
					"reward_reputation": int(request["reward_reputation"]),
					"delivered": request.get("delivered", {}).duplicate(true),
				},
				"request.%s.complete" % request_id)
			_commit_social_reputation_delta(
				int(request["reward_reputation"]), completion_event,
				"social.hamlet.request_reputation.%s.%s" % [
					active_village_id, request_id])
			_commit_operational_access_delta(
				int(request["reward_reputation"]), completion_event)
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
		"owner": active_village_id,
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
		"event_ref": str(completion_event_result.get("event_id", "")),
		"history_ref": str(completion_event_result.get("history_id", "")),
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
	apply_people_owner_projection()
	apply_biology_owner_projection()
	apply_social_owner_projection()
	apply_political_owner_projection()
	apply_movement_owner_projection()
	_refresh_social_reputation_projection()
	_refresh_permissions()
	var saved_warehouse: Array = []
	for stack in warehouse_slots:
		saved_warehouse.append(Inventory.serialize_stack(stack))
	runtime_projects[active_project_instance_id] = project
	var serialized := {
		"version": 4,
		"village_id": active_village_id,
		"world_seed": world_seed,
		"roster_mode": roster_mode,
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
		"operational_access_points": operational_access_points,
		"operational_access_evidence_refs": _operational_access_evidence.keys(),
		"permissions": permissions.duplicate(true),
		"project": project.duplicate(true),
		"active_project_instance_id": active_project_instance_id,
		"runtime_projects": runtime_projects.duplicate(true),
		"runtime_buildings": runtime_buildings.duplicate(true),
		"runtime_plans": runtime_plans.duplicate(true),
		"delivery_ledger": delivery_ledger.duplicate(true),
		"automation_correlations": _automation_correlations.keys(),
	}
	var canonical := SettlementContentRegistry.migrate_v1_payload(serialized)
	return (canonical.get("data", serialized) as Dictionary)


func restore_state(
		value: Variant,
		expected_seed: int,
		expected_settlement_id: String = "") -> bool:
	if not (value is Dictionary):
		return false
	var data: Dictionary = value
	var migration := SettlementContentRegistry.migrate_v1_payload(data)
	if not bool(migration.get("ok", false)):
		return false
	data = migration.get("data", data)
	var saved_village_id := str(data.get("village_id", ""))
	if not expected_settlement_id.is_empty() \
			and saved_village_id != expected_settlement_id:
		return false
	if saved_village_id.is_empty() \
			or int(data.get("world_seed", -1)) != expected_seed:
		return false
	var saved_project_value: Variant = data.get("project", {})
	var saved_project: Dictionary = saved_project_value \
		if saved_project_value is Dictionary else {}
	var legacy_project := int(saved_project.get("schema_version", 1)) < 2
	var anchors_value: Variant = data.get("anchors", {})
	var anchors: Dictionary = anchors_value if anchors_value is Dictionary else {}
	var saved_roster_mode := str(data.get(
		"roster_mode", ROSTER_MODE_LEGACY))
	initialize(
		expected_seed, anchors, saved_village_id, saved_roster_mode)
	clock_minutes = clampf(float(data.get("clock_minutes", 480.0)), 0.0, 1439.999)
	day = maxi(1, int(data.get("day", 1)))
	var npc_value: Variant = data.get("npc_records", {})
	if npc_value is Dictionary:
		for npc_id in npc_records.keys():
			if npc_value.has(npc_id) and npc_value[npc_id] is Dictionary:
				var restored: Dictionary = npc_value[npc_id].duplicate(true)
				# Fixed-source visual identity stays authored. Mutable residence and
				# ordinary job assignment restore through the persistent person owner.
				for field in ["id", "name", "color", "need_profile"]:
					restored[field] = npc_records[npc_id][field]
				for field in [
					"alive", "health", "max_health", "injured", "injury",
					"activity",
				]:
					if not restored.has(field):
						restored[field] = npc_records[npc_id][field]
				npc_records[npc_id] = restored
		# Stage B residents are generated over time and are therefore not part
		# of the immutable legacy roster. Restore only records namespaced to the
		# owning settlement; foreign IDs cannot be injected through save data.
		for npc_value_id in npc_value:
			var npc_id := str(npc_value_id)
			if npc_records.has(npc_id) or not (npc_value[npc_value_id] is Dictionary):
				continue
			if active_village_id != VILLAGE_ID \
					and not npc_id.begins_with("%s.npc." % active_village_id):
				continue
			var restored: Dictionary = npc_value[npc_value_id].duplicate(true)
			restored["id"] = npc_id
			restored["resident_id"] = npc_id
			restored["record_type"] = "Resident"
			restored["version"] = 1
			restored["personal_inventory"] = restored.get(
				"personal_inventory", _empty_slots(8)).duplicate(true)
			restored["equipment"] = restored.get(
				"equipment", {}).duplicate(true)
			restored["current_task"] = restored.get(
				"current_task", {}).duplicate(true)
			restored["carried_stack"] = restored.get(
				"carried_stack", {}).duplicate(true)
			restored["transaction_history"] = restored.get(
				"transaction_history", []).duplicate(true)
			npc_records[npc_id] = restored
	for npc_id in npc_records.keys():
		npc_records[npc_id] = _ensure_resident_fields(
			str(npc_id), npc_records[npc_id])
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
	var legacy_reputation_points := maxi(0, int(data.get("reputation_points", 0)))
	var legacy_reputation_state := str(data.get(
		"reputation_state", REP_STRANGER))
	reputation_points = legacy_reputation_points
	reputation_state = legacy_reputation_state
	operational_access_points = maxi(0, int(data.get(
		"operational_access_points", legacy_reputation_points)))
	_operational_access_evidence.clear()
	var access_evidence_value: Variant = data.get(
		"operational_access_evidence_refs", [])
	if access_evidence_value is Array:
		for evidence_value in access_evidence_value:
			var evidence_ref := str(evidence_value)
			if not evidence_ref.is_empty():
				_operational_access_evidence[evidence_ref] = true
	if not data.has("operational_access_points") and operational_access_points > 0:
		_operational_access_evidence[
			"legacy.hamlet.operational_access.%s" % active_village_id] = true
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
	_restore_runtime_records(data)
	if legacy_project:
		_migrate_legacy_watchtower_state(request_value, saved_project)
	else:
		var saved_definition_id := SettlementContentRegistry.canonical_id(str(
			saved_project.get(
				"definition_id",
				saved_project.get("id", _active_project_definition_id()))))
		if SettlementContentRegistry.get_project(saved_definition_id).is_empty():
			saved_definition_id = _active_project_definition_id()
		_load_project_contract(saved_definition_id)
		project.merge(saved_project, true)
		project["id"] = saved_definition_id
		project["definition_id"] = saved_definition_id
		var project_definition := SettlementContentRegistry.get_project(
			saved_definition_id)
		project["building_definition_id"] = str(
			project_definition.get("building_id", ""))
		project["blueprint_id"] = str(project_definition.get("blueprint_id", ""))
		project["instance_id"] = str(project.get(
			"instance_id", _default_project_instance_id()))
		project["owner_id"] = str(project.get(
			"owner_id", active_village_id))
		project["history"] = project.get("history", []).duplicate(true)
		_import_legacy_project_history()
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
	active_project_instance_id = str(project.get(
		"instance_id", _default_project_instance_id()))
	runtime_projects[active_project_instance_id] = project
	if bool(project.get("complete", false)):
		_activate_project_building()
	var allow_legacy_people_update := not PeopleManager.restored_from_state
	if not reconcile_people_owner(allow_legacy_people_update):
		return false
	var allow_legacy_biology_update := not BiologyManager.restored_from_state
	if not reconcile_biology_owner(allow_legacy_biology_update):
		return false
	if not reconcile_social_owner(false):
		return false
	if not reconcile_political_owner(false):
		return false
	if not reconcile_movement_owner(not MovementManager.restored_from_state):
		return false
	apply_movement_owner_projection()
	if not SocialManager.restored_from_state:
		var migration_points := legacy_reputation_points
		match legacy_reputation_state:
			REP_ALLY:
				migration_points = maxi(migration_points, 35)
			REP_SUPPLIER:
				migration_points = maxi(migration_points, 16)
			REP_HELPFUL:
				migration_points = maxi(migration_points, 1)
		var migrated := SocialManager.migrate_legacy_reputation(
			active_village_id,
			SocialManager.PLAYER_ACTOR_ID,
			migration_points,
			legacy_reputation_state,
			"social.hamlet.legacy_reputation.%s" % active_village_id)
		if not bool(migrated.get("ok", false)):
			push_warning("HamletState: legacy social migration failed: %s" % migrated)
			return false
	_refresh_reputation_state()
	initialized = true
	warehouse_changed.emit()
	requests_changed.emit()
	project_changed.emit()
	delivery_ledger_changed.emit()
	state_changed.emit()
	return true


func reconcile_people_owner(allow_existing_updates: bool = false) -> bool:
	_ensure_people_owner()
	var result := PeopleManager.reconcile_settlement_projection(
		active_village_id,
		npc_records,
		{},
		{},
		"hamlet_facade",
		allow_existing_updates)
	if not bool(result.get("ok", false)):
		push_warning("HamletState: people-owner reconciliation failed: %s" % result)
		return false
	npc_records = (result.get("resident_records", npc_records) \
		as Dictionary).duplicate(true)
	return true


func apply_people_owner_projection() -> void:
	if not initialized or not PeopleManager.initialized:
		return
	var result := PeopleManager.reconcile_settlement_projection(
		active_village_id, npc_records, {}, {}, "hamlet_projection", false)
	if bool(result.get("ok", false)):
		npc_records = (result.get("resident_records", npc_records) \
			as Dictionary).duplicate(true)


func reconcile_biology_owner(allow_existing_updates: bool = false) -> bool:
	_ensure_biology_owner()
	var result := BiologyManager.reconcile_settlement_projection(
		active_village_id, npc_records, allow_existing_updates)
	if not bool(result.get("ok", false)):
		push_warning("HamletState: biological-owner reconciliation failed: %s" \
			% result)
		return false
	npc_records = (result.get("resident_records", npc_records) \
		as Dictionary).duplicate(true)
	return true


func apply_biology_owner_projection() -> void:
	if not initialized or not BiologyManager.initialized:
		return
	var result := BiologyManager.reconcile_settlement_projection(
		active_village_id, npc_records, false)
	if bool(result.get("ok", false)):
		npc_records = (result.get("resident_records", npc_records) \
			as Dictionary).duplicate(true)


func reconcile_social_owner(allow_existing_updates: bool = false) -> bool:
	_ensure_social_owner()
	var result := SocialManager.reconcile_settlement_projection(
		active_village_id, npc_records, allow_existing_updates)
	if not bool(result.get("ok", false)):
		push_warning("HamletState: social-owner reconciliation failed: %s" % result)
		return false
	npc_records = (result.get("resident_records", npc_records) \
		as Dictionary).duplicate(true)
	return true


func apply_social_owner_projection() -> void:
	if not initialized or not SocialManager.initialized:
		return
	var result := SocialManager.reconcile_settlement_projection(
		active_village_id, npc_records, false)
	if bool(result.get("ok", false)):
		npc_records = (result.get("resident_records", npc_records) \
			as Dictionary).duplicate(true)


func refresh_social_projection() -> void:
	apply_social_owner_projection()
	_refresh_social_reputation_projection()
	_refresh_permissions()


func reconcile_political_owner(allow_existing_updates: bool = false) -> bool:
	_ensure_political_owner()
	var projection := {
		"npc_records": npc_records.duplicate(true),
		"site_id": "hamlet_facade.%s" % active_village_id,
		"government_profile_ref": "government.communal_council",
		"governing_faction_archetype_ref": "faction.local_council",
	}
	var result := PoliticalManager.reconcile_settlement_projection(
		active_village_id, projection, allow_existing_updates)
	if not bool(result.get("ok", false)):
		push_warning("HamletState: political-owner reconciliation failed: %s" % result)
		return false
	return true


func apply_political_owner_projection() -> void:
	if not initialized or not PoliticalManager.initialized:
		return
	if PoliticalManager.government_for_settlement(active_village_id).is_empty():
		reconcile_political_owner(false)


func refresh_political_projection() -> void:
	apply_political_owner_projection()
	_refresh_permissions()


func reconcile_movement_owner(allow_existing_updates: bool = false) -> bool:
	_ensure_movement_owner()
	for npc_id in get_npc_ids():
		var record: Dictionary = npc_records[npc_id]
		var position_value: Variant = record.get("position", [])
		var position: Array = position_value.duplicate(true) \
			if position_value is Array else []
		if position.size() != 3:
			var home: Array = record.get("home", [])
			position = [float(home[0]) + 0.5, 0.0, float(home[1]) + 0.5] \
				if home.size() >= 2 else [0.0, 0.0, 0.0]
		var result := MovementManager.register_mover({
			"transaction_id": "movement.hamlet.register.%s" % npc_id,
			"entity_ref": npc_id,
			"mover_profile_ref": "mover_profile.humanoid.npc",
			"position": position,
			"movement_mode": "Ground",
			"movement_state": str(record.get("activity", "Idle")).capitalize(),
			"lod_state": "local" if active_village_id \
				== SettlementManager.focused_settlement_id else "distant",
			"semantic_location": {
				"kind": "settlement",
				"ref": active_village_id,
				"settlement_ref": active_village_id,
				"position": position,
			},
		})
		if not bool(result.get("ok", false)):
			push_warning("HamletState: movement-owner reconciliation failed: %s" \
				% result)
			return false
		if allow_existing_updates and MovementManager.has_mover(npc_id):
			MovementManager.commit_physical_snapshot({
				"entity_ref": npc_id,
				"position": position,
				"movement_mode": "Ground",
				"movement_state": str(record.get("activity", "Idle")).capitalize(),
				"semantic_location": {
					"kind": "settlement",
					"ref": active_village_id,
					"settlement_ref": active_village_id,
					"position": position,
				},
			})
	return true


func apply_movement_owner_projection() -> void:
	if not initialized or not MovementManager.initialized:
		return
	for npc_id in get_npc_ids():
		if not MovementManager.has_mover(npc_id):
			continue
		var mover := MovementManager.mover_record(npc_id)
		var position: Array = mover.get("position", [])
		if position.size() != 3:
			continue
		var record: Dictionary = npc_records[npc_id]
		record["position"] = position.duplicate(true)
		record["movement_record_ref"] = str(mover.get("movement_record_ref", ""))
		record["movement_revision"] = int(mover.get("movement_revision", 0))
		npc_records[npc_id] = record


func refresh_movement_projection() -> void:
	apply_movement_owner_projection()


func _ensure_people_owner() -> void:
	if PeopleManager.initialized and PeopleManager.world_seed == world_seed:
		return
	PeopleManager.initialize(
		world_seed,
		str(WorldManager.active_world.get("world_id", "")))


func _ensure_biology_owner() -> void:
	if BiologyManager.initialized and BiologyManager.world_seed == world_seed:
		return
	BiologyManager.initialize(
		world_seed,
		str(WorldManager.active_world.get("world_id", "")))


func _ensure_social_owner() -> void:
	if SocialManager.initialized and SocialManager.world_seed == world_seed:
		return
	SocialManager.initialize(
		world_seed,
		str(WorldManager.active_world.get("world_id", "")))


func _ensure_political_owner() -> void:
	if PoliticalManager.initialized and PoliticalManager.world_seed == world_seed:
		return
	PoliticalManager.initialize(
		world_seed,
		str(WorldManager.active_world.get("world_id", "")))


func _ensure_movement_owner() -> void:
	if MovementManager.initialized and MovementManager.world_seed == world_seed:
		return
	MovementManager.initialize(
		world_seed,
		str(WorldManager.active_world.get("world_id", "")))


func _restore_runtime_records(data: Dictionary) -> void:
	runtime_projects.clear()
	runtime_buildings.clear()
	runtime_plans.clear()
	var saved_projects: Variant = data.get("runtime_projects", {})
	if saved_projects is Dictionary:
		for instance_value in saved_projects:
			var instance_id := str(instance_value)
			var raw: Variant = saved_projects[instance_value]
			if instance_id.is_empty() or not (raw is Dictionary):
				continue
			var record: Dictionary = raw.duplicate(true)
			var definition_id := SettlementContentRegistry.canonical_id(str(
				record.get("definition_id", record.get("id", ""))))
			if SettlementContentRegistry.get_project(definition_id).is_empty():
				continue
			record["id"] = definition_id
			record["definition_id"] = definition_id
			record["building_definition_id"] = SettlementContentRegistry.canonical_id(
				str(record.get("building_definition_id", "")))
			record["blueprint_id"] = SettlementContentRegistry.canonical_id(
				str(record.get("blueprint_id", "")))
			record["instance_id"] = instance_id
			runtime_projects[instance_id] = record
	var saved_buildings: Variant = data.get("runtime_buildings", {})
	if saved_buildings is Dictionary:
		for instance_value in saved_buildings:
			var instance_id := str(instance_value)
			var raw: Variant = saved_buildings[instance_value]
			if instance_id.is_empty() or not (raw is Dictionary):
				continue
			var record: Dictionary = raw.duplicate(true)
			var definition_id := SettlementContentRegistry.canonical_id(str(
				record.get("definition_id", "")))
			if SettlementContentRegistry.get_building(definition_id).is_empty():
				continue
			record["definition_id"] = definition_id
			record["blueprint_id"] = SettlementContentRegistry.canonical_id(
				str(record.get("blueprint_id", "")))
			record["instance_id"] = instance_id
			record["condition"] = clampf(
				float(record.get("condition", 1.0)), 0.0, 1.0)
			var adoption := StructureManager.adopt_legacy_building(record, {
				"world_seed": world_seed,
				"settlement_id": str(record.get(
					"owner_id", active_village_id)),
				"migration_id": "save.v18.structure_owner",
			})
			if bool(adoption.get("ok", false)):
				record = StructureManager.compatibility_building_view(
					instance_id, record)
			runtime_buildings[instance_id] = record
	var saved_plans: Variant = data.get("runtime_plans", {})
	if saved_plans is Dictionary:
		for instance_value in saved_plans:
			var instance_id := str(instance_value)
			var raw: Variant = saved_plans[instance_value]
			if instance_id.is_empty() or not (raw is Dictionary):
				continue
			var record: Dictionary = raw.duplicate(true)
			var definition_id := SettlementContentRegistry.canonical_id(str(
				record.get("definition_id", "")))
			if SettlementContentRegistry.get_plan(definition_id).is_empty():
				continue
			record["definition_id"] = definition_id
			record["instance_id"] = instance_id
			runtime_plans[instance_id] = record


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
