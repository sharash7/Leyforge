extends Node
## Canonical Document-13 owner for formal political world state.
##
## PeopleManager owns persons, SocialManager owns trust/belief/negotiation,
## Set 27 owns economic amounts and execution, and Set 30/26 owns physical
## movement. This owner commits governments, factions, offices, jurisdiction,
## law, membership, territory claims, recognition, treaties and permission
## facts without duplicating those specialist domains.

signal political_changed

const STATE_SCHEMA := "leyforge.political-state"
const STATE_VERSION := 1
const INTERFACE_ID := "leyforge.system.interface.political"
const INTERFACE_VERSION := "1.0"
const EVIDENCE_OWNER := "document13.political"
const MAX_EVIDENCE_REFS := 128
const MAX_HISTORY_REFS := 128
const MAX_TRANSACTION_JOURNAL := 256

const GOVERNMENT_PROFILE_IDS: Array[String] = [
	"government.communal_council",
	"government.direct_assembly",
	"government.constitutional_monarchy",
	"government.central_monarchy",
	"government.guild_oligarchy",
	"government.clan_confederacy",
	"government.civic_republic",
	"government.plural_temple_compact",
	"government.frontier_march",
	"government.cooperative_federation",
	"government.machine_consensus",
	"government.ancestor_mandate",
	"government.contract_principality",
	"government.customary_network",
]

const FACTION_ARCHETYPE_IDS: Array[String] = [
	"faction.local_council",
	"faction.crown_administration",
	"faction.confederacy",
	"faction.merchant_league",
	"faction.craft_guild",
	"faction.mage_order",
	"faction.faith_network",
	"faction.ancestor_house",
	"faction.military_order",
	"faction.frontier_company",
	"faction.caravan_federation",
	"faction.portal_authority",
	"faction.research_consortium",
	"faction.personhood_league",
	"faction.labour_union",
	"faction.rebel_movement",
	"faction.raider_clan",
	"faction.bandit_syndicate",
	"faction.pirate_flotilla",
	"faction.smuggler_network",
	"faction.forbidden_order",
	"faction.ancient_remnant",
	"faction.realm_embassy",
	"faction.crisis_coalition",
]

const VALID_CAPABILITIES: Array[String] = [
	"political.enact_law",
	"political.sign_treaty",
	"political.declare_war",
	"political.appoint_office",
	"political.grant_citizenship",
	"political.manage_membership",
	"political.control_customs",
	"political.authorise_taxation",
	"political.authorise_public_borrowing",
	"political.authorise_public_procurement",
	"political.manage_public_treasury",
	"political.command_public_military",
	"political.grant_asylum",
	"political.issue_building_permit",
	"political.manage_territory",
	"political.manage_diplomacy",
	"political.manage_border",
	"political.adjudicate",
	"political.issue_warrant",
	"political.enforce_contract",
	"settlement.request_delivery",
	"settlement.warehouse.deposit",
	"settlement.warehouse.view",
	"settlement.warehouse.withdraw",
	"settlement.automation.import",
]

const LOCAL_EXECUTIVE_CAPABILITIES: Array[String] = [
	"political.enact_law",
	"political.sign_treaty",
	"political.appoint_office",
	"political.grant_citizenship",
	"political.manage_membership",
	"political.control_customs",
	"political.authorise_taxation",
	"political.authorise_public_procurement",
	"political.command_public_military",
	"political.grant_asylum",
	"political.issue_building_permit",
	"political.manage_territory",
	"political.manage_diplomacy",
	"political.manage_border",
	"political.adjudicate",
]

const VALID_GOVERNMENT_STATES: Array[String] = [
	"active", "interim", "occupied", "collapsed", "dissolved",
]
const VALID_FACTION_STATES: Array[String] = [
	"forming", "active", "underground", "reformed", "dissolved",
]
const VALID_JURISDICTION_TYPES: Array[String] = [
	"settlement", "district", "territory", "road", "bridge", "market",
	"port", "portal", "vessel", "protected_site", "realm_enclave",
]
const VALID_OFFICE_STATES: Array[String] = [
	"active", "vacant", "suspended", "abolished",
]
const VALID_GRANT_STATES: Array[String] = [
	"active", "suspended", "expired", "revoked",
]
const VALID_LAW_STATES: Array[String] = [
	"proposed", "active", "suspended", "expired", "repealed",
]
const VALID_LAW_EFFECT_MODES: Array[String] = [
	"require_authority", "public_allow", "deny",
]
const VALID_MEMBERSHIP_TYPES: Array[String] = [
	"citizen", "resident", "visitor", "guest", "protected_foreigner",
	"diplomat", "refugee", "asylum_seeker", "stateless", "outlaw",
	"prisoner", "exile", "faction_member", "government_member",
	"office_member", "vassal", "client", "tributary", "ally",
	"honorary_member", "infiltrator",
]
const VALID_MEMBERSHIP_VISIBILITY: Array[String] = [
	"public", "private", "disputed", "illegal", "hidden", "historical",
]
const VALID_MEMBERSHIP_STATES: Array[String] = [
	"active", "conditional", "temporary", "revoked", "ended",
]
const VALID_CLAIM_TYPES: Array[String] = [
	"sovereignty", "occupation", "lease", "communal", "protected",
	"sacred", "demilitarised", "frontier", "autonomous", "route",
]
const VALID_CLAIM_STATES: Array[String] = [
	"active", "disputed", "suspended", "withdrawn", "superseded",
]
const VALID_CONTROL_BANDS: Array[String] = [
	"none", "nominal", "contested", "limited", "effective", "complete",
]
const VALID_RECOGNITION_STATES: Array[String] = [
	"unknown", "recognised", "partially_recognised", "unrecognised",
	"disputed", "hostile_but_recognised",
]
const VALID_FORMAL_STATES: Array[String] = [
	"unknown", "peace", "alliance", "defensive_pact", "non_aggression",
	"truce", "war", "protectorate", "vassalage", "autonomy",
	"ceasefire", "disputed",
]
const VALID_TREATY_STATES: Array[String] = [
	"draft", "active", "suspended", "expired", "breached", "terminated",
]

var initialized := false
var restored_from_state := false
var world_seed := 0
var world_id := ""
var _governments: Dictionary = {}
var _factions: Dictionary = {}
var _jurisdictions: Dictionary = {}
var _offices: Dictionary = {}
var _authority_grants: Dictionary = {}
var _laws: Dictionary = {}
var _memberships: Dictionary = {}
var _territory_claims: Dictionary = {}
var _relationships: Dictionary = {}
var _treaties: Dictionary = {}
var _political_history: Dictionary = {}
var _transactions: Dictionary = {}
var _transaction_order: Array[String] = []


func reset() -> void:
	initialized = false
	restored_from_state = false
	world_seed = 0
	world_id = ""
	_governments.clear()
	_factions.clear()
	_jurisdictions.clear()
	_offices.clear()
	_authority_grants.clear()
	_laws.clear()
	_memberships.clear()
	_territory_claims.clear()
	_relationships.clear()
	_treaties.clear()
	_political_history.clear()
	_transactions.clear()
	_transaction_order.clear()
	political_changed.emit()


func initialize(seed_value: int, requested_world_id: String = "") -> void:
	if initialized and world_seed == seed_value \
			and (requested_world_id.is_empty() or world_id == requested_world_id):
		return
	reset()
	initialized = true
	world_seed = seed_value
	world_id = requested_world_id if not requested_world_id.is_empty() \
		else "world.seed.%d" % seed_value
	political_changed.emit()


func government_ids(settlement_ref: String = "") -> Array[String]:
	return _matching_ids(_governments, "government_id", "governed_settlement_refs",
		settlement_ref)


func faction_ids(government_ref: String = "") -> Array[String]:
	return _matching_ids(_factions, "faction_id", "government_refs", government_ref)


func jurisdiction_ids(government_ref: String = "") -> Array[String]:
	return _matching_ids(_jurisdictions, "jurisdiction_id", "government_ref",
		government_ref)


func office_ids(government_ref: String = "") -> Array[String]:
	return _matching_ids(_offices, "office_id", "government_ref", government_ref)


func authority_grant_ids(actor_ref: String = "") -> Array[String]:
	return _matching_ids(_authority_grants, "grant_id", "actor_ref", actor_ref)


func law_ids(jurisdiction_ref: String = "") -> Array[String]:
	return _matching_ids(_laws, "law_instance_id", "jurisdiction_ref",
		jurisdiction_ref)


func membership_ids(actor_ref: String = "") -> Array[String]:
	return _matching_ids(_memberships, "membership_id", "actor_ref", actor_ref)


func territory_claim_ids(spatial_ref: String = "") -> Array[String]:
	return _matching_ids(_territory_claims, "claim_id", "spatial_ref", spatial_ref)


func political_relationship_ids(entity_ref: String = "") -> Array[String]:
	var result: Array[String] = []
	for relationship_id in _relationships:
		var record: Dictionary = _relationships[relationship_id]
		if entity_ref.is_empty() or entity_ref in [
			str(record.get("actor_a_ref", "")),
			str(record.get("actor_b_ref", "")),
		]:
			result.append(str(relationship_id))
	result.sort()
	return result


func treaty_ids(signatory_ref: String = "") -> Array[String]:
	return _matching_ids(_treaties, "treaty_id", "signatory_refs", signatory_ref)


func get_government(government_id: String) -> Dictionary:
	return (_governments.get(government_id, {}) as Dictionary).duplicate(true)


func get_faction(faction_id: String) -> Dictionary:
	return (_factions.get(faction_id, {}) as Dictionary).duplicate(true)


func get_jurisdiction(jurisdiction_id: String) -> Dictionary:
	return (_jurisdictions.get(jurisdiction_id, {}) as Dictionary).duplicate(true)


func get_office(office_id: String) -> Dictionary:
	return (_offices.get(office_id, {}) as Dictionary).duplicate(true)


func get_authority_grant(grant_id: String) -> Dictionary:
	return (_authority_grants.get(grant_id, {}) as Dictionary).duplicate(true)


func get_law(law_instance_id: String) -> Dictionary:
	return (_laws.get(law_instance_id, {}) as Dictionary).duplicate(true)


func get_membership(membership_id: String) -> Dictionary:
	return (_memberships.get(membership_id, {}) as Dictionary).duplicate(true)


func get_territory_claim(claim_id: String) -> Dictionary:
	return (_territory_claims.get(claim_id, {}) as Dictionary).duplicate(true)


func get_political_relationship(relationship_id: String) -> Dictionary:
	return (_relationships.get(relationship_id, {}) as Dictionary).duplicate(true)


func get_treaty(treaty_id: String) -> Dictionary:
	return (_treaties.get(treaty_id, {}) as Dictionary).duplicate(true)


func government_for_settlement(settlement_ref: String) -> Dictionary:
	for government_id in government_ids(settlement_ref):
		var government: Dictionary = _governments[government_id]
		if str(government.get("state", "")) in ["active", "interim", "occupied"]:
			return government.duplicate(true)
	return {}


func ensure_settlement_government(request: Dictionary) -> Dictionary:
	_ensure_initialized(request)
	var settlement_ref := str(request.get("settlement_ref", ""))
	var profile_ref := str(request.get(
		"profile_ref", "government.communal_council"))
	var faction_archetype_ref := str(request.get(
		"faction_archetype_ref", "faction.local_council"))
	if settlement_ref.is_empty():
		return {"ok": false, "error": "CIV-GOV-001.missing_settlement_ref"}
	if profile_ref not in GOVERNMENT_PROFILE_IDS:
		return {"ok": false, "error": "CIV-GOV-001.invalid_profile_ref"}
	if faction_archetype_ref not in FACTION_ARCHETYPE_IDS:
		return {"ok": false, "error": "CIV-FAC-001.invalid_archetype_ref"}
	var transaction_id := _request_transaction_id(request)
	if transaction_id.is_empty():
		transaction_id = "political.ensure_settlement.%s" % _world_scoped_token(
			settlement_ref)
	var replay := _transaction_replay(transaction_id, request)
	if not replay.is_empty():
		return replay
	var resident_refs := _normalised_refs(request.get("resident_refs", []))
	var executive_holder_ref := str(request.get("executive_holder_ref", ""))
	if not executive_holder_ref.is_empty() and executive_holder_ref not in resident_refs:
		resident_refs.append(executive_holder_ref)
		resident_refs.sort()
	var token := _world_scoped_token(settlement_ref)
	var government_id := str(request.get(
		"government_id", "government_instance.%s" % token))
	var faction_id := str(request.get(
		"faction_id", "faction.generated.%s" % token))
	var jurisdiction_id := str(request.get(
		"jurisdiction_id", "jurisdiction.settlement.%s" % token))
	var office_id := str(request.get(
		"office_id", "office.local_executive.%s" % token))
	if government_id.is_empty() or faction_id.is_empty() \
			or jurisdiction_id.is_empty() or office_id.is_empty():
		return {"ok": false, "error": "CIV-ID-001.invalid_generated_identity"}
	var evidence_payload := {
		"settlement_ref": settlement_ref,
		"government_id": government_id,
		"faction_id": faction_id,
		"jurisdiction_id": jurisdiction_id,
		"office_id": office_id,
		"profile_ref": profile_ref,
		"faction_archetype_ref": faction_archetype_ref,
		"resident_refs": resident_refs,
		"executive_holder_ref": executive_holder_ref,
		"source_evidence_ref": str(request.get("source_evidence_ref",
			request.get("generation_evidence", ""))),
	}
	var evidence_id := "evidence.political.settlement.%s" % _stable_token(
		{"transaction_id": transaction_id, "payload": evidence_payload})
	var evidence := _commit_evidence(
		evidence_id, "political.settlement_government_reconciled",
		evidence_payload, transaction_id)
	if not bool(evidence.get("ok", false)):
		return {"ok": false, "error": "CIV-AUTH-001.evidence_commit_failed",
			"detail": evidence}
	var now := _world_tick()
	var government: Dictionary = _governments.get(government_id, {})
	if government.is_empty():
		government = {
			"record_type": "GovernmentInstanceRecord",
			"version": STATE_VERSION,
			"government_id": government_id,
			"profile_ref": profile_ref,
			"scope": str(request.get("scope", "settlement")),
			"jurisdiction_refs": [jurisdiction_id],
			"governed_settlement_refs": [settlement_ref],
			"governed_territory_refs": [],
			"governing_faction_refs": [faction_id],
			"office_refs": [office_id],
			"charter_refs": _normalised_refs(request.get("charter_refs", [])),
			"active_law_refs": [],
			"recognised_by_refs": [],
			"legitimacy_claim_refs": _normalised_refs(
				request.get("legitimacy_claim_refs", [])),
			"specialist_authority_refs": {
				"fiscal": "", "military": "", "diplomacy": "",
			},
			"state": "active",
			"revision": 1,
			"created_tick": now,
			"updated_tick": now,
			"evidence_refs": [evidence_id],
			"history_refs": [],
			"state_hash": "",
		}
	else:
		government["jurisdiction_refs"] = _append_ref(
			government.get("jurisdiction_refs", []), jurisdiction_id,
			MAX_EVIDENCE_REFS)
		government["governed_settlement_refs"] = _append_ref(
			government.get("governed_settlement_refs", []), settlement_ref,
			MAX_EVIDENCE_REFS)
		government["governing_faction_refs"] = _append_ref(
			government.get("governing_faction_refs", []), faction_id,
			MAX_EVIDENCE_REFS)
		government["office_refs"] = _append_ref(
			government.get("office_refs", []), office_id, MAX_EVIDENCE_REFS)
		government["evidence_refs"] = _append_ref(
			government.get("evidence_refs", []), evidence_id, MAX_EVIDENCE_REFS)
		government["revision"] = int(government.get("revision", 0)) + 1
		government["updated_tick"] = now
	government["state_hash"] = _record_hash(government)
	_governments[government_id] = government

	var jurisdiction: Dictionary = _jurisdictions.get(jurisdiction_id, {})
	if jurisdiction.is_empty():
		jurisdiction = {
			"record_type": "JurisdictionRecord",
			"version": STATE_VERSION,
			"jurisdiction_id": jurisdiction_id,
			"government_ref": government_id,
			"jurisdiction_type": "settlement",
			"spatial_refs": [settlement_ref],
			"parent_jurisdiction_ref": "",
			"overlap_policy": "allowed",
			"authority_capabilities": LOCAL_EXECUTIVE_CAPABILITIES.duplicate(),
			"status": "active",
			"revision": 1,
			"created_tick": now,
			"updated_tick": now,
			"evidence_refs": [evidence_id],
			"state_hash": "",
		}
	else:
		jurisdiction["spatial_refs"] = _append_ref(
			jurisdiction.get("spatial_refs", []), settlement_ref,
			MAX_EVIDENCE_REFS)
		jurisdiction["evidence_refs"] = _append_ref(
			jurisdiction.get("evidence_refs", []), evidence_id,
			MAX_EVIDENCE_REFS)
		jurisdiction["revision"] = int(jurisdiction.get("revision", 0)) + 1
		jurisdiction["updated_tick"] = now
	jurisdiction["state_hash"] = _record_hash(jurisdiction)
	_jurisdictions[jurisdiction_id] = jurisdiction

	var faction: Dictionary = _factions.get(faction_id, {})
	if faction.is_empty():
		faction = {
			"record_type": "PoliticalFactionRecord",
			"version": STATE_VERSION,
			"faction_id": faction_id,
			"archetype_ref": faction_archetype_ref,
			"government_refs": [government_id],
			"government_role": "administration",
			"headquarters_ref": settlement_ref,
			"public_visibility": "public",
			"legal_status": "recognised",
			"membership_refs": [],
			"office_refs": [office_id],
			"territory_claim_refs": [],
			"treaty_refs": [],
			"state": "active",
			"revision": 1,
			"created_tick": now,
			"updated_tick": now,
			"evidence_refs": [evidence_id],
			"history_refs": [],
			"state_hash": "",
		}
	else:
		faction["government_refs"] = _append_ref(
			faction.get("government_refs", []), government_id,
			MAX_EVIDENCE_REFS)
		faction["office_refs"] = _append_ref(
			faction.get("office_refs", []), office_id, MAX_EVIDENCE_REFS)
		faction["evidence_refs"] = _append_ref(
			faction.get("evidence_refs", []), evidence_id, MAX_EVIDENCE_REFS)
		faction["revision"] = int(faction.get("revision", 0)) + 1
		faction["updated_tick"] = now
	faction["state_hash"] = _record_hash(faction)
	_factions[faction_id] = faction

	var office: Dictionary = _offices.get(office_id, {})
	if office.is_empty():
		office = {
			"record_type": "PoliticalOfficeRecord",
			"version": STATE_VERSION,
			"office_id": office_id,
			"government_ref": government_id,
			"office_type": str(request.get("office_type", "local_executive")),
			"jurisdiction_refs": [jurisdiction_id],
			"capability_ids": LOCAL_EXECUTIVE_CAPABILITIES.duplicate(),
			"holder_refs": [] if executive_holder_ref.is_empty() \
				else [executive_holder_ref],
			"single_holder": true,
			"appointment_basis": str(request.get(
				"appointment_basis", "legacy_settlement_reconciliation")),
			"authority_source_ref": government_id,
			"effective_tick": now,
			"expiry_tick": 0,
			"status": "vacant" if executive_holder_ref.is_empty() else "active",
			"revision": 1,
			"created_tick": now,
			"updated_tick": now,
			"evidence_refs": [evidence_id],
			"state_hash": "",
		}
	else:
		if not executive_holder_ref.is_empty():
			office["holder_refs"] = [executive_holder_ref]
			office["status"] = "active"
		office["evidence_refs"] = _append_ref(
			office.get("evidence_refs", []), evidence_id, MAX_EVIDENCE_REFS)
		office["revision"] = int(office.get("revision", 0)) + 1
		office["updated_tick"] = now
	office["state_hash"] = _record_hash(office)
	_offices[office_id] = office

	for resident_ref in resident_refs:
		_upsert_membership_internal({
			"actor_ref": resident_ref,
			"organisation_ref": government_id,
			"membership_type": "resident",
			"public_visibility": "public",
			"legal_status_refs": ["legal_status.resident"],
			"authority_source_ref": government_id,
			"evidence_id": evidence_id,
			"start_tick": now,
		})
	var history_id := _append_history(
		"settlement_government_reconciled", government_id, evidence_payload,
		evidence_id)
	government = _governments[government_id]
	government["history_refs"] = _append_ref(
		government.get("history_refs", []), history_id, MAX_HISTORY_REFS)
	government["state_hash"] = _record_hash(government)
	_governments[government_id] = government
	var result := {
		"ok": true,
		"government_id": government_id,
		"faction_id": faction_id,
		"jurisdiction_id": jurisdiction_id,
		"office_id": office_id,
		"evidence_id": evidence_id,
		"result_revision": int(government.get("revision", 1)),
		"political_summary": settlement_political_summary(settlement_ref),
	}
	_store_transaction(transaction_id, government_id, _hash_value(request), result)
	political_changed.emit()
	return result


func appoint_office(request: Dictionary) -> Dictionary:
	_ensure_initialized(request)
	var office_id := str(request.get("office_id", ""))
	var holder_ref := str(request.get("holder_ref", ""))
	if not _offices.has(office_id) or holder_ref.is_empty():
		return {"ok": false, "error": "CIV-OFF-001.invalid_appointment"}
	var office: Dictionary = _offices[office_id]
	var authorizer_ref := str(request.get("authorizer_ref", ""))
	var permission := permission_query({
		"actor_ref": authorizer_ref,
		"capability_id": "political.appoint_office",
		"government_ref": str(office.get("government_ref", "")),
		"jurisdiction_ref": str((office.get("jurisdiction_refs", []) as Array).front()
			if not (office.get("jurisdiction_refs", []) as Array).is_empty() else ""),
	})
	if not bool(permission.get("allowed", false)):
		return {"ok": false, "error": "CIV-AUTH-001.appointment_denied",
			"permission": permission}
	var transaction_id := _request_transaction_id(request)
	if transaction_id.is_empty():
		return {"ok": false, "error": "CIV-AUTH-001.missing_transaction_id"}
	var replay := _transaction_replay(transaction_id, request)
	if not replay.is_empty():
		return replay
	var expected_revision := int(request.get(
		"expected_revision", office.get("revision", 0)))
	if expected_revision != int(office.get("revision", 0)):
		return {"ok": false, "error": "CIV-OFF-001.revision_conflict"}
	var evidence_id := "evidence.political.office.%s" % _stable_token(request)
	var evidence := _commit_evidence(
		evidence_id, "political.office_appointed", request, transaction_id)
	if not bool(evidence.get("ok", false)):
		return {"ok": false, "error": "CIV-AUTH-001.evidence_commit_failed"}
	var previous_holders := (office.get("holder_refs", []) as Array).duplicate()
	office["holder_refs"] = [holder_ref]
	office["status"] = "active"
	office["appointment_basis"] = str(request.get(
		"appointment_basis", "authorised_appointment"))
	office["revision"] = int(office.get("revision", 0)) + 1
	office["updated_tick"] = _world_tick()
	office["evidence_refs"] = _append_ref(
		office.get("evidence_refs", []), evidence_id, MAX_EVIDENCE_REFS)
	office["state_hash"] = _record_hash(office)
	_offices[office_id] = office
	var history_id := _append_history("office_appointed", office_id, {
		"previous_holders": previous_holders,
		"holder_ref": holder_ref,
		"authorizer_ref": authorizer_ref,
	}, evidence_id)
	var result := {"ok": true, "office_id": office_id,
		"holder_ref": holder_ref, "history_id": history_id,
		"evidence_id": evidence_id,
		"result_revision": int(office.get("revision", 0))}
	_store_transaction(transaction_id, office_id, _hash_value(request), result)
	political_changed.emit()
	return result


func issue_authority_grant(request: Dictionary) -> Dictionary:
	_ensure_initialized(request)
	var actor_ref := str(request.get("actor_ref", ""))
	var government_ref := str(request.get("government_ref", ""))
	var capabilities := _normalised_refs(request.get("capability_ids", []))
	if actor_ref.is_empty() or not _governments.has(government_ref) \
			or capabilities.is_empty() or not _capabilities_valid(capabilities):
		return {"ok": false, "error": "CIV-AUTH-001.invalid_grant"}
	var authorizer_ref := str(request.get("authorizer_ref", ""))
	var bootstrap := bool(request.get("bootstrap", false))
	if not bootstrap:
		var permission := permission_query({
			"actor_ref": authorizer_ref,
			"capability_id": "political.appoint_office",
			"government_ref": government_ref,
			"jurisdiction_ref": str(request.get("jurisdiction_ref", "")),
		})
		if not bool(permission.get("allowed", false)):
			return {"ok": false, "error": "CIV-AUTH-001.grant_denied",
				"permission": permission}
	var transaction_id := _request_transaction_id(request)
	if transaction_id.is_empty():
		return {"ok": false, "error": "CIV-AUTH-001.missing_transaction_id"}
	var replay := _transaction_replay(transaction_id, request)
	if not replay.is_empty():
		return replay
	var grant_id := str(request.get("grant_id", "authority_grant.%s" %
		_world_scoped_token({"actor": actor_ref, "government": government_ref,
			"basis": request.get("basis_ref", transaction_id),
			"capabilities": capabilities})))
	var evidence_id := "evidence.political.authority.%s" % _stable_token(request)
	var evidence := _commit_evidence(
		evidence_id, "political.authority_granted", request, transaction_id)
	if not bool(evidence.get("ok", false)):
		return {"ok": false, "error": "CIV-AUTH-001.evidence_commit_failed"}
	var existing: Dictionary = _authority_grants.get(grant_id, {})
	var now := _world_tick()
	var record := {
		"record_type": "AuthorityGrantRecord",
		"version": STATE_VERSION,
		"grant_id": grant_id,
		"actor_ref": actor_ref,
		"government_ref": government_ref,
		"jurisdiction_refs": _normalised_refs(request.get(
			"jurisdiction_refs", [request.get("jurisdiction_ref", "")])),
		"capability_ids": capabilities,
		"subject_refs": _normalised_refs(request.get("subject_refs", [])),
		"basis_type": str(request.get("basis_type", "delegated")),
		"basis_ref": str(request.get("basis_ref", "")),
		"delegator_ref": authorizer_ref,
		"conditions": (request.get("conditions", {}) as Dictionary).duplicate(true),
		"effective_tick": int(request.get("effective_tick", now)),
		"expiry_tick": int(request.get("expiry_tick", 0)),
		"status": str(request.get("status", "active")),
		"revision": int(existing.get("revision", 0)) + 1,
		"created_tick": int(existing.get("created_tick", now)),
		"updated_tick": now,
		"evidence_refs": _append_ref(existing.get("evidence_refs", []),
			evidence_id, MAX_EVIDENCE_REFS),
		"state_hash": "",
	}
	record["state_hash"] = _record_hash(record)
	var validation := validate_authority_grant(record)
	if not bool(validation.get("ok", false)):
		return validation
	_authority_grants[grant_id] = record
	var history_id := _append_history(
		"authority_granted", grant_id, request, evidence_id)
	var result := {"ok": true, "grant_id": grant_id,
		"history_id": history_id, "evidence_id": evidence_id,
		"result_revision": int(record.get("revision", 0))}
	_store_transaction(transaction_id, grant_id, _hash_value(request), result)
	political_changed.emit()
	return result


func reconcile_operational_access(request: Dictionary) -> Dictionary:
	_ensure_initialized(request)
	var settlement_ref := str(request.get("settlement_ref", ""))
	var actor_ref := str(request.get("actor_ref", ""))
	var access_points := maxi(0, int(request.get("access_points", 0)))
	var project_complete := bool(request.get("project_complete", false))
	var government := government_for_settlement(settlement_ref)
	if government.is_empty() or actor_ref.is_empty():
		return {"ok": false,
			"error": "CIV-AUTH-001.missing_settlement_government"}
	var government_ref := str(government.get("government_id", ""))
	var jurisdiction_refs: Array = government.get("jurisdiction_refs", [])
	var jurisdiction_ref := str(jurisdiction_refs.front()) \
		if not jurisdiction_refs.is_empty() else ""
	var effective_access := maxi(access_points, 35 if project_complete else 0)
	var thresholds := {
		"settlement.request_delivery": 1,
		"settlement.warehouse.deposit": 16,
		"settlement.warehouse.view": 16,
		"settlement.warehouse.withdraw": 35,
		"settlement.automation.import": 16,
	}
	var capabilities: Array[String] = []
	for capability_id in thresholds:
		if effective_access >= int(thresholds[capability_id]):
			capabilities.append(str(capability_id))
	capabilities.sort()
	var grant_id := "authority_grant.operational.%s" % _world_scoped_token({
		"settlement_ref": settlement_ref,
		"actor_ref": actor_ref,
	})
	var evidence_refs := _normalised_refs(request.get("evidence_refs", []))
	var transaction_id := _request_transaction_id(request)
	if transaction_id.is_empty():
		transaction_id = "political.operational_access.%s.%d.%s.%s" % [
			_world_scoped_token({"settlement": settlement_ref, "actor": actor_ref}),
			effective_access,
			str(project_complete),
			_stable_token(evidence_refs),
		]
	var request_copy := request.duplicate(true)
	request_copy["evidence_refs"] = evidence_refs
	request_copy["transaction_id"] = transaction_id
	var replay := _transaction_replay(transaction_id, request_copy)
	if not replay.is_empty():
		return replay
	var evidence_payload := {
		"settlement_ref": settlement_ref,
		"actor_ref": actor_ref,
		"access_points": access_points,
		"project_complete": project_complete,
		"capability_ids": capabilities,
		"source_evidence_refs": evidence_refs,
	}
	var evidence_id := "evidence.political.operational.%s" % _stable_token(
		{"transaction_id": transaction_id, "payload": evidence_payload})
	var evidence := _commit_evidence(
		evidence_id, "political.operational_access_reconciled",
		evidence_payload, transaction_id)
	if not bool(evidence.get("ok", false)):
		return {"ok": false, "error": "CIV-AUTH-001.evidence_commit_failed"}
	var now := _world_tick()
	var existing: Dictionary = _authority_grants.get(grant_id, {})
	var record := {
		"record_type": "AuthorityGrantRecord",
		"version": STATE_VERSION,
		"grant_id": grant_id,
		"actor_ref": actor_ref,
		"government_ref": government_ref,
		"jurisdiction_refs": [jurisdiction_ref] if not jurisdiction_ref.is_empty()
			else [],
		"capability_ids": capabilities,
		"subject_refs": [settlement_ref],
		"basis_type": "operational_compatibility",
		"basis_ref": "document07.settlement_operation_evidence",
		"delegator_ref": "",
		"conditions": {
			"access_points": access_points,
			"project_complete": project_complete,
			"source_evidence_refs": evidence_refs,
		},
		"effective_tick": int(existing.get("effective_tick", now)),
		"expiry_tick": 0,
		"status": "active" if not capabilities.is_empty() else "suspended",
		"revision": int(existing.get("revision", 0)) + 1,
		"created_tick": int(existing.get("created_tick", now)),
		"updated_tick": now,
		"evidence_refs": _append_ref(existing.get("evidence_refs", []),
			evidence_id, MAX_EVIDENCE_REFS),
		"state_hash": "",
	}
	record["state_hash"] = _record_hash(record)
	_authority_grants[grant_id] = record
	var history_id := _append_history(
		"operational_access_reconciled", grant_id, evidence_payload, evidence_id)
	var result := {
		"ok": true,
		"grant_id": grant_id,
		"capability_ids": capabilities,
		"history_id": history_id,
		"evidence_id": evidence_id,
		"result_revision": int(record.get("revision", 0)),
	}
	_store_transaction(transaction_id, grant_id, _hash_value(request_copy), result)
	political_changed.emit()
	return result


func activate_law(request: Dictionary) -> Dictionary:
	_ensure_initialized(request)
	var definition_ref := str(request.get("definition_ref", ""))
	var jurisdiction_ref := str(request.get("jurisdiction_ref", ""))
	if definition_ref.is_empty() or not _jurisdictions.has(jurisdiction_ref):
		return {"ok": false, "error": "CIV-LAW-001.invalid_definition_or_jurisdiction"}
	var jurisdiction: Dictionary = _jurisdictions[jurisdiction_ref]
	var government_ref := str(jurisdiction.get("government_ref", ""))
	var authorizer_ref := str(request.get("authorizer_ref", ""))
	if not bool(request.get("bootstrap", false)):
		var permission := permission_query({
			"actor_ref": authorizer_ref,
			"capability_id": "political.enact_law",
			"government_ref": government_ref,
			"jurisdiction_ref": jurisdiction_ref,
		})
		if not bool(permission.get("allowed", false)):
			return {"ok": false, "error": "CIV-AUTH-001.law_enactment_denied",
				"permission": permission}
	var effects_value: Variant = request.get("permission_effects", {})
	if not (effects_value is Dictionary):
		return {"ok": false, "error": "CIV-LAW-001.invalid_permission_effects"}
	for capability_value in (effects_value as Dictionary):
		var capability_id := str(capability_value)
		var effect_value: Variant = (effects_value as Dictionary)[capability_value]
		if capability_id not in VALID_CAPABILITIES or not (effect_value is Dictionary) \
				or str((effect_value as Dictionary).get(
					"mode", "require_authority")) not in VALID_LAW_EFFECT_MODES:
			return {"ok": false, "error": "CIV-LAW-001.invalid_permission_effect"}
	var transaction_id := _request_transaction_id(request)
	if transaction_id.is_empty():
		return {"ok": false, "error": "CIV-AUTH-001.missing_transaction_id"}
	var replay := _transaction_replay(transaction_id, request)
	if not replay.is_empty():
		return replay
	var law_id := str(request.get("law_instance_id", "law.%s" %
		_world_scoped_token({"definition": definition_ref,
			"jurisdiction": jurisdiction_ref, "transaction": transaction_id})))
	var evidence_id := "evidence.political.law.%s" % _stable_token(request)
	var evidence := _commit_evidence(
		evidence_id, "political.law_activated", request, transaction_id)
	if not bool(evidence.get("ok", false)):
		return {"ok": false, "error": "CIV-AUTH-001.evidence_commit_failed"}
	var existing: Dictionary = _laws.get(law_id, {})
	var now := _world_tick()
	var record := {
		"record_type": "ActiveLawRecord",
		"version": STATE_VERSION,
		"law_instance_id": law_id,
		"definition_ref": definition_ref,
		"government_ref": government_ref,
		"jurisdiction_ref": jurisdiction_ref,
		"enacted_by_ref": authorizer_ref,
		"effective_tick": int(request.get("effective_tick", now)),
		"expiry_tick": int(request.get("expiry_tick", 0)),
		"subject_filters": (request.get("subject_filters", {}) as Dictionary).duplicate(true),
		"exempt_actor_refs": _normalised_refs(request.get("exempt_actor_refs", [])),
		"specialist_policy_refs": _normalised_refs(
			request.get("specialist_policy_refs", [])),
		"permission_effects": (effects_value as Dictionary).duplicate(true),
		"legal_classifications": _normalised_refs(
			request.get("legal_classifications", [])),
		"status": str(request.get("status", "active")),
		"revision": int(existing.get("revision", 0)) + 1,
		"created_tick": int(existing.get("created_tick", now)),
		"updated_tick": now,
		"evidence_refs": _append_ref(existing.get("evidence_refs", []),
			evidence_id, MAX_EVIDENCE_REFS),
		"state_hash": "",
	}
	record["state_hash"] = _record_hash(record)
	var validation := validate_law(record)
	if not bool(validation.get("ok", false)):
		return validation
	_laws[law_id] = record
	var government: Dictionary = _governments[government_ref]
	government["active_law_refs"] = _append_ref(
		government.get("active_law_refs", []), law_id, MAX_EVIDENCE_REFS)
	government["revision"] = int(government.get("revision", 0)) + 1
	government["updated_tick"] = now
	government["state_hash"] = _record_hash(government)
	_governments[government_ref] = government
	var history_id := _append_history("law_activated", law_id, request, evidence_id)
	var result := {"ok": true, "law_instance_id": law_id,
		"history_id": history_id, "evidence_id": evidence_id,
		"result_revision": int(record.get("revision", 0))}
	_store_transaction(transaction_id, law_id, _hash_value(request), result)
	political_changed.emit()
	return result


func commit_membership(request: Dictionary) -> Dictionary:
	_ensure_initialized(request)
	var actor_ref := str(request.get("actor_ref", ""))
	var organisation_ref := str(request.get("organisation_ref", ""))
	var membership_type := str(request.get("membership_type", ""))
	if actor_ref.is_empty() or membership_type not in VALID_MEMBERSHIP_TYPES \
			or not (_governments.has(organisation_ref) \
			or _factions.has(organisation_ref)):
		return {"ok": false, "error": "CIV-MEM-001.invalid_membership"}
	var government_ref := organisation_ref
	if _factions.has(organisation_ref):
		var government_refs: Array = (
			_factions[organisation_ref] as Dictionary).get("government_refs", [])
		government_ref = str(government_refs.front()) \
			if not government_refs.is_empty() else ""
	var required_capability := "political.grant_citizenship" \
		if membership_type in ["citizen", "protected_foreigner", "refugee",
			"asylum_seeker"] else "political.manage_membership"
	if not bool(request.get("bootstrap", false)):
		var permission := permission_query({
			"actor_ref": str(request.get("authorizer_ref", "")),
			"capability_id": required_capability,
			"government_ref": government_ref,
			"jurisdiction_ref": str(request.get("jurisdiction_ref", "")),
		})
		if not bool(permission.get("allowed", false)):
			return {"ok": false, "error": "CIV-AUTH-001.membership_denied",
				"permission": permission}
	var transaction_id := _request_transaction_id(request)
	if transaction_id.is_empty():
		return {"ok": false, "error": "CIV-AUTH-001.missing_transaction_id"}
	var replay := _transaction_replay(transaction_id, request)
	if not replay.is_empty():
		return replay
	var evidence_id := "evidence.political.membership.%s" % _stable_token(request)
	var evidence := _commit_evidence(
		evidence_id, "political.membership_committed", request, transaction_id)
	if not bool(evidence.get("ok", false)):
		return {"ok": false, "error": "CIV-AUTH-001.evidence_commit_failed"}
	var membership := _upsert_membership_internal({
		"membership_id": request.get("membership_id", ""),
		"actor_ref": actor_ref,
		"organisation_ref": organisation_ref,
		"membership_type": membership_type,
		"public_visibility": request.get("public_visibility", "public"),
		"legal_status_refs": request.get("legal_status_refs", []),
		"role_refs": request.get("role_refs", []),
		"authority_source_ref": request.get("authority_source_ref",
			request.get("authorizer_ref", "")),
		"evidence_id": evidence_id,
		"start_tick": request.get("start_tick", _world_tick()),
		"end_tick": request.get("end_tick", 0),
		"status": request.get("status", "active"),
	})
	var membership_id := str(membership.get("membership_id", ""))
	var history_id := _append_history(
		"membership_committed", membership_id, request, evidence_id)
	var result := {"ok": true, "membership_id": membership_id,
		"history_id": history_id, "evidence_id": evidence_id,
		"result_revision": int(membership.get("revision", 0))}
	_store_transaction(transaction_id, membership_id, _hash_value(request), result)
	political_changed.emit()
	return result


func register_territory_claim(request: Dictionary) -> Dictionary:
	_ensure_initialized(request)
	var claimant_ref := str(request.get("claimant_ref", ""))
	var spatial_ref := str(request.get("spatial_ref", ""))
	var claim_type := str(request.get("claim_type", "sovereignty"))
	if spatial_ref.is_empty() or claim_type not in VALID_CLAIM_TYPES \
			or not (_governments.has(claimant_ref) \
			or _factions.has(claimant_ref) \
			or claimant_ref.begins_with("settlement.")):
		return {"ok": false, "error": "CIV-TERR-001.invalid_claim"}
	var government_ref := claimant_ref if _governments.has(claimant_ref) else \
		str(request.get("government_ref", ""))
	if not bool(request.get("bootstrap", false)):
		var permission := permission_query({
			"actor_ref": str(request.get("authorizer_ref", "")),
			"capability_id": "political.manage_territory",
			"government_ref": government_ref,
			"jurisdiction_ref": str(request.get("jurisdiction_ref", "")),
		})
		if not bool(permission.get("allowed", false)):
			return {"ok": false, "error": "CIV-AUTH-001.territory_denied",
				"permission": permission}
	var transaction_id := _request_transaction_id(request)
	if transaction_id.is_empty():
		return {"ok": false, "error": "CIV-AUTH-001.missing_transaction_id"}
	var replay := _transaction_replay(transaction_id, request)
	if not replay.is_empty():
		return replay
	var claim_id := str(request.get("claim_id", "territory_claim.%s" %
		_world_scoped_token({"claimant": claimant_ref, "spatial": spatial_ref,
			"type": claim_type})))
	var evidence_id := "evidence.political.territory.%s" % _stable_token(request)
	var evidence := _commit_evidence(
		evidence_id, "political.territory_claim_committed", request, transaction_id)
	if not bool(evidence.get("ok", false)):
		return {"ok": false, "error": "CIV-AUTH-001.evidence_commit_failed"}
	var existing: Dictionary = _territory_claims.get(claim_id, {})
	var now := _world_tick()
	var record := {
		"record_type": "TerritoryClaimRecord",
		"version": STATE_VERSION,
		"claim_id": claim_id,
		"claimant_ref": claimant_ref,
		"government_ref": government_ref,
		"spatial_ref": spatial_ref,
		"claim_type": claim_type,
		"legal_basis_refs": _normalised_refs(request.get("legal_basis_refs", [])),
		"history_refs": _normalised_refs(request.get("history_refs", [])),
		"treaty_refs": _normalised_refs(request.get("treaty_refs", [])),
		"effective_control_band": str(request.get(
			"effective_control_band", "nominal")),
		"disputed_by_refs": _normalised_refs(request.get("disputed_by_refs", [])),
		"status": str(request.get("status", "active")),
		"revision": int(existing.get("revision", 0)) + 1,
		"created_tick": int(existing.get("created_tick", now)),
		"updated_tick": now,
		"evidence_refs": _append_ref(existing.get("evidence_refs", []),
			evidence_id, MAX_EVIDENCE_REFS),
		"state_hash": "",
	}
	record["state_hash"] = _record_hash(record)
	var validation := validate_territory_claim(record)
	if not bool(validation.get("ok", false)):
		return validation
	_territory_claims[claim_id] = record
	if _governments.has(claimant_ref):
		var government: Dictionary = _governments[claimant_ref]
		government["governed_territory_refs"] = _append_ref(
			government.get("governed_territory_refs", []), claim_id,
			MAX_EVIDENCE_REFS)
		government["revision"] = int(government.get("revision", 0)) + 1
		government["updated_tick"] = now
		government["state_hash"] = _record_hash(government)
		_governments[claimant_ref] = government
	if _factions.has(claimant_ref):
		var faction: Dictionary = _factions[claimant_ref]
		faction["territory_claim_refs"] = _append_ref(
			faction.get("territory_claim_refs", []), claim_id,
			MAX_EVIDENCE_REFS)
		faction["revision"] = int(faction.get("revision", 0)) + 1
		faction["updated_tick"] = now
		faction["state_hash"] = _record_hash(faction)
		_factions[claimant_ref] = faction
	var history_id := _append_history(
		"territory_claim_committed", claim_id, request, evidence_id)
	var result := {"ok": true, "claim_id": claim_id,
		"history_id": history_id, "evidence_id": evidence_id,
		"result_revision": int(record.get("revision", 0))}
	_store_transaction(transaction_id, claim_id, _hash_value(request), result)
	political_changed.emit()
	return result


func set_political_relationship(request: Dictionary) -> Dictionary:
	_ensure_initialized(request)
	var actor_a_ref := str(request.get("actor_a_ref", ""))
	var actor_b_ref := str(request.get("actor_b_ref", ""))
	if actor_a_ref.is_empty() or actor_b_ref.is_empty() \
			or actor_a_ref == actor_b_ref or not _political_entity_exists(actor_a_ref) \
			or not _political_entity_exists(actor_b_ref):
		return {"ok": false, "error": "CIV-ID-001.invalid_political_relationship"}
	var recognition_state := str(request.get("recognition_state", "unknown"))
	var formal_state := str(request.get("formal_state", "peace"))
	if recognition_state not in VALID_RECOGNITION_STATES \
			or formal_state not in VALID_FORMAL_STATES:
		return {"ok": false, "error": "CIV-ID-001.invalid_formal_state"}
	if not bool(request.get("bootstrap", false)):
		var permission := permission_query({
			"actor_ref": str(request.get("authorizer_ref", "")),
			"capability_id": "political.manage_diplomacy",
			"government_ref": str(request.get("government_ref", actor_a_ref)),
			"jurisdiction_ref": str(request.get("jurisdiction_ref", "")),
		})
		if not bool(permission.get("allowed", false)):
			return {"ok": false, "error": "CIV-AUTH-001.diplomacy_denied",
				"permission": permission}
	var transaction_id := _request_transaction_id(request)
	if transaction_id.is_empty():
		return {"ok": false, "error": "CIV-AUTH-001.missing_transaction_id"}
	var replay := _transaction_replay(transaction_id, request)
	if not replay.is_empty():
		return replay
	var pair := [actor_a_ref, actor_b_ref]
	pair.sort()
	var relationship_id := str(request.get("relationship_id",
		"political_relationship.%s" % _world_scoped_token(pair)))
	var evidence_id := "evidence.political.relationship.%s" % _stable_token(request)
	var evidence := _commit_evidence(
		evidence_id, "political.relationship_committed", request, transaction_id)
	if not bool(evidence.get("ok", false)):
		return {"ok": false, "error": "CIV-AUTH-001.evidence_commit_failed"}
	var existing: Dictionary = _relationships.get(relationship_id, {})
	var now := _world_tick()
	var record := {
		"record_type": "PoliticalRelationshipRecord",
		"version": STATE_VERSION,
		"relationship_id": relationship_id,
		"actor_a_ref": str(pair[0]),
		"actor_b_ref": str(pair[1]),
		"recognition_state": recognition_state,
		"formal_state": formal_state,
		"active_treaty_refs": _normalised_refs(request.get(
			"active_treaty_refs", existing.get("active_treaty_refs", []))),
		"dispute_refs": _normalised_refs(request.get("dispute_refs", [])),
		"war_ref": str(request.get("war_ref", "")),
		"access_policy_refs": _normalised_refs(request.get("access_policy_refs", [])),
		"economic_policy_refs": _normalised_refs(
			request.get("economic_policy_refs", [])),
		"movement_policy_refs": _normalised_refs(
			request.get("movement_policy_refs", [])),
		"last_changed_tick": now,
		"revision": int(existing.get("revision", 0)) + 1,
		"created_tick": int(existing.get("created_tick", now)),
		"updated_tick": now,
		"evidence_refs": _append_ref(existing.get("evidence_refs", []),
			evidence_id, MAX_EVIDENCE_REFS),
		"state_hash": "",
	}
	record["state_hash"] = _record_hash(record)
	_relationships[relationship_id] = record
	var history_id := _append_history(
		"political_relationship_committed", relationship_id, request, evidence_id)
	var result := {"ok": true, "relationship_id": relationship_id,
		"history_id": history_id, "evidence_id": evidence_id,
		"result_revision": int(record.get("revision", 0))}
	_store_transaction(transaction_id, relationship_id, _hash_value(request), result)
	political_changed.emit()
	return result


func commit_treaty(request: Dictionary) -> Dictionary:
	_ensure_initialized(request)
	var signatory_refs := _normalised_refs(request.get("signatory_refs", []))
	var signer_refs_value: Variant = request.get("authorised_signer_refs", {})
	if signatory_refs.size() < 2 or not (signer_refs_value is Dictionary):
		return {"ok": false, "error": "CIV-TREATY-001.invalid_signatories"}
	for signatory_ref in signatory_refs:
		if not _political_entity_exists(signatory_ref):
			return {"ok": false, "error": "CIV-TREATY-001.unknown_signatory"}
		var signer_ref := str((signer_refs_value as Dictionary).get(signatory_ref, ""))
		var government_ref := signatory_ref
		if _factions.has(signatory_ref):
			var government_refs: Array = (
				_factions[signatory_ref] as Dictionary).get("government_refs", [])
			government_ref = str(government_refs.front()) \
				if not government_refs.is_empty() else ""
		var permission := permission_query({
			"actor_ref": signer_ref,
			"capability_id": "political.sign_treaty",
			"government_ref": government_ref,
			"jurisdiction_ref": str(request.get("jurisdiction_ref", "")),
		})
		if not bool(permission.get("allowed", false)):
			return {"ok": false, "error": "CIV-TREATY-001.unauthorised_signer",
				"signatory_ref": signatory_ref, "permission": permission}
	var transaction_id := _request_transaction_id(request)
	if transaction_id.is_empty():
		return {"ok": false, "error": "CIV-AUTH-001.missing_transaction_id"}
	var replay := _transaction_replay(transaction_id, request)
	if not replay.is_empty():
		return replay
	var treaty_id := str(request.get("treaty_id", "treaty.%s" %
		_world_scoped_token({"signatories": signatory_refs,
			"transaction": transaction_id})))
	var evidence_id := "evidence.political.treaty.%s" % _stable_token(request)
	var evidence := _commit_evidence(
		evidence_id, "political.treaty_committed", request, transaction_id)
	if not bool(evidence.get("ok", false)):
		return {"ok": false, "error": "CIV-AUTH-001.evidence_commit_failed"}
	var existing: Dictionary = _treaties.get(treaty_id, {})
	var now := _world_tick()
	var record := {
		"record_type": "PoliticalTreatyRecord",
		"version": STATE_VERSION,
		"treaty_id": treaty_id,
		"treaty_type": str(request.get("treaty_type", "agreement")),
		"signatory_refs": signatory_refs,
		"authorised_signer_refs": (signer_refs_value as Dictionary).duplicate(true),
		"effective_tick": int(request.get("effective_tick", now)),
		"expiry_or_review_tick": int(request.get("expiry_or_review_tick", 0)),
		"term_refs": _normalised_refs(request.get("term_refs", [])),
		"economic_policy_refs": _normalised_refs(
			request.get("economic_policy_refs", [])),
		"movement_policy_refs": _normalised_refs(
			request.get("movement_policy_refs", [])),
		"status": str(request.get("status", "active")),
		"revision": int(existing.get("revision", 0)) + 1,
		"created_tick": int(existing.get("created_tick", now)),
		"updated_tick": now,
		"evidence_refs": _append_ref(existing.get("evidence_refs", []),
			evidence_id, MAX_EVIDENCE_REFS),
		"state_hash": "",
	}
	record["state_hash"] = _record_hash(record)
	var validation := validate_treaty(record)
	if not bool(validation.get("ok", false)):
		return validation
	_treaties[treaty_id] = record
	for signatory_ref in signatory_refs:
		if _governments.has(signatory_ref):
			var government: Dictionary = _governments[signatory_ref]
			government["history_refs"] = _append_ref(
				government.get("history_refs", []), treaty_id, MAX_HISTORY_REFS)
			government["revision"] = int(government.get("revision", 0)) + 1
			government["updated_tick"] = now
			government["state_hash"] = _record_hash(government)
			_governments[signatory_ref] = government
		if _factions.has(signatory_ref):
			var faction: Dictionary = _factions[signatory_ref]
			faction["treaty_refs"] = _append_ref(
				faction.get("treaty_refs", []), treaty_id, MAX_HISTORY_REFS)
			faction["revision"] = int(faction.get("revision", 0)) + 1
			faction["updated_tick"] = now
			faction["state_hash"] = _record_hash(faction)
			_factions[signatory_ref] = faction
	for index in signatory_refs.size():
		for other_index in range(index + 1, signatory_refs.size()):
			_link_treaty_relationship(
				signatory_refs[index], signatory_refs[other_index], treaty_id,
				str(request.get("recognition_state", "recognised")),
				str(request.get("formal_state", "peace")), evidence_id)
	var history_id := _append_history(
		"treaty_committed", treaty_id, request, evidence_id)
	var result := {"ok": true, "treaty_id": treaty_id,
		"history_id": history_id, "evidence_id": evidence_id,
		"result_revision": int(record.get("revision", 0))}
	_store_transaction(transaction_id, treaty_id, _hash_value(request), result)
	political_changed.emit()
	return result


func permission_query(request: Dictionary) -> Dictionary:
	var actor_ref := str(request.get("actor_ref", ""))
	var capability_id := str(request.get("capability_id", ""))
	var government_ref := str(request.get("government_ref", ""))
	var jurisdiction_ref := str(request.get("jurisdiction_ref", ""))
	var subject_ref := str(request.get("subject_ref", ""))
	var base := {
		"schema": "leyforge.document13.permission-decision",
		"version": STATE_VERSION,
		"actor_ref": actor_ref,
		"capability_id": capability_id,
		"government_ref": government_ref,
		"jurisdiction_ref": jurisdiction_ref,
		"subject_ref": subject_ref,
		"allowed": false,
		"reason_code": "CIV-AUTH-001.permission_denied",
		"authority_source_refs": [],
		"law_refs": [],
		"world_time": _world_time(),
	}
	if not initialized or actor_ref.is_empty() \
			or capability_id not in VALID_CAPABILITIES:
		base["reason_code"] = "CIV-AUTH-001.invalid_permission_request"
		return base
	var law_resolution := _law_permission_resolution(
		actor_ref, capability_id, jurisdiction_ref, subject_ref)
	base["law_refs"] = law_resolution.get("law_refs", [])
	if bool(law_resolution.get("denied", false)):
		base["reason_code"] = "CIV-LAW-001.explicit_denial"
		return base
	var sources: Array[String] = []
	for office_id in _offices:
		var office: Dictionary = _offices[office_id]
		if str(office.get("status", "")) != "active" \
				or actor_ref not in (office.get("holder_refs", []) as Array) \
				or capability_id not in (office.get("capability_ids", []) as Array) \
				or not _government_matches(government_ref,
					str(office.get("government_ref", ""))) \
				or not _scope_matches(jurisdiction_ref,
					office.get("jurisdiction_refs", [])):
			continue
		if _record_active_at(office):
			sources.append(str(office_id))
	for grant_id in _authority_grants:
		var grant: Dictionary = _authority_grants[grant_id]
		if str(grant.get("status", "")) != "active" \
				or str(grant.get("actor_ref", "")) != actor_ref \
				or capability_id not in (grant.get("capability_ids", []) as Array) \
				or not _government_matches(government_ref,
					str(grant.get("government_ref", ""))) \
				or not _scope_matches(jurisdiction_ref,
					grant.get("jurisdiction_refs", [])) \
				or not _scope_matches(subject_ref, grant.get("subject_refs", [])):
			continue
		if _record_active_at(grant):
			sources.append(str(grant_id))
	if bool(law_resolution.get("public_allow", false)):
		for law_ref in law_resolution.get("law_refs", []):
			sources.append(str(law_ref))
	sources.sort()
	base["authority_source_refs"] = sources
	if not sources.is_empty():
		base["allowed"] = true
		base["reason_code"] = "CIV-AUTH-000.permission_granted"
	return base


func political_status_view(
		actor_ref: String,
		viewer_ref: String = "",
		reveal_private: bool = false) -> Dictionary:
	var memberships: Array[Dictionary] = []
	var legal_status_refs: Array[String] = []
	for membership_id in membership_ids(actor_ref):
		var membership: Dictionary = _memberships[membership_id]
		var visibility := str(membership.get("public_visibility", "public"))
		if visibility in ["private", "hidden", "illegal"] \
				and not reveal_private and viewer_ref != actor_ref:
			continue
		memberships.append(membership.duplicate(true))
		for status_ref in membership.get("legal_status_refs", []):
			if str(status_ref) not in legal_status_refs:
				legal_status_refs.append(str(status_ref))
	legal_status_refs.sort()
	return {
		"schema": "leyforge.document13.political-status-view",
		"version": STATE_VERSION,
		"actor_ref": actor_ref,
		"viewer_ref": viewer_ref,
		"memberships": memberships,
		"legal_status_refs": legal_status_refs,
		"classified_data_withheld": memberships.size() < membership_ids(actor_ref).size(),
		"world_time": _world_time(),
	}


func fiscal_authority_snapshot(
		actor_ref: String,
		government_ref: String,
		jurisdiction_ref: String) -> Dictionary:
	var capability_map := {
		"can_authorise_taxation": "political.authorise_taxation",
		"can_control_customs": "political.control_customs",
		"can_authorise_public_borrowing": "political.authorise_public_borrowing",
		"can_authorise_public_procurement": "political.authorise_public_procurement",
		"can_manage_public_treasury": "political.manage_public_treasury",
	}
	var decisions := {}
	for field in capability_map:
		decisions[field] = permission_query({
			"actor_ref": actor_ref,
			"capability_id": capability_map[field],
			"government_ref": government_ref,
			"jurisdiction_ref": jurisdiction_ref,
		})
	return {
		"schema": "leyforge.document13.set27-fiscal-authority-snapshot",
		"version": STATE_VERSION,
		"actor_ref": actor_ref,
		"government_ref": government_ref,
		"jurisdiction_ref": jurisdiction_ref,
		"decisions": decisions,
		"economic_values_owned": false,
		"world_time": _world_time(),
	}


func territory_truth(spatial_ref: String) -> Dictionary:
	var claims: Array[Dictionary] = []
	for claim_id in territory_claim_ids(spatial_ref):
		var claim: Dictionary = _territory_claims[claim_id]
		if str(claim.get("status", "")) in ["active", "disputed"]:
			claims.append(claim.duplicate(true))
	return {
		"schema": "leyforge.document13.territory-truth",
		"version": STATE_VERSION,
		"spatial_ref": spatial_ref,
		"claims": claims,
		"physical_traversability_owned": false,
		"world_time": _world_time(),
	}


func settlement_political_summary(settlement_ref: String) -> Dictionary:
	var governments := government_ids(settlement_ref)
	var jurisdiction_count := 0
	var office_count := 0
	var law_count := 0
	var membership_count := 0
	var claim_count := 0
	var max_revision := 0
	for government_id in governments:
		var government: Dictionary = _governments[government_id]
		max_revision = maxi(max_revision, int(government.get("revision", 0)))
		var jurisdictions := jurisdiction_ids(government_id)
		jurisdiction_count += jurisdictions.size()
		office_count += office_ids(government_id).size()
		for jurisdiction_id in jurisdictions:
			law_count += law_ids(jurisdiction_id).size()
	for membership_id in _memberships:
		var membership: Dictionary = _memberships[membership_id]
		if str(membership.get("organisation_ref", "")) in governments:
			membership_count += 1
	for claim_id in _territory_claims:
		var claim: Dictionary = _territory_claims[claim_id]
		if str(claim.get("government_ref", "")) in governments:
			claim_count += 1
	return {
		"schema": "leyforge.document13.settlement-political-summary",
		"version": STATE_VERSION,
		"settlement_ref": settlement_ref,
		"government_refs": governments,
		"jurisdiction_count": jurisdiction_count,
		"office_count": office_count,
		"active_law_count": law_count,
		"membership_count": membership_count,
		"territory_claim_count": claim_count,
		"source_revision": max_revision,
		"world_time": _world_time(),
	}


func lod_snapshot(settlement_ref: String) -> Dictionary:
	var government_records: Array[Dictionary] = []
	var faction_records: Array[Dictionary] = []
	var jurisdiction_records: Array[Dictionary] = []
	var office_records: Array[Dictionary] = []
	var membership_records: Array[Dictionary] = []
	var law_records: Array[Dictionary] = []
	var claim_records: Array[Dictionary] = []
	var relationship_records: Array[Dictionary] = []
	var treaty_records: Array[Dictionary] = []
	var relevant_entities: Array[String] = []
	for government_id in government_ids(settlement_ref):
		relevant_entities.append(government_id)
		var government: Dictionary = _governments[government_id]
		government_records.append(government.duplicate(true))
		for faction_ref in government.get("governing_faction_refs", []):
			if _factions.has(str(faction_ref)) and str(faction_ref) not in relevant_entities:
				relevant_entities.append(str(faction_ref))
				faction_records.append((
					_factions[str(faction_ref)] as Dictionary).duplicate(true))
		for jurisdiction_id in jurisdiction_ids(government_id):
			jurisdiction_records.append((
				_jurisdictions[jurisdiction_id] as Dictionary).duplicate(true))
			for law_id in law_ids(jurisdiction_id):
				law_records.append((_laws[law_id] as Dictionary).duplicate(true))
		for office_id in office_ids(government_id):
			office_records.append((_offices[office_id] as Dictionary).duplicate(true))
	for membership_id in _memberships:
		var membership: Dictionary = _memberships[membership_id]
		if str(membership.get("organisation_ref", "")) in relevant_entities:
			membership_records.append(membership.duplicate(true))
	for claim_id in _territory_claims:
		var claim: Dictionary = _territory_claims[claim_id]
		if str(claim.get("claimant_ref", "")) in relevant_entities \
				or str(claim.get("government_ref", "")) in relevant_entities:
			claim_records.append(claim.duplicate(true))
	for relationship_id in _relationships:
		var relationship: Dictionary = _relationships[relationship_id]
		if str(relationship.get("actor_a_ref", "")) in relevant_entities \
				or str(relationship.get("actor_b_ref", "")) in relevant_entities:
			relationship_records.append(relationship.duplicate(true))
			for treaty_ref in relationship.get("active_treaty_refs", []):
				if _treaties.has(str(treaty_ref)):
					treaty_records.append((
						_treaties[str(treaty_ref)] as Dictionary).duplicate(true))
	return {
		"identity": {
			"record_type": "PoliticalSettlementProjection",
			"settlement_ref": settlement_ref,
			"government_refs": government_ids(settlement_ref),
		},
		"ownership": {
			"owner": EVIDENCE_OWNER,
			"physical_settlement_owner": "document07.settlement",
		},
		"history": {
			"relationships": relationship_records,
			"treaties": treaty_records,
			"history_refs": _history_for_entities(relevant_entities),
		},
		"irreversible": {
			"memberships": membership_records,
			"territory_claims": claim_records,
		},
		"state": {
			"governments": government_records,
			"factions": faction_records,
			"jurisdictions": jurisdiction_records,
			"offices": office_records,
			"active_laws": law_records,
			"summary": settlement_political_summary(settlement_ref),
			"representation": "political_record",
		},
	}


func reconcile_settlement_projection(
		settlement_ref: String,
		projection: Dictionary,
		allow_existing_updates: bool = false) -> Dictionary:
	var npc_records: Dictionary = projection.get("npc_records", {})
	var resident_refs: Array[String] = []
	var executive_holder_ref := ""
	for actor_value in npc_records:
		var actor_ref := str(actor_value)
		resident_refs.append(actor_ref)
		var person: Dictionary = npc_records[actor_value]
		if executive_holder_ref.is_empty() and str(person.get("job_id", "")) \
				in ["job.leader.elder", "job.leader.mayor", "job.leader.chief"]:
			executive_holder_ref = actor_ref
	resident_refs.sort()
	var existing := government_for_settlement(settlement_ref)
	if not existing.is_empty() and not allow_existing_updates:
		var existing_government_id := str(existing.get("government_id", ""))
		var missing_residents: Array[String] = []
		for resident_ref in resident_refs:
			if not _has_active_membership(
					resident_ref, existing_government_id, "resident"):
				missing_residents.append(resident_ref)
		if missing_residents.is_empty():
			return {"ok": true,
				"government_id": existing_government_id,
				"political_summary": settlement_political_summary(settlement_ref),
				"political_lod": lod_snapshot(settlement_ref),
				"existing": true}
		resident_refs = missing_residents
		executive_holder_ref = ""
		projection["government_profile_ref"] = str(existing.get(
			"profile_ref", "government.communal_council"))
	var result := ensure_settlement_government({
		"transaction_id": "political.settlement_projection.%s.%s" % [
			_world_scoped_token(settlement_ref),
			_stable_token({"residents": resident_refs,
				"executive": executive_holder_ref})],
		"world_seed": world_seed,
		"world_id": world_id,
		"settlement_ref": settlement_ref,
		"resident_refs": resident_refs,
		"executive_holder_ref": executive_holder_ref,
		"profile_ref": str(projection.get(
			"government_profile_ref", "government.communal_council")),
		"faction_archetype_ref": str(projection.get(
			"governing_faction_archetype_ref", "faction.local_council")),
		"generation_evidence": str(projection.get(
			"site_id", "legacy_settlement_projection")),
	})
	if bool(result.get("ok", false)):
		result["political_lod"] = lod_snapshot(settlement_ref)
	return result


func serialize_state() -> Dictionary:
	var journal: Array[Dictionary] = []
	for transaction_id in _transaction_order:
		if _transactions.has(transaction_id):
			journal.append((_transactions[transaction_id] as Dictionary).duplicate(true))
	var data := {
		"schema": STATE_SCHEMA,
		"version": STATE_VERSION,
		"interface_id": INTERFACE_ID,
		"interface_version": INTERFACE_VERSION,
		"world_seed": world_seed,
		"world_id": world_id,
		"governments": _sorted_records(_governments, "government_id"),
		"factions": _sorted_records(_factions, "faction_id"),
		"jurisdictions": _sorted_records(_jurisdictions, "jurisdiction_id"),
		"offices": _sorted_records(_offices, "office_id"),
		"authority_grants": _sorted_records(_authority_grants, "grant_id"),
		"laws": _sorted_records(_laws, "law_instance_id"),
		"memberships": _sorted_records(_memberships, "membership_id"),
		"territory_claims": _sorted_records(_territory_claims, "claim_id"),
		"political_relationships": _sorted_records(
			_relationships, "relationship_id"),
		"treaties": _sorted_records(_treaties, "treaty_id"),
		"political_history": _sorted_records(_political_history, "history_id"),
		"transaction_journal": journal,
		"state_hash": "",
	}
	data["state_hash"] = _state_hash(data)
	return data


func restore_state(
		value: Variant,
		expected_seed: int,
		expected_world_id: String = "") -> bool:
	if not (value is Dictionary):
		return false
	var data: Dictionary = value
	if str(data.get("schema", "")) != STATE_SCHEMA \
			or int(data.get("version", 0)) != STATE_VERSION \
			or str(data.get("interface_id", "")) != INTERFACE_ID \
			or int(data.get("world_seed", -1)) != expected_seed \
			or str(data.get("state_hash", "")) != _state_hash(data):
		return false
	var saved_world_id := str(data.get("world_id", ""))
	if not expected_world_id.is_empty() and not saved_world_id.is_empty() \
			and saved_world_id != expected_world_id:
		return false
	var specs := [
		["governments", "government_id", Callable(self, "validate_government")],
		["factions", "faction_id", Callable(self, "validate_faction")],
		["jurisdictions", "jurisdiction_id", Callable(self, "validate_jurisdiction")],
		["offices", "office_id", Callable(self, "validate_office")],
		["authority_grants", "grant_id", Callable(self, "validate_authority_grant")],
		["laws", "law_instance_id", Callable(self, "validate_law")],
		["memberships", "membership_id", Callable(self, "validate_membership")],
		["territory_claims", "claim_id", Callable(self, "validate_territory_claim")],
		["political_relationships", "relationship_id",
			Callable(self, "validate_political_relationship")],
		["treaties", "treaty_id", Callable(self, "validate_treaty")],
		["political_history", "history_id", Callable(self, "validate_history")],
	]
	var restored_sets := {}
	for spec in specs:
		var restored := _restore_records(
			data.get(spec[0], []), str(spec[1]), spec[2])
		if not bool(restored.get("ok", false)):
			return false
		restored_sets[str(spec[0])] = restored.get("records", {})
	var restored_transactions := {}
	var restored_order: Array[String] = []
	var journal_value: Variant = data.get("transaction_journal", [])
	if not (journal_value is Array):
		return false
	for entry_value in journal_value:
		if not (entry_value is Dictionary):
			return false
		var entry: Dictionary = entry_value.duplicate(true)
		var transaction_id := str(entry.get("transaction_id", ""))
		if transaction_id.is_empty() or restored_transactions.has(transaction_id) \
				or str(entry.get("payload_hash", "")).length() != 64 \
				or not (entry.get("result", {}) is Dictionary):
			return false
		restored_transactions[transaction_id] = entry
		restored_order.append(transaction_id)
	initialized = true
	restored_from_state = true
	world_seed = expected_seed
	world_id = expected_world_id if not expected_world_id.is_empty() else saved_world_id
	_governments = restored_sets.get("governments", {})
	_factions = restored_sets.get("factions", {})
	_jurisdictions = restored_sets.get("jurisdictions", {})
	_offices = restored_sets.get("offices", {})
	_authority_grants = restored_sets.get("authority_grants", {})
	_laws = restored_sets.get("laws", {})
	_memberships = restored_sets.get("memberships", {})
	_territory_claims = restored_sets.get("territory_claims", {})
	_relationships = restored_sets.get("political_relationships", {})
	_treaties = restored_sets.get("treaties", {})
	_political_history = restored_sets.get("political_history", {})
	_transactions = restored_transactions
	_transaction_order = restored_order
	var validation := validate_state()
	if not bool(validation.get("ok", false)):
		return false
	political_changed.emit()
	return true


func validate_state() -> Dictionary:
	var errors: Array[String] = []
	var record_sets := [
		[_governments, Callable(self, "validate_government")],
		[_factions, Callable(self, "validate_faction")],
		[_jurisdictions, Callable(self, "validate_jurisdiction")],
		[_offices, Callable(self, "validate_office")],
		[_authority_grants, Callable(self, "validate_authority_grant")],
		[_laws, Callable(self, "validate_law")],
		[_memberships, Callable(self, "validate_membership")],
		[_territory_claims, Callable(self, "validate_territory_claim")],
		[_relationships, Callable(self, "validate_political_relationship")],
		[_treaties, Callable(self, "validate_treaty")],
		[_political_history, Callable(self, "validate_history")],
	]
	for spec in record_sets:
		var source: Dictionary = spec[0]
		var validator: Callable = spec[1]
		for record_id in source:
			var validation: Dictionary = validator.call(source[record_id])
			if not bool(validation.get("ok", false)):
				errors.append("%s:%s" % [
					str(validation.get("error", "invalid_record")), record_id])
	for government_id in _governments:
		var government: Dictionary = _governments[government_id]
		for jurisdiction_ref in government.get("jurisdiction_refs", []):
			if not _jurisdictions.has(str(jurisdiction_ref)):
				errors.append("CIV-GOV-001.missing_jurisdiction:%s" % government_id)
		for office_ref in government.get("office_refs", []):
			if not _offices.has(str(office_ref)):
				errors.append("CIV-GOV-001.missing_office:%s" % government_id)
	for jurisdiction_id in _jurisdictions:
		if not _governments.has(str((
			_jurisdictions[jurisdiction_id] as Dictionary).get("government_ref", ""))):
			errors.append("CIV-LAW-001.orphan_jurisdiction:%s" % jurisdiction_id)
	for office_id in _offices:
		var office: Dictionary = _offices[office_id]
		if not _governments.has(str(office.get("government_ref", ""))):
			errors.append("CIV-OFF-001.orphan_office:%s" % office_id)
		if bool(office.get("single_holder", false)) \
				and (office.get("holder_refs", []) as Array).size() > 1:
			errors.append("CIV-OFF-001.duplicate_single_holder:%s" % office_id)
	for law_id in _laws:
		var law: Dictionary = _laws[law_id]
		if not _jurisdictions.has(str(law.get("jurisdiction_ref", ""))):
			errors.append("CIV-LAW-001.orphan_law:%s" % law_id)
	for membership_id in _memberships:
		var membership: Dictionary = _memberships[membership_id]
		var organisation_ref := str(membership.get("organisation_ref", ""))
		if not (_governments.has(organisation_ref) or _factions.has(organisation_ref)):
			errors.append("CIV-MEM-001.orphan_membership:%s" % membership_id)
	for treaty_id in _treaties:
		var treaty: Dictionary = _treaties[treaty_id]
		for signatory_ref in treaty.get("signatory_refs", []):
			if not _political_entity_exists(str(signatory_ref)):
				errors.append("CIV-TREATY-001.orphan_signatory:%s" % treaty_id)
	return {"ok": errors.is_empty(), "errors": errors,
		"record_counts": {
			"governments": _governments.size(),
			"factions": _factions.size(),
			"jurisdictions": _jurisdictions.size(),
			"offices": _offices.size(),
			"authority_grants": _authority_grants.size(),
			"laws": _laws.size(),
			"memberships": _memberships.size(),
			"territory_claims": _territory_claims.size(),
			"relationships": _relationships.size(),
			"treaties": _treaties.size(),
		}}


func validate_government(record: Dictionary) -> Dictionary:
	if str(record.get("record_type", "")) != "GovernmentInstanceRecord" \
			or str(record.get("government_id", "")).is_empty() \
			or str(record.get("profile_ref", "")) not in GOVERNMENT_PROFILE_IDS \
			or str(record.get("state", "")) not in VALID_GOVERNMENT_STATES:
		return {"ok": false, "error": "CIV-GOV-001.invalid_government"}
	return _validate_hashed_record(record, ["jurisdiction_refs",
		"governed_settlement_refs", "governed_territory_refs",
		"governing_faction_refs", "office_refs", "active_law_refs",
		"evidence_refs", "history_refs"])


func validate_faction(record: Dictionary) -> Dictionary:
	if str(record.get("record_type", "")) != "PoliticalFactionRecord" \
			or str(record.get("faction_id", "")).is_empty() \
			or str(record.get("archetype_ref", "")) not in FACTION_ARCHETYPE_IDS \
			or str(record.get("state", "")) not in VALID_FACTION_STATES:
		return {"ok": false, "error": "CIV-FAC-001.invalid_faction"}
	return _validate_hashed_record(record, ["government_refs", "membership_refs",
		"office_refs", "territory_claim_refs", "treaty_refs", "evidence_refs",
		"history_refs"])


func validate_jurisdiction(record: Dictionary) -> Dictionary:
	if str(record.get("record_type", "")) != "JurisdictionRecord" \
			or str(record.get("jurisdiction_id", "")).is_empty() \
			or str(record.get("government_ref", "")).is_empty() \
			or str(record.get("jurisdiction_type", "")) not in VALID_JURISDICTION_TYPES \
			or (record.get("spatial_refs", []) as Array).is_empty():
		return {"ok": false, "error": "CIV-LAW-001.invalid_jurisdiction"}
	return _validate_hashed_record(record, ["spatial_refs",
		"authority_capabilities", "evidence_refs"])


func validate_office(record: Dictionary) -> Dictionary:
	if str(record.get("record_type", "")) != "PoliticalOfficeRecord" \
			or str(record.get("office_id", "")).is_empty() \
			or str(record.get("government_ref", "")).is_empty() \
			or str(record.get("status", "")) not in VALID_OFFICE_STATES \
			or not _capabilities_valid(record.get("capability_ids", [])):
		return {"ok": false, "error": "CIV-OFF-001.invalid_office"}
	if bool(record.get("single_holder", false)) \
			and (record.get("holder_refs", []) as Array).size() > 1:
		return {"ok": false, "error": "CIV-OFF-001.multiple_single_holders"}
	return _validate_hashed_record(record, ["jurisdiction_refs", "capability_ids",
		"holder_refs", "evidence_refs"])


func validate_authority_grant(record: Dictionary) -> Dictionary:
	if str(record.get("record_type", "")) != "AuthorityGrantRecord" \
			or str(record.get("grant_id", "")).is_empty() \
			or str(record.get("actor_ref", "")).is_empty() \
			or str(record.get("government_ref", "")).is_empty() \
			or str(record.get("status", "")) not in VALID_GRANT_STATES \
			or not _capabilities_valid(record.get("capability_ids", [])):
		return {"ok": false, "error": "CIV-AUTH-001.invalid_authority_grant"}
	return _validate_hashed_record(record, ["jurisdiction_refs", "capability_ids",
		"subject_refs", "evidence_refs"])


func validate_law(record: Dictionary) -> Dictionary:
	if str(record.get("record_type", "")) != "ActiveLawRecord" \
			or str(record.get("law_instance_id", "")).is_empty() \
			or str(record.get("definition_ref", "")).is_empty() \
			or str(record.get("jurisdiction_ref", "")).is_empty() \
			or str(record.get("status", "")) not in VALID_LAW_STATES \
			or not (record.get("permission_effects", {}) is Dictionary):
		return {"ok": false, "error": "CIV-LAW-001.invalid_law"}
	for capability_value in (record.get("permission_effects", {}) as Dictionary):
		var effect: Dictionary = (
			record.get("permission_effects", {}) as Dictionary)[capability_value]
		if str(capability_value) not in VALID_CAPABILITIES \
				or str(effect.get("mode", "")) not in VALID_LAW_EFFECT_MODES:
			return {"ok": false, "error": "CIV-LAW-001.invalid_effect"}
	return _validate_hashed_record(record, ["exempt_actor_refs",
		"specialist_policy_refs", "legal_classifications", "evidence_refs"])


func validate_membership(record: Dictionary) -> Dictionary:
	if str(record.get("record_type", "")) != "PoliticalMembershipRecord" \
			or str(record.get("membership_id", "")).is_empty() \
			or str(record.get("actor_ref", "")).is_empty() \
			or str(record.get("organisation_ref", "")).is_empty() \
			or str(record.get("membership_type", "")) not in VALID_MEMBERSHIP_TYPES \
			or str(record.get("public_visibility", "")) \
				not in VALID_MEMBERSHIP_VISIBILITY \
			or str(record.get("status", "")) not in VALID_MEMBERSHIP_STATES:
		return {"ok": false, "error": "CIV-MEM-001.invalid_membership"}
	return _validate_hashed_record(record, ["legal_status_refs", "role_refs",
		"evidence_refs"])


func validate_territory_claim(record: Dictionary) -> Dictionary:
	if str(record.get("record_type", "")) != "TerritoryClaimRecord" \
			or str(record.get("claim_id", "")).is_empty() \
			or str(record.get("claimant_ref", "")).is_empty() \
			or str(record.get("spatial_ref", "")).is_empty() \
			or str(record.get("claim_type", "")) not in VALID_CLAIM_TYPES \
			or str(record.get("status", "")) not in VALID_CLAIM_STATES \
			or str(record.get("effective_control_band", "")) \
				not in VALID_CONTROL_BANDS:
		return {"ok": false, "error": "CIV-TERR-001.invalid_claim"}
	return _validate_hashed_record(record, ["legal_basis_refs", "history_refs",
		"treaty_refs", "disputed_by_refs", "evidence_refs"])


func validate_political_relationship(record: Dictionary) -> Dictionary:
	if str(record.get("record_type", "")) != "PoliticalRelationshipRecord" \
			or str(record.get("relationship_id", "")).is_empty() \
			or str(record.get("actor_a_ref", "")).is_empty() \
			or str(record.get("actor_b_ref", "")).is_empty() \
			or str(record.get("recognition_state", "")) \
				not in VALID_RECOGNITION_STATES \
			or str(record.get("formal_state", "")) not in VALID_FORMAL_STATES:
		return {"ok": false, "error": "CIV-ID-001.invalid_relationship"}
	return _validate_hashed_record(record, ["active_treaty_refs", "dispute_refs",
		"access_policy_refs", "economic_policy_refs", "movement_policy_refs",
		"evidence_refs"])


func validate_treaty(record: Dictionary) -> Dictionary:
	if str(record.get("record_type", "")) != "PoliticalTreatyRecord" \
			or str(record.get("treaty_id", "")).is_empty() \
			or (record.get("signatory_refs", []) as Array).size() < 2 \
			or not (record.get("authorised_signer_refs", {}) is Dictionary) \
			or str(record.get("status", "")) not in VALID_TREATY_STATES:
		return {"ok": false, "error": "CIV-TREATY-001.invalid_treaty"}
	return _validate_hashed_record(record, ["signatory_refs", "term_refs",
		"economic_policy_refs", "movement_policy_refs", "evidence_refs"])


func validate_history(record: Dictionary) -> Dictionary:
	if str(record.get("record_type", "")) != "PoliticalHistoryRecord" \
			or str(record.get("history_id", "")).is_empty() \
			or str(record.get("event_type", "")).is_empty() \
			or str(record.get("subject_ref", "")).is_empty():
		return {"ok": false, "error": "CIV-ID-001.invalid_history"}
	return _validate_hashed_record(record, ["evidence_refs"])


func _upsert_membership_internal(request: Dictionary) -> Dictionary:
	var actor_ref := str(request.get("actor_ref", ""))
	var organisation_ref := str(request.get("organisation_ref", ""))
	var membership_type := str(request.get("membership_type", "resident"))
	var membership_id := str(request.get("membership_id", ""))
	if membership_id.is_empty():
		membership_id = "membership.%s" % _world_scoped_token({
			"actor": actor_ref,
			"organisation": organisation_ref,
			"type": membership_type,
		})
	var existing: Dictionary = _memberships.get(membership_id, {})
	var now := _world_tick()
	var record := {
		"record_type": "PoliticalMembershipRecord",
		"version": STATE_VERSION,
		"membership_id": membership_id,
		"actor_ref": actor_ref,
		"organisation_ref": organisation_ref,
		"membership_type": membership_type,
		"public_visibility": str(request.get("public_visibility", "public")),
		"start_tick": int(request.get("start_tick", now)),
		"end_tick": int(request.get("end_tick", 0)),
		"authority_source_ref": str(request.get("authority_source_ref", "")),
		"legal_status_refs": _normalised_refs(request.get("legal_status_refs", [])),
		"role_refs": _normalised_refs(request.get("role_refs", [])),
		"status": str(request.get("status", "active")),
		"revision": int(existing.get("revision", 0)) + 1,
		"created_tick": int(existing.get("created_tick", now)),
		"updated_tick": now,
		"evidence_refs": _append_ref(existing.get("evidence_refs", []),
			str(request.get("evidence_id", "")), MAX_EVIDENCE_REFS),
		"state_hash": "",
	}
	record["state_hash"] = _record_hash(record)
	_memberships[membership_id] = record
	if _factions.has(organisation_ref):
		var faction: Dictionary = _factions[organisation_ref]
		faction["membership_refs"] = _append_ref(
			faction.get("membership_refs", []), membership_id, MAX_EVIDENCE_REFS)
		faction["revision"] = int(faction.get("revision", 0)) + 1
		faction["updated_tick"] = now
		faction["state_hash"] = _record_hash(faction)
		_factions[organisation_ref] = faction
	return record


func _link_treaty_relationship(
		actor_a_ref: String,
		actor_b_ref: String,
		treaty_id: String,
		recognition_state: String,
		formal_state: String,
		evidence_id: String) -> void:
	var pair := [actor_a_ref, actor_b_ref]
	pair.sort()
	var relationship_id := "political_relationship.%s" % _world_scoped_token(pair)
	var existing: Dictionary = _relationships.get(relationship_id, {})
	var now := _world_tick()
	var record := {
		"record_type": "PoliticalRelationshipRecord",
		"version": STATE_VERSION,
		"relationship_id": relationship_id,
		"actor_a_ref": str(pair[0]),
		"actor_b_ref": str(pair[1]),
		"recognition_state": recognition_state,
		"formal_state": formal_state,
		"active_treaty_refs": _append_ref(
			existing.get("active_treaty_refs", []), treaty_id, MAX_HISTORY_REFS),
		"dispute_refs": (existing.get("dispute_refs", []) as Array).duplicate(),
		"war_ref": str(existing.get("war_ref", "")),
		"access_policy_refs": (
			existing.get("access_policy_refs", []) as Array).duplicate(),
		"economic_policy_refs": (
			existing.get("economic_policy_refs", []) as Array).duplicate(),
		"movement_policy_refs": (
			existing.get("movement_policy_refs", []) as Array).duplicate(),
		"last_changed_tick": now,
		"revision": int(existing.get("revision", 0)) + 1,
		"created_tick": int(existing.get("created_tick", now)),
		"updated_tick": now,
		"evidence_refs": _append_ref(existing.get("evidence_refs", []),
			evidence_id, MAX_EVIDENCE_REFS),
		"state_hash": "",
	}
	record["state_hash"] = _record_hash(record)
	_relationships[relationship_id] = record


func _law_permission_resolution(
		actor_ref: String,
		capability_id: String,
		jurisdiction_ref: String,
		subject_ref: String) -> Dictionary:
	var law_refs: Array[String] = []
	var denied := false
	var public_allow := false
	for law_id in _laws:
		var law: Dictionary = _laws[law_id]
		if str(law.get("status", "")) != "active" \
				or not _record_active_at(law) \
				or not _scope_matches(jurisdiction_ref,
					[str(law.get("jurisdiction_ref", ""))]):
			continue
		var effects: Dictionary = law.get("permission_effects", {})
		if not effects.has(capability_id):
			continue
		var effect: Dictionary = effects[capability_id]
		if not _law_subject_matches(effect, actor_ref, subject_ref):
			continue
		law_refs.append(str(law_id))
		if actor_ref in (law.get("exempt_actor_refs", []) as Array) \
				or actor_ref in (effect.get("exempt_actor_refs", []) as Array):
			continue
		match str(effect.get("mode", "require_authority")):
			"deny":
				denied = true
			"public_allow":
				public_allow = true
	law_refs.sort()
	return {"denied": denied, "public_allow": public_allow,
		"law_refs": law_refs}


func _law_subject_matches(
		effect: Dictionary,
		actor_ref: String,
		subject_ref: String) -> bool:
	var actor_refs: Array = effect.get("actor_refs", [])
	if not actor_refs.is_empty() and actor_ref not in actor_refs:
		return false
	var subject_refs: Array = effect.get("subject_refs", [])
	if not subject_refs.is_empty() and subject_ref not in subject_refs:
		return false
	var membership_types: Array = effect.get("membership_types", [])
	if not membership_types.is_empty():
		var matched := false
		for membership_id in membership_ids(actor_ref):
			var membership: Dictionary = _memberships[membership_id]
			if str(membership.get("membership_type", "")) in membership_types \
					and str(membership.get("status", "")) == "active":
				matched = true
				break
		if not matched:
			return false
	return true


func _record_active_at(record: Dictionary) -> bool:
	var now := _world_tick()
	var effective_tick := int(record.get("effective_tick", 0))
	var expiry_tick := int(record.get("expiry_tick", 0))
	return effective_tick <= now and (expiry_tick <= 0 or now < expiry_tick)


func _government_matches(requested: String, actual: String) -> bool:
	return requested.is_empty() or requested == actual


func _scope_matches(requested: String, scopes_value: Variant) -> bool:
	if requested.is_empty():
		return true
	if not (scopes_value is Array):
		return false
	var scopes: Array = scopes_value
	return scopes.is_empty() or requested in scopes


func _political_entity_exists(entity_ref: String) -> bool:
	return _governments.has(entity_ref) or _factions.has(entity_ref) \
		or entity_ref.begins_with("settlement.") or entity_ref.begins_with("realm.")


func _has_active_membership(
		actor_ref: String,
		organisation_ref: String,
		membership_type: String) -> bool:
	for membership_id in membership_ids(actor_ref):
		var membership: Dictionary = _memberships[membership_id]
		if str(membership.get("organisation_ref", "")) == organisation_ref \
				and str(membership.get("membership_type", "")) == membership_type \
				and str(membership.get("status", "")) in [
					"active", "conditional", "temporary"]:
			return true
	return false


func _history_for_entities(entity_refs: Array[String]) -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	for history_id in _political_history:
		var record: Dictionary = _political_history[history_id]
		if str(record.get("subject_ref", "")) in entity_refs:
			result.append(record.duplicate(true))
	return result


func _append_history(
		event_type: String,
		subject_ref: String,
		payload: Dictionary,
		evidence_id: String) -> String:
	var history_id := "political_history.%s" % _world_scoped_token({
		"event_type": event_type,
		"subject_ref": subject_ref,
		"evidence_id": evidence_id,
	})
	if _political_history.has(history_id):
		return history_id
	var record := {
		"record_type": "PoliticalHistoryRecord",
		"version": STATE_VERSION,
		"history_id": history_id,
		"event_type": event_type,
		"subject_ref": subject_ref,
		"payload_hash": _hash_value(payload),
		"world_time": _world_time(),
		"revision": 1,
		"evidence_refs": [evidence_id] if not evidence_id.is_empty() else [],
		"state_hash": "",
	}
	record["state_hash"] = _record_hash(record)
	_political_history[history_id] = record
	return history_id


func _matching_ids(
		source: Dictionary,
		identity_field: String,
		filter_field: String,
		filter_value: String) -> Array[String]:
	var result: Array[String] = []
	for key in source:
		var record: Dictionary = source[key]
		if str(record.get(identity_field, "")) != str(key):
			continue
		if filter_value.is_empty():
			result.append(str(key))
			continue
		var candidate: Variant = record.get(filter_field, "")
		if candidate is Array and filter_value in (candidate as Array):
			result.append(str(key))
		elif str(candidate) == filter_value:
			result.append(str(key))
	result.sort()
	return result


func _normalised_refs(value: Variant) -> Array[String]:
	var result: Array[String] = []
	if value is Array:
		for entry in value:
			var ref := str(entry)
			if not ref.is_empty() and ref not in result:
				result.append(ref)
	elif not str(value).is_empty():
		result.append(str(value))
	result.sort()
	return result


func _capabilities_valid(value: Variant) -> bool:
	if not (value is Array):
		return false
	for capability_value in value:
		if str(capability_value) not in VALID_CAPABILITIES:
			return false
	return true


func _validate_hashed_record(
		record: Dictionary,
		array_fields: Array[String]) -> Dictionary:
	for field in array_fields:
		if not (record.get(field, []) is Array):
			return {"ok": false, "error": "CIV-ID-001.invalid_%s" % field}
	if int(record.get("revision", 0)) < 1 \
			or str(record.get("state_hash", "")) != _record_hash(record):
		return {"ok": false, "error": "CIV-ID-001.hash_or_revision_invalid"}
	return {"ok": true}


func _request_transaction_id(request: Dictionary) -> String:
	for field in ["transaction_id", "command_id", "event_id", "request_id"]:
		var value := str(request.get(field, ""))
		if not value.is_empty():
			return value
	return ""


func _store_transaction(
		transaction_id: String,
		subject_ref: String,
		payload_hash: String,
		result: Dictionary) -> void:
	_transactions[transaction_id] = {
		"transaction_id": transaction_id,
		"subject_ref": subject_ref,
		"payload_hash": payload_hash,
		"status": "committed",
		"result_revision": int(result.get("result_revision", 0)),
		"authoritative_world_time": _world_time(),
		"result": result.duplicate(true),
	}
	if transaction_id not in _transaction_order:
		_transaction_order.append(transaction_id)
	while _transaction_order.size() > MAX_TRANSACTION_JOURNAL:
		var expired: String = _transaction_order.pop_front()
		_transactions.erase(expired)


func _transaction_replay(
		transaction_id: String,
		request: Dictionary) -> Dictionary:
	if transaction_id.is_empty() or not _transactions.has(transaction_id):
		return {}
	var entry: Dictionary = _transactions[transaction_id]
	if str(entry.get("payload_hash", "")) != _hash_value(request):
		return {"ok": false, "error": "political_transaction_conflict",
			"transaction_id": transaction_id}
	var result: Dictionary = entry.get("result", {}).duplicate(true)
	result["duplicate"] = true
	return result


func _commit_evidence(
		evidence_id: String,
		event_type: String,
		payload: Dictionary,
		correlation_id: String) -> Dictionary:
	var payload_hash := _hash_value(payload)
	var envelope := ProductionKernel.make_evidence_envelope(
		evidence_id, EVIDENCE_OWNER, event_type, payload_hash, correlation_id)
	var committed := ProductionKernel.commit_evidence(envelope)
	if not bool(committed.get("ok", false)):
		return committed
	var published := ProductionKernel.publish_event(
		"event.%s" % evidence_id.trim_prefix("evidence."), EVIDENCE_OWNER,
		event_type, payload_hash, [evidence_id])
	if not bool(published.get("ok", false)):
		return published
	return {"ok": true,
		"duplicate": bool(committed.get("duplicate", false)),
		"evidence_id": evidence_id,
		"payload_hash": payload_hash}


func _world_time() -> Dictionary:
	return ProductionKernel.world_time_reference()


func _world_tick() -> int:
	var reference := _world_time()
	return int(reference.get("world_tick", reference.get("tick", 0)))


func _ensure_initialized(context: Dictionary) -> void:
	if initialized:
		return
	var seed_value := int(context.get(
		"world_seed", PeopleManager.world_seed if PeopleManager.initialized else 0))
	var requested_world_id := str(context.get(
		"world_id", PeopleManager.world_id if PeopleManager.initialized else ""))
	initialize(seed_value, requested_world_id)


func _append_ref(
		values_value: Variant,
		value: String,
		limit: int) -> Array:
	var result: Array = values_value.duplicate() if values_value is Array else []
	if not value.is_empty() and value not in result:
		result.append(value)
	while result.size() > limit:
		result.pop_front()
	return result


func _sorted_records(source: Dictionary, identity_field: String) -> Array[Dictionary]:
	var result: Array[Dictionary] = []
	var ids: Array = source.keys()
	ids.sort_custom(func(a: Variant, b: Variant) -> bool: return str(a) < str(b))
	for id_value in ids:
		var record: Dictionary = source[id_value]
		if str(record.get(identity_field, "")) == str(id_value):
			result.append(record.duplicate(true))
	return result


func _restore_records(
		values: Variant,
		identity_field: String,
		validator: Callable) -> Dictionary:
	if not (values is Array):
		return {"ok": false, "error": "invalid_record_collection"}
	var result := {}
	for value in values:
		if not (value is Dictionary):
			return {"ok": false, "error": "invalid_record"}
		var record: Dictionary = value.duplicate(true)
		var identity := str(record.get(identity_field, ""))
		if identity.is_empty() or result.has(identity):
			return {"ok": false, "error": "duplicate_or_missing_identity"}
		var validation: Dictionary = validator.call(record)
		if not bool(validation.get("ok", false)):
			return validation
		result[identity] = record
	return {"ok": true, "records": result}


func _record_hash(record: Dictionary) -> String:
	var payload := record.duplicate(true)
	payload.erase("state_hash")
	return _hash_value(payload)


func _state_hash(data: Dictionary) -> String:
	var payload := data.duplicate(true)
	payload.erase("state_hash")
	return _hash_value(payload)


func _stable_token(value: Variant) -> String:
	return _hash_value(value).substr(0, 24)


func _world_scoped_token(value: Variant) -> String:
	return _stable_token({
		"world_seed": world_seed,
		"world_id": world_id,
		"value": value,
	})


func _hash_value(value: Variant) -> String:
	var normalised: Variant = _json_value(value)
	var text := _canonical_json(normalised)
	var context := HashingContext.new()
	context.start(HashingContext.HASH_SHA256)
	context.update(text.to_utf8_buffer())
	return context.finish().hex_encode()


func _json_value(value: Variant) -> Variant:
	if value is Dictionary:
		var result := {}
		for key in value:
			result[str(key)] = _json_value(value[key])
		return result
	if value is Array:
		var result: Array = []
		for entry in value:
			result.append(_json_value(entry))
		return result
	if value is Vector2:
		return [value.x, value.y]
	if value is Vector2i:
		return [value.x, value.y]
	if value is Vector3:
		return [value.x, value.y, value.z]
	if value is Vector3i:
		return [value.x, value.y, value.z]
	if value is PackedStringArray:
		return Array(value)
	if value is PackedFloat32Array:
		return Array(value)
	if value is PackedFloat64Array:
		return Array(value)
	if value is PackedInt32Array:
		return Array(value)
	if value is PackedInt64Array:
		return Array(value)
	return value


func _canonical_json(value: Variant) -> String:
	if value is Dictionary:
		var dictionary: Dictionary = value
		var keys: Array = dictionary.keys()
		keys.sort_custom(func(a: Variant, b: Variant) -> bool: return str(a) < str(b))
		var entries: Array[String] = []
		for key in keys:
			entries.append("%s:%s" % [
				JSON.stringify(str(key)), _canonical_json(dictionary[key])])
		return "{%s}" % ",".join(entries)
	if value is Array:
		var entries: Array[String] = []
		for entry in value:
			entries.append(_canonical_json(entry))
		return "[%s]" % ",".join(entries)
	if value is int or value is float:
		return String.num(float(value), 12)
	return JSON.stringify(value)
