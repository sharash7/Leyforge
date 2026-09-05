# LEYFORGE DOCUMENT SETS 27-30

# Cross-Set Interface Register v1.1 - Final Reconciled Contract

**Status:** Approved integration baseline for the final Sets 27-30 reconciliation pass  
**Date:** 8 August 2026  
**Supersedes:** Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0 for interfaces between Sets 27, 28, 29 and 30  
**Project Lead and Final Authority:** Ash

> **Governing Rule**
>
> One gameplay rule has one owner. Other systems consume typed, versioned interfaces and evidence. No consumer may recreate an owner's formula merely because it needs the result.

# 1. Purpose

This register closes the final design-level reconciliation pass between:

- **Document Set 27 - Economy, Markets, Contracts, Trade and Public Finance**;
- **Document Set 28 - Dialogue, Social Systems and Companions**;
- **Document Set 29 - Survival, Health and Biological Systems**;
- **Document Set 30 - Movement, Traversal and Transportation**.

It consolidates the provisional amendments raised while the four sets were developed in parallel, resolves overlapping interface names, freezes the ownership boundaries required for implementation, and records the small number of dependencies that remain owned outside Sets 27-30.

This register does **not** transfer ownership from an earlier approved specialist set merely to make a later API look tidier.

# 2. Final Ownership Matrix

| Gameplay Truth | Final Owner | Consumers / Notes |
| --- | --- | --- |
| Prices, value, currency, markets, wages, economic contracts, finance, taxes, trade-route economics | Set 27 | Sets 28-30 consume economic facts where needed. |
| Dialogue, beliefs, rumours, social memory, trust, loyalty, willingness, companion agreements, social assignment intent | Set 28 | Set 28 never moves actors or calculates prices/biology. |
| Health, Stamina, Fatigue, hunger/hydration/nutrition, temperature/wetness/sleep, injury, disease, toxins, treatment and biological modifiers | Set 29 | Sets 27/28/30 consume biological summaries/decisions. |
| Ground/air/traversal/glide movement, mounts, land vehicles, guided transport, physical routes, route accessibility, travel time, local navigation/path execution, movement LOD | Set 30 | Aquatic locomotion uses the resolved Set 26 provider boundary in Section 14. |
| Physical road/bridge/building infrastructure | Document 20 / structure owners | Set 30 interprets mover-specific accessibility; it does not own construction. |
| Water/fluid identity and detailed aquatic locomotion | Set 26B-26E | Resolved in Section 14; Set 30 exposes the universal movement facade. |
| World clock / authoritative simulation time | Technical/world authority | Shared read-only reference; no Set 27-30 owner. |
| Global actor presence / global simulation promotion trigger | Technical/world simulation authority | Each set owns its domain payload during promotion/demotion. |

# 3. Cross-Set Contract Rules

1. **Typed snapshots over raw internals.** Consumers receive bounded snapshots, not another system's mutable arrays.
2. **Revisions travel with state.** Any value whose staleness affects authority carries a source revision and authoritative world time.
3. **Commands and evidence are idempotent.** Cross-set actions with persistent consequences carry a transaction/evidence ID.
4. **Queries are side-effect free unless explicitly defined as commands.** Opening a map or asking for an ETA never spends Stamina or money.
5. **Permission and physical feasibility are separate.** Set 28 can authorise a passenger; Set 30 still decides whether a seat physically fits.
6. **Intent and execution are separate.** Set 27/28 can request transport/travel; Set 30 owns actual movement and arrival evidence.
7. **Biological cause and movement consequence are separate.** Set 29 decides the physiological state; Set 30 applies the resulting movement restriction/modifier.
8. **Economic value and physical capacity are separate.** Set 27 may value cargo; Set 30 owns movement-safe capacity.
9. **Knowledge and truth are separate.** Set 30 owns objective route state; Set 28C owns actor belief/rumour/provenance about that state.
10. **Abstraction cannot bypass local truth.** A distant journey cannot cross a route that would be physically blocked when locally simulated.

# 4. XSET-001 - Shared World Time, Presence and Evidence Envelope

**Owner:** Technical/world authority for time/presence; each gameplay set owns its own events.  
**Consumers:** Sets 27-30.

## 4.1 WorldTimeReference

```text
world_time_revision
simulation_time
simulation_rate
paused_or_suspended_state
calendar_context_ref?
source_authority
```

All contractual deadlines, social assignment timestamps, biological scheduling and travel estimates reference the same authoritative timeline.

## 4.2 ActorPresenceState

```text
entity_ref
presence_state = active_local | active_remote | disconnected_persistent | safely_suspended | protected_rest | abstract_simulation | unavailable
world_time
policy_ref
revision
```

No set interprets application-closed wall time as simulation time unless the world/session authority explicitly advanced the world.

## 4.3 CrossSetEvidenceEnvelope

```text
evidence_id
source_owner
source_event_or_transaction_ref
subject_refs[]
outcome_class
world_time
source_revision
integrity_or_idempotency_key?
reason_codes[]
```

A consumer records the evidence reference and commits its own consequence once. It does not copy the external mutable state into a second authority.

**Reconciles:** 27J-B/C, AM-29-090/091/093/106 and the common timing/evidence requirements in 28G/28J/30I.

# 5. XSET-002 - Economy <-> Social Terms and Commercial Resolution

## 5.1 Set 27 -> Set 28: EconomicTermsSnapshot

```text
economic_context_id
subject_or_offer_ref
price_or_compensation_terms
contract_summary_ref?
trade_opportunity_refs[]
economic_standing_band?
permitted_concession_bounds
payment_or_access_options[]
freshness
confidence
source_revision
```

## 5.2 Set 28 -> Set 27: SocialCommercialResolution

```text
social_resolution_id
subject_or_offer_ref
accept_reject_counter_state
economic_concession_class
bounded_concession_request_or_modifier?
willingness_or_refusal_reason
social_authority_or_consent_ref?
relationship_consequence_evidence_refs[]
information_provenance_ref?
source_revision
```

Set 28 may negotiate within the economic bounds supplied by Set 27. It cannot rewrite fair value, create currency or create stock. Set 27 commits the executable economic terms.

**Reconciles:** 27-IFACE-002, 27B-IFACE-005, 27C-IFACE-007, 27D-IFACE-002, 27E-IFACE-001/002/005, 27F-A, 27G-A, 27H-B, 27I-A and the Set 27/28 proposals in 28A/28F/28G/28J.

# 6. XSET-003 - Economy <-> Biology Demand, Capacity and Relief

## 6.1 Set 29 -> Set 27: PopulationHealthSummary

The **AM-29-104 canonical PopulationHealthSummary** is adopted as the aggregate interface.

Minimum fields:

```text
summary_id
population_or_household_ref
coverage_count
profile_coverage[]
food_requirement_or_demand
hydration_requirement_if_enabled?
medical_demand
treatment_backlog
workforce_capacity_modifier
injury_downtime_band
disease_or_outbreak_burden
protected_named_case_refs[]
world_time
source_revision
```

Individual economic decisions may also request a disclosure-appropriate worker capability/availability summary.

## 6.2 Set 27 -> Set 29: EconomicProvisionContext

```text
context_id
food_or_medicine_availability
committed_resource_refs[]
affordability_or_access_band
ration_or_relief_access_state
substitute_availability[]
trip_or_service_context_ref?
world_time
source_revision
```

Set 27 turns biological demand into price, purchasing, wages, contracts and relief policy. Set 29 turns actually supplied/consumed resources into biological outcomes.

**Reconciles:** 27-IFACE-003, 27C-IFACE-008, 27D-IFACE-001/003, 27E-IFACE-003, 27F-B, 27G-B, 27H-C, 27I-B, AM-29-003/037/044/059/078/083/089/104 and related Set 28 availability consumers.

# 7. XSET-004 - Economy <-> Movement Transport Mission and Execution

This is the canonical reconciliation of 27H's caravan mission with Set 30 XSI-30-008 and guided-service XSI-30-010.

## 7.1 Set 27 -> Set 30: TransportMissionRequest

```text
transport_mission_id
request_owner = set27
shipment_or_contract_refs[]
origin_endpoint_ref
destination_endpoint_ref
waypoint_refs[]
required_cargo_or_passenger_capacity
cargo_handling_or_priority_class
authorised_transport_asset_refs[]?
authorised_operator_or_driver_refs[]?
departure_window
arrival_or_contract_window
route_policy_constraints
stop_or_checkpoint_policy
customs_or_toll_clearance_refs[]
commercial_abort_or_budget_threshold_ref?
risk_or_escort_policy_refs[]
callback_evidence_requirements[]
revision
```

Set 27 owns the mission's commercial meaning. `budget_threshold` cannot force impossible movement.

## 7.2 Set 30 -> Set 27: TransportExecutionSnapshot

```text
transport_mission_id
movement_plan_ref
assigned_transport_asset_refs[]
usable_capacity
capacity_used
movement_mode_or_service_family
route_accessibility
estimated_travel_time
actual_departure_time?
journey_progress
current_route_or_leg_ref?
required_service_or_stop_refs[]
operating_resource_or_service_requirements[]
vehicle_or_mount_condition_refs[]
delay_or_blocker_state
physical_incident_evidence_refs[]
arrival_state
actual_arrival_time?
delivery_or_handover_readiness
reason_codes[]
movement_revision
```

For rail/lift/powered passenger or freight services, 30G provides the movement/service-readiness facts through the same transport execution family. Set 27 remains owner of fare, freight value, profit and demand.

## 7.3 Required Movement API Compatibility

Set 27 may use the standard Set 30 query endpoints:

- `CargoCapacity()`
- `RouteAccessibility()`
- `TravelTime()`
- `VehicleCondition()`
- `MountStatus()` where relevant.

**Reconciles:** 27-IFACE-004, 27C-IFACE-006, 27D-IFACE-004/005, 27E-IFACE-004/005, 27F-C, 27G-C, 27H-A, 27I-C, XSI-30-008 and XSI-30-010.

# 8. XSET-005 - Social <-> Biology Care, Availability and Disclosure

## 8.1 Set 29 -> Set 28: SocialBiologicalSummary

```text
entity_ref
recovery_status
care_need
treatment_urgency
assignment_survival_availability
socially_relevant_condition_summary
critical_alert_if_disclosure_allowed?
carry_penalty_compatibility_value?
knowledge_visibility_class
reason_codes[]
world_time
source_revision
```

Set 28 receives only information appropriate to the actor/observer disclosure context.

## 8.2 Set 28 -> Set 29: SocialCareContext

```text
entity_ref
care_or_assignment_context_ref
named_actor_priority_reason?
care_action_or_assistance_intent?
relationship_or_consent_evidence_ref?
assignment_status_ref?
world_time
source_revision
```

Set 28 may decide that a companion wants to help. Set 29 still owns treatment eligibility and biological outcome.

**Reconciles:** AM-29-002/036/043/087/088/094/096/097 and Set 29 incoming requirements consolidated by 28A/28F/28G/28J.

# 9. XSET-006 - Social <-> Movement Permissions, Formation and Travel Intent

This contract closes XSI-30-003, XSI-30-006 and the Set 28 travel/assignment proposals.

## 9.1 Set 28 -> Set 30: SocialMovementAuthorisation

```text
context_id
subject_or_group_ref
companion_travel_permission?
ride_or_mount_permission?
passenger_assignment_refs[]
control_authority_ref?
formation_intent_ref?
assignment_ref?
allowed_transport_or_movement_constraints[]
world_time
source_revision
```

## 9.2 FormationIntent

Set 28 owns:

```text
formation_intent_id
group_id
leader_ref
member_refs[]
formation_style
spacing_preference
role_slot_preferences{}
compression_allowed
split_allowed
regroup_policy
follow_distance_band
priority_or_urgency
social_reason_ref?
revision
```

## 9.3 Set 30 -> Set 28: FormationSpatialPlan

Set 30 owns:

```text
formation_spatial_plan_id
formation_intent_id
assigned_slots{}
current_shape
compression_state
corridor_width_required
separated_member_refs[]
blocked_member_refs[]
regroup_target?
reason_codes[]
navigation_revision
```

## 9.4 Generic ExternalMovementIntent

Set 28 uses the 30I generic movement-intent contract for rendezvous, return-home and delegated travel instead of separate bespoke movement implementations.

```text
movement_intent_id
request_owner
requester_entity_or_group_ref
goal_type
goal_ref_or_region
arrival_profile_id
urgency
route_policy_ref?
formation_intent_ref?
allowed_movement_modes[]
forbidden_movement_modes[]
wait_policy
replan_policy
failure_policy
expiry_or_cancel_condition
knowledge_context_ref?
permission_context_ref?
task_or_assignment_ref?
revision
```

Set 30 returns movement status, route/path refs, ETA/confidence, blockers and authoritative arrival evidence.

## 9.5 Seat Availability

Set 30 exposes physical `PassengerSeatAvailability()`/seat-capacity facts. Set 28 authorises the assignment. Neither side substitutes for the other.

**Reconciles:** 28A/28F/28G/28J movement proposals, XSI-30-003, XSI-30-006 and XSI-30-012.

# 10. XSET-007 - Route Truth, Route Knowledge and Confidence

Route truth and route belief are deliberately separated.

## 10.1 Set 30 -> Set 28C: RouteObservation

```text
route_or_region_ref
observed_access_state
observed_condition_or_blocker_summary
observation_time
coverage
observation_source_ref
objective_confidence
route_revision
```

This is factual movement evidence, not an actor belief.

## 10.2 Set 28C -> Set 30: RouteKnowledgeSnapshot

```text
observer_or_group_id
route_or_region_ref
knowledge_state
belief_or_claim_confidence
last_verified_time
known_closures[]
known_hazards[]
known_transfers[]
source_provenance_refs[]
staleness_band
permission_to_reveal
knowledge_revision
```

30H uses this when route planning must respect what an observer legitimately knows. It does not infer whether a rumour is truthful from the route graph.

Set 27 may submit economic observations/rumours into Set 28C as evidence, but economic information does not mutate physical route truth.

**Reconciles:** 27-IFACE-002, 27C-IFACE-007, 27H-B, 28C/28J knowledge requirements and XSI-30-011.

# 11. XSET-008 - Biology <-> Movement Exertion and Mobility

This contract resolves XSI-30-002 against AM-29-001, AM-29-085, AM-29-086 and AM-29-105.

## 11.1 Set 30 -> Set 29: MovementExertionRequest

```text
request_id
idempotency_key
query_mode = estimate | begin | continue | commit | end
entity_id
movement_action_id?
movement_action_family
movement_mode
intensity_band
is_sustained
elapsed_duration?
distance_or_progress?
vertical_gain?
terrain_resistance_band?
grade_band?
load_context_ref_or_band?
support_mode?
hand_arm_requirement?
equipment_assist_band?
environment_context_ref?
world_time
movement_revision
```

**Important resolution:** Set 30 owns the movement action and its physical intensity/context. Set 29 owns the conversion of that request into actual Stamina expenditure, Fatigue/recovery effects and biological permission. Set 30 does **not** need to define a biological Stamina cost merely to execute movement.

## 11.2 Set 29 -> Set 30: MovementExertionDecision

```text
request_id
commit_status
allowed_to_begin
allowed_to_continue
stamina_spend_result?
stamina_availability_band
movement_exertion_modifier
recovery_modifier
estimated_rest_frequency_band?
hard_movement_restrictions[]
reason_codes[]
source_state_revision
world_time
```

`query_mode=estimate` is side-effect free and is used by 30H for route estimates.

## 11.3 Set 29 -> Set 30: BiologicalMobilityModifierSnapshot

This is the movement-facing projection of AM-29-105:

```text
entity_id
stamina_modifier
carry_penalty
fatigue_movement_modifier
injury_mobility_function
injury_movement_modifiers[]
thermal_movement_modifier
disease_or_toxin_movement_modifiers[]
max_speed_modifier?
acceleration_modifier?
jump_modifier?
sprint_allowed
crouch_allowed
crawl_allowed
hard_restrictions[]
reason_codes[]
source_state_revision
effective_world_time
```

The named Set 29 compatibility endpoints `StaminaModifier()` and `CarryPenalty()` remain valid.

**Reconciles:** XSI-30-002, AM-29-001, AM-29-031, AM-29-085, AM-29-086, AM-29-098 and AM-29-105.

# 12. XSET-009 - Physical Impact <-> Biological Consequence

This contract resolves XSI-30-005 with AM-29-029/031.

## 12.1 Set 30 -> Set 29: PhysicalImpactEvent

```text
impact_event_id
entity_id
impact_velocity_world
impact_speed_normal
impact_speed_tangential
impact_normal
gravity_profile_id
fall_duration?
maximum_descent_speed?
landing_quality
landing_posture
surface_response_class
surface_tags[]
active_descent_provider_id?
equipment_movement_protection_tags[]
realm_or_environment_tags[]
external_hit_location_or_region_hint?
source_context
world_time
movement_revision
```

The payload is **physical evidence**, not a biological damage result.

## 12.2 Set 29 -> Set 30: BiologicalImpactResult

```text
biological_result_id
impact_event_id
commit_status
health_consequence_ref?
injury_state_changes[]
critical_or_incapacitation_state?
movement_restrictions[]
movement_modifiers[]
recovery_state_ref?
reason_codes[]
source_state_revision
world_time
```

Set 29 decides biological injury/health consequences. Set 30 applies only resulting movement state/restrictions.

**Reconciles:** XSI-30-005, AM-29-029, AM-29-031 and related injury mobility outputs.

# 13. XSET-010 - Cross-Set Simulation Promotion/Demotion

Global simulation determines **when** an entity changes fidelity. Each set owns **what domain state** it serialises/reconstructs.

## 13.1 SimulationTransitionContext

```text
transition_id
entity_or_group_ref
from_lod
requested_to_lod
transition_reason
world_time
world_or_region_revision
presence_state
required_exact_domain_reconciliations[]
```

## 13.2 Domain Payloads

- Set 27: economic commitments, shipment/contract due state, market/account summaries.
- Set 28: companion/assignment/social records and named-actor relevance.
- Set 29: biological actor/cohort state and reconciliation barrier.
- Set 30: semantic location, route/journey progress, movement mode, attachments, last valid transform/node.

No set may mark the transition complete while a required domain reports `reconciling` or `failed` for consequential state.

**Reconciles:** 27J-B, 28G/28J off-screen resolution requirements, AM-29-097/099, XSI-30-013 and 30I movement LOD.

# 14. XSET-011 - RESOLVED Aquatic Locomotion Provider Boundary (XSI-30-001)

**Final Resolution:** **Option A is adopted.** Detailed swimming remains in Document 26E; Set 30 is the universal movement facade and cross-medium coordinator.

## 14.1 Why This Resolution Was Chosen

Document 26E already defines a mature, deeply integrated aquatic character system: water-contact states, wading, surface swimming, diving, underwater locomotion, buoyancy/current/wave response, breath/depth interaction, vessel-side transitions, aquatic NPC behaviour, multiplayer prediction and save/reconnect behaviour. Moving those rules into Set 30 would duplicate or dismantle an approved specialist system for no gameplay benefit.

The clean one-owner boundary is therefore provider-based rather than document-number-based.

## 14.2 Set 26E Owns

While a character is in the aquatic provider state, 26E owns:

- Wet/Wading/Deep-Wading aquatic response where 26E's contact thresholds apply;
- Surface Supported / surface swimming;
- Submerged/diving/underwater locomotion;
- aquatic vertical control and orientation;
- buoyancy and water-medium movement response;
- current/wave/surf character response using 26D fields;
- aquatic entry-state classification;
- aquatic NPC locomotion provider behaviour;
- water-side vessel/shore interaction conditions defined by Set 26.

26E continues to consume survival/health interfaces from Set 29 and does not gain ownership of generic route planning or social AI.

## 14.3 Set 30 Owns

Set 30 owns:

- the universal `Aquatic` top-level `MovementMode` facade;
- common Movement API publication;
- land/air/traversal -> aquatic handoff request;
- aquatic -> land/traverse re-entry validation;
- route-plan and navigation integration around aquatic provider edges;
- common movement networking/persistence envelopes where reused by provider adapters;
- non-aquatic locomotion and all other Set 30 movement domains.

## 14.4 Provider Contract

26E exposes an `AquaticMovementProvider` adapter to Set 30:

```text
AquaticMovementState(entity)
AquaticEntryEligibility(entity, contact_context)
AquaticExitCandidate(entity, desired_exit_context)
AquaticRouteAccessibility(mover, water_segment_or_context)
AquaticTraversalCost(mover, water_segment_or_context)
AquaticMovementSnapshot(entity)
```

Set 30 may publish:

```text
CurrentMovementMode(entity) = Aquatic
movement_provider_ref = set26.aquatic
```

but it does not recalculate swim speed, buoyancy, current response or underwater movement.

## 14.5 Entry/Exit Handoff

**Land/Air -> Aquatic**

1. Set 30 reports authoritative transform/velocity/posture/contact intent.
2. 26E validates aquatic entry and selects its water-contact state.
3. Authority transfers to the Aquatic movement provider for the aquatic portion.

**Aquatic -> Land/Traverse**

1. 26E supplies validated exit candidate, position/velocity/support/posture information.
2. 30B/30C revalidate land/traversal collision and clearance.
3. Set 30 resumes the appropriate non-aquatic movement controller.

## 14.6 Aquatic Mount Boundary (resolves XSI-30-007)

- 30E owns rider, seat, control-authority and mount relationship.
- Creature/biological owners supply whether the mount can operate aquatically.
- 26E/Set 26 owns aquatic-medium locomotion while the mount is using the aquatic provider.
- Set 30 retains the universal mounted/Aquatic facade and cross-medium transition.

No duplicate aquatic mount physics solver is authorised.

**Final status:** XSI-30-001 and XSI-30-007 are **RESOLVED**.

# 15. Set 30 XSI Status Reconciliation

| Existing XSI | Final Status | Canonical Resolution |
| --- | --- | --- |
| XSI-30-001 Water Locomotion Ownership | **Resolved** | XSET-011; Option A, 26E detailed aquatic provider + Set 30 facade. |
| XSI-30-002 Movement Exertion | **Resolved** | XSET-008. |
| XSI-30-003 Formation Intent | **Resolved** | XSET-006. |
| XSI-30-004 Environmental Movement Field | **Confirmed external dependency** | Semantics retained; environment owner mapping occurs outside four-set reconciliation. |
| XSI-30-005 Fall Impact Consequence | **Resolved** | XSET-009. |
| XSI-30-006 Ride Permission/Seat Assignment | **Resolved** | XSET-006. |
| XSI-30-007 Aquatic Mount Riding Boundary | **Resolved** | XSET-011 Section 14.6. |
| XSI-30-008 Terrestrial Caravan Execution | **Resolved** | XSET-004. |
| XSI-30-009 Automation Transport Readiness | **Confirmed external dependency** | 30G semantics retained; Automation/Magic integration remains external. |
| XSI-30-010 Guided Freight/Passenger Service | **Resolved** | XSET-004 guided-service extension. |
| XSI-30-011 Route Knowledge/Confidence | **Resolved** | XSET-007. |
| XSI-30-012 External AI Movement Intent | **Resolved for Sets 27-30** | XSET-006; generic contract remains usable by other gameplay owners. |
| XSI-30-013 Movement LOD Promotion/Demotion | **Resolved** | XSET-010. |

# 16. Set 27 Reconciliation Summary

The Set 27 specialist documents remain authoritative for economic gameplay. Their proposed interface names are treated as historical aliases where this register provides a consolidated contract.

| Set 27 Amendment Family | Final Contract |
| --- | --- |
| Economic information/social concession/negotiation | XSET-002 and XSET-007 where route information is involved. |
| Survival demand/workforce/relief | XSET-003. |
| Terrestrial transport/commute/delivery/caravan/guided service | XSET-004. |
| Cross-set time/LOD/evidence | XSET-001 and XSET-010. |

Set 27 never gains physical movement authority through a transport mission.

# 17. Set 28 Reconciliation Summary

The Set 28 requested interface package in 28J is adopted semantically with the following consolidation:

| Set 28 Interface Family | Final Contract |
| --- | --- |
| Wage/contract/trade/economic standing input and social commercial result | XSET-002. |
| Recovery/care/assignment survival summaries | XSET-005. |
| Travel state, passenger seats, formation resolution, companion travel and assignment travel | XSET-006. |
| Actor route knowledge/rumour/provenance | XSET-007. |
| Off-screen transition evidence | XSET-001 and XSET-010. |

`AssignmentCarryFeasibility()` remains **withdrawn as an independent gameplay interface**. It is an integration composition of Set 29 biological carrying output and Set 30 physical movement/capacity output.

# 18. Set 29 Reconciliation Summary

Set 29's canonical `leyforge.system.interface.survival` v1.0 remains valid.

The nine mandatory compatibility endpoints remain:

- `HungerLevel()`
- `ThirstLevel()`
- `BodyTemperature()`
- `InjuryState()`
- `DiseaseState()`
- `PoisonLevel()`
- `Fatigue()`
- `StaminaModifier()`
- `CarryPenalty()`

For cross-set movement integration:

- AM-29-001/085/086/105 consolidate into XSET-008;
- AM-29-029/031 consolidate into XSET-009;
- AM-29-090/091/093/097/099 consolidate into XSET-001/XSET-010;
- AM-29-104 remains the canonical population summary used by XSET-003.

The other AM-29 amendments remain valid specialist/external integration proposals and are not discarded by this four-set pass.

# 19. Set 30 Movement API v1.0

The Set 30 Movement API remains:

- `CurrentMovementMode()`
- `MaxSpeed()`
- `CargoCapacity()`
- `TraversalCost()`
- `VehicleCondition()`
- `MountStatus()`
- `TravelTime()`
- `RouteAccessibility()`

The API is a movement facade. Returning `Aquatic` does not imply Set 30 owns 26E's swimming implementation.

# 20. Versioning and Compatibility

This register is **v1.1**.

- Earlier local amendment names remain documentation aliases for migration/history.
- Implementations should prefer the canonical XSET contracts above.
- Optional compatible fields may be added in v1.x.
- Removing or redefining ownership, mandatory fields or compatibility semantics requires a v2.0 review.
- Set 25 registry governance should register the final public interface IDs and schema versions during the production integration pass.

# 21. Remaining External Dependencies - Not Cross-Set Conflicts

The following do **not** block the Sets 27-30 reconciliation:

- final terrestrial environment-owner mapping for XSI-30-004;
- final Automation/Magic transport-readiness adapter for XSI-30-009;
- implementation-specific Godot class names;
- exact performance/network thresholds after profiling;
- wider Set 26/Set 29 biological details outside the resolved aquatic locomotion ownership field;
- registration of final interfaces through Set 25.

# 22. Final Reconciliation Result

There is now **no unresolved gameplay-ownership conflict between Sets 27, 28, 29 and 30**.

The one genuine ownership collision - XSI-30-001 / swimming - is resolved by keeping the mature aquatic locomotion implementation in Set 26E while Set 30 remains the universal Movement API and cross-medium coordination layer.

All other overlaps are resolved as owner/consumer interfaces rather than new joint gameplay systems.

---

**End of Leyforge Document Sets 27-30 Cross-Set Interface Register v1.1 - Final Reconciled Contract**
