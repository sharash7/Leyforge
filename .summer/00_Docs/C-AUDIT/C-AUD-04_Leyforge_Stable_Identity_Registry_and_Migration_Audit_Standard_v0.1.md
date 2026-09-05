# C-AUD-04 — Leyforge Stable Identity, Registry & Migration Audit Standard

**Document ID:** C-AUD-04  
**Title:** Leyforge Stable Identity, Registry & Migration Audit Standard  
**Version:** v0.1  
**Status:** BRANCH C LOCK CANDIDATE — READY FOR REVIEW / ACCEPTANCE  
**Branch:** Branch C — V1 Documentation Audit & Finalisation  
**Project:** Leyforge  
**Date:** 30 August 2026  

**Parent Authority:** C-AUD-00 through C-AUD-03  
**Primary Upstream Semantic Authority:** FCC-12; FCC-13A through FCC-13E  
**Engineering Interfaces:** ENG-GOV-08 Persistence / Save / Migration; ENG-GOV-09 Registry & Stable-ID Engineering; ENG-GOV-14 Exceptions / Waivers / Deprecation; B-OPS-01; B-OPS-05  
**Operational Interfaces:** Project Brain / LF-BRAIN; PRD; LFE; FORGE-ENG; CI/validators; save fixtures; content packages; migration records  
**Owns:** Branch C audit methodology for durable identity, registry coherence, aliases, projections, generated identities, references, migration and compatibility certification  
**Does Not Own:** the canonical identity of individual content, exact runtime schema, engine data structures, save database implementation, network encoding, Forge editor implementation, or new FCC-13 binding decisions

---

# 00. Purpose

C-AUD-04 defines how Branch C will determine whether Leyforge's durable identities, registries and migrations are coherent enough for Documentation V1 certification.

The governing question is:

> **Can every consequential persistent Leyforge concept be identified, referenced, loaded, migrated, generated and interpreted without relying on display names, accidental numeric ordering, duplicate Block/Item rows, stale prototype identities or unsafe guesses about legacy data?**

C-AUD-04 converts the locked semantic identity architecture into an auditable certification contract.

It does not redesign FCC-13.

It proves that the final V1 corpus, registries, migration rules and technical handoffs preserve FCC-12/FCC-13 identity semantics consistently.

---

# 01. Foundational Identity Doctrine

### CA04-001 — Semantic Identity Is the Audit Root
The audit begins from durable semantic identity, not from filenames, display text, asset paths, runtime numeric handles or legacy POC row numbers.

### CA04-002 — Meaning Precedes Encoding
The audit must establish what a thing *is* before judging whether its registry representation is correct.

### CA04-003 — Stable Identity Is Cross-System
A durable identity may be consumed by saves, world state, networking, Forge, recipes, blueprints, packages, tests, migration and runtime registries without becoming different semantic identities in each subsystem.

### CA04-004 — Presentation Is Not Identity
Display names, localisation strings, UI labels, cultural names and contextual names must not become accidental durable identifiers.

### CA04-005 — Runtime Optimisation Is Not Identity
Compact numeric handles, table indexes, cache IDs, packed voxel IDs and similar runtime values are implementation mechanisms rather than canonical identity.

### CA04-006 — Historical IDs Remain Historically Meaningful
A retired or redirected ID remains part of migration/provenance history even when it is no longer active canonical content.

### CA04-007 — Identity Audit Follows Authority
Where identity semantics are disputed, C-AUD-02 determines ownership and C-AUD-03 determines meaning before C-AUD-04 judges registry encoding.

### CA04-008 — Registry Correctness Cannot Repair Wrong Canon
A perfectly valid schema containing the wrong semantic identity still fails certification.

---

# 02. Audit Object Model

C-AUD-04 distinguishes the following audit objects.

### CA04-009 — Canonical Definition
The authoritative reusable definition of a durable concept.

### CA04-010 — Stable Semantic ID
The durable machine-readable identifier bound to a canonical definition.

### CA04-011 — Domain
The semantic identity category such as material, form, object, recipe, blueprint or knowledge.

### CA04-012 — Namespace
The ownership boundary that prevents independent content providers from colliding.

### CA04-013 — Projection
A representation of one canonical definition in a specific context such as world Block, Item, dropped object, installed component or UI representation.

### CA04-014 — Instance
A specific occurrence referencing a definition plus runtime/persistent state.

### CA04-015 — Generated Identity
A deterministic semantic identity derived from authorised source identities such as `(material_id, form_id)`.

### CA04-016 — Authored Identity
A directly authored durable identity for content whose semantics cannot be represented only as a regular generated combination.

### CA04-017 — Alias
A non-primary identifier associated with a target under a declared alias class.

### CA04-018 — Redirect
A durable migration mapping from an obsolete identifier to a current target.

### CA04-019 — Compatibility Object
A preserved noncanonical object used to retain old data that cannot safely map to current canon.

### CA04-020 — Registry Entry
A machine-readable row or object representing an authoritative definition, projection, generated cache, alias, migration mapping or compatibility record.

### CA04-021 — Registry View
A generated index/cache/dashboard derived from source definitions.

### CA04-022 — Migration Rule
A declared transformation from historical representation to current representation.

### CA04-023 — Migration Context
Authorised evidence used when an old identifier cannot be resolved safely without surrounding state.

---

# 03. Registry Authority Layers

### CA04-024 — Registry Layers Must Be Classifiable
Every consequential registry artifact must be identifiable as one of:

- semantic source-of-truth;
- authored definition set;
- generated definition set;
- runtime compiled/mirrored registry;
- alias/redirect registry;
- migration registry;
- compatibility registry;
- test registry;
- derived index/cache;
- historical registry evidence.

### CA04-025 — One Layer Must Own Each Semantic Fact
Duplicating the same semantic fact across multiple writable registries without a discoverable source owner is a defect.

### CA04-026 — Generated Registries Are Derived
Generated rows and caches must identify their generator/source inputs sufficiently for drift detection.

### CA04-027 — Runtime Mirrors Do Not Become Canon
A runtime registry can faithfully implement canon without becoming the semantic owner.

### CA04-028 — Historical POC Registries Are Evidence
Old prototype registries remain usable for migration evidence and compatibility reconstruction but cannot automatically promote rows into current V1 canon.

### CA04-029 — Machine Readability Does Not Grant Authority
JSON, CSV, database or schema format does not outrank current semantic authority.

### CA04-030 — Registry Audit Must Preserve Layer Boundaries
C-AUD-04 must not collapse semantic definitions, generated outputs, migration metadata and runtime handles into one undifferentiated registry concept.

---

# 04. Stable ID Syntax Audit

FCC-13A establishes the canonical shape:

> `<namespace>:<domain>/<path>`

C-AUD-04 audits whether the final V1 identity corpus obeys that architecture.

### CA04-031 — Canonical IDs Must Be Parseable
Every V1 canonical stable ID must resolve unambiguously into namespace, domain and path under the accepted syntax.

### CA04-032 — Canonical IDs Must Be Durable
An ID may not encode volatile implementation details that would force renaming when engine layout, table ordering or display text changes.

### CA04-033 — Canonical IDs Must Be Semantically Appropriate
The path must identify the intended concept rather than an unrelated implementation artefact.

### CA04-034 — Display Names Do Not Control Paths
Changing user-facing wording does not automatically require a stable-ID change.

### CA04-035 — Asset Paths Are Not Stable IDs
Godot resource paths, legacy Unreal `/Game/...` paths, filesystem locations and Forge workspace paths must not serve as canonical identity.

### CA04-036 — Numeric IDs Alone Are Insufficient
A persistent concept represented only by an implementation-specific numeric value fails stable identity certification unless it is historical data with an exact migration mapping.

### CA04-037 — Duplicate Canonical IDs Are Blocking
Two active canonical definitions may not claim the same stable semantic ID.

### CA04-038 — Canonical ID Shadowing Is Blocking
A third-party, compatibility or test source may not redefine the meaning of a core `leyforge:` ID.

### CA04-039 — Retired IDs Remain Reserved
A retired canonical ID may never be reassigned to unrelated content.

### CA04-040 — ID Meaning Is Immutable After Shipping
Once an ID has been used as shipped durable identity, its semantic meaning cannot be repurposed.

---

# 05. Namespace Audit

### CA04-041 — Core Namespace
`leyforge:` is reserved for canonical shipped Leyforge content.

### CA04-042 — Compatibility Namespace
`leyforge_compat:` contains migration/compatibility content that is not normal canonical gameplay content.

### CA04-043 — Test Namespace
`leyforge_test:` contains stable test fixtures and must remain isolated from normal production content.

### CA04-044 — Third-Party Namespaces Are Owner-Isolated
External content must use its own namespace rather than injecting into `leyforge:`.

### CA04-045 — Namespace Ownership Must Be Discoverable
Every active namespace must have a known owner/provider.

### CA04-046 — Namespace Collision Is Blocking
Two independent providers may not claim the same namespace without an explicit governed ownership model.

### CA04-047 — Compatibility Content Must Not Leak Into Normal Generation
`leyforge_compat:` identities must not silently enter normal crafting, world generation, trade or progression.

### CA04-048 — Test Content Must Not Leak Into Normal Gameplay
`leyforge_test:` identities must not become dependencies of production canonical content unless intentionally promoted through normal authority.

### CA04-049 — Mod Content May Reference Core
Third-party namespaces may depend on authorised core IDs without acquiring permission to redefine them.

### CA04-050 — Namespace Migration Is Consequential
Renaming or transferring a namespace requires migration and reference audits across all persistent consumers.

---

# 06. Domain Audit

Core domains currently include:

- `material/`
- `form/`
- `object/`
- `recipe/`
- `blueprint/`
- `knowledge/`

### CA04-051 — Domain Represents Semantic Ownership
A domain exists because the identity class is meaningfully distinct, not merely because a subsystem wants a new folder.

### CA04-052 — Domain Proliferation Requires Authority
New canonical domains require a real identity owner and cannot arise from convenience alone.

### CA04-053 — Material IDs Identify Matter
Material identity must not encode form, location, owner, damage, provenance, charge, purity, quality or current state unless current canon explicitly says those dimensions change underlying material identity.

### CA04-054 — Form IDs Identify Reusable Form
A form ID must not silently become a material or object identity.

### CA04-055 — Object IDs Identify Authored Object Archetypes
Object identity is appropriate for meaningful object-level behaviour or lifecycle beyond ordinary material+form representation.

### CA04-056 — Recipe IDs Identify Processes
A recipe identity is not the same as the output object/material identity.

### CA04-057 — Blueprint IDs Identify Structural/Project Definitions
A blueprint or structure definition does not become an Item merely because a UI can select it.

### CA04-058 — Knowledge IDs Remain Separate
Persistent knowledge/unlock identity must remain separable from recipes, Items and material definitions.

### CA04-059 — Wrong-Domain Identity Is an Audit Finding
Using a domain that misrepresents the underlying semantic owner is a registry defect even if the ID is syntactically valid.

---

# 07. Definition, Projection & Instance Audit

### CA04-060 — One Physical Thing May Have Multiple Projections
World, inventory, dropped, installed, container-slot and structure-cell representations do not automatically create new canonical identities.

### CA04-061 — Projection Is Not Definition
A Block row or Item row may be a representation of an existing definition rather than an independent canonical definition.

### CA04-062 — Single-Definition Rule Is Audited
If placement and pickup preserve the same physical thing, the audit expects one canonical identity with multiple projections unless an owning authority establishes a lifecycle split.

### CA04-063 — Block/Item Duplication Is Not Presumed Valid
Legacy pairs must be reconciled through current identity/projection semantics.

### CA04-064 — Lifecycle Splits May Justify Separate Identities
Living organism versus harvested product, raw feedstock versus transformed material, or other true physical/lifecycle changes may require distinct identities.

### CA04-065 — Instance State Is Not Canonical Identity
Damage, ownership, location, charge, quality, provenance and other per-instance dimensions normally remain state.

### CA04-066 — State Explosion Is a Defect
Creating a new canonical ID for every state combination fails unless current authority explicitly requires distinct persistent identities.

### CA04-067 — Projection Must Reference the Correct Definition
Every projection must resolve to the canonical physical/material/object identity it represents.

### CA04-068 — Multiblock Cells Are Not Independent Objects by Default
Cells belonging to one functional assembly should reference the root assembly where current architecture says so.

### CA04-069 — Installed Components Preserve Identity Where Removable
Installation alone does not create a new component identity.

### CA04-070 — Composite Objects Preserve Components
Container + contents, machine archetype + material slots and similar composites must preserve their component identities rather than flattening them into misleading new material IDs.

---

# 08. Generated Standard-Form Audit

FCC-13A/B locks deterministic standard-form identity from:

> `(material_id, form_id)`

### CA04-071 — Generated Identity Must Be Deterministic
The same valid material/form inputs must resolve to the same semantic generated identity under the same registry contract.

### CA04-072 — Generated Identity Must Be Collision-Free
Two different valid input pairs may not resolve to the same semantic identity.

### CA04-073 — Generation Must Preserve Source Identity
A generated form must retain the actual material identity rather than degrading into generic “stone”, “wood”, “metal” or equivalent where canon requires exact matter.

### CA04-074 — Form Eligibility Must Be Enforced
The existence of a global form ID does not imply that every material may instantiate it.

### CA04-075 — Invalid Combinations Must Fail Clearly
Unsupported combinations such as incompatible material/form pairs must reject rather than silently create nonsensical generated content.

### CA04-076 — Generated Rows Are Cacheable, Not Independently Authoritative
Build/runtime systems may materialise rows for performance, but those rows remain derived from the authoritative source pair and eligibility rules.

### CA04-077 — Generated IDs Must Survive Rebuild
Changes in row ordering or generation sequence must not alter durable semantic identity.

### CA04-078 — Specialist Override Must Be Explicit
If a material/form pair binds a bespoke authored object instead of the standard template, that override must be discoverable and deterministic.

### CA04-079 — Generated Output Drift Is Auditable
A generated row that no longer matches its source material/form/generator contract is a defect.

### CA04-080 — Generator Version Changes Require Migration Analysis
A semantic change to generation rules must identify whether existing persistent generated content needs migration or compatibility treatment.

---

# 09. Authored Object & Material-Slot Audit

### CA04-081 — Authored Objects Need Stable Archetype IDs
Machines, portal components, tools, furniture, containers and other authored objects require durable object identity where canon requires them.

### CA04-082 — Material Variants Do Not Automatically Multiply Archetypes
A material-neutral archetype plus persistent material-slot composition should remain one archetype where current canon says variation is compositional.

### CA04-083 — Material Slots Are Persistent Where Consequential
Selected component materials must remain recoverable where they affect visuals, simulation, repair, salvage, mass, conductivity, heat resistance, provenance or other meaningful behaviour.

### CA04-084 — Copy/Fork Creates New Authored Identity Where Required
Forge-authored content copied or forked as an independently publishable definition receives a new stable authored identity under the accepted Forge rules.

### CA04-085 — Display Rename Does Not Fork Identity
Changing presentation text alone does not create a new authored object.

### CA04-086 — Saved Blueprint/Design Identity Is Audited Separately
A deliberately saved/published design may deserve its own authored identity even when ordinary configured instances do not.

---

# 10. Alias Taxonomy Audit

Aliases must be typed.

### CA04-087 — Migration Alias
Maps an obsolete durable ID to current content.

### CA04-088 — Deprecated Canonical Rename
Preserves an old canonical ID after a deliberate rename.

### CA04-089 — Cultural / Local Alias
Represents presentation terminology and does not automatically participate in durable migration.

### CA04-090 — Compatibility Alias
Supports legacy/imported references where an exact redirect is authorised.

### CA04-091 — Alias Class Must Be Explicit
An alias cannot safely participate in migration if its role is unknown.

### CA04-092 — Display Synonyms Are Not Durable Redirects by Default
Human language resemblance does not authorise migration.

### CA04-093 — Many Old IDs May Redirect to One Target
Merging legacy Block/Item duplicates may legitimately result in multiple historical IDs resolving to one current physical identity.

### CA04-094 — One Old ID Must Not Resolve Ambiguously
A durable source ID may not silently resolve to multiple canonical targets without explicit contextual migration.

### CA04-095 — Alias Chains Must Terminate
Redirect resolution must reach an active target, compatibility result or explicit quarantine outcome.

### CA04-096 — Alias Cycles Are Blocking
No alias/redirect cycle may exist in a V1-certified migration graph.

### CA04-097 — Missing Alias Targets Are Blocking
A durable alias may not point to an absent or undefined target.

### CA04-098 — Alias Resolution Must Be Deterministic
The same source/context under the same migration version must resolve identically.

---

# 11. Rename & Deprecation Audit

### CA04-099 — Canonical Rename Requires Migration
Changing a stable ID's spelling while preserving concept meaning is an explicit migration event, not an in-place rewrite of history.

### CA04-100 — Old ID Remains Reserved
The previous ID remains historically allocated after rename.

### CA04-101 — Deprecated Does Not Mean Undefined
Deprecated identities must remain interpretable for as long as supported persistent data may reference them.

### CA04-102 — Removal Requires Lifecycle Evidence
An ID may leave active content only through the applicable deprecation/retirement/migration process.

### CA04-103 — New References to Retired IDs Are Defects
Current canonical content must not create fresh durable dependencies on identities forbidden for new use.

### CA04-104 — Compatibility Shims Are Visible
Temporary compatibility objects or redirects must not masquerade as preferred current content.

---

# 12. Migration Resolution Order Audit

The conceptual resolution order is:

1. current canonical ID;
2. deprecated canonical redirect;
3. migration alias;
4. compatibility mapping;
5. authorised contextual migration;
6. compatibility/quarantine if unresolved.

### CA04-105 — Resolution Order Must Be Explicit
Technical implementations may optimise lookup but must preserve the semantic precedence above or an equivalent accepted ordering.

### CA04-106 — Current Canon Wins
An already-valid current canonical ID must not be reinterpreted through legacy heuristics.

### CA04-107 — Exact Redirect Precedes Guesswork
Declared aliases and migration mappings take precedence over contextual inference.

### CA04-108 — Contextual Migration Is Exceptional
Context is used only when the historical source genuinely lacked enough identity information for direct mapping.

### CA04-109 — Quarantine Beats Unsafe Guessing
If no safe mapping exists, unresolved content is quarantined or preserved compatibly rather than mapped by approximate similarity.

### CA04-110 — String Similarity Is Not Migration Authority
Names that look alike do not justify merging identities.

### CA04-111 — Migration Must Preserve Player-Owned Value Where Possible
Where deletion would destroy valid historical state and no canonical mapping exists, compatibility preservation should be considered under the owning migration rules.

---

# 13. Contextual Migration Audit

Examples include generic legacy `Stone`, `Deepstone`, generic `Plant Fibre`, generic terrain and numeric-only POC data.

### CA04-112 — Context Inputs Must Be Declared
A contextual rule must state which fields may influence resolution.

Possible evidence includes:

- historical registry version;
- realm/location;
- block position;
- source container;
- old category;
- old recipe;
- provenance;
- structure/site context;
- surrounding saved state.

### CA04-113 — Context Must Be Evidence-Backed
A field may not be used merely because it is convenient if current authority does not justify that inference.

### CA04-114 — Contextual Rules Must Be Deterministic
Equivalent historical state must resolve equivalently.

### CA04-115 — Contextual Migration Cannot Decide Unresolved Canon
Migration cannot silently settle a current semantic question that the owning canon has not answered.

### CA04-116 — Contextual Migration Must Record Outcome Class
The result must be traceable as canonical redirect, generated-form rebind, compatibility preservation, retirement, quarantine or other declared disposition.

### CA04-117 — Ambiguous Context Remains Ambiguous
If two canonical targets remain equally plausible under authorised evidence, the migration cannot choose arbitrarily.

---

# 14. Legacy POC Migration Audit

### CA04-118 — Every In-Scope Legacy Row Requires Disposition
The historical 312-row POC registry is audited as migration evidence and every retained legacy row must have a declared disposition.

### CA04-119 — Disposition Does Not Mean Survival
A historical row may be rebound, merged, represented as state/form/source, redirected, preserved as compatibility/test content, retired or excluded from canonical content.

### CA04-120 — POC Existence Does Not Prove Canonical Survival
Working prototype content must not automatically become V1 content.

### CA04-121 — Legacy Block/Item Pairs Must Use Current Projection Rules
Historical duplication is reconciled under FCC-13B rather than preserved because the POC used separate arrays/classes.

### CA04-122 — Generic POC Terrain Requires Canonical Rebinding
Generic soil, stone, sand, gravel, clay, mud and similar rows must resolve through current composition/material architecture.

### CA04-123 — Old Asset Paths Are Migration Metadata Only
Legacy `/Game/Voxel/...` and other obsolete implementation paths do not define final V1 identities.

### CA04-124 — Legacy Numeric IDs Need Registry-Version Context
A numeric ID is only migratable when its historical mapping can be established safely.

### CA04-125 — Unknown Numeric Mapping Is Quarantined
A free current numeric slot must never inherit old meaning accidentally.

### CA04-126 — Historical Test Fixtures May Be Preserved
Useful POC identities may remain under `leyforge_test:` where they support migration/regression testing without entering normal canon.

### CA04-127 — Unsupported Old Save Objects May Use Compatibility Identity
`leyforge_compat:` may preserve old persistent instances when no safe canonical mapping exists.

---

# 15. Reference Closure Audit

### CA04-128 — Every Durable Reference Must Resolve
Recipes, blueprints, structures, saves, packages, knowledge records and other persistent references must resolve to a valid target, authorised alias or explicit compatibility outcome.

### CA04-129 — Missing References Are Blocking Where Consequential
A V1 registry cannot certify while required canonical references silently point nowhere.

### CA04-130 — Wrong-Domain References Are Defects
A reference must target an identity domain compatible with the field/relationship semantics.

### CA04-131 — Generated References Must Resolve Through Source Truth
References to generated forms must remain reproducible from current source identities and eligibility rules.

### CA04-132 — Test/Compat Leakage Is Detected
Canonical definitions must not depend accidentally on test-only or compatibility-only content.

### CA04-133 — Circular References Are Evaluated Semantically
Cycles are not automatically wrong, but dependency cycles that prevent deterministic construction/resolution or violate ownership are findings.

### CA04-134 — Reference Closure Includes Aliases
Alias targets and redirect chains are part of the same closure audit.

### CA04-135 — Reference Closure Includes Packages
External content dependencies must resolve through owned namespaces and declared package dependencies.

---

# 16. Recipe / Provider / Blueprint Identity Audit

### CA04-136 — Recipe Identity Is Stable
Persistent references to recipes must not depend on display text or table order.

### CA04-137 — Provider Tags Do Not Replace Selected Material Identity
Provider substitution may select compatible inputs while preserving the actual material consumed/installed where current semantics require it.

### CA04-138 — Output Identity Must Be Explicit
A recipe/process must resolve its output definition/form/state without flattening material semantics.

### CA04-139 — Blueprint References Are Stable
Persistent structures/projects must not depend on mutable editor list positions.

### CA04-140 — Portal Definitions Preserve Exact Families
Portal object/recipe/blueprint references must preserve the six current portal-family bindings certified by FCC rather than genericising them into an unsafe universal portal identity.

---

# 17. Save & Persistence Identity Audit

### CA04-141 — Saves Persist Semantic Identity
Persistent state should contain or be recoverable through stable semantic identity rather than depending solely on transient runtime handles.

### CA04-142 — Runtime Handle Disagreement Resolves to Semantic ID
Where both semantic and cached runtime identities exist, the stable semantic identity governs.

### CA04-143 — Save Schema Version Is Explicit
Persistent formats must identify the schema/version needed to choose safe migration behaviour.

### CA04-144 — Supported Historical Versions Have Declared Paths
Every supported historical save version must have a known migration route or explicit compatibility policy.

### CA04-145 — Migration Paths Are Version-Aware
A migration must not assume all historical data came from one registry/schema state.

### CA04-146 — Save → Migrate → Reload Is Auditable
Certification should eventually include fixtures proving persistent identity survives supported migrations.

### CA04-147 — Historical Fixtures Are Protected Evidence
Once created for supported migration versions, fixtures must remain stable enough to detect regression.

### CA04-148 — Unsupported Newer Schemas Fail Safely
An older build must not reinterpret newer unknown data as though it were understood.

### CA04-149 — Corrupt Identity Data Must Not Poison Valid State
Invalid references should be rejected/quarantined according to persistence authority rather than silently remapped.

### CA04-150 — Migration Must Preserve Canonical Meaning
A technically successful load that maps content to the wrong semantic target fails identity certification.

---

# 18. Runtime Numeric Handle Audit

### CA04-151 — Runtime Handles May Be Rebuilt
Compact IDs may change between builds/configurations without changing semantic identity.

### CA04-152 — Persistent Numeric Handles Require Semantic Recovery
If runtime handles are cached/persisted, enough metadata must exist to validate/remap them safely.

### CA04-153 — Numeric Ordering Is Nonsemantic
Reordering registry rows must not change what saved/networked content means.

### CA04-154 — Numeric Gaps Are Harmless
Unused runtime numbers do not need to be filled and may not justify reuse of retired semantic meaning.

### CA04-155 — Network Compression Must Preserve Identity
Any compact network representation must resolve to the same semantic definition under the authoritative session/server registry contract.

---

# 19. Forge & Player-Created Content Audit

### CA04-156 — Forge-Authored Definitions Receive Durable Identity
Published/saved definitions requiring persistent reference must have stable IDs under the accepted Forge identity model.

### CA04-157 — Author Identity and Content Identity Are Distinct
Ownership/creator metadata must not be encoded as the semantic content meaning unless explicitly part of the namespace/provider contract.

### CA04-158 — Copying/Forking Is Traceable
Independent forks receive new identity while retaining lineage/provenance where useful.

### CA04-159 — Package Identity Is Separate From Contained Identity
A content package has its own identity/version and contains namespaced definitions; package filename is not the identity of every contained object.

### CA04-160 — External Content Must Pass Core Reference Rules
Mod/Forge definitions must obey namespace, stable-reference, alias and dependency integrity rules applicable to runtime content.

### CA04-161 — Package Failure Must Not Partially Activate Identity State
Invalid content must not leave half-registered definitions that corrupt the registry.

---

# 20. Biological / Living Content Identity Audit

### CA04-162 — Biological Definition Is Not Automatically Harvested Product
Species/living organism, propagule, harvested product, processed food/material and preserved specimen may have different identity requirements.

### CA04-163 — Registry IDs Do Not Decide Biology
Two biological records with similar names are not merged merely because registry design would be simpler.

### CA04-164 — Migration Aliases Cannot Decide Species Equivalence
An alias may only encode a relationship established by the owning biological canon.

### CA04-165 — Native Realm Ownership Does Not Alone Prove Species Relation
Realm-local records may be separately native while their lineage/equivalence remains unknown.

### CA04-166 — Deepcap Hold Is a Model Case
Until the owning FCC decision resolves Overworld Deepcap Mushroom ↔ Impossible Deep Deepcap, registry/migration work must preserve the ambiguity rather than silently merging them.

---

# 21. Registry Finding Taxonomy

C-AUD-04 findings may use the following specific types.

### ID-01 — Duplicate Canonical ID
Two active definitions claim one semantic ID.

### ID-02 — Semantic ID Reuse
A retired/shipped ID is repurposed.

### ID-03 — Wrong Domain
An identity is placed in a semantically incorrect domain.

### ID-04 — Namespace Collision
Multiple providers claim the same namespace/ID improperly.

### ID-05 — Presentation-as-Identity
Display text or asset path is used as durable identity.

### ID-06 — Numeric-Only Persistence
Persistent meaning depends solely on transient numeric handles.

### ID-07 — Projection Duplication
Block/Object/Item representations incorrectly become multiple canonical definitions.

### ID-08 — State Explosion
Instance/state combinations are incorrectly encoded as canonical identities.

### ID-09 — Generated Collision
Different source pairs generate the same identity.

### ID-10 — Generated Drift
Cached/materialised output disagrees with source/generator truth.

### ID-11 — Invalid Form Generation
An ineligible material/form combination is accepted.

### ID-12 — Alias Cycle
Redirect graph loops.

### ID-13 — Missing Alias Target
Redirect points to no valid target.

### ID-14 — Ambiguous Redirect
One legacy ID resolves non-deterministically.

### ID-15 — Unsafe Contextual Migration
Migration guesses beyond authorised evidence.

### ID-16 — Legacy Leakage
Historical POC content re-enters current canon without authority.

### ID-17 — Test Leakage
`leyforge_test:` content enters production canon/gameplay unexpectedly.

### ID-18 — Compat Leakage
`leyforge_compat:` content enters normal progression/worldgen unexpectedly.

### ID-19 — Broken Reference
A durable reference cannot resolve.

### ID-20 — Wrong-Target Reference
A reference resolves syntactically but to the wrong semantic concept.

### ID-21 — Migration Gap
Supported historical identity lacks a safe declared path.

### ID-22 — Migration Meaning Loss
Migration loads successfully but changes semantic meaning.

### ID-23 — Missing Provenance
A consequential migrated/generated definition cannot be traced to its source/authority.

### ID-24 — Unowned Identity
A canonical ID exists without a discoverable semantic owner.

### ID-25 — Registry Layer Confusion
Source, generated, runtime, migration or compatibility layers are incorrectly treated as interchangeable authority.

---

# 22. Finding Severity Guidance

### CA04-167 — Stable-Identity Defects Are High Risk by Default
Defects that can reinterpret persistent worlds, saves, packages or network state should normally be treated as AUD-4 or higher.

### CA04-168 — Systemic Collision May Be AUD-5
A namespace/ID architecture flaw capable of invalidating broad content or persistent interpretation may block the global V1 lock.

### CA04-169 — Cosmetic Name Drift Is Lower Risk
Presentation-only inconsistencies may remain AUD-1/AUD-2 where semantic identity is unaffected.

### CA04-170 — Uncertainty May Escalate
If the audit cannot prove whether persistent data maps safely, uncertainty is not grounds to downgrade the issue.

---

# 23. Audit Records

A registry/identity audit row should be able to record:

```text
Audit Row ID:
Concept / Stable ID:
Namespace:
Domain:
Definition Owner:
Registry Source:
Registry Layer:
Projection(s):
Generated Inputs:
Alias Class:
Legacy Source ID(s):
Migration Rule:
Migration Context:
Compatibility Outcome:
Persistent Consumers:
Reference Targets:
Current Status:
Finding Type:
Severity:
Evidence:
Required Owner Action:
Re-Audit Result:
```

### CA04-171 — Audit Rows Reference Source Authority
The row is evidence/index, not a new semantic definition.

### CA04-172 — Stable IDs May Be Audited in Families
Generated form families may be tested by deterministic rules plus representative/exhaustive machine checks rather than manually writing one prose row per possible combination where safe.

### CA04-173 — High-Risk Exceptions Receive Explicit Rows
Contextual migrations, compatibility objects, retired identities and lifecycle splits receive direct auditable records.

---

# 24. Audit Execution Procedure

### Phase 1 — Registry Source Discovery
Identify every current/historical registry, schema, alias table, migration table, generator and persistent consumer.

### Phase 2 — Authority Classification
Use C-AUD-01/02 to classify which artifacts are semantic source, generated output, runtime mirror, evidence or history.

### Phase 3 — Stable-ID Enumeration
Enumerate all active canonical IDs and reserved retired IDs.

### Phase 4 — Namespace/Domain Validation
Check syntax, namespace ownership, domain validity and collisions.

### Phase 5 — Definition/Projection Reconciliation
Prove Block/Object/Item/world/inventory representations obey current single-definition/lifecycle rules.

### Phase 6 — Generated Identity Validation
Validate deterministic material/form generation, eligibility, collisions and specialist overrides.

### Phase 7 — Alias/Redirect Graph Validation
Check alias classes, targets, cycles, ambiguity and chain termination.

### Phase 8 — Legacy Migration Reconciliation
Audit historical IDs including the POC migration matrix and any later save/content migrations.

### Phase 9 — Reference Closure
Validate all durable references across recipes, blueprints, structures, saves, packages and registries.

### Phase 10 — Persistence Fixture Audit
Check declared migration paths and retained fixtures once implementation exists.

### Phase 11 — Compatibility/Test Isolation
Verify compat/test namespaces cannot leak into canonical production content.

### Phase 12 — Final Registry Certification
Confirm no blocking identity/migration/reference defect remains.

---

# 25. Automation / Validator Handoff

C-AUD-04 defines certification expectations.

Exact validator implementation belongs to Branch B/LFE/engineering.

Future automated checks should cover where practical:

### CA04-174 — Duplicate ID Detection
Fail on duplicate canonical IDs.

### CA04-175 — Retired ID Reuse Detection
Fail when a reserved retired ID receives unrelated new meaning.

### CA04-176 — Namespace Validation
Fail on invalid/unauthorised namespace shadowing.

### CA04-177 — Domain Reference Validation
Fail on mechanically identifiable wrong-domain references.

### CA04-178 — Projection Duplicate Detection
Detect duplicate canonical definitions incorrectly created for multiple projections.

### CA04-179 — Generated Collision Detection
Detect generated-form collisions.

### CA04-180 — Generated Determinism Verification
Verify deterministic identity from authorised source inputs.

### CA04-181 — Generated Drift Detection
Detect materialised/generated rows diverging from source truth.

### CA04-182 — Alias Cycle Detection
Fail on redirect cycles.

### CA04-183 — Missing Alias Target Detection
Fail on aliases targeting absent definitions.

### CA04-184 — Ambiguous Alias Detection
Fail where deterministic alias resolution cannot be established.

### CA04-185 — Retired Reference Detection
Detect new references to prohibited retired IDs.

### CA04-186 — Test / Compat Leakage Detection
Detect forbidden dependency edges from canonical content into test/compat-only definitions.

### CA04-187 — Whole-Registry Gate
Provide one aggregated registry validation entrypoint once the registry architecture is operational.

### CA04-188 — Automation Does Not Replace Semantic Review
Machine checks cannot prove whether two similarly named biological/material concepts *should* be one identity; that remains authority/semantic review.

---

# 26. Persistence / Migration Verification Handoff

Once persistent V1 implementation activates, C-AUD-04 expects evidence for:

### CA04-189 — Save Manifest / Version Recognition
Supported save formats identify their version and required migration context.

### CA04-190 — Historical Fixture Preservation
Representative supported historical states are retained as regression evidence.

### CA04-191 — Deterministic Migration
Repeated migration of the same fixture under the same migration version produces equivalent current state.

### CA04-192 — Save → Reload Equivalence
Current supported state preserves semantic identity across save/reload.

### CA04-193 — Migration → Save → Reload Equivalence
Migrated content remains correctly interpreted after being re-saved in the current format.

### CA04-194 — Corrupt/Unknown Identity Safety
Invalid identity references fail safely without silently substituting unrelated canonical content.

### CA04-195 — Unsupported-Newer Safety
Older software does not reinterpret newer unknown identities/schema data as valid older content.

---

# 27. Project Brain Interface

### CA04-196 — Brain Indexes Identity State
The Brain may expose stable IDs, aliases, migration state, registry owners, deprecations and validator health.

### CA04-197 — Brain Does Not Duplicate Full Registries as Authority
Navigation/index views link to authoritative definitions or generated machine sources.

### CA04-198 — Retired/Deprecated IDs Remain Discoverable
Historical identity must be searchable for debugging migration without cluttering normal current-content views.

### CA04-199 — Migration Findings Link to Sources
Identity audit findings should connect canon, registry row, migration rule, save fixture and resolution where available.

### CA04-200 — Brain Status Must Not Overrule Registry Authority
A stale dashboard cannot change what an authoritative stable ID means.

---

# 28. PRD / LFE / FORGE-ENG Interface

### CA04-201 — PRD Extracts Technical Requirements
PRD must capture implementation requirements arising from the identity/migration contract without redefining FCC semantics.

### CA04-202 — LFE Owns Runtime Identity Architecture
Exact data structures, caches, save mapping, runtime handles and migration execution belong downstream once evidence is mature.

### CA04-203 — FORGE-ENG Owns Authoring UX / Package Mechanics
Exact Forge namespace allocation, ID creation UI, package compilation and validation mechanics are technical implementation concerns.

### CA04-204 — Branch C Audits the Handoff
C-AUD later verifies that LFE/FORGE-ENG preserve the accepted semantic identity contract.

### CA04-205 — Implementation Convenience Cannot Flatten Canon
Technical architecture may optimise representation but may not merge material/form/state/provenance/object distinctions that canon requires.

---

# 29. Branch B Interface

### CA04-206 — ENG-GOV-09 Remains Engineering Law
C-AUD-04 does not replace the Registry & Stable-ID Engineering Standard.

### CA04-207 — ENG-GOV-08 Remains Persistence Law
Save/migration engineering rules remain Branch B authority.

### CA04-208 — ENG-GOV-14 Governs Deprecation Lifecycle
Branch C may detect a retirement/migration problem but does not invent the engineering deprecation process.

### CA04-209 — B-OPS Tracks Enforcement Maturity
Missing validators are represented as governance debt rather than as if automation already existed.

### CA04-210 — G1 Registry Activation Is a Key Milestone
Registry/core-identity validators become consequential when real V1 registry/bootstrap work activates.

### CA04-211 — G2 Persistence Activation Expands the Gate
Historical fixtures, migration and save/reload evidence become required when persistent V1 world state becomes real.

---

# 30. Delta Reconciliation

### CA04-212 — New Identity Authority Reopens Affected Rows
If FCC-13/FCC-14 or another owner changes an identity relationship, only affected registry/migration audit records need reopening.

### CA04-213 — New Alias Does Not Reopen Unrelated Canon
A bounded migration alias addition need not invalidate unrelated registry certification.

### CA04-214 — Generator Changes Reopen Generated Families
Changes to deterministic identity or form eligibility require affected generated-form families to be revalidated.

### CA04-215 — Namespace Changes Have Broad Blast Radius
Changing namespace ownership or syntax requires a full affected reference/migration review.

### CA04-216 — New Persistent Consumers Expand Reference Closure
When multiplayer, Forge packages or new save domains begin referencing identities, the audit scope expands to those consumers.

### CA04-217 — Final Freeze Requires No Unprocessed Identity Delta
Global V1 lock cannot occur while known identity/migration changes remain unincorporated.

---

# 31. V1 Document Gate — Identity / Registry / Migration

A V1 document that defines or consumes durable identity may certify only when applicable conditions are satisfied:

```text
[ ] concept owner known
[ ] stable ID / domain role clear
[ ] namespace owner clear
[ ] no duplicate canonical identity
[ ] no retired-ID reuse
[ ] presentation separated from identity
[ ] runtime handles separated from identity
[ ] Definition / Projection / Instance boundaries coherent
[ ] Block/Object/Item single-definition rule preserved
[ ] lifecycle splits explicitly justified
[ ] state/provenance/quality not collapsed into identity
[ ] generated identities deterministic
[ ] generated identities collision-free
[ ] form eligibility respected
[ ] specialist overrides explicit
[ ] aliases typed
[ ] alias graph terminates
[ ] no alias cycles
[ ] alias targets exist
[ ] contextual migration evidence-backed
[ ] unresolved legacy data quarantined rather than guessed
[ ] test/compat namespaces isolated
[ ] legacy POC rows have disposition where relevant
[ ] durable references close
[ ] migration paths declared for supported persistent versions
[ ] required technical handoffs exist
[ ] no blocking ID-xx finding remains
```

---

# 32. Whole-Corpus Stable Identity Gate

Before `LEYFORGE DOCUMENTATION V1.0 — GLOBAL CORPUS LOCKED`, Branch C must be able to certify:

```text
[ ] all canonical namespaces inventoried
[ ] all canonical identity domains inventoried
[ ] active stable IDs are unique
[ ] retired IDs remain reserved
[ ] no namespace shadowing exists
[ ] definition/projection/instance architecture is coherent
[ ] legacy Block/Item duplication has been reconciled
[ ] generated standard-form architecture is deterministic
[ ] generated-form collisions are absent
[ ] generated outputs are traceable to source truth
[ ] authored object archetypes preserve material composition where required
[ ] alias classes are explicit
[ ] alias/redirect graph is acyclic and deterministic
[ ] all migration targets exist
[ ] contextual migrations are evidence-backed
[ ] unresolved migration never relies on name similarity
[ ] supported legacy POC identities have declared dispositions
[ ] compatibility/test content is isolated
[ ] durable canonical references close
[ ] persistent identity requirements are handed to LFE/PRD
[ ] Forge/package identity requirements are handed to FORGE-ENG
[ ] required Branch B validators/debt are represented honestly
[ ] no unresolved AUD-5 identity defect remains
[ ] no unresolved in-scope AUD-4 identity/migration defect remains
```

---

# 33. Current Leyforge Validation Cases

The following already-accepted project cases validate this audit model.

## 33.1 Oak Log
Historical separate Block and Item rows should not survive as duplicate canonical physical identities when placement/pickup preserve the same thing.

**Audit principle:** projection reconciliation / many old IDs → one target.

## 33.2 Stone Brick / Cobblestone / Oak Beam
Historical world/inventory duplicates resolve through current material+form / physical-object rules.

**Audit principle:** single-definition and deterministic generated-form binding.

## 33.3 Cave Mushroom
Living world organism and harvested product remain distinct where lifecycle semantics genuinely differ.

**Audit principle:** lifecycle split is not projection duplication.

## 33.4 Deepstone
Historical generic POC identity cannot simply persist as current canon after upstream retirement/reclassification.

**Audit principle:** contextual migration / retirement / compatibility rather than name preservation.

## 33.5 Dream Glass → Lucid Glass
A canonical rename preserves the old identifier as migration metadata/redirect rather than reusing or deleting historical meaning.

**Audit principle:** immutable shipped meaning + explicit rename migration.

## 33.6 Generic Stone
Historical generic Stone must resolve to actual canonical composition where possible.

**Audit principle:** class/context cannot masquerade as one universal material identity.

## 33.7 Deepcap Mushroom ↔ Deepcap
Current biological relationship remains an FCC-owned hold.

**Audit principle:** registry identity and aliases cannot decide unresolved biology.

## 33.8 `leyforge_test`
Historical/test fixtures may remain useful without becoming canonical gameplay content.

**Audit principle:** namespace isolation.

## 33.9 `leyforge_compat`
Unsupported-but-preserved old instances may survive without re-entering normal worldgen/progression.

**Audit principle:** compatibility preservation separated from canon.

---

# 34. Acceptance Gate

C-AUD-04 may be theoretically locked when the project accepts that it has defined:

```text
[ ] foundational semantic identity doctrine
[ ] registry audit object model
[ ] registry authority layers
[ ] stable-ID syntax audit
[ ] namespace audit
[ ] domain audit
[ ] Definition / Projection / Instance audit
[ ] single-definition audit
[ ] generated-form identity audit
[ ] authored-object/material-slot audit
[ ] alias taxonomy
[ ] rename/deprecation handling
[ ] migration resolution order
[ ] contextual migration rules
[ ] legacy POC migration audit
[ ] reference-closure audit
[ ] recipe/provider/blueprint identity audit
[ ] save/persistence identity audit
[ ] runtime numeric-handle audit
[ ] Forge/player-created identity audit
[ ] biological identity safeguards
[ ] ID-01 through ID-25 finding taxonomy
[ ] severity guidance
[ ] audit-row structure
[ ] execution procedure
[ ] validator handoff
[ ] persistence-fixture handoff
[ ] Brain interface
[ ] PRD/LFE/FORGE-ENG interface
[ ] Branch B interface
[ ] delta reconciliation
[ ] individual-document identity gate
[ ] whole-corpus stable-identity gate
[ ] current Leyforge validation cases
```

---

# 35. Immediate Handoff

After C-AUD-04 is accepted, proceed to:

> **C-AUD-05 — Leyforge Cross-Family Interface & Traceability Audit Standard v0.1**

C-AUD-05 will connect the audited truths established so far:

```text
C-AUD-01
WHAT SOURCES EXIST?
        ↓
C-AUD-02
WHO OWNS EACH TRUTH?
        ↓
C-AUD-03
DO THE MEANINGS AGREE?
        ↓
C-AUD-04
ARE DURABLE IDENTITIES / REGISTRIES / MIGRATIONS COHERENT?
        ↓
C-AUD-05
DO REQUIREMENTS, HANDOFFS AND DEPENDENCIES
TRACE ACROSS THE ENTIRE DOCUMENT FAMILY?
```

---

# 36. Foundational Statement

> **A durable Leyforge identity must continue to mean the same thing when it is authored, generated, placed, picked up, saved, loaded, migrated, networked, packaged, tested and inspected years later.**

The V1 registry is not merely a list of names.

It is the durable identity contract that prevents the world, Forge, saves, mods and future versions of Leyforge from disagreeing about what persistent content actually is.

---

**End of C-AUD-04 v0.1**
