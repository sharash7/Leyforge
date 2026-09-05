# Leyforge Final Content Canon Collection

## FCC-14C — Forge, Technical, Validation & Migration Handoff Requirements

**Version:** 0.1  
**Date:** 30 August 2026  
**Status:** **FINAL CROSS-REALM CERTIFICATION VOLUME C COMPLETE — IMPLEMENTATION HANDOFF REQUIREMENTS LOCKED; TECHNICAL ARCHITECTURE REMAINS DOWNSTREAM**  
**Parent:** FCC-14 — Canon Certification & Art Handoff  
**Consumes:** FCC-14A; FCC-14B; FCC-14 Steps 1D–1E; locked FCC-12; locked FCC-13A–E; owner-approved Abysscap amendment  
**Companion Volumes:** FCC-14A — Final Cross-Realm Certification & Global Invariant Register; FCC-14B — Semantic Art-Handoff & Visual Distinction Manifest; FCC-14D — Final Hold/Amendment Register, Completeness Audit, Package Manifest & Cross-Realm Certification Lock  
**Next:** FCC-14D

---

# 1. Purpose

FCC-14C is the final **Forge / technical-consumption / validation / migration handoff authority** for the current Leyforge Final Content Canon scope.

It answers:

> **What must The Forge, registries, compilers/bakes, runtime systems, migration tooling and automated validation be capable of preserving so implementation cannot silently rewrite the certified FCC semantics?**

FCC-14C translates locked semantic authority into implementation-facing obligations. It does **not** select the final code architecture.

The governing rule remains:

> **CERTIFY WHAT IS LOCKED; ROUTE WHAT BELONGS ELSEWHERE; REOPEN ONLY A GENUINE CONTRADICTION.**

The central technical boundary is:

> **Stable semantic truth is authoritative; editor representation, generated data, runtime handles, caches, assets and engine-specific objects are replaceable implementation projections.**

---

# 2. Authority Boundary

## 2.1 FCC-14C owns

FCC-14C owns the project-wide requirement contract for:

- Forge semantic authoring capability;
- stable-ID consumption;
- material/form generation and specialist overrides;
- Block/Object/Item/projection and lifecycle preservation;
- state/provenance/quality/composition preservation;
- recipe/provider/capability/environment representation;
- blueprint/project/repair material resolution;
- portal-family/state authoring and validation;
- cross-realm suitability validation;
- semantic art-contract validation;
- accessibility/performance truth-preservation validation;
- alias/redirect/contextual migration requirements;
- `leyforge_compat` / `leyforge_test` isolation;
- build/runtime/migration acceptance gates;
- diagnostic/reporting minimums;
- the narrow Abysscap migration handoff.

## 2.2 FCC-14C does not own

FCC-14C does not choose:

- exact Forge screen layout or editor UX;
- exact data schema or serialization syntax;
- exact source file format;
- exact generated registry format;
- exact Godot classes/resources/nodes;
- exact Zylann voxel representation;
- exact database/index/cache implementation;
- exact networking/replication implementation;
- exact save-container format;
- exact portal transition/failsafe code;
- exact ecology suitability equations;
- exact corruption propagation algorithms;
- exact law/contract evaluator;
- exact shader/material implementation;
- exact asset build pipeline;
- exact LOD thresholds/performance budgets;
- exact CI product/vendor or repository workflow.

These are Branch B / PRD / LFE / FORGE-ENG / implementation authorities, constrained by this handoff.

## 2.3 Engineering freedom rule

Downstream engineering may replace an implementation technique without an FCC amendment when all certified semantic inputs, outputs, identity boundaries, migration guarantees and player-visible truth remain equivalent.

A technical rewrite becomes an FCC concern only when it proposes to change canonical meaning.

---

# 3. Executive Handoff Result

FCC-14C consumes a **zero-open-semantic-hold** corpus from FCC-14A/B.

| Domain | Result |
|---|---|
| Stable identity / namespace contract | **HANDOFF READY** |
| Material + generated-form contract | **HANDOFF READY** |
| Block/Object/Item/projection contract | **HANDOFF READY** |
| State/provenance/quality contract | **HANDOFF READY** |
| Recipe/provider/capability/quantity contract | **HANDOFF READY** |
| Blueprint/project/repair contract | **HANDOFF READY** |
| Six-portal authoring/runtime contract | **HANDOFF READY** |
| Cross-realm suitability contract | **HANDOFF READY** |
| Semantic visual-validation contract | **HANDOFF READY** |
| Accessibility/performance truth contract | **HANDOFF READY** |
| Legacy/save migration contract | **HANDOFF READY** |
| Compatibility/test isolation | **HANDOFF READY** |
| New FCC semantic contradictions introduced | **0** |
| Open FCC-14 semantic holds | **0** |
| Implementation architecture locked by FCC-14C | **NO** |
| FCC-14D authorised | **YES** |

**Numbered handoff / validation requirements in this volume:** **276**.

---

# 4. Requirement Classes

FCC-14C uses the following ID families:

- `HT-CORE-*` — authority/source/bake/runtime boundary;
- `HT-ID-*` — stable identity and namespace;
- `HT-FORM-*` — material/form/generated-form;
- `HT-OBJ-*` — physical object/projection/lifecycle;
- `HT-STATE-*` — state/provenance/quality/cross-realm metadata;
- `HT-RECIPE-*` — recipe/provider/capability/quantity;
- `HT-PROJ-*` — blueprint/project/repair material resolution;
- `HT-PORTAL-*` — six-portal authoring and runtime semantics;
- `HT-ENV-*` — environmental/cross-realm suitability;
- `HT-VIS-*` — FCC-14B semantic visual contract;
- `HT-A11Y-*` — accessibility/non-colour semantic preservation;
- `HT-PERF-*` — performance/LOD truth preservation;
- `HT-MIG-*` — migration/save compatibility;
- `HT-COMPAT-*` — compatibility/test segregation;
- `VAL-CI-*` — authoring/build/CI rejection gates;
- `VAL-RUN-*` — runtime acceptance invariants;
- `VAL-REP-*` — diagnostic/reporting requirements.

A requirement ID is a **handoff acceptance reference**, not a claim that FCC-14C owns the implementation that satisfies it.

---

# 5. Source → Bake → Runtime Contract

The project-wide semantic pipeline is certified conceptually as:

1. **Approved editable semantic source** — human-authorable source of truth.
2. **Validation/compilation/bake** — deterministic transformation/check stage.
3. **Generated derived data** — registries, indexes, generated forms, caches, manifests, previews or equivalent outputs.
4. **Runtime representation** — engine-specific objects/handles/resources consuming stable semantic identity.
5. **Persistence/migration layer** — stores/reconstructs durable semantic identity and safely migrates historical data.

No specific file format is imposed here.

A build product may be disposable. Canonical semantic meaning may not be.


# 6. Core Authority & Pipeline Requirements — `HT-CORE`

| ID | Requirement |
|---|---|
| **HT-CORE-001** | FCC-14C is a semantic implementation handoff, not a replacement engineering specification. |
| **HT-CORE-002** | All downstream systems must consume FCC-12 material semantics, FCC-13 identity/registry/recipe/portal/migration semantics, FCC-14A global invariants and FCC-14B visual-distinction obligations without silently weakening them. |
| **HT-CORE-003** | When a downstream technical choice conflicts with a locked FCC semantic requirement, the semantic requirement wins unless a governed amendment is approved. |
| **HT-CORE-004** | Implementation convenience must not create new canonical materials, objects, portal families, realms, lifecycle identities or migration targets. |
| **HT-CORE-005** | Runtime representation, caches, numeric handles and asset references are derived implementation data rather than semantic identity. |
| **HT-CORE-006** | Approved editable source must remain distinguishable from generated/baked/runtime derived products. |
| **HT-CORE-007** | Generated or cached products must be reproducible from approved semantic source plus declared toolchain/version inputs. |
| **HT-CORE-008** | A failed authoring validation or bake must not silently replace the last approved valid semantic source/product. |
| **HT-CORE-009** | A presentation-only change may not alter gameplay-contract fields without an explicit contract revision. |
| **HT-CORE-010** | Technical systems may add diagnostics, caches, indexing, compression and acceleration without changing canonical meaning. |
| **HT-CORE-011** | Exact schemas, classes, file formats, editor layout, database technology, serialization format and Godot/Zylann representation remain downstream technical choices. |
| **HT-CORE-012** | FCC-14C requirements are acceptance obligations that Branch B/Forge engineering may satisfy with any architecture that preserves the certified semantics. |

# 7. Stable Identity & Namespace Requirements — `HT-ID`

| ID | Requirement |
|---|---|
| **HT-ID-001** | Durable canonical concepts must resolve through stable semantic IDs independent of display names, registry ordering, asset paths, numeric handles and engine-specific resource paths. |
| **HT-ID-002** | Canonical IDs must retain typed domain ownership; a recipe ID cannot satisfy a material field, a knowledge ID cannot silently become inventory content, and a migration alias cannot masquerade as an active object. |
| **HT-ID-003** | The core `leyforge` namespace must remain reserved for canonical first-party content. |
| **HT-ID-004** | Compatibility-only content must remain isolated under `leyforge_compat` or an equivalently explicit compatibility boundary and must not enter normal worldgen/crafting/progression. |
| **HT-ID-005** | Test fixtures must remain isolated under `leyforge_test` or an equivalently explicit test boundary and must never silently appear in normal gameplay. |
| **HT-ID-006** | Third-party namespaces may reference core IDs but may not shadow or silently replace `leyforge:` identities. |
| **HT-ID-007** | Once a shipped canonical stable ID has semantic meaning, that meaning must never be reused for unrelated content. |
| **HT-ID-008** | A semantic rename that requires a stable-ID change must use an explicit redirect/migration path; display-name edits alone do not force identity changes. |
| **HT-ID-009** | Multiple historical IDs may legally converge on one canonical target when the mapping is semantically exact. |
| **HT-ID-010** | Cultural/local/display aliases must remain distinct from durable migration redirects unless explicitly promoted by migration evidence. |
| **HT-ID-011** | The canonical resolver must be able to report existence, domain, namespace owner, active/deprecated/compat/test status, redirect target, generated status and canonical target. |
| **HT-ID-012** | Canonical lookup must take precedence over cached or local numeric handles. |
| **HT-ID-013** | If a numeric handle disagrees with its stable semantic ID, the stable semantic ID must win. |
| **HT-ID-014** | Runtime numeric handles may be regenerated and must not be persisted as the sole durable semantic identity. |
| **HT-ID-015** | Save compression dictionaries and chunk palettes may compact IDs only when they remain reversibly mapped to canonical semantic identities. |
| **HT-ID-016** | Generated standard-form identities must be deterministic from their semantic inputs rather than allocation order. |
| **HT-ID-017** | Blueprint IDs must remain independent from whichever legal provider materials are selected for a built instance. |
| **HT-ID-018** | Knowledge IDs must remain separate from materials, items and physical portal components. |
| **HT-ID-019** | Portal component IDs must remain portal-family-specific semantic objects rather than generic portal materials. |
| **HT-ID-020** | Exactly six normal external portal-family identity domains must remain representable without a generic seventh family. |

# 8. Material, Form & Generated-Form Requirements — `HT-FORM`

| ID | Requirement |
|---|---|
| **HT-FORM-001** | Canonical material definitions must be authorable independently from physical form. |
| **HT-FORM-002** | Reusable form definitions/profiles must be authorable independently from canonical material identity. |
| **HT-FORM-003** | Regular standard-form identity must resolve deterministically from `(material_id, form_id)`. |
| **HT-FORM-004** | The Forge must support material form eligibility through reusable profiles plus per-material allow/deny/override/specialise rules. |
| **HT-FORM-005** | Not every material may be assumed to support every form. |
| **HT-FORM-006** | Standard forms may be generated/materialised/cached without becoming independently authored canonical identities. |
| **HT-FORM-007** | Equivalent form concepts must not proliferate under arbitrary synonyms when they represent the same semantic form. |
| **HT-FORM-008** | Specialist authored geometry may override a standard material+form template when geometry, collision, living behaviour, magical behaviour, composition, sockets, ports, pivots or moving parts require it. |
| **HT-FORM-009** | A specialist form override must retain the underlying material identity unless the owning canon defines a true transformed material/object. |
| **HT-FORM-010** | Material-family art inheritance must be capable of propagating to generated forms while respecting FCC-14B identity-critical distinctions. |
| **HT-FORM-011** | Generated forms must remain stable across registry reorderings and bake regeneration. |
| **HT-FORM-012** | Generated-form IDs must not incorporate transient asset paths, texture indices, runtime row numbers or editor folder names. |
| **HT-FORM-013** | Irreversible FCC-12 transformation thresholds must create the correct new canonical material/object identity rather than a cosmetic state label. |
| **HT-FORM-014** | Reversible form conversion must not create a new material identity. |
| **HT-FORM-015** | Fluid/gas world, stored and piped projections must retain one substance identity while quantity/container/state are stored separately. |
| **HT-FORM-016** | Living specialist materials such as Living Heartwood must be able to restrict or override ordinary form generation without becoming generic inert timber. |
| **HT-FORM-017** | Multi-material authored objects must be able to contain canonical generated-form components and specialist components in the same composition. |
| **HT-FORM-018** | The authoring pipeline must detect and block an illegal material/form pair before canonical publication or runtime use. |

# 9. Physical Object, Projection & Lifecycle Requirements — `HT-OBJ`

| ID | Requirement |
|---|---|
| **HT-OBJ-001** | One canonical physical object may expose world/placeable, inventory, dropped and installed projections without multiplying canonical identity. |
| **HT-OBJ-002** | Block is a world/voxel representation boundary, not an automatic material or object identity boundary. |
| **HT-OBJ-003** | Item is primarily a portable/inventory projection boundary, not an automatic duplicate physical identity. |
| **HT-OBJ-004** | The single-definition rule must prevent duplicate canonical Block/Item identities for the same unchanged physical object. |
| **HT-OBJ-005** | Separate identities are permitted where a genuine lifecycle split occurs, such as living organism → propagule/seed → harvested product → processed product. |
| **HT-OBJ-006** | Lifecycle authoring must identify which transitions preserve object identity and which create a new canonical object/material. |
| **HT-OBJ-007** | Removable installed components must retain their physical object identity while installed. |
| **HT-OBJ-008** | Irreversibly consumed components must transfer relevant composition/provenance into the resulting assembly according to process rules. |
| **HT-OBJ-009** | Large machines must support one root functional identity with multiblock footprints/component graphs/occupied-cell references rather than one machine identity per occupied cell. |
| **HT-OBJ-010** | Player-configured variants must be representable as archetype + material-slot map + state without automatic creation of a new canonical ID. |
| **HT-OBJ-011** | Forking/copying a deliberately authored Forge design must create a new stable authored identity rather than silently sharing identity. |
| **HT-OBJ-012** | Inventory stacks must preserve enough data to reconstruct object/material identity, form, consequential state, quality and provenance. |
| **HT-OBJ-013** | Lots with materially relevant provenance/state differences may remain separate stacks without receiving new canonical IDs. |
| **HT-OBJ-014** | Portal inactive/damaged/ruined/calibrated/upgraded conditions must remain states of the same portal-family structure unless a component physically detaches. |
| **HT-OBJ-015** | Historical `Broken Portal Block` semantics must not become a generic current portal material or seventh portal family. |
| **HT-OBJ-016** | World/inventory icon/preview differences must not create duplicate physical content entries. |

# 10. State, Provenance, Quality & Composition Requirements — `HT-STATE`

| ID | Requirement |
|---|---|
| **HT-STATE-001** | State/condition profiles must be authorable separately from canonical material/object identity. |
| **HT-STATE-002** | Provenance/history metadata must be representable separately from material identity. |
| **HT-STATE-003** | Quality, grade, purity and composition dimensions must be representable as separate semantics rather than one universal rarity field. |
| **HT-STATE-004** | Damage, occupation, contamination, charge, dormancy, instability, corruption, repair and restoration must be representable without automatic identity duplication. |
| **HT-STATE-005** | Where corruption overlays are reversible/cleansable, the base canonical identity must remain recoverable. |
| **HT-STATE-006** | Native realm hazards/states must remain representable independently from genuine Void-corruption state. |
| **HT-STATE-007** | Provenance may remain invisible in ordinary presentation while still being authoritative for trade, ecology, law, support or migration. |
| **HT-STATE-008** | Imported, naturalised, invasive and corrupted classifications must not be collapsed into one “foreign” flag. |
| **HT-STATE-009** | Provider equivalence must not erase the exact selected material from object composition, repair or salvage data. |
| **HT-STATE-010** | Cross-realm transfer records must be able to preserve source, transfer vector, provenance, transferred subject, receiving owner, support/environment, scope/persistence and identity conservation where the owning systems require them. |
| **HT-STATE-011** | An object/material crossing a realm boundary must not automatically receive a new canonical identity. |
| **HT-STATE-012** | Local/cultural/faction/biome styling must be able to exist as contextual overlay without mutating base identity. |
| **HT-STATE-013** | State presentation data must support FCC-14B non-colour redundancy where state affects safety, progression or interaction. |
| **HT-STATE-014** | Low-end rendering simplification must be allowed to reduce effect complexity without deleting authoritative state. |

# 11. Recipe, Provider, Capability & Quantity Requirements — `HT-RECIPE`

| ID | Requirement |
|---|---|
| **HT-RECIPE-001** | Recipe records must be able to express stable recipe ID, exact/provider inputs, form requirements, state predicates, quality/provenance predicates, quantities, capabilities, environment, knowledge/permission, outputs, by-products/waste, provenance policy, quality policy, automation compatibility and migration status where applicable. |
| **HT-RECIPE-002** | Exact-material requirements must remain distinguishable from provider/capability requirements. |
| **HT-RECIPE-003** | Exact-component requirements must remain distinguishable from provider/capability requirements. |
| **HT-RECIPE-004** | Provider requirements must resolve only legal candidates that satisfy the authored capability/properties contract. |
| **HT-RECIPE-005** | A visually similar material may not be accepted as a provider solely because of art resemblance or display name. |
| **HT-RECIPE-006** | Realm-name allowlists are insufficient for imported specialist content; validation must consider actual material properties, support, environment, containment and capability contracts. |
| **HT-RECIPE-007** | Process capability definitions must be data-driven and able to express compatible process families, level/strength where meaningful, environmental range, safety limits, automation support and provider stations. |
| **HT-RECIPE-008** | Named station identity must remain separate from the capability it provides. |
| **HT-RECIPE-009** | Processing stations must expose capabilities, supported environment, I/O interfaces, power/heat/mana requirements, efficiency modifiers, safety features, automation support and state/condition where applicable. |
| **HT-RECIPE-010** | Automation must execute through the same semantic input/provider/conservation validator as manual processing rather than a looser alternate recipe path. |
| **HT-RECIPE-011** | Quantity/conservation logic must prevent negative, duplicating or silently disappearing material balances. |
| **HT-RECIPE-012** | Physical form conversion of the same material must preserve material identity and account for declared yield/waste/offcuts. |
| **HT-RECIPE-013** | Processes crossing an FCC-12 transformation threshold must output the new canonical material identity. |
| **HT-RECIPE-014** | Repair operations must support target/slot, damage state, exact/provider replacement, quantity, capability, recovered component/scrap and resulting state. |
| **HT-RECIPE-015** | Provider-based repair may substitute only where the original authored design permits substitution. |
| **HT-RECIPE-016** | Exact identity-bearing specialist components such as a Coherence Core cannot accept generic provider replacement unless explicitly authored. |
| **HT-RECIPE-017** | Project/construction transactions must support reservations, delivered stock, incorporation rules, salvage/recovery and completion state. |
| **HT-RECIPE-018** | Resource incorporation must occur once at authoritative commit and must not duplicate across retries, chunk streaming or recovery. |
| **HT-RECIPE-019** | Learned recipe/knowledge migration must preserve knowledge identity separately from physical ingredient inventory. |
| **HT-RECIPE-020** | Mandatory first-access recipes must be testable for reachability and may not depend solely on random foreign loot. |

# 12. Blueprint, Project, Repair & Material-Resolution Requirements — `HT-PROJ`

| ID | Requirement |
|---|---|
| **HT-PROJ-001** | Blueprint/project authoring must support semantic material roles rather than hardcoding every visual material instance. |
| **HT-PROJ-002** | Blueprint material resolution must follow a deterministic order declared by the owning design/technical authority. |
| **HT-PROJ-003** | Material/style overrides may not bypass structural support requirements. |
| **HT-PROJ-004** | Material/style overrides may not bypass fire/heat requirements. |
| **HT-PROJ-005** | Material/style overrides may not bypass pressure requirements. |
| **HT-PROJ-006** | Material/style overrides may not bypass water/environment requirements. |
| **HT-PROJ-007** | Material/style overrides may not bypass corruption/containment requirements. |
| **HT-PROJ-008** | Material/style overrides may not bypass portal-family exact requirements. |
| **HT-PROJ-009** | Material/style overrides may not bypass accessibility/safety communication requirements. |
| **HT-PROJ-010** | If no legal material resolves a required role, authoring/construction must block with an exact diagnostic rather than silently choosing an invalid substitute. |
| **HT-PROJ-011** | Built instances must retain actual selected materials/components independently from the blueprint stable ID. |
| **HT-PROJ-012** | Repair/restoration must operate on the built instance composition/state rather than resetting it to a generic blueprint appearance. |

# 13. Realm Access / Portal Handoff Requirements — `HT-PORTAL`

These requirements consume the FCC-13D/Step-1D six-family graph. They do not define the portal runtime implementation.

| ID | Requirement |
|---|---|
| **HT-PORTAL-001** | The Forge/toolchain must represent exactly six normal external portal families: Covenant Portal, Veilgate, Dreamgate, Ascension Gate, Deepgate and Ashgate. |
| **HT-PORTAL-002** | A shared Realm Access runtime may be used without merging the six semantic family identities. |
| **HT-PORTAL-003** | Each portal family must support its own canonical components, blueprint identity, recipe bindings and destination/attunement data. |
| **HT-PORTAL-004** | Portal-family authoring must distinguish construction components from operational energy/fuel concepts; no generic Portal Fuel material may be invented by implementation. |
| **HT-PORTAL-005** | Portal structures must support incomplete, inactive, active, damaged, ruined, calibrated and upgraded states as states of the same family. |
| **HT-PORTAL-006** | Portal upgrades must not automatically create a new normal portal family. |
| **HT-PORTAL-007** | Destination calibration/attunement must remain distinct from portal-family identity. |
| **HT-PORTAL-008** | Portal access control may be physical, legal, factional, contract-based or permission-based without converting those restrictions into material identities. |
| **HT-PORTAL-009** | Portal knowledge/blueprints must remain knowledge data rather than consumed physical ingredients. |
| **HT-PORTAL-010** | First-access dependency validation must preserve the certified acyclic graph. |
| **HT-PORTAL-011** | Covenant, Veilgate and Dreamgate must remain independently bootstrappable from authorised Overworld/guaranteed provenance routes. |
| **HT-PORTAL-012** | Ascension Gate first access must accept one qualifying earlier-realm stabilisation provenance, not require all early realms. |
| **HT-PORTAL-013** | Deepgate first access must require two distinct qualifying prior-realm provenances as locked, without circular self-dependency. |
| **HT-PORTAL-014** | Ashgate first access must require the exact Impossible Deep Deepfire Ember Containment Core provenance/component as locked. |
| **HT-PORTAL-015** | Mandatory portal dependencies must retain deterministic non-RNG-only acquisition paths. |
| **HT-PORTAL-016** | Valid sequence breaking must remain accepted when exact/provider/provenance requirements are legitimately satisfied. |
| **HT-PORTAL-017** | Destination validation failure must expose a safe fault/blocked state rather than silently route to an arbitrary destination. |
| **HT-PORTAL-018** | First-arrival and return/recovery systems must preserve the anti-stranding semantics certified in Step 1D. |
| **HT-PORTAL-019** | Portal runtime failures, restrictions, quarantine and Void corruption must remain distinguishable states/causes for diagnostics and presentation. |
| **HT-PORTAL-020** | Legacy Ancient Portal Frame, Broken Portal Block and Unstable Rift Block may migrate to canonical family archaeology/state/component, anomaly/interface content or compatibility content, but never to a seventh family. |
| **HT-PORTAL-021** | Portal-family IDs, recipes and migration aliases must remain family-specific and typed. |
| **HT-PORTAL-022** | Automated validation must prove the six-family boundary and reject any normal canonical seventh-family registration. |

# 14. Cross-Realm Environment & Suitability Requirements — `HT-ENV`

| ID | Requirement |
|---|---|
| **HT-ENV-001** | Cross-realm suitability must be validated from actual environmental/support requirements rather than realm-name allowlists alone. |
| **HT-ENV-002** | Organisms/materials may be imported without losing source provenance. |
| **HT-ENV-003** | Naturalisation must not erase biological/material origin. |
| **HT-ENV-004** | Foreign provenance must not automatically classify content as invasive, hostile or corrupted. |
| **HT-ENV-005** | Native rot, blight, nightmare, Predator Dark, Sacred Law, Deep impossible physics and Ashen crisis conditions must not be auto-classified as Void corruption. |
| **HT-ENV-006** | Void corruption must require the owning corruption semantics rather than aesthetic darkness, danger or foreignness. |
| **HT-ENV-007** | Environmental support/containment requirements must be queryable by authoring and runtime validators where specialist content depends on them. |
| **HT-ENV-008** | Cross-realm events/effects must have a legitimate transfer pathway rather than being inferred from thematic similarity. |
| **HT-ENV-009** | Receiving-world consequences must remain owned by the receiving world/system even when provenance is foreign. |
| **HT-ENV-010** | Cross-realm knowledge transfer must be representable without implying physical material transfer. |
| **HT-ENV-011** | Performance/distance simulation may abstract environmental checks but must produce the same authoritative suitability/result semantics. |
| **HT-ENV-012** | Diagnostics must be able to explain which requirement failed: exact identity, provider, capability, environment, support, containment, permission or provenance. |

# 15. Semantic Visual-Contract Requirements — `HT-VIS`

These are technical preservation requirements for FCC-14B meaning. They do not choose final colours, textures, shaders or models.

| ID | Requirement |
|---|---|
| **HT-VIS-001** | Forge previews and final runtime presentation must be capable of preserving all FCC-14B Class A identity-critical distinctions where recognition matters. |
| **HT-VIS-002** | Forge/runtime state presentation must be capable of preserving FCC-14B Class B state-critical distinctions where interaction/safety matters. |
| **HT-VIS-003** | Contextual/provenance overlays must not be baked in as new canonical base identities unless the owning canon explicitly requires it. |
| **HT-VIS-004** | Generated forms must inherit enough material-family presentation data to remain recognisable as the same material across eligible forms. |
| **HT-VIS-005** | Specialist authored forms may change silhouette/geometry without erasing exact material/object identity. |
| **HT-VIS-006** | Greatroot and Greatheart must not collapse where exact identity matters. |
| **HT-VIS-007** | Ordinary Silver and Soul Silver must not collapse where exact identity matters. |
| **HT-VIS-008** | Specialist glass families must not collapse into one generic magic glass where exact identity matters. |
| **HT-VIS-009** | Black Ember and Deepfire Ember must not collapse. |
| **HT-VIS-010** | Furnace Heart and Furnace Core must not collapse. |
| **HT-VIS-011** | Overworld Deepcap Mushroom and Impossible Deep Abysscap must remain distinct in authoring, inventory/Codex and production asset binding. |
| **HT-VIS-012** | Native realm states must remain separable from genuine Void corruption. |
| **HT-VIS-013** | Portal family/state presentation must preserve six-family identity and must not present damaged/ruined/upgraded state as a seventh family. |
| **HT-VIS-014** | Corruption/restoration presentation must preserve recoverable base identity where restoration/provenance matters. |
| **HT-VIS-015** | Historical POC RGB/hex values, texture indices and old Unreal asset paths must not be promoted to final art authority. |
| **HT-VIS-016** | Visual validation must treat final palette/texture/shader/model choices as downstream values constrained by semantic distinctions rather than FCC-14C-owned constants. |

# 16. Accessibility / Non-Colour Requirements — `HT-A11Y`

| ID | Requirement |
|---|---|
| **HT-A11Y-001** | Critical exact/provider/capability/safety/status distinctions must not rely on colour alone. |
| **HT-A11Y-002** | Authoring/runtime presentation must permit redundant use of text, shape, silhouette, iconography, labels, architecture, animation/state, pattern, diagnostics and sound where appropriate. |
| **HT-A11Y-003** | Portal safe/unsafe, active/inactive, bound/unbound, damaged/restoring and ordinary fault/quarantine/Void states must remain communicable without colour-only dependence. |
| **HT-A11Y-004** | Native/imported/naturalised/invasive/corrupted classification must be communicable explicitly rather than inferred only from colour or “foreign-looking” art. |
| **HT-A11Y-005** | Reduced-motion settings must not remove the only cue that a critical state exists. |
| **HT-A11Y-006** | Reduced-flash settings must not remove the only cue that a critical state exists. |
| **HT-A11Y-007** | High-contrast or alternate-palette modes must preserve identity/state truth. |
| **HT-A11Y-008** | Forge validation should be capable of flagging critical semantic states that have only one colour-dependent cue. |
| **HT-A11Y-009** | UI layout and icon style remain downstream, but the semantic fields required for accessible diagnostics must be available. |
| **HT-A11Y-010** | Accessibility presentation changes must not mutate canonical content/state data. |

# 17. Performance & Scalability Truth Requirements — `HT-PERF`

| ID | Requirement |
|---|---|
| **HT-PERF-001** | Performance/LOD/profile changes may alter presentation cost but not authoritative content existence. |
| **HT-PERF-002** | Performance/LOD/profile changes may not alter canonical identity. |
| **HT-PERF-003** | Performance/LOD/profile changes may not alter resource amount or transaction conservation. |
| **HT-PERF-004** | Performance/LOD/profile changes may not alter ownership/personhood. |
| **HT-PERF-005** | Performance/LOD/profile changes may not alter corruption state. |
| **HT-PERF-006** | Performance/LOD/profile changes may not alter portal requirements, destination binding or access result. |
| **HT-PERF-007** | Performance/LOD/profile changes may not alter cross-realm suitability or world outcome. |
| **HT-PERF-008** | Generated/cached lower-detail assets must remain bound to the same stable semantic IDs as higher-detail presentation. |
| **HT-PERF-009** | Near/far simulation implementations must preserve deterministic authoritative outcomes where the owning systems require them. |
| **HT-PERF-010** | Exact LOD thresholds, streaming budgets, shader budgets and hardware tiers remain engineering/performance governance rather than FCC-14C canon. |

# 18. Migration & Legacy Requirements — `HT-MIG`

| ID | Requirement |
|---|---|
| **HT-MIG-001** | Legacy resolution must conceptually follow current canonical lookup → deprecated redirect → migration alias → compatibility mapping → authorised contextual migration → compatibility/quarantine if unresolved. |
| **HT-MIG-002** | Approximate string similarity must never be used as a semantic migration rule. |
| **HT-MIG-003** | Contextual migration may inspect authorised evidence such as realm/location, block position, source container, old category, old recipe and provenance. |
| **HT-MIG-004** | Unsupported legacy content must be quarantined/compat-preserved when deletion would destroy player-owned value/world integrity and no safe canonical mapping exists. |
| **HT-MIG-005** | Compatibility objects must remain noncanonical and excluded from normal worldgen/crafting/progression. |
| **HT-MIG-006** | Test fixtures must remain segregated and normal canonical content must not depend on them. |
| **HT-MIG-007** | Removed stable IDs must never be reused for unrelated current content. |
| **HT-MIG-008** | Numeric-only legacy saves must be migrated version-aware; a current free numeric slot cannot inherit unrelated old meaning. |
| **HT-MIG-009** | Missing migration targets must never silently become unrelated content. |
| **HT-MIG-010** | Learned recipe IDs must migrate through recipe aliases only when a valid semantic replacement exists. |
| **HT-MIG-011** | Legacy duplicate Block/Item pairs must converge to the single canonical physical identity where FCC-13E defines that outcome. |
| **HT-MIG-012** | Generic legacy Stone/Plant Fibre/Deepstone references must use the FCC-13 authorised contextual migration rules rather than one universal guessed target. |
| **HT-MIG-013** | Legacy portal rows must remain constrained by the FCC-13E portal migration boundary and six-family rule. |
| **HT-MIG-014** | Historical asset path, texture index and RGB/hex metadata may be retained as provenance/migration evidence but not semantic identity. |
| **HT-MIG-015** | Every migration run must create or preserve a pre-migration backup before destructive commit. |
| **HT-MIG-016** | Every migration run must emit a machine-readable migration log. |
| **HT-MIG-017** | Every migration run must emit a player/developer-readable summary. |
| **HT-MIG-018** | Migration reporting must count direct redirects, contextual migrations, compatibility objects, test-only segregation/removals, rejected/removed objects and unresolved cases. |
| **HT-MIG-019** | A runtime unresolved context may result in a defined compatibility object without reopening FCC design canon. |
| **HT-MIG-020** | Migration must be transactional enough that a failed migration does not silently destroy the only valid prior save/state. |
| **HT-MIG-021** | The Abysscap amendment must preserve Overworld Deepcap Mushroom as a distinct identity and must never redirect/merge it with Impossible Deep Abysscap. |
| **HT-MIG-022** | The Impossible Deep display name is now **Abysscap**; **Deepcap** may remain only as a legacy/colloquial Impossible Deep alias where useful. |
| **HT-MIG-023** | The colloquial display alias “Deepcap” must not automatically become a durable migration redirect merely because it matches an old/current display string. |
| **HT-MIG-024** | If any persisted pre-amendment Impossible Deep stable ID explicitly encodes the old Deepcap identity/path, migration must use an explicit one-way redirect to the approved Abysscap canonical target; if no persisted semantic ID requires change, a display-name amendment alone must not manufacture unnecessary migration identity churn. |

# 19. Compatibility & Test Isolation — `HT-COMPAT`

| ID | Requirement |
|---|---|
| **HT-COMPAT-001** | Normal canonical registries/builds must be auditable for leakage from `leyforge_compat` and `leyforge_test`. |
| **HT-COMPAT-002** | Canonical mandatory recipes may not depend on compatibility-only content. |
| **HT-COMPAT-003** | Canonical mandatory recipes may not depend on test-only content. |
| **HT-COMPAT-004** | Canonical worldgen may not spawn compatibility/test fixtures unless an explicit development/compatibility mode requests them. |
| **HT-COMPAT-005** | Compatibility content must be visibly diagnosable as compatibility/legacy content to developers and migration tooling. |
| **HT-COMPAT-006** | Test fixtures must use stable test identities so automated tests remain reproducible without polluting canon. |
| **HT-COMPAT-007** | POC-only unsupported weapons, armour, food, stations, relics, monster drops and generic dimension materials remain excluded unless separately promoted by their owning authority. |
| **HT-COMPAT-008** | Legacy content may be preserved for save integrity without becoming eligible for progression or crafting. |
| **HT-COMPAT-009** | Build validation must fail or quarantine when compatibility/test content leaks into required current-canon dependency graphs. |
| **HT-COMPAT-010** | Packaging rules may include compatibility/test resources when needed for migration/tests, but normal gameplay discovery must remain semantically isolated. |

# 20. Authoring / Build / CI Validation Gates — `VAL-CI`

A downstream validator may split these across editor, bake, CI and release gates. FCC-14C locks the failure conditions, not the software topology.

| ID | Requirement |
|---|---|
| **VAL-CI-001** | Reject duplicate active canonical stable IDs or domain ownership collisions. |
| **VAL-CI-002** | Reject canonical IDs that violate namespace/domain ownership rules. |
| **VAL-CI-003** | Reject alias cycles, redirect loops and missing redirect targets. |
| **VAL-CI-004** | Reject reuse of a retired stable ID for unrelated meaning. |
| **VAL-CI-005** | Reject generated-form identity drift for unchanged `(material_id, form_id)` inputs. |
| **VAL-CI-006** | Reject impossible or disallowed material/form pairs. |
| **VAL-CI-007** | Reject specialist overrides whose base material/object binding becomes ambiguous. |
| **VAL-CI-008** | Reject duplicate canonical Block/Object/Item identities for one unchanged physical object. |
| **VAL-CI-009** | Reject invalid lifecycle collapse where living source, propagule, harvest and processed product require distinct identities. |
| **VAL-CI-010** | Reject invalid lifecycle explosion where projections/states are being authored as duplicate canonical identities. |
| **VAL-CI-011** | Reject recipe exact-input targets that do not resolve. |
| **VAL-CI-012** | Reject provider requirements with no legal candidate where at least one is required by locked progression. |
| **VAL-CI-013** | Reject recipe outputs in the wrong domain. |
| **VAL-CI-014** | Reject transformations that violate FCC-12 material transformation thresholds. |
| **VAL-CI-015** | Reject negative/duplicating conservation balance. |
| **VAL-CI-016** | Reject missing required process capabilities/environments/containment conditions. |
| **VAL-CI-017** | Reject canonical mandatory recipes that depend on compatibility/test-only content. |
| **VAL-CI-018** | Reject unsafe provider substitution that erases an exact identity requirement. |
| **VAL-CI-019** | Reject blueprint/material resolution that bypasses structural/heat/pressure/environment/containment/portal requirements. |
| **VAL-CI-020** | Reject a normal canonical seventh external portal family. |
| **VAL-CI-021** | Reject portal first-access dependency cycles. |
| **VAL-CI-022** | Reject a mandatory first-access dependency that is only available through random foreign loot. |
| **VAL-CI-023** | Reject portal destination binding that can silently fall back to an arbitrary unrelated realm/location under normal activation. |
| **VAL-CI-024** | Reject migration that maps an unknown/missing target to unrelated content. |
| **VAL-CI-025** | Reject contextual migration without an evidence-backed rule. |
| **VAL-CI-026** | Reject compatibility/test leakage into normal canonical worldgen/crafting/progression. |
| **VAL-CI-027** | Reject visual-contract bindings that merge FCC-14B identity-critical pairs where exact recognition is required. |
| **VAL-CI-028** | Reject presentation/state bindings that make a native realm condition indistinguishable in data from genuine Void corruption. |
| **VAL-CI-029** | Reject critical safety/status contracts whose only semantic cue is colour. |
| **VAL-CI-030** | Reject performance/LOD variants that change canonical identity/state/resource/portal/world outcome data. |
| **VAL-CI-031** | Reject Abysscap migration/binding that targets Overworld Deepcap Mushroom. |
| **VAL-CI-032** | Reject historical POC RGB/hex/texture-index/asset-path values being treated as canonical identity keys. |

# 21. Runtime Acceptance Invariants — `VAL-RUN`

| ID | Requirement |
|---|---|
| **VAL-RUN-001** | Runtime canonical resolution must be deterministic for a fixed approved content set. |
| **VAL-RUN-002** | Runtime caches/handles must be rebuildable without changing semantic IDs. |
| **VAL-RUN-003** | Runtime placement/inventory/drop/install transitions must preserve single physical identity where no lifecycle split occurs. |
| **VAL-RUN-004** | Runtime recipes and automation must use the same exact/provider/capability/environment semantics as authored data. |
| **VAL-RUN-005** | Runtime transactions must preserve quantity/conservation across retries, streaming, save/load and recovery. |
| **VAL-RUN-006** | Runtime material-slot composition must preserve the actual provider material chosen for built objects. |
| **VAL-RUN-007** | Runtime portal family/state must remain stable across save/load. |
| **VAL-RUN-008** | Runtime portal activation must surface blocked/unsafe validation rather than silently choosing another destination. |
| **VAL-RUN-009** | Runtime migration/compatibility objects must remain diagnosable and noncanonical. |
| **VAL-RUN-010** | Runtime chunk/inventory compression must remain reversible to canonical semantic IDs. |
| **VAL-RUN-011** | Runtime ecology/suitability implementation must not infer corruption/invasiveness solely from foreign realm provenance. |
| **VAL-RUN-012** | Runtime corruption systems must not overwrite the base identity needed for cleansing/restoration where canon preserves it. |
| **VAL-RUN-013** | Runtime accessibility/performance settings must not change authoritative semantic truth. |
| **VAL-RUN-014** | Runtime must support enough diagnostics to explain canonical resolver, recipe/provider, portal and migration failures. |
| **VAL-RUN-015** | Runtime multiplayer/network compact handles, if used, must resolve under an agreed stable-ID mapping context. |
| **VAL-RUN-016** | Runtime missing/unknown content must fail safely to migration/compatibility/reporting policy rather than guessing. |

# 22. Diagnostics & Reporting Minimums — `VAL-REP`

| ID | Requirement |
|---|---|
| **VAL-REP-001** | Validation diagnostics must identify the failing semantic ID/domain where available. |
| **VAL-REP-002** | Diagnostics must distinguish exact-target failure from provider-resolution failure. |
| **VAL-REP-003** | Diagnostics must distinguish material/form illegality from missing asset presentation. |
| **VAL-REP-004** | Diagnostics must distinguish capability failure from environmental/support/containment failure. |
| **VAL-REP-005** | Diagnostics must distinguish permission/law/access failure from physical construction failure. |
| **VAL-REP-006** | Diagnostics must distinguish ordinary portal fault, unsafe destination, quarantine/restriction and genuine Void corruption where those states exist. |
| **VAL-REP-007** | Diagnostics must distinguish canonical content from deprecated, compatibility and test content. |
| **VAL-REP-008** | Migration reports must preserve old ID, chosen outcome/target, rule type and enough context/provenance to explain the decision. |
| **VAL-REP-009** | Build/bake reports should record source/version/toolchain identity sufficient to reproduce derived products. |
| **VAL-REP-010** | Validation outputs should be machine-readable enough for CI and human-readable enough for authors to repair source data. |
| **VAL-REP-011** | Warnings may be used for open downstream art/engineering values, but semantic contract violations must not be downgraded merely because the runtime can technically load them. |
| **VAL-REP-012** | A zero-error build does not certify art quality; it certifies semantic contract preservation within the implemented validator scope. |

# 23. Minimum Forge Capability Surface

The Forge does not need one screen per requirement. It must, however, eventually expose enough authoring power that canonical content can be expressed without hand-editing around the tool.

At minimum the semantic authoring surface must be capable of representing:

- immutable stable authored IDs;
- domain and namespace ownership;
- display/local/cultural aliases separated from migration redirects;
- canonical material definitions;
- reusable form definitions/profiles;
- material form eligibility;
- deterministic generated standard forms;
- specialist authored overrides;
- multi-material archetypes and material slots;
- world/inventory/drop/install projections;
- lifecycle splits;
- state/condition profiles;
- provenance/history;
- quality/grade/purity/composition where applicable;
- exact/provider recipe inputs;
- form/state/provenance/quality predicates;
- process capability and environment requirements;
- by-products/waste and conservation data;
- projects/reservations/incorporation/salvage;
- repair contracts;
- sockets, ports, pivots, moving parts and interaction anchors;
- portal-family components, states, destinations and calibration data;
- support/environment/containment requirements;
- semantic art binding/preview data;
- accessibility-critical semantic cues/diagnostics;
- typed redirects/migration metadata;
- compatibility/test status;
- validation diagnostics before publication.

The Forge may internally present these concepts through templates, inheritance, inspectors, graphs, forms, wizards or generated defaults. FCC-14C does not dictate the UX.

---

# 24. Deterministic Generated-Form / Bake Contract

A generated-form or bake system is acceptable only when:

1. canonical source identity is explicit before generation;
2. generation is deterministic for equivalent semantic inputs;
3. output identity is independent of generation order;
4. regenerated caches do not create new canonical IDs;
5. authoring overrides are explicit and traceable;
6. illegal form eligibility fails validation rather than generating placeholder canon;
7. generated output cannot silently overwrite authored specialist identity;
8. generated presentation remains bound to FCC-14B distinction requirements;
9. the bake records enough source/version context to diagnose drift;
10. deleting/rebuilding derived data does not delete canonical semantic truth.

---

# 25. Migration Transaction Contract

Migration tooling must treat old player/world data as valuable state rather than a best-effort import.

The minimum conceptual transaction is:

1. identify source save/content version;
2. preserve a pre-migration backup;
3. resolve canonical IDs and explicit redirects;
4. apply evidence-backed contextual migration only where authorised;
5. segregate unsupported content into compatibility/quarantine rather than guessing;
6. preserve actual material composition/state/provenance where reconstructable;
7. emit machine-readable and human-readable reports;
8. commit only after validation of the migrated result;
9. preserve enough evidence to diagnose or repeat the migration;
10. never reuse historical IDs to make an error disappear.

The FCC-13E design-time migration matrix remains complete at **312/312 rows with zero unresolved design holds**. Runtime compatibility objects remain an accepted safety outcome when a specific historical save lacks enough context for a safe canonical mapping.

---

# 26. Abysscap Amendment — Technical / Migration Handoff

`FCC14-HOLD-BIO-001` is closed semantically by FCC-14A.

FCC-14C records only the downstream technical consequences:

- **Overworld Deepcap Mushroom** remains its own canonical Overworld-native biological crop identity.
- **Impossible Deep Abysscap** is a separate canonical Impossible-Deep-native crop identity.
- the two may never resolve to the same canonical stable ID;
- the two may never share a durable migration target;
- **Deepcap** may remain a legacy/colloquial Impossible Deep alias in display/Codex/history where useful;
- that colloquial alias is not automatically a durable redirect;
- if a pre-amendment persisted Impossible Deep stable ID must change because its semantic path itself encoded the old name, the old ID receives an explicit redirect to the approved Abysscap target;
- if only display text changed and durable semantic identity did not, implementation must not create unnecessary ID churn;
- no amendment is authorised to infer common ancestry, cultivar lineage, import history or shared species between the two crops.

FCC-14D will record the amendment in the formal final amendment/package register.

---

# 27. Six-Portal Technical Acceptance Bundle

Before a downstream implementation may claim compliance with the FCC portal contract, automated/manual evidence must be capable of proving all of the following:

- six and only six normal external portal families are active in canonical content;
- each family resolves to its own components/blueprint/recipes/state;
- the first-access graph is acyclic;
- Covenant, Veilgate and Dreamgate remain independently reachable through their authorised bootstrap/provenance routes;
- Ascension accepts the locked one-earlier-realm stabilisation dependency;
- Deepgate enforces the locked two-distinct-prior-provenance dependency;
- Ashgate enforces the exact Deepfire Ember Containment Core dependency;
- no mandatory route relies solely on random foreign loot;
- sequence breaking through legitimate acquisition is accepted;
- invalid/unsafe destinations block rather than silently reroute;
- repair/recovery preserves family identity;
- upgrade/calibration preserves family identity;
- legacy portal rows do not instantiate a seventh family;
- performance/accessibility modes do not change portal truth.

---

# 28. Visual / Semantic Validation Bundle

Technical validation does not certify whether final art is beautiful. It must certify that data and bindings do not make canon unreadable or contradictory.

At minimum the implemented system must be capable of testing or inspecting:

- material inheritance drift;
- state explosion into duplicate identities;
- generated-form presentation drift;
- exact identity pairs accidentally sharing one canonical binding where FCC-14B requires distinction;
- portal family collapse;
- portal state misregistered as family identity;
- native hazard/state collapsed into Void corruption;
- corruption erasing base identity needed by restoration;
- provenance/classification collapsed into one foreign/corrupted flag;
- critical status communicated by colour alone;
- low-end/accessibility variants dropping critical truth;
- historical placeholder assets/colours being promoted as semantic authority.

Where full automated visual inspection is impractical, the technical stack must expose deterministic manifests/previews/diagnostics that make manual certification possible.

---

# 29. Routed Technical Decisions

The following remain **required implementation work but not unresolved FCC content**:

| Routed Area | FCC-14C Constraint |
|---|---|
| Forge editor UX | Must expose the semantic capability surface; exact UX open. |
| Source schema | Must encode required semantics; exact syntax/open format open. |
| Generated registry | Must be deterministic and preserve stable semantic identity. |
| Godot/Zylann mapping | Must not make engine/resource paths canonical identity. |
| Save format | Must preserve durable semantic IDs and migration safety. |
| Network replication | Compact handles allowed only under agreed stable-ID mapping. |
| Portal transition code | Must preserve six-family, safety, destination and recovery semantics. |
| Ecology suitability implementation | Must evaluate actual requirements rather than realm-name shortcut. |
| Corruption runtime | Must preserve native-state/Void distinction and base identity where required. |
| Law/contract evaluator | Must preserve physical-vs-legal restriction distinction. |
| Asset/shader pipeline | Must satisfy FCC-14B semantic distinction requirements. |
| Performance/LOD system | May simplify presentation, never authoritative truth. |
| CI/build system | Must enforce semantic validation gates; product/vendor choice open. |

A routed item is **not a blocker for FCC-14D** unless a downstream implementation already exists and is proven to contradict the certified semantics.

---

# 30. Recommended Downstream Verification Layers

FCC-14C does not mandate one CI topology, but the requirements naturally divide into five useful evidence layers:

### Layer A — Source Authoring Validation

Catch malformed IDs, domain misuse, illegal form eligibility, unresolved references and authoring-contract violations before bake.

### Layer B — Deterministic Bake Validation

Catch generated-form drift, duplicate generated identities, invalid derived registries, missing specialist overrides and source/product mismatch.

### Layer C — Runtime Semantic Validation

Catch resolver divergence, transaction/conservation errors, projection duplication, portal safety/state errors and performance/accessibility truth changes.

### Layer D — Migration Validation

Use fixed historical fixtures to prove redirects, contextual migration, compatibility quarantine, backups, logs and non-reuse of retired IDs.

### Layer E — Package / Release Validation

Prove canonical/compat/test segregation, manifest/version identity, six-portal boundary, zero missing canonical dependencies and reproducible registry/content hashes where the engineering architecture provides them.

These layers may be merged or split technically.

---

# 31. FCC-14C Completeness Gate

- [x] FCC-14A zero-hold semantic state consumed;
- [x] FCC-14B semantic art-handoff consumed;
- [x] FCC-13A stable identity/namespace rules preserved;
- [x] FCC-13A generated-form architecture preserved;
- [x] FCC-13A projection/lifecycle rules preserved;
- [x] FCC-13B single-definition/projection boundary preserved;
- [x] FCC-13C exact/provider/capability/quantity model preserved;
- [x] FCC-13C project/repair/conservation model preserved;
- [x] FCC-13D six-portal dependency graph preserved;
- [x] FCC-13D repair/recovery/failsafe boundary preserved;
- [x] FCC-13E 312-row migration closure preserved;
- [x] save/migration backup and reporting requirements preserved;
- [x] `leyforge_compat` isolation preserved;
- [x] `leyforge_test` isolation preserved;
- [x] no-retired-ID-reuse rule preserved;
- [x] source/bake/runtime semantic boundary recorded;
- [x] Forge minimum capability surface recorded;
- [x] material/form/generated-form requirements recorded;
- [x] specialist authored override requirements recorded;
- [x] multi-material composition requirements recorded;
- [x] state/provenance/quality requirements recorded;
- [x] cross-realm suitability requirements recorded;
- [x] portal authoring/runtime requirements recorded;
- [x] semantic visual-contract validation recorded;
- [x] accessibility/non-colour requirements recorded;
- [x] performance truth-preservation requirements recorded;
- [x] migration transaction contract recorded;
- [x] Abysscap technical/migration handoff recorded;
- [x] authoring/build/CI failure gates recorded;
- [x] runtime acceptance invariants recorded;
- [x] diagnostics/reporting minimums recorded;
- [x] exact implementation architecture remains downstream;
- [x] new FCC semantic contradictions introduced = 0;
- [x] open FCC-14 semantic holds = 0;
- [x] FCC-14D drafting authorised.

---

# 32. FCC-14C Result

> **FCC-14C — FORGE, TECHNICAL, VALIDATION & MIGRATION HANDOFF REQUIREMENTS — COMPLETE v0.1**

The current Leyforge Final Content Canon is now technically handoff-ready at the semantic-contract level.

FCC-14C certifies that downstream implementation can proceed without inventing missing content meaning because the required boundaries are explicit for:

- stable identity;
- generated forms;
- physical projections/lifecycles;
- material/object state;
- recipes/providers/capabilities/quantities;
- projects/repair;
- cross-realm environment/suitability;
- Realm Access portals;
- semantic art validation;
- accessibility/performance truth preservation;
- legacy/save migration;
- compatibility/test isolation;
- build/runtime diagnostics.

The document intentionally leaves implementation technology open.

No semantic hold remains.

The next and final FCC-14 volume is:

> **FCC-14D — FINAL HOLD/AMENDMENT REGISTER, COMPLETENESS AUDIT, PACKAGE MANIFEST & CROSS-REALM CERTIFICATION LOCK**

FCC-14D may issue the formal project-wide certification statement only after verifying FCC-14A/B/C, the Abysscap amendment, source/package completeness and zero-open-hold state.

---

# 33. Principal Evidence Register

FCC-14C is grounded principally in:

- `FCC-14A_Final_Cross-Realm_Certification_and_Global_Invariant_Register_v0_1.md`;
- `FCC-14B_Semantic_Art-Handoff_and_Visual_Distinction_Manifest_v0_1.md`;
- `FCC-14_Step_1D_Portal_Reachability_Recovery_Failsafe_Legacy_and_Migration_Certification_v0_1.md`;
- `FCC-14_Step_1E_Semantic_Art-Handoff_Forge_Requirements_and_Final_Certification_Architecture_v0_1.md`;
- locked `FCC-12` Universal Materials package;
- `FCC-13A_Stable_Identity_Registry_Architecture_and_Namespace_Rules_v0_1.md`;
- `FCC-13B_Definitive_Block_Object_Item_Form_and_Inventory_Projection_Registry_v0_1.md`;
- `FCC-13C_Definitive_Recipe_Process_Provider_and_Quantity_Registry_v0_1.md`;
- `FCC-13D_Realm_Portal_Components_Recipes_and_Access_Binding_v0_1.md`;
- `FCC-13E_Legacy_Migration_Matrix_Completeness_Audit_and_FCC-14_Handoff_v0_1.md`;
- FCC-13 final 312-row legacy migration matrix;
- FCC-13 final document-to-interview fidelity audit;
- owner-approved FCC-14 Abysscap amendment.

Where this handoff is less detailed than an owning FCC-12/FCC-13/realm source, that owning source remains authoritative. FCC-14C does not silently replace detailed source canon with implementation preference.

---

**End of FCC-14C v0.1**
