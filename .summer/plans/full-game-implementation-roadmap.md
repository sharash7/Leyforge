# Leyforge Documents 00-30 Full-Implementation Production Roadmap

**Roadmap version:** 2
**Updated:** 2026-08-14
**Machine source SHA-256:** `1cb02ab929a5e3032d78098325400688feba21cd7efd86128692a3d706939781`
**Current phase:** P4

## Completion contract

The programme is Core-first. Completion covers every accepted Core Production,
Early Access and Full Release requirement across Documents 00-30. Later Expansion,
Tooling Research and Archived Validation remain governed but do not block release.
Catalogue presence, generated assets and narrow probe success are not gameplay
completion evidence.

Package status records implementation evidence for that named owner boundary.
Phase status records ordered gate acceptance. Existing implementation may therefore
be verified in a later phase while `current_phase` remains P4, but no later phase is
accepted until its earlier required gates close. This prevents vertical reconciliation
work from being reported as out-of-order programme completion.

## Current implementation baseline

- Coverage: 0 Implemented, 28 Partial, 1 Stub, 3 Missing.
- Regression: 58 scenes and 20078 checks; 256 worldgen seeds; 10000 Forge structure seeds.
- Runtime compatibility: save v18, worldgen v5.

## Phase map

| Phase | Status | Outcome | Gate |
|---|---|---|---|
| P0 - Governance and Production Reset | completed | A reproducible Documents 00-30 baseline, production backlog, and archive-safe development profile. | G0-G1 |
| P1 - Technical and Registry Kernel | completed | One authoritative command, evidence, registry, pack, and transaction substrate proven by a representative vertical. | G2-G3 |
| P2 - Canonical Data, World and Persistence | completed | Canonical physical content and deterministic generated worlds persist independently of presentation and POC fixtures. | G4-G5 |
| P3 - Persistent Simulation and Ownership Reconciliation | completed | Specialist systems own their state and communicate through the final reconciled Sets 27-30 contracts. | G6-foundation |
| P4 - Living Frontier Gameplay Integration | in_progress | A complete generated gather, build, settle, trade, travel, adventure and recovery loop across connected settlements. | G6 |
| P5 - Core Production Completion | planned | The solo-first Living Frontier Network is a complete, accessible, presented production milestone. | G7-G8 |
| P6 - Early Access and Full Release Breadth | planned | Every accepted release-tier package across Documents 00-30 is integrated with complete dependencies and evidence. | G7-G9 expansion |
| P7 - Multiplayer Hardening | planned | Solo, split-screen and network play share one authoritative persistent ruleset. | G9-network |
| P8 - Release Qualification | planned | A reproducible release candidate with frozen evidence and explicit human approval. | G10 |

## P0 - Governance and Production Reset

A reproducible Documents 00-30 baseline, production backlog, and archive-safe development profile.

| Package | Status | Documents | Depends on | Deliverables | Acceptance |
|---|---|---|---|---|---|
| GOV-001 - Canonical document and coverage baseline | completed | 00; 18; 25 | None | 137-document manifest; requirements ledger; 32-subsystem coverage register | document governance passes; coverage is evidence-derived |
| GOV-002 - Requirements-to-package disposition | completed | 00; 01; 02; 03; 04; 05; 06; 07; 08; 09; 10; 11; 12; 13; 14; 15; 16; 17; 18; 19; 20; 20A-20H; 21; 22; 23; 24; 25; 26; 27; 28; 29; 30 | GOV-001 | machine-readable production packages; tier and dependency mapping | every accepted requirement resolves to one governed package before implementation |
| GOV-003 - POC archive isolation | completed | 00; 01; 07; 11; 15; 18; 24; 25 | GOV-001 | production-safe profile and save labels; legacy identity aliases; leakage probe | new worlds do not use retired POC identities; legacy fixtures remain loadable |
| GOV-004 - Safe build and verification baseline | completed | 18; 25 | GOV-001 | fixed Godot runner; isolated verification profiles; teardown blocking policy | current regression gate passes without release-blocking output |

**Exit gate (G0-G1):** Core requirements have a package and owner; production profiles contain no active POC identity; Phase 0 and current regression gates pass

## P1 - Technical and Registry Kernel

One authoritative command, evidence, registry, pack, and transaction substrate proven by a representative vertical.

| Package | Status | Documents | Depends on | Deliverables | Acceptance |
|---|---|---|---|---|---|
| KRN-001 - World time, presence, authority and evidence envelope | completed | 07; 15; 18; 25; 27; 28; 29; 30 | GOV-002 | WorldTimeReference; ActorPresenceState; AuthorityContext; CrossSetEvidenceEnvelope | persistent consequences are idempotent; conflicting evidence is rejected |
| KRN-002 - Command, event, transaction and scheduler foundation | completed | 18; 25 | KRN-001 | validated command envelope; event journal; transaction lifecycle; bounded scheduler | unauthorised mutation is rejected; replay cannot duplicate a commit |
| REG-001 - Qualified IDs, schemas, facets, packs and compiler | completed | 03; 04; 05; 06; 18; 25 | GOV-002 | definition envelope; schema registry; pack manifest and lockfile; compiled Godot resources | duplicate owners and unresolved references fail; compiled output is deterministic |
| REG-002 - Representative cross-domain registry fixture | completed | 03; 04; 05; 06; 12; 17; 25 | KRN-002; REG-001 | Block-to-UI fixture; optional-pack fixture; save and rollback evidence | fixture loads, saves, migrates and rolls back losslessly |

**Exit gate (G2-G3):** shared kernel contracts pass; representative fixture compiles and round-trips; rollback is deterministic

## P2 - Canonical Data, World and Persistence

Canonical physical content and deterministic generated worlds persist independently of presentation and POC fixtures.

| Package | Status | Documents | Depends on | Deliverables | Acceptance |
|---|---|---|---|---|---|
| DATA-001 - Core Blocks, Items, Recipes and Resources | completed | 03; 04; 05; 06; 25 | REG-002 | catalogue batches; provenance and conservation rules; capability graph | no recoverable-Block duplicate Item; all physical chains conserve quantities |
| WLD-001 - Seed world topology and biome assembly | completed | 11; 24 | REG-002 | world manifest; regional generation; deterministic repair | seed corpus is deterministic; normal generation has no archived-profile dependency |
| STR-001 - Persistent StructureInstance owner | completed | 12; 16; 20; 22; 24 | REG-002; WLD-001 | StructureInstance record; damage and repair history; LOD views | ConstructionProject hands completion to Structure owner; combat cannot materialise structure truth directly |
| SAVE-001 - Save coordinator, migration and recovery | completed | 18; 25 | KRN-002; REG-002 | ordered migrations; generated-base plus delta; missing-pack quarantine; atomic recovery | supported v2-v18 fixtures migrate; failed writes preserve the previous good save |
| LOD-001 - Time, presence and simulation LOD | completed | 07; 10; 11; 18; 25 | KRN-002; SAVE-001 | promotion and demotion; bounded catch-up; workload budgets | identity, ownership and quantities agree across LOD transitions |

**Exit gate (G4-G5):** approved Core catalogues resolve; multiple generated regions require no POC fallback; save recovery and migration pass

## P3 - Persistent Simulation and Ownership Reconciliation

Specialist systems own their state and communicate through the final reconciled Sets 27-30 contracts.

| Package | Status | Documents | Depends on | Deliverables | Acceptance |
|---|---|---|---|---|---|
| NPC-001 - Persistent people and household owner extraction | completed | 07 | LOD-001 | resident, household, job and schedule interfaces | resident identity survives materialisation changes |
| BIO-001 - Biological and survival state owner | completed | 16; 29; 30 | KRN-002; NPC-001 | biological records; impact and exertion decisions; mobility modifiers | combat and actors request rather than write biological truth |
| SOC-001 - Social, dialogue and knowledge state owner | completed | 07; 13; 15; 28 | KRN-002; NPC-001 | relationship and knowledge records; dialogue evidence; companion agreements | social trust cannot directly grant political or economic authority |
| POL-001 - Government, law and territory owner | completed | 13; 27; 28 | KRN-002; NPC-001 | political authority; territory and law records; permission queries | political permissions have one owner |
| MOV-001 - Universal Movement facade and journey records | completed | 07; 19; 26; 28; 29; 30 | BIO-001; SOC-001; STR-001 | movement request API; journey records; route truth; specialist provider boundary | settlement schedules issue movement intent; Set 26E remains aquatic provider |
| EVT-001 - Quest, event and world-history evidence owner | completed | 15; 24 | KRN-002; SAVE-001 | event journal; quest graph state; world consequence references | events bind existing identities and remain idempotent |

EVT-001 completion covers the runtime owner boundary: stable-definition Event and
Quest Instances, staged graphs and branches, authoritative evidence, contributions,
transactional reward-claim state, checked consequence links, bounded Chronicle state,
atomic commits, and v1-to-v2 migration. It does not claim the remaining authored
Document 15 breadth or the separate Document 24K Atlas scheduler and content registry.

**Exit gate (G6-foundation):** owner boundaries are enforced; near and far simulation reconcile; save/load preserves specialist state

## P4 - Living Frontier Gameplay Integration

A complete generated gather, build, settle, trade, travel, adventure and recovery loop across connected settlements.

| Package | Status | Documents | Depends on | Deliverables | Acceptance |
|---|---|---|---|---|---|
| SET-001 - Settlement services, construction and growth | in_progress | 07; 19; 20; 20A-20H | NPC-001; MOV-001; STR-001 | need-driven projects; service activation; district growth | projects conserve resources and produce owned structures |
| ECO-001 - Economy, markets, contracts and trade | planned | 27 | BIO-001; SOC-001; POL-001; MOV-001; SET-001 | stock-backed markets; contracts and wages; transport missions; public finance | no invisible stock, money or completed journeys |
| SYS-001 - Automation, magic and infrastructure integration | planned | 08; 09; 20 | DATA-001; SET-001; ECO-001 | network graphs; machines; mana and wards; facility transactions | networks conserve inputs and use owner-neutral settlement transactions |
| ECOLOGY-001 - Creature, ecology and threat runtime | planned | 10; 11; 24; 29; 30 | BIO-001; MOV-001; WLD-001 | persistent creatures; bounded ecology; Atlas-driven threats | fixed goblin scheduling is not production authority |
| COMBAT-001 - Combat and aftermath reconciliation | planned | 12; 15; 16; 29; 30 | BIO-001; MOV-001; STR-001; EVT-001; ECOLOGY-001 | resolved impact events; structure consequences; persistent aftermath | each consequence commits once through its owner |
| CORE-001 - Generated Living Frontier identity slice | planned | 00; 01; 02; 06; 07; 15; 17; 24 | SET-001; ECO-001; SYS-001; COMBAT-001 | connected generated settlements; capability progression; travel, quest and recovery loop | slice does not require Forest Hamlet, fixed residents or fixed coordinates |

**Exit gate (G6):** Living Frontier vertical passes; progression is capability-driven; persistent consequences survive LOD and reload

## P5 - Core Production Completion

The solo-first Living Frontier Network is a complete, accessible, presented production milestone.

| Package | Status | Documents | Depends on | Deliverables | Acceptance |
|---|---|---|---|---|---|
| FORGE-001 - Approved Core Forge and Atlas migration | planned | 21; 22; 23; 24; 25 | REG-002; STR-001; CORE-001 | approved editable sources; deterministic runtime products; coverage ledger | generated products never become editable authority |
| REALM-001 - Core realm foundation | planned | 09; 14; 24 | SAVE-001; MOV-001; EVT-001 | RealmInstance; transition transaction; Verdant Covenant; Ancestral Veil safe-return teaser | realm identity and return persist atomically |
| BPW-001 - Restricted player Blueprint Workshop | planned | 17; 19; 21; 22 | REG-002; STR-001; FORGE-001 | player blueprint source; validation and submission; non-destructive editing | players cannot mutate developer registry authority |
| UI-001 - Owner-neutral UI, accessibility and recovery | planned | 17; 18; 23 | CORE-001; REALM-001 | read models; command bridge; guidance; settings and recovery UI | UI labels come from focused world state; accessibility suite passes |
| CORE-ACCEPT-001 - Core production acceptance | planned | 00; 18; 25 | FORGE-001; REALM-001; BPW-001; UI-001 | packaged evidence; manual test matrix; owner decision | G7-G8 evidence is frozen and approved |

**Exit gate (G7-G8):** Core pack lock is frozen; packaged performance and accessibility pass; human milestone approval is recorded

## P6 - Early Access and Full Release Breadth

Every accepted release-tier package across Documents 00-30 is integrated with complete dependencies and evidence.

| Package | Status | Documents | Depends on | Deliverables | Acceptance |
|---|---|---|---|---|---|
| BREADTH-001 - Accepted world and civilisation breadth | planned | 10; 11; 12; 13; 15; 20; 20A-20H; 24; 25 | CORE-ACCEPT-001 | release-tier biomes, cultures, settlements, sites, creatures, threats and histories | each package passes completeness and reachability contracts |
| REALM-002 - Accepted Full Release realms | planned | 09; 14; 24 | REALM-001; BREADTH-001 | complete admitted realm packages | each realm has progression, persistence and safe return |
| MAR-001 - Full Set 26 maritime integration | planned | 26 | BIO-001; ECO-001; MOV-001; REALM-001; BREADTH-001 | marine fields; aquatic provider; vessels; ports; maritime economy, combat, events and UI | G9 passes; aquatic locomotion has one provider |
| RELEASE-SCOPE-001 - Accepted-scope closure | planned | 00; 25 | BREADTH-001; REALM-002; MAR-001 | terminal requirement dispositions; deferred-tier register | Core, Early Access and Full Release scope has no incomplete row |

**Exit gate (G7-G9 expansion):** accepted release packages are Integrated or Released; full maritime closure passes; no accepted requirement remains partial or unverified

## P7 - Multiplayer Hardening

Solo, split-screen and network play share one authoritative persistent ruleset.

| Package | Status | Documents | Depends on | Deliverables | Acceptance |
|---|---|---|---|---|---|
| NET-001 - Replication, prediction and authority | planned | 18; 26; 27; 28; 29; 30 | RELEASE-SCOPE-001; KRN-002 | replication; prediction; permission validation; content handshake | clients cannot author persistent truth |
| NET-002 - Reconnect, split-screen and soak | planned | 17; 18; 26; 30 | NET-001 | late join; reconnect; host recovery; shared-screen support; soak evidence | replay cannot duplicate goods, money, injuries, journeys or projects |

**Exit gate (G9-network):** replication and reconnect pass; content handshake and permissions pass; soak tests preserve conservation

## P8 - Release Qualification

A reproducible release candidate with frozen evidence and explicit human approval.

| Package | Status | Documents | Depends on | Deliverables | Acceptance |
|---|---|---|---|---|---|
| QUAL-001 - Seed, performance and accessibility qualification | planned | 17; 18; 25 | NET-002 | seed corpus; packaged profiles; accessibility review; human playtests | release budgets and player-trust gates pass |
| QUAL-002 - Migration and recovery qualification | planned | 18; 25 | RELEASE-SCOPE-001; NET-002 | migration matrix; missing-pack recovery; rollback evidence | supported saves migrate without loss |
| QUAL-003 - Evidence freeze and release decision | planned | 00; 18; 25 | QUAL-001; QUAL-002 | frozen pack locks; checksums; benchmarks; known deferrals; rollback instructions | G10 passes with explicit human approval |

**Exit gate (G10):** all selected gates pass; evidence bundle is frozen; release authority approves

## Shared public contracts

- Qualified IDs, definition envelopes, pack manifests and lockfiles, aliases, tombstones and migrations.
- WorldTimeReference, ActorPresenceState, AuthorityContext and CrossSetEvidenceEnvelope.
- Authoritative Structure, Realm, Biology, Social, Political, Movement, Economy, Event and Vessel records.
- Typed economy/transport, social/movement, biology/movement, combat/consequence and aquatic-provider boundaries.
- UI and presentation consume read models, snapshots and events; they never own gameplay truth.

## Verification policy

- Use the configured fixed Godot 4.8 development runner and isolated writable profiles.
- Keep current regression green after every package and run Phase 0 for document, registry, migration or coverage changes.
- Require schema/reference, determinism, conservation, progression, migration, LOD, accessibility and teardown evidence per package.
- Block parse/script/gameplay failures, dangling references, POC leakage, authority violations and RID/ObjectDB/resource/StringName leaks.
- Preserve the existing dirty worktree and do not stage or commit without instruction.
