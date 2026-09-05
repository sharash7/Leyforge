# Leyforge Final Content Canon Collection

## FCC-04H — Somnolent Expanse Dungeons, Guardians, Authorities, Events & Major Outcomes

**Version:** 0.1  
**Status:** Content Canon — Realm-Local Lock Candidate  
**Realm:** Somnolent Expanse  
**Stable Realm ID:** `realm.network.somnolent_expanse`  
**Parent Collection:** Leyforge Final Content Canon (FCC)  
**Depends On:** FCC-04A through FCC-04G  
**Primary Upstream Sources Reconciled:** Foundation Documents 00–20; World Content Atlas Set 24, especially 24D, 24G and 24H; Post-Atlas production governance; accepted FCC-04 interview decisions Q246–Q390; FCC-04A through FCC-04G.  
**Primary Scope:** dungeon families, guardian families, fixed realm authorities, emergent authority families, realm events, encounter-state inputs, non-combat/combat resolution, persistent aftermath, reward provenance, adventure-site interfaces, deterministic generation, simulation scaling, accessibility and art handoff.  
**Final Global Status:** Pending FCC-04I/FCC-04J and final cross-realm reconciliation.

---

# 1. Purpose

FCC-04H defines the complete realm-local **adventure-content canon** for the Somnolent Expanse.

It owns:

- the five canonical Somnolent dungeon families;
- the five canonical guardian families;
- the three fixed major authority identities;
- the Collective Fear Sovereign emergent authority-family framework;
- Somnolent-specific dungeon encounter-state axes;
- guardian resolution categories;
- authority resolution categories;
- the twelve canonical Somnolent realm-event families;
- persistent dungeon and authority aftermath;
- realm-local reward provenance;
- adventure-site relationships to ecology, civilisation, prophecy, coherence and Dreamgate infrastructure;
- deterministic generation requirements;
- low-end/off-screen simulation requirements;
- multiplayer/state-authority requirements at the content-contract level;
- accessibility requirements;
- art-handoff requirements.

FCC-04H does **not** redefine universal combat, boss runtime, health/damage, AI scheduling, dialogue, quest execution, reputation, faction simulation, loot architecture, dungeon-seed infrastructure, structure generation, pathfinding, save/load, multiplayer protocol, portal travel, economy, item ownership, player death/respawn, universal prophecy mathematics, universal Lucidity implementation, accessibility settings, the cosmological source of Void corruption, exact final reward quantities, or final stable IDs for FCC-added guardians/events/authority families.

> **FCC-04H defines what Somnolent adventure content exists, what it means, how it may resolve and what realm state it may change; shared Leyforge systems execute those contracts.**

---

# 2. Adventure Canon Statement

Somnolent dungeons are not disposable monster corridors layered on top of a dream-themed environment.

They emerge from the same realm systems established in FCC-04A through FCC-04G:

- Lucidity;
- Waking Anchor stability;
- coherence;
- expectation-responsive states;
- memory reconstruction;
- conditional prophecy;
- natural nightmare ecology;
- Dreamwater;
- Sleepwalker Roads;
- mixed waking/dream law;
- civilisation and consent;
- Dreamgate infrastructure;
- settlement history;
- authority pressure;
- Void corruption where genuinely present.

A dungeon may contain combat, but combat is not its definition. A guardian may be fought, but a guardian is not automatically hostile. A realm authority may become a boss encounter, but an authority is not defined as a creature that exists only to be killed.

The realm must support navigation, investigation, observation, interpretation, evidence reconstruction, prophecy analysis, stealth, avoidance, ecology, rescue, stabilisation, route repair, containment, negotiation, diplomacy, consent, political choice, awakening, protection, redirection, restoration, controlled risk and combat where appropriate.

> **Somnolent adventure content should ask the player to understand what a dream-space is expressing, stabilising, predicting, remembering, fearing or becoming — not merely clear it.**

---

# 3. Ownership and Interface Contract

FCC-04H owns dungeon-family identity, dungeon stable-ID preservation, guardian-family identity, fixed authority identity, fixed authority stable-ID preservation, Collective Fear Sovereign family identity, encounter-state inputs, resolution categories, event families, persistent aftermath, reward provenance and adventure-content art requirements.

It consumes realm laws from FCC-04A; biomes/hazards/states from FCC-04B; materials from FCC-04C; flora from FCC-04D; creature ecology from FCC-04E; civilisation and consent law from FCC-04F; Blocks/Items/structures from FCC-04G; and universal combat, quests, AI, rewards, multiplayer and persistence systems.

FCC-04H must not add a second Somnolent portal, restore the off-realm sleeping-body model, treat natural nightmare as Void corruption, make all guardians hostile, require killing every authority, duplicate Waking Devourer as a boss species, turn prophecy into guaranteed truth, rewrite authoritative history through Memory Theatre, create new major materials solely as rewards, or promote Collective Fear Sovereign into a fourth fixed authority.

---

# 4. Canon Adventure Roster

## 4.1 Canonical Dungeon Families

| Dungeon Family | Stable ID | Canon Status |
|---|---|---|
| **Lucid Observatory** | `dungeon.realm.dream.lucid_observatory` | Locked |
| **Nightmare Nest** | `dungeon.realm.dream.nightmare_nest` | Locked |
| **Memory Theatre** | `dungeon.realm.dream.memory_theatre` | Locked |
| **Waking Labyrinth** | `dungeon.realm.dream.waking_labyrinth` | Locked |
| **Prophecy Engine** | `dungeon.realm.dream.prophecy_engine` | Locked |

These five are the authoritative Somnolent dungeon families. A family may appear in more than one compatible biome.

## 4.2 Canonical Guardian Families

1. **Lucid Custodian**
2. **Nest Warden**
3. **Stagekeeper**
4. **Waking Sentinel**
5. **Fate Custodian**

Working FCC IDs pending final registry normalisation:

- `guardian.realm.dream.lucid_custodian`
- `guardian.realm.dream.nest_warden`
- `guardian.realm.dream.stagekeeper`
- `guardian.realm.dream.waking_sentinel`
- `guardian.realm.dream.fate_custodian`

These are guardian roles/families, not mandatory biological species.

## 4.3 Fixed Major Authorities

1. **Nightmare Architect** — `boss.realm.dream.nightmare_architect`
2. **Sleeping Oracle** — `boss.realm.dream.sleeping_oracle`
3. **Waking Devourer** — `boss.realm.dream.waking_devourer`

There are exactly **three fixed major authority identities** at FCC-04 level.

## 4.4 Emergent Authority Family

**Collective Fear Sovereign** is a canonical variable authority family, not a fourth fixed authority.

Working FCC family ID:

`authority.family.dream.collective_fear_sovereign`

This ID remains provisional until FCC-04J/global registry normalisation.

---

# 5. Dungeon Generation Principle

Somnolent dungeon generation must be bounded, deterministic and state-aware.

A generated dungeon may vary through seed, biome, coherence state, regional environmental state, authority influence, settlement ownership, route access, Lucidity-related presentation, nightmare pressure, prophecy conditions, memory evidence, Void corruption and prior player outcomes.

Dungeon generation must not depend on uncontrolled freeform text interpretation. The same seed and authoritative state must reproduce the same underlying dungeon truth even if presentation varies for accessibility or Lucidity.

---

# 6. Dungeon State Axes

Dungeon instances may draw from bounded axes:

- **Coherence:** Anchored, Stable, Mutable, Unstable, Fragmenting, Dissolving.
- **Lucidity pressure:** high clarity, normal clarity, low clarity, severe drift.
- **Nightmare pressure:** dormant, active, intensified, territorial, runaway, managed/restored.
- **Prophecy:** unread, observed, conditional, contradicted, manipulated, invalidated, fulfilled, concealed.
- **Memory reconstruction:** incomplete, conflicting, role-missing, biased, corroborated, disproven, falsified, sufficiently resolved.
- **Waking/dream law:** dream-dominant, waking-like physical, mixed, fractured, stabilised.
- **Void corruption:** separate explicit overlay, never inferred from nightmare or low coherence alone.

---

# 7. Lucid Observatory

The **Lucid Observatory** is a dream-navigation, symbolic-observation and prophecy-adjacent complex stabilised through Lucidity, Waking Anchors, shared symbols, coherence alignment, deliberate observation and compatible route knowledge.

The old Set-24 reference to **waking-body safety** is superseded. No off-realm sleeping body is required.

Its instruments may examine Dream Network routes, coherence islands, Dreamgate conditions, distant symbolic phenomena, Dreamwater currents, prophecy indicators and collective dream pressure. It does not provide unrestricted surveillance.

Possible rooms include horizon chambers, lens galleries, symbol arrays, observation domes, route maps, Dreamwater viewing basins, Lucid Glass instruments, coherence calibration rooms, false-observation chambers, shared-observer halls and collapsed wings.

Observation can alter which **authored room state** becomes accessible. High Lucidity may expose a stable interpretation; multiple observers may need to coordinate; incompatible symbols may temporarily split route choices. The system never invents arbitrary geometry from unrestricted thought.

Preferred biomes include Lucid Shores, Prophecy Dunes, Sleepwalker Roads and stable Shattered Waking Isles.

Core hazards include Lucidity Drift, Expectation Distortion, Prophecy Dissonance, Coherence Collapse and false-route interpretation.

Possible resolutions include recalibration, repair, re-anchoring, interpretation, defence, public opening, Oracle School stewardship, shared governance, sealing, abandonment, corruption restoration or combat against hostile occupiers.

---

# 8. Lucid Custodian

The **Lucid Custodian** is the guardian family associated with Lucid Observatories.

A Custodian may be a construct, dream-native person, bound role, institutional caretaker, durable thoughtform or rotating office.

It may test observation discipline, route knowledge, Lucidity, permission, repair competency or ethical prophecy use.

Possible resolutions include proving qualification, repairing instruments, negotiating access, passing a trial, replacing a failed Custodian, awakening/repairing it, exposing corrupted instructions or defeating it if genuinely hostile.

A successful dungeon resolution does not require killing the Custodian.

---

# 9. Nightmare Nest

The **Nightmare Nest** is a fear-fed living maze whose ecology and topology amplify repeated fear responses, avoidance patterns and unresolved danger.

FCC canon preserves the Set-24 identity while clarifying:

- natural nightmare is not Void corruption;
- courage may weaken supported fear-feedback mechanics;
- real predators and political conflicts remain real;
- nightmare societies may exist inside or around Nests;
- not every Nest should be cleansed into a pleasant biome.

Possible content includes looping thickets, fear-reactive chambers, Nightmare Thorn corridors, Fearling aggregation zones, Nightmare Stalker territories, resin chambers, protected nightmare nurseries, Warden posts, trapped travellers, nightmare-society territory and authority-built architecture.

Supported repeated behaviour may strengthen selected authored states, such as repeatedly fleeing one route making a loop harder to break. This is bounded gameplay logic, not unrestricted psychological inference.

Primary biome: Nightmare Thickets.

Possible resolutions include identifying the fear source, reducing harmful feedback, stabilising a healthy nightmare ecology, rescue, negotiation, territory management, Warden support, containment, combat or cleansing actual Void corruption without erasing natural nightmare identity.

---

# 10. Nest Warden

The **Nest Warden** guardian family protects or regulates Nightmare Nest territory.

A Nest Warden may be an ecological caretaker, nightmare person, Warden-order member, construct, manifested territorial role or elevated predator.

Possible tests include respecting boundaries, understanding warning ecology, reducing fear feedback, proving non-destructive intent, negotiation or combat.

A Nest Warden may politically oppose a Nightmare Warden order; the similar term does not imply one organisation.

---

# 11. Memory Theatre

The **Memory Theatre** is a dream-stage complex in which scenes replay through roles, omissions, contradictory perspectives, reconstructed scenery and alternative interpretations.

It cannot retroactively rewrite authoritative history.

The player may observe, assume a missing role, replace a participant in a reconstruction, inspect scenery, challenge the script, perform an alternative version or expose contradictions. Role assumption never overwrites player identity.

Primary biome: Memory Cities.

Possible outcomes include corroborating a reconstruction, proving one false, preserving unresolved alternatives, exposing manipulation, restoring missing context, releasing a trapped role, negotiating archive ownership, closing the Theatre, repurposing it for education/art or fighting hostile Stagekeepers/occupiers.

---

# 12. Stagekeeper

The **Stagekeeper** is the guardian family associated with Memory Theatres.

A Stagekeeper may be director, archivist, actor, construct, dream-native caretaker, embodied role or institutional office.

It may enforce scene integrity, consent, role assignment, evidence handling, performance rules or archive access.

Possible resolutions include completing a missing scene, freeing it, proving the script corrupted, negotiating access, replacing it, repairing the Theatre or defeating it if coercive/hostile.

---

# 13. Waking Labyrinth

The **Waking Labyrinth** is a mixed-reality dungeon where dream law and waking-like physical law compete for control of rooms.

This replaces the older model in which rooms bridged sleepers and waking sites.

Rooms may shift between symbolic dream state, high-coherence waking-like state, mixed state, fractured state and stabilised state.

Possible content includes physical machinery, symbolic machinery, Waking Stone foundations, Dreamstone rooms, bounded gravity/orientation presentation, Dreamwater conflicts, mixed-material ruins and broken anchors.

A Waking Labyrinth exit may return to the entrance, open another Somnolent region, reveal Dreamgate knowledge, restore a Dreamgate link, expose portal-support infrastructure or show another realm symbolically.

It may **not** act as a second normal interdimensional portal.

Primary biome: Shattered Waking Isles.

Possible outcomes include stabilising one law-state, preserving a controlled mixed state, restoring anchors, repairing machinery, evacuating inhabitants, sealing fractures, repurposing research facilities, abandoning unsalvageable sectors or defeating hostile guardians.

---

# 14. Waking Sentinel

The **Waking Sentinel** guardian family is associated with Waking Labyrinths.

It may test physical-law consistency, anchor integrity, machinery interaction, route discipline and the player's ability to distinguish symbolic from physical states.

Possible identities include construct, mixed-reality organism, research guardian, institutional role or stabilisation intelligence.

It may be repaired, bypassed, authorised/reprogrammed through supported systems, convinced, replaced or fought.

It cannot grant an interdimensional exit outside the Dreamgate system.

---

# 15. Prophecy Engine

The **Prophecy Engine** is a machine-dream complex that models **conditional futures** through probability, prophecy phenomena, historical inputs, symbolic computation and observed world state.

It does not know one guaranteed immutable future.

Outputs may be high-confidence possibilities, low-confidence possibilities, conditional branches, warnings, symbolic projections, incomplete forecasts, manipulated results, obsolete results, falsified results or futures invalidated by changed conditions.

Factions may contest an Engine to monopolise forecasts, suppress bad outcomes, manipulate public belief, influence trade, plan wars, avert disasters or legitimise rulers. The Engine does not automatically decide political legitimacy.

Primary biome: Prophecy Dunes.

Possible resolutions include repair, recalibration, exposing manipulation, publishing or restricting results, shared governance, destroying unreliable components, preserving uncertainty, freeing bound operators, deactivation, defence or combat against hostile occupants.

---

# 16. Fate Custodian

The **Fate Custodian** guardian family protects, operates or regulates Prophecy Engine systems.

It may be machine intelligence, oracle, construct, bounded prophecy-being, institutional office or distributed control role.

It may enforce access law, calibration, secrecy, probability ethics, anti-manipulation rules or maintenance.

Possible resolutions include proving manipulation, repairing calibration, negotiating disclosure, replacing an abusive operator, demonstrating changed conditions, deactivation or combat.

It cannot make a conditional prophecy universally true by declaration.

---

# 17. Guardian Family Rule

The five guardian families are **encounter roles**, not ordinary creature additions.

A guardian may use existing creature bodies, constructs, dream-native persons, institutional offices, bound roles or unique manifestations.

A guardian instance becomes a distinct creature/NPC registry identity only where broader content governance justifies it.

This prevents the five guardian families from silently expanding the twelve-creature roster.

---

# 18. Guardian Resolution Contract

All five guardian families support multiple resolution families where the instance permits it.

Working categories include:

- PASSED
- REPAIRED
- RECONCILED
- CALMED
- REASSIGNED
- REPLACED
- BYPASSED
- ALLIED
- CONTAINED
- DEACTIVATED
- DEFEATED
- SLAIN

Final global enum naming remains system-owned.

A successful resolution does not imply ownership of the guardian. A personhood-bearing guardian retains rights after resolution.

---

# 19. Nightmare Architect

**Stable ID:** `boss.realm.dream.nightmare_architect`

The Nightmare Architect is a persistent realm-scale intelligence capable of organising accumulated collective fear into architecture, dungeons, trials, creatures, territorial systems, invasions and defensive environments.

It deliberately **builds with fear**.

This distinguishes it from a Collective Fear Sovereign, which emerges *from* collective fear.

It is not inherently evil. Possible motivations include protection through externalised fear, feeding from fear, controlled trials, political domination, artistic obsession, defence or predatory expansion.

Likely territory includes Nightmare Thickets, Nightmare Nests, Sleepwalker Road incursions, constructed nightmare districts and selected Memory City fear-zones.

Broad outcomes:

- understand/heal the fear source;
- negotiate boundaries;
- redirect nightmares into controlled trials;
- reform;
- support under agreed terms;
- contain/imprison where legitimate;
- depose;
- defeat;
- destroy.

Persistent consequences may alter Nightmare Thicket pressure, Fearling populations, Nest state, route safety, Warden politics, nightmare-society relations, settlement evacuation and bounded Overworld dream-resonance events.

The Architect does not physically transport sleepers between realms.

---

# 20. Sleeping Oracle

**Stable ID:** `boss.realm.dream.sleeping_oracle`

The Sleeping Oracle is an ancient prophetic being maintained in a deliberate deep-dream/dormant state because its dreaming produces unusually powerful conditional visions.

“Sleeping” does **not** mean its physical body lies in the Overworld.

Waking the Oracle may end/reduce some visions, free it, destabilise prophecy institutions, expose manipulation or change route forecasting. Leaving it asleep may preserve visions, preserve an exploitative institution, protect it or imprison it.

No one answer is universally canonically correct.

Possible outcomes:

- interpret visions without disturbing it;
- protect;
- expose manipulation;
- wake;
- share/distribute the prophetic burden;
- reduce its influence;
- free if involuntary;
- negotiate directly if awakened;
- fight guardians;
- confront/defeat the Oracle if genuinely hostile.

Persistent consequences may alter Prophecy Dunes, prophecy availability, Oracle School politics, prophecy markets, route forecasts, public trust, Time-Seed/Omen research and Prophecy Engine access.

---

# 21. Waking Devourer Authority

The Waking Devourer has two related records:

- creature family: `creature.realm.dream.waking_devourer`
- preserved Set-24 authority encounter stable ID: `boss.realm.dream.waking_devourer`

These do **not** define two biological species.

The authority record references an exceptional ancient or region-dominant individual of the existing creature family.

An authority-scale Waking Devourer is an apex boundary predator whose activity can alter waking/dream-law boundaries, coherence infrastructure, Waking Stone formation, Dreamgate stability, Shattered Waking Isles and mixed-reality hazards.

Older source outcomes such as “guide into sleep”, “split worlds” and “controlled crossings” are narrowed.

Valid outcomes may include restoring damaged boundaries, redirecting the Devourer toward naturally unstable regions, stabilising/feeding it safely where ecology permits, bargaining where intelligence/personhood supports it, containment, tracking, driving away or killing.

It cannot create a permanent alternate interdimensional crossing.

---

# 22. Collective Fear Sovereign

**Collective Fear Sovereign** is a variable authority family, not a single fixed monster.

It may emerge when a sufficiently large, persistent shared fear develops durable identity, coherent territory, agency and political/ecological influence.

Possible fear sources include war, famine, abandonment, monsters, magical catastrophe, invasion, societal collapse, divine punishment, failed prophecy or environmental ruin.

Its appearance and behaviour derive from the source state through bounded authored templates.

A Sovereign may become a person. If durable identity, agency and moral capacity exist, it may become ruler, neighbour, protected person, political actor, revolutionary symbol or ecological regulator.

Possible outcomes include reducing or transforming the shared fear source, negotiation, recognition of sovereignty, boundaries, institutional reform, containment, relocation of influence, deposition, defeat or destruction.

Destroying one Sovereign does not remove fear from the realm.

Generation may vary fear source, territory, visual motif, ability profile, affected civilisation, resolution hooks and event relationships, but may not generate unrestricted new species, arbitrary lore or unbounded psychological inference.

---

# 23. Fixed Authority Count

FCC-04 has exactly **three fixed major authority identities**:

1. Nightmare Architect
2. Sleeping Oracle
3. Waking Devourer

Collective Fear Sovereign is a **variable authority family**.

No additional fixed Somnolent authority is implied by dormant powers, city-scale dream entities, dungeon guardians, Nightmare societies, prophecy fauna or temporary thoughtforms.

Later additions require explicit canon amendment.

---

# 24. No Separate Titan Requirement

FCC-04 currently locks **no separate Somnolent titan/world-scale encounter family**.

The Deep Dream Abyss may host enormous visual phenomena, dormant powers, megadungeon-scale instances and authority-scale consequences. Those do not automatically become titan definitions.

A future titan addition requires explicit reconciliation.

---

# 25. Major Realm Events

The Somnolent Expanse has exactly twelve principal realm-event families.

| Event | Working ID |
|---|---|
| **Lucid Tide** | `event.realm.dream.lucid_tide` |
| **Manta Migration** | `event.realm.dream.manta_migration` |
| **Reverie Bloom** | `event.realm.dream.reverie_bloom` |
| **Memory Convergence** | `event.realm.dream.memory_convergence` |
| **Prophecy Window** | `event.realm.dream.prophecy_window` |
| **Oracle Revelation** | `event.realm.dream.oracle_revelation` |
| **Nightmare Front** | `event.realm.dream.nightmare_front` |
| **Fearling Bloom** | `event.realm.dream.fearling_bloom` |
| **Sleepwalker Road Shift** | `event.realm.dream.sleepwalker_road_shift` |
| **Waking Rupture** | `event.realm.dream.waking_rupture` |
| **Deep Dream Rising** | `event.realm.dream.deep_dream_rising` |
| **Void Incursion** | `event.realm.dream.void_incursion` |

These IDs are FCC working IDs, not earlier Set-24 stable IDs.

---

# 26. Event Family Definitions

## Lucid Tide

Temporary/regional increase in clarity and coherence around Lucid Shores or routes. May improve route readability, Beacon operation, Observatory access and recovery from Lucidity Drift.

## Manta Migration

Large Lucid Manta movement event. May reveal route information, change Dreamwater traffic, create ecological/research opportunities and increase Dream Port activity. It never guarantees safety.

## Reverie Bloom

Large flourishing of Reverie Garden ecology and culture. May increase Emotion Blooms, Muse Moths, Dreamfruit, Inspiration Resin and settlement festivals, while risking symbolism overwhelming function.

## Memory Convergence

Multiple Memory City reconstructions overlap more strongly. May reveal evidence, expose contradictory architecture, open Theatre states or create claimant conflict. It does not prove objective history by itself.

## Prophecy Window

One class of possible future becomes easier to observe. May affect Oracle activity, Prophecy Engines, Time-Seeds, Omen Striders and politics. It does not make the future immutable.

## Oracle Revelation

A major prophecy disclosure or reinterpretation changes civilisation behaviour. It may trigger political mobilisation, panic, protective preparation, market upheaval or manipulation investigations.

## Nightmare Front

Natural nightmare ecology expands/intensifies. May change Thickets, routes, Fearling pressure, predators, Warden mobilisation and Nightmare Nest activity. It is not Void Incursion.

## Fearling Bloom

Fearling population surge driven by concentrated existing fear resonance. It may create nuisance pressure, settlement disruption, predator response and Warden action.

## Sleepwalker Road Shift

One or more route segments change between bounded saved states. May cause delays, route discoveries, toll disputes, rescue opportunities or temporary isolation. Never a cross-realm shortcut.

## Waking Rupture

Mixed-reality instability centred on Shattered Waking Isles or compatible infrastructure. May cause machinery faults, structural mismatches, Waking Stone changes, Dreamwater instability, Labyrinth access or Waking Devourer activity.

## Deep Dream Rising

Deep Dream phenomena influence higher/safer regions. May bring Concept Leeches, Origin Mote exposure, severe coherence pressure, Deepbell response, unusual Dreamwater or ancient-site access. Not automatically Void.

## Void Incursion

Genuine Void-origin contamination enters Somnolent. May corrupt terrain, portal infrastructure, ecology, routes, dungeons and settlements. FCC-04I owns the detailed state progression/restoration rules.

---

# 27. Event Persistence and Combination

Realm events may combine where causally valid.

Examples:

- Lucid Tide -> Manta Migration -> Observatory access
- Prophecy Window -> Oracle Revelation
- Nightmare Front -> Fearling Bloom
- Waking Rupture -> Waking Devourer authority involvement
- Deep Dream Rising -> route instability
- Void Incursion -> Waking Rupture or Nightmare distortion

Events must use explicit causal state rather than random stacking.

Persistent evidence may include changed Blocks, structures, route state, settlement population, ecology, authority territory, faction state, maps, Codex, trade, NPC memory, archives and Dreamgate status.

---

# 28. Authority and Event Interaction

Authorities may respond to events without owning the event framework.

- Nightmare Architect may intensify or redirect Nightmare Fronts.
- Sleeping Oracle may become central to Prophecy Windows or Oracle Revelations.
- exceptional Waking Devourers may become central to Waking Ruptures.
- Collective Fear Sovereigns may emerge during prolonged fear-producing world states.

No authority must spawn for every matching event.

Participation derives from seed, territory, current state, relationships, prior outcomes and severity.

---

# 29. Dungeon and Event Interaction

Events may modify dungeon instances.

Examples:

- Lucid Tide stabilises a Lucid Observatory wing.
- Nightmare Front changes a Nightmare Nest ecology state.
- Memory Convergence opens a Memory Theatre reconstruction.
- Waking Rupture exposes a Waking Labyrinth.
- Prophecy Window changes Prophecy Engine branches.
- Void Incursion overlays corruption across any compatible dungeon.

A dungeon family does not change identity merely because its state changes.

---

# 30. Reward Provenance

Somnolent dungeons and authorities do **not** use a generic `dream loot` category.

Rewards must come from legitimate provenance:

- existing materials;
- salvage;
- plants;
- creature products;
- repaired machinery;
- faction gifts;
- legal claims;
- research;
- prophecy records;
- route access;
- knowledge;
- stabilisation techniques;
- Dreamgate knowledge;
- authority grants;
- trade permissions;
- restored infrastructure.

A dungeon cannot invent a new major material because a reward table needs a rare drop.

---

# 31. Authority Reward Principle

Progression cannot require killing Nightmare Architect, Sleeping Oracle, Waking Devourer or a Collective Fear Sovereign unless a specific authored path makes combat the chosen resolution.

Possible rewards include route access, prophecy, stabilisation knowledge, Dreamgate research, settlement permission, resource grants, political recognition, safe nightmare relationships, research access, faction alignment or combat trophies where combat occurred.

Non-combat outcomes must be able to grant equivalent progression **function**, even if specific rewards differ.

---

# 32. Resolution Proof

Dungeon/authority state should record why an outcome happened.

A useful resolution record may include encounter ID, dungeon/authority ID, instance seed, prior state, chosen resolution category, key conditions/evidence, guardian status, authority status, faction impact, route impact, ecology impact, reward provenance, corruption state, timestamp/world day, changed structures and follow-up hooks.

This prevents complex outcomes being reduced to `boss_dead=true`.

---

# 33. Canonical Resolution Categories

Working global-compatible categories include:

- STABILIZED
- REPAIRED
- INTERPRETED
- RECONCILED
- REDIRECTED
- CONTAINED
- AWAKENED
- PROTECTED
- SUPPORTED
- RECOGNIZED
- REFORMED
- SEALED
- DEACTIVATED
- ABANDONED
- DEPOSED
- DEFEATED
- SLAIN
- ALLIED

Exact enum naming remains subject to universal reconciliation.

---

# 34. Persistent Dungeon Outcome Requirements

Every dungeon family must support persistent state sufficient to distinguish:

- unresolved;
- partially explored;
- partially resolved;
- successful non-destructive resolution;
- successful destructive resolution;
- failed attempt;
- abandoned/retreated state;
- corrupted aftermath;
- restored state;
- repurposed state;
- faction-controlled state where applicable.

A dungeon does not flatten to one boolean `completed`.

---

# 35. Failure, Retreat and Recovery

Failure may cause route closure, increased nightmare pressure, guardian hostility, settlement consequence, prophecy loss/obsolescence, damaged infrastructure, event escalation or lost salvage opportunities.

Failure may not intentionally corrupt the save, delete player identity, erase required Codex/quest data, destroy authoritative memories, permanently trap the player without a recoverable Dreamgate/respawn path, or rewrite the player into a duplicate dream body.

Recovery may require changed routes, new evidence, settlement support, Lucidity preparation, stabilisation, different equipment, negotiation, rescue or a later rematch.

---

# 36. Natural Nightmare Versus Void Corruption

Natural nightmare includes Fearlings, Nightmare Stalkers, Nightmare Thorn, Nightmare Nests, Nightmare Thickets, Nightmare Architect content and Collective Fear Sovereigns.

Void corruption requires explicit Void provenance/state.

A terrifying dungeon is not automatically corrupted. A peaceful-looking area can be Void-corrupted if the actual state says so.

---

# 37. Prophecy Integrity

No dungeon or authority may silently elevate a possible future into immutable canon.

Prophecy content must preserve uncertainty, conditions, probability, observation effects, manipulation possibility, obsolete forecasts and changed-outcome possibility.

The player may act on prophecy and thereby alter the conditions that produced it.

---

# 38. Memory Integrity

Memory Theatre and Memory City phenomena may present incomplete memory, contradictory reconstruction, evidence, symbolic truth and bias.

They may not overwrite Ancestral Veil ownership, prove historical truth without evidence, erase authoritative player knowledge or rewrite save history retroactively.

---

# 39. Dreamgate Boundary

No dungeon or authority creates a second normal physical access path.

- Lucid Observatory cannot teleport out of realm.
- Nightmare Nest cannot awaken the player elsewhere.
- Memory Theatre cannot replay the player into another realm.
- Waking Labyrinth cannot exit directly into the Overworld.
- Prophecy Engine cannot forecast itself into a portal.
- Sleeping Oracle cannot dream travellers physically across realms.
- Waking Devourer cannot create permanent controlled crossings.
- Sleepwalker Roads remain intra-Somnolent normal routes.

Dreamgate remains the one canonical normal portal type.

---

# 40. Creature Ecology Interface

FCC-04H may consume the twelve ordinary creature foundations without redefining them.

Examples:

- Lucid Observatory may use Lucid Manta migration as route information.
- Nightmare Nests may contain Fearlings and Nightmare Stalkers.
- Memory Theatres may contain role manifestations without registering them as creatures.
- Waking Labyrinths may use Waking Shellbacks or Waking Devourer pressure.
- Prophecy Engines may use Omen Strider movement as an external clue.
- Deep Dream variants may contain Concept Leeches.

Guardian families do not count toward the twelve-creature roster.

---

# 41. Flora and Material Interface

Dungeons may use Dreamstone, Dream Sand, Dream Soil, Dreamwater, Reverie Wood, Waking Stone, Dream Motes, Nightmare Resin, Lucid Glass, Sleepbloom, Memory Thread, Prophecy Ink, Nightmare Thorn, Omen Grass, Deepbell and Hush Moss.

They must not silently add new principal material families.

If a dungeon seems to require a new material, first test an existing material/state; if none fits, record a reconciliation candidate rather than canonising it locally.

---

# 42. Civilisation and Settlement Interface

Adventure outcomes may affect Oracle Schools, Nightmare Wardens, Memory Traders, Shared-Dream cultures, Nightmare societies, Dreamgate settlements, route communities, Waking research colonies and Deep Dream expedition camps.

Possible consequences include migration, settlement closure/opening, trade changes, new law, legitimacy shifts, treaties, quarantine, Warden mobilisation, prophecy distrust, route toll changes, research access and protected nightmare territory.

No dungeon becomes ownerless free property just because an encounter was resolved.

---

# 43. Consent and Personhood

Somnolent adventure content often touches memory, symbolic identity, fear, prophecy and dream-space ownership.

Personhood and consent remain active in dungeon contexts.

Dungeon mechanics cannot justify harvesting a person as material, permanently impersonating their dream aspect, extracting private memories without a supported mechanism, forcing intelligent nightmare beings into livestock classification or treating a Collective Fear Sovereign as property solely because it emerged from emotion.

Combat remains possible where conflict is real, but origin does not remove rights automatically.

---

# 44. Difficulty Scaling

Difficulty may alter enemy count, guardian ability complexity, hazard intensity, timing windows, clue redundancy, resource pressure, preparation requirements, recovery assistance, damage and route complexity.

Difficulty must not change canon truth.

Lower difficulty cannot make prophecy guaranteed. Higher difficulty cannot permanently delete memories. Performance mode cannot turn natural nightmare into Void corruption. Accessibility mode cannot turn a Waking Labyrinth into a portal bypass.

---

# 45. World Simulation Complexity Profiles

## Low Simulation

Use cached dungeon state, discrete coherence updates, simplified background ecology, coarse route/event updates, minimal off-screen guardian simulation and simplified authority-territory summaries.

## Standard Simulation

Supports normal dungeon persistence, local ecology, regional event consequences, bounded guardian persistence and settlement/dungeon interaction.

## Advanced Simulation

May support richer prophecy-state changes, more detailed Nightmare Front ecology, complex Memory Theatre consequences, authority/faction interaction and long-term dungeon repurposing.

Advanced simulation remains deterministic and validated. It does not become uncontrolled freeform AI world generation.

---

# 46. Off-Screen Simulation

Off-screen dungeons should use state summaries, scheduled event checks, aggregate ecology, cached guardian state, authority-territory summaries and deterministic rehydration on approach.

This is required for low-end scalability.

---

# 47. Multiplayer and Local Co-op Contract

Universal multiplayer authority executes encounter state.

FCC-04H requires authoritative dungeon state, synchronised route changes, authoritative guardian/authority state, consistent shared prophecy outputs, provenance-preserving rewards and late-join reconstruction of current persistent state.

Personal UI/presentation may differ where allowed, but authoritative geometry/state must reconcile.

Split-screen/local co-op should avoid permanently contradictory dungeon geometries or the old one-player-outside/one-player-dream-body model. Use group-authoritative state, individual presentation, party choice and shared observation puzzles.

---

# 48. Accessibility Contract

Critical Somnolent adventure mechanics require redundant presentation.

- **Lucidity:** cannot rely only on blur, colour or distortion.
- **Route loops:** must be distinguishable from worldgen bugs.
- **Memory Theatre:** evidence cannot rely solely on subtle visual differences.
- **Prophecy:** possible/conditional/false/manipulated outputs need readable classification.
- **Reduced motion/flash:** transitions and nightmare manifestations must respect settings.
- **Colour:** coherence, prophecy validity, nightmare pressure, guardian state and corruption cannot rely on colour alone.

When dungeon geometry or route state changes, players should receive understandable cues so intentional dream logic is not mistaken for a technical failure.

---

# 49. Art Direction Handoff — Dungeons

Later realm-art documents must preserve:

## Lucid Observatory
Clarity, lenses, horizon, shared symbols, Lucid Glass, route mapping, anchored versus unstable sections.

## Nightmare Nest
Living fear ecology, looping growth, Nightmare Thorn, resin, territorial behaviour, healthy nightmare versus runaway state, distinct Void overlay.

## Memory Theatre
Stage, role, reconstruction, overlapping sets, missing participants, contradictory evidence, present versus reconstructed scene.

## Waking Labyrinth
Waking-like law, dream law, mixed/fractured states, Waking Stone, machinery, anchor structures, no literal Overworld exit implication.

## Prophecy Engine
Machine-dream computation, branching possibility, probability, conditional output, Prophecy Ink, Lucid/Fate Glass and false-certainty risk.

---

# 50. Art Direction Handoff — Guardians and Authorities

Guardian roles must remain readable even if different instances use different bodies:

- Lucid Custodian — observation/clarity/maintenance.
- Nest Warden — territorial/nightmare ecology.
- Stagekeeper — performance/role/archive.
- Waking Sentinel — mixed physical/dream law.
- Fate Custodian — prophecy/machine/conditional future.

Authority identity:

- **Nightmare Architect:** deliberate designer/organiser of fear, not random nightmare.
- **Sleeping Oracle:** dormancy/prophecy without an off-realm sleeping-human implication.
- **Waking Devourer:** authority-scale individuals visibly inherit the ordinary creature family.
- **Collective Fear Sovereign:** variable visual grammar tied to fear source, but coherent enough to read as a durable authority rather than random procedural noise.

---

# 51. Source Supersession Register

| Source-Era Direction | FCC-04H Resolution |
|---|---|
| Lucid Observatory stabilised by waking-body safety | Replaced by Waking Anchor / coherence / Lucidity |
| Nightmare Nest weakens through courage | Retained narrowly; fear-feedback may weaken but real threats remain |
| Memory Theatre alternative outcomes | Retained as reconstruction, not history rewrite |
| Waking Labyrinth bridges sleepers and waking sites | Superseded by mixed waking/dream-law dungeon |
| Waking Labyrinth coordinated awakening exit | Superseded; Dreamgate-only physical exit |
| Prophecy Engine possible futures | Retained |
| Prophecy Engine false certainty | Retained |
| Nightmare Architect | Retained with stable ID |
| Nightmare Architect changes Overworld sleep events | Reinterpreted as bounded dream-resonance/story consequences |
| Sleeping Oracle | Retained with stable ID |
| Sleeping Oracle waking may end visions | Retained |
| Waking Devourer | Retained with stable authority ID plus single creature-family relationship |
| guide Waking Devourer into sleep | Narrowed/removed where it implies sleeping-body model |
| split worlds | Superseded |
| controlled crossings | Superseded; Dreamgate remains normal portal |
| Collective Fear Sovereign boss hook | Canonised as emergent authority family |
| dormant titans in Deep Dream concept material | Not promoted into a titan family |
| guardian = enemy | Rejected |
| boss = mandatory kill | Rejected |
| dungeon complete = empty/free property | Rejected |
| generic dream loot | Rejected |
| nightmare = corruption | Rejected |
| prophecy = guaranteed future | Rejected |

---

# 52. Cross-Document Interfaces

## FCC-04A
Supplies Dream Network identity, Lucidity, Waking Anchor, bounded expectation, coherence, prophecy philosophy, Dreamgate-only travel, authority structure and death/respawn exclusions.

## FCC-04B
Supplies biome suitability, six coherence states, twelve hazards, eight environmental states, Dreamwater hazards and regional-state inputs.

## FCC-04C
Supplies material identities, source provenance, corruption-state boundary and no-native-metal rule.

## FCC-04D
Supplies Nightmare Thorn, Omen Grass, Deepbell, Sleepbloom and restoration ecology.

## FCC-04E
Supplies the twelve creature families, Waking Devourer creature identity, Nightmare Stalker/Fearling ecology, Concept Leech and personhood boundaries.

## FCC-04F
Supplies Oracle Schools, Nightmare Wardens, Nightmare societies, consent law, settlement consequences and authority-facing civilisation interfaces.

## FCC-04G
Supplies structures, Dreamgate physical boundary, Blocks/Items, reward provenance and physical processing.

## FCC-04I
Consumes FCC-04H outcomes for nightmare-state changes, Void corruption, restoration, coherence aftermath, cross-realm interactions and irreversible transformations.

## FCC-04J
Certifies the dungeon/guardian/authority/event registries, stable-ID preservation, reward provenance, source supersession and art-handoff completeness.

---

# 53. Canonical Registry Snapshot

## Dungeon Families
1. `dungeon.realm.dream.lucid_observatory` — **Lucid Observatory**
2. `dungeon.realm.dream.nightmare_nest` — **Nightmare Nest**
3. `dungeon.realm.dream.memory_theatre` — **Memory Theatre**
4. `dungeon.realm.dream.waking_labyrinth` — **Waking Labyrinth**
5. `dungeon.realm.dream.prophecy_engine` — **Prophecy Engine**

## Guardian Families — FCC Working IDs
1. `guardian.realm.dream.lucid_custodian` — **Lucid Custodian**
2. `guardian.realm.dream.nest_warden` — **Nest Warden**
3. `guardian.realm.dream.stagekeeper` — **Stagekeeper**
4. `guardian.realm.dream.waking_sentinel` — **Waking Sentinel**
5. `guardian.realm.dream.fate_custodian` — **Fate Custodian**

## Fixed Authorities
1. `boss.realm.dream.nightmare_architect` — **Nightmare Architect**
2. `boss.realm.dream.sleeping_oracle` — **Sleeping Oracle**
3. `boss.realm.dream.waking_devourer` — **Waking Devourer** authority encounter referencing the canonical creature family

## Variable Authority Family — FCC Working ID
- `authority.family.dream.collective_fear_sovereign` — **Collective Fear Sovereign**

## Major Realm Events
1. Lucid Tide
2. Manta Migration
3. Reverie Bloom
4. Memory Convergence
5. Prophecy Window
6. Oracle Revelation
7. Nightmare Front
8. Fearling Bloom
9. Sleepwalker Road Shift
10. Waking Rupture
11. Deep Dream Rising
12. Void Incursion

---

# 54. Content Completeness Check

FCC-04H is complete at realm-local canon level only if it accounts for:

- five dungeon families and source stable-ID preservation;
- five guardian families;
- three fixed authorities;
- one emergent authority family;
- Waking Devourer creature/authority single-definition handling;
- twelve event families;
- encounter-state axes;
- non-combat and combat resolution;
- guardian and authority resolution;
- reward provenance;
- persistent aftermath;
- failure/retreat/recovery;
- nightmare versus Void distinction;
- prophecy integrity;
- memory integrity;
- Dreamgate travel boundary;
- creature/flora/material/civilisation interfaces;
- low-end simulation;
- multiplayer;
- accessibility;
- art handoff.

This document satisfies those categories at realm-local canon level.

---

# 55. Production Requirements

Implementation requires support for deterministic dungeon instance seeds, bounded room-state grammars, saved dungeon/guardian/authority/event state, coherence integration, Lucidity presentation, route-state integration, prophecy-condition records, Memory Theatre evidence records, nightmare-pressure state, mixed waking/dream-law room state, reward provenance, non-combat resolution, authority consequence propagation, late-load reconstruction, low-end aggregate simulation, accessibility substitutions and multiplayer-authoritative outcomes.

These are content requirements, not engine prescriptions.

---

# 56. FCC-04H Acceptance Gate

FCC-04H is ready for realm-local acceptance only when:

## Dungeon Roster
- exactly five dungeon families are present;
- all five Set-24 names and stable IDs are retained;
- Lucid Observatory no longer depends on waking-body safety;
- Nightmare Nest preserves natural nightmare ecology;
- Memory Theatre cannot rewrite authoritative history;
- Waking Labyrinth no longer physically bridges sleepers/waking sites;
- Waking Labyrinth cannot bypass Dreamgate;
- Prophecy Engine models conditional futures.

## Guardian Roster
- exactly five guardian families are present;
- guardians are encounter roles rather than automatic new species;
- guardian instances may be persons;
- guardians are not automatically hostile;
- non-combat resolution is supported where appropriate.

## Authority Roster
- exactly three fixed authorities are present;
- all three source authority stable IDs are preserved;
- Waking Devourer authority references the existing creature family;
- Collective Fear Sovereign is a variable family rather than a fourth fixed authority;
- no separate titan family has been silently added.

## Authority Meaning
- Nightmare Architect deliberately builds with fear;
- Collective Fear Sovereign emerges from collective fear;
- Sleeping Oracle is not an Overworld sleeping body;
- waking the Oracle may end/reduce visions without being the mandatory moral answer;
- Waking Devourer cannot create alternate permanent crossings;
- authority outcomes need not require killing.

## Events
- exactly twelve major event families are accounted for;
- Nightmare Front is distinct from Void Incursion;
- Deep Dream Rising is distinct from Void Incursion;
- events can leave persistent evidence;
- event combinations require causal state.

## Integrity / Ownership
- prophecy remains conditional;
- Memory Theatre cannot delete or rewrite player-owned truth;
- natural nightmare remains distinct from corruption;
- Dreamgate remains the only normal physical portal;
- no dungeon invents principal materials solely as rewards;
- reward provenance uses FCC-04C–G content;
- personhood/consent remain active;
- universal death/respawn remains external.

## Simulation / Accessibility
- deterministic generation is possible;
- low-end/off-screen simulation can aggregate;
- multiplayer has one authoritative world state;
- route changes remain readable;
- Lucidity effects have redundant cues;
- prophecy classifications are accessible;
- transitions respect reduced-motion/reduced-flash settings.

---

# 57. Realm-Local Status

FCC-04H preserves the strongest Set-24 Somnolent adventure foundations while reconciling the later FCC lock.

It deliberately preserves:

- all five dungeon stable IDs;
- all three fixed authority stable IDs;
- multi-outcome authority philosophy;
- possible-future prophecy;
- nightmare ecology;
- persistent world-state consequences.

It deliberately supersedes:

- physical travel through sleep/waking;
- off-realm sleeping-body safety;
- Waking Labyrinth exits into waking sites;
- Waking Devourer world-splitting/alternate-crossing outcomes;
- mandatory boss-kill progression;
- generic dream loot;
- nightmare-as-corruption logic.

The Collective Fear Sovereign is now fully bounded as an emergent authority family, giving Somnolent a distinctive dynamic authority system without increasing the fixed authority roster.

**FCC-04H realm-local adventure canon is ready for review.**
