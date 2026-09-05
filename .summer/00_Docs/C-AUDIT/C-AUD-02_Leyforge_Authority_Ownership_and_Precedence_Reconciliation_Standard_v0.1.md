# C-AUD-02 — Leyforge Authority, Ownership & Precedence Reconciliation Standard

**Document ID:** C-AUD-02  
**Title:** Leyforge Authority, Ownership & Precedence Reconciliation Standard  
**Version:** v0.1  
**Status:** BRANCH C DRAFT — READY FOR REVIEW / LOCK DECISION  
**Branch:** Branch C — V1 Documentation Audit & Finalisation  
**Parent Authority:** C-AUD-00 — Leyforge V1 Audit Constitution, Scope & Certification Model  
**Consumes:** C-AUD-01 — Leyforge Master Corpus Inventory & Disposition Standard  
**Project:** Leyforge  
**Date:** 30 August 2026  
**Owns:** authority-owner discovery, authority-state classification, concept ownership reconciliation, precedence resolution, overlap/collision classification, supersession/amendment treatment, source-gap routing, authority finding closure, and V1 authority-completeness certification  
**Does not own:** underlying content decisions, engineering law, Brain architecture, production sequencing, implementation architecture, registry identity semantics beyond authority reconciliation, or domain decisions assigned to another owner  
**Primary interfaces:** FCC-14; FCC-12/13; LF-BRAIN; ENG-GOV; B-OPS; PRD; LFE; FORGE-ENG; registries; ADRs; Branch D; C-AUD-03 through C-AUD-11

---

# 00. Purpose

C-AUD-02 defines how Leyforge determines **which source is allowed to say what**.

C-AUD-01 answers:

> What source material exists, and how do its copies, editions, bundles and derivatives relate?

C-AUD-02 answers:

> For each consequential concept, who owns the authoritative definition, which sources may specialise or consume it, which sources are merely evidence or history, and what happens when two apparently authoritative statements overlap or disagree?

The governing principle is:

> **ONE CONSEQUENTIAL CONCEPT MAY HAVE MANY REFERENCES, MANY CONSUMERS AND MANY SPECIALISTS, BUT ITS PRIMARY SEMANTIC OWNERSHIP MUST BE DISCOVERABLE AND NON-CONTRADICTORY.**

C-AUD-02 does not flatten Leyforge into one giant document. It creates a disciplined authority graph in which ownership, specialisation, handoff and precedence are explicit enough that developers and agents do not infer authority from filenames, timestamps, implementation state or memory.

---

# 01. Foundational Authority Model

### CA02-001 — Consequential Concepts Require Discoverable Ownership
Every consequential active concept inside the V1 corpus must have a discoverable primary owner or an explicit unresolved-owner finding.

### CA02-002 — Ownership Is Semantic, Not Merely File-Level
A document may own one concept while another document owns a neighbouring concept within the same broader system.

### CA02-003 — Document Ownership Does Not Imply Universal Ownership
Owning a document family does not grant that family authority over every concept it mentions.

### CA02-004 — Reference Does Not Equal Ownership
A source may reference, summarise, consume, constrain or hand off a concept without becoming its semantic owner.

### CA02-005 — Implementation Does Not Create Product Ownership
Code, tests, runtime registries and POC behaviour are evidence/implementation surfaces unless current authority explicitly assigns them semantic ownership.

### CA02-006 — Machine Representation Does Not Create Semantic Ownership
A schema, JSON file or registry may own exact machine binding within its declared domain while remaining subordinate to higher semantic canon for what the represented concept means.

### CA02-007 — Navigation Does Not Create Ownership
Indexes, Project Brain pages, authority maps and dashboards may record ownership but do not become the owner merely by pointing to it.

### CA02-008 — Certification Does Not Automatically Replace Detailed Ownership
A certification/index document may certify a family while detailed owning documents retain their deeper behaviour unless the certification document explicitly reconciles or supersedes them.

### CA02-009 — One Primary Owner Does Not Mean One Source File
A primary semantic owner may be a governed document family or bounded set of documents where the domain intentionally splits detail by sub-scope.

### CA02-010 — Ownership Must Be Narrow Enough to Prevent Collision
If an ownership statement is too broad to distinguish neighbouring concepts, it must be decomposed before V1 certification.

---

# 02. Authority Role Vocabulary

Every consequential relationship should be classifiable with one or more authority roles.

### CA02-011 — `PRIMARY_OWNER`
The source or governed family that defines the canonical meaning of a concept within the declared scope.

### CA02-012 — `SPECIALIST_OWNER`
A source that owns a narrower sub-domain under a broader authority, provided it does not contradict higher authority.

### CA02-013 — `BINDING_OWNER`
A source that owns exact stable IDs, schema bindings, aliases, recipe rows, migration relationships or other machine-binding semantics delegated to it.

### CA02-014 — `CERTIFICATION_OWNER`
A source that owns the process/result of certifying a governed family or cross-family scope without necessarily replacing all detailed semantic owners.

### CA02-015 — `IMPLEMENTATION_OWNER`
A technical authority that owns how an accepted requirement is implemented within its delegated architecture scope.

### CA02-016 — `OPERATIONAL_OWNER`
A source that owns how an already-binding rule is operationalised, enforced or evidenced without rewriting the rule itself.

### CA02-017 — `CONSUMER`
A source or system that depends on an authority and may constrain its use without owning the upstream meaning.

### CA02-018 — `REFERENCE`
A source that cites or summarises authoritative material for convenience.

### CA02-019 — `EVIDENCE`
A source that demonstrates, tests, researches or records behaviour but does not itself define the governing semantic rule.

### CA02-020 — `HISTORICAL_AUTHORITY`
A source that was once authoritative but is no longer current, retained for provenance, migration or archaeology.

### CA02-021 — `PROVISIONAL_OWNER`
A temporary ownership assignment used only when a semantic domain must be tracked before final authority is established.

### CA02-022 — `UNRESOLVED_OWNER`
No safe current semantic owner can yet be established from available authority.

### CA02-023 — Roles May Coexist Where Semantics Differ
One source may be, for example, a certification owner for a family and a primary owner for a narrow certification rule, while another source remains the semantic owner for detailed content.

---

# 03. Concept Ownership Records

### CA02-024 — Authority Reconciliation Operates on Concepts
Branch C should create or derive concept-level authority records rather than relying only on document-level labels.

### CA02-025 — Consequential Concepts Receive Stable Audit Identity
Where practical, authority records should receive stable audit IDs so collisions and resolutions can be tracked across rewrites.

Recommended form:

```text
AUTH-####
```

### CA02-026 — Minimum Concept Authority Record
A concept authority record should support at least:

```text
authority_record_id
concept_id_or_label
domain
primary_owner
specialist_owners
binding_owner
certification_owner
implementation_owner
operational_owner
consumers
upstream_authorities
downstream_handoffs
source_documents
precedence_notes
supersession_state
open_findings
v1_authority_state
```

### CA02-027 — Unknown Fields Stay Explicitly Unknown
Authority records must not fill missing owners, precedence or relationships by inference merely to complete a table.

### CA02-028 — Stable Existing IDs Are Reused Where Appropriate
If the concept already has a governed stable ID, the authority record links it rather than inventing a competing semantic ID.

### CA02-029 — Audit IDs Do Not Become Canon IDs
`AUTH-####` identifies the audit record, not the game/content concept itself.

---

# 04. Authority Hierarchy Principles

### CA02-030 — Domain Authority Chains Govern First
Precedence must first follow the accepted authority chain inside the domain being audited.

### CA02-031 — Project-Wide Product Canon Constrains Engineering
Engineering authority may choose implementation within accepted product requirements but may not redefine what Leyforge is required to be.

### CA02-032 — Engineering Constitution Constrains Specialist Engineering Standards
Within Branch B, ENG-GOV-00 is constitutional and specialist ENG-GOV documents refine rather than contradict it.

### CA02-033 — Specialist Scope Can Override General Wording Only by Valid Specialisation
A narrower applicable rule may specialise a broader rule where both can remain true.

### CA02-034 — Specialist Scope Cannot Violate Higher Authority
Specificity does not justify contradiction with higher canonical or constitutional authority.

### CA02-035 — Certification Authority Tests, It Does Not Freely Redesign
FCC-14 and C-AUD certification layers reconcile/certify locked sources and reopen design only for genuine unresolved contradictions or source gaps that require owner decisions.

### CA02-036 — Operationalisation Is Subordinate to Rule Text
B-OPS may map rules to enforcement/evidence but cannot weaken or rewrite ENG-GOV semantics.

### CA02-037 — Brain Authority Is Navigational/Operational Where Declared
LF-BRAIN may own Brain schemas, records and navigation behaviour but does not silently absorb content or engineering semantic authority.

### CA02-038 — Roadmap Authority Governs Sequence, Not Semantic Truth
Branch D may decide when work happens and which gate blocks progression, but cannot declare a failed semantic audit passed.

### CA02-039 — ADRs Select Architecture Within Constraints
An ADR may choose among valid technical options inside canon and ENG-GOV constraints but cannot override product canon or constitutional engineering law without an explicitly governed upstream change.

### CA02-040 — Code Follows Authority Rather Than Becoming Its Own Precedence Layer
When implementation diverges from current authority, the difference is implementation debt, evidence or a change proposal—not automatic new canon.

---

# 05. Precedence Decision Order

When apparently conflicting sources exist, Branch C uses the following ordered reasoning process.

### CA02-041 — Step 1: Confirm the Sources Are Actually Active
Historical, superseded, generated, evidence-only or archived sources must not be treated as equal active authorities.

### CA02-042 — Step 2: Confirm They Address the Same Concept
Similar terminology may represent different concepts, states, provenance, forms, projections or lifecycle phases.

### CA02-043 — Step 3: Compare Declared Scope
A local rule and a global rule may coexist if their scopes differ legitimately.

### CA02-044 — Step 4: Identify the Primary Owner
Use explicit ownership, family constitutions, indexes, handoffs and accepted project decisions.

### CA02-045 — Step 5: Identify Valid Specialisation
Determine whether one source legitimately narrows or implements the other's meaning.

### CA02-046 — Step 6: Check Explicit Supersession or Amendment
Later accepted reconciliation, amendment or certification may intentionally replace older wording.

### CA02-047 — Step 7: Test Whether Both Statements Can Remain True
If they can coexist under distinct scope, no contradiction exists.

### CA02-048 — Step 8: Search Evidence for an Existing Resolution
Before creating a new decision, search locked sources, amendment registers, certification outputs, ADRs, migration records and relevant project history.

### CA02-049 — Step 9: Classify the Remaining Conflict
If active statements still cannot both be true, record a genuine authority conflict.

### CA02-050 — Step 10: Route to the Owning Authority
Branch C does not choose a new semantic answer outside its domain.

### CA02-051 — Step 11: Propagate the Resolution
Once resolved, all affected consumers, registries, handoffs and summaries must be checked.

### CA02-052 — Step 12: Re-Audit Before Closure
The authority finding closes only after propagation is verified.

---

# 06. What Does NOT Establish Precedence

### CA02-053 — Newer Timestamp Does Not Establish Precedence
File-system modification time, upload date and package creation date are non-authoritative metadata.

### CA02-054 — Higher Version Number Alone Does Not Establish Precedence
A `v1.0` file does not defeat a `v0.3` file unless governance establishes the relationship.

### CA02-055 — `FINAL`, `LOCKED` or `LATEST` in Filename Does Not Establish Precedence
These labels are evidence to inspect, not self-authenticating authority.

### CA02-056 — More Detailed Text Does Not Automatically Establish Precedence
Detail can be stale, historical or outside the source's ownership.

### CA02-057 — Shorter Certification Summary Does Not Automatically Erase Detail
Concise certification/index wording does not silently supersede detailed owning text.

### CA02-058 — More Recent Chat Does Not Automatically Establish Precedence
Chat decisions matter only when accepted/project-governed and must be connected to the authoritative record or amendment path.

### CA02-059 — Working Implementation Does Not Establish Precedence
POC success or runtime behaviour cannot overrule newer accepted design canon.

### CA02-060 — Machine-Readable Data Does Not Establish Precedence
Registry/schema readability is not proof of semantic authority.

### CA02-061 — Popularity or Repetition Does Not Establish Precedence
A stale statement repeated across many documents does not outrank a single explicit owning reconciliation.

### CA02-062 — File Location Alone Does Not Establish Precedence
Being in an apparently important folder does not make a source authoritative unless repository/governance structure says so.

---

# 07. Legitimate Overlap vs Authority Collision

### CA02-063 — `REINFORCEMENT`
Multiple sources state compatible versions of the same rule while identifying the same conceptual owner.

### CA02-064 — `SPECIALISATION`
A narrower owner adds legitimate detail within a broader rule.

### CA02-065 — `BINDING_HANDOFF`
Semantic authority delegates exact IDs/schema/recipes/migration bindings to another source.

### CA02-066 — `IMPLEMENTATION_HANDOFF`
Product/semantic authority delegates technical realisation without delegating product meaning.

### CA02-067 — `CERTIFICATION_SUMMARY`
A certification source reports that detailed owning sources passed review without duplicating their whole content.

### CA02-068 — `MIRROR`
A generated/runtime/index representation mirrors another authority and must remain traceable to it.

### CA02-069 — `LEGACY_COMPATIBILITY`
An old term or object remains solely for migration/compatibility and must not compete with current canon.

### CA02-070 — `DUPLICATED_AUTHORITY`
Two active sources both appear to define the same primary semantic concept without a valid owner/specialist relationship.

### CA02-071 — `BOUNDARY_COLLISION`
Two legitimate domains both claim part of a concept, but the ownership boundary between them is unclear or contradictory.

### CA02-072 — `LEAKAGE`
A local or specialist source silently starts owning a global/universal concept outside its mandate.

### CA02-073 — `ORPHAN_CONCEPT`
A consequential concept is consumed by the project but no current owner can be established.

### CA02-074 — `STALE_OWNER`
A document still presents itself as owner after accepted authority moved elsewhere.

---

# 08. Scope Partitioning

### CA02-075 — Ownership May Be Partitioned by Semantic Dimension
Complex systems may split ownership by identity, behaviour, presentation, runtime implementation, persistence, tooling and verification.

### CA02-076 — Partitioning Must Be Discoverable
A reader must be able to determine where one owner's scope stops and another begins.

### CA02-077 — Partitioning Cannot Produce Circular Authority
Source A cannot depend on B for the same semantic decision that B simultaneously delegates back to A.

### CA02-078 — Handoffs Must Preserve Upstream Constraints
A downstream owner may fill delegated detail but cannot erase upstream invariants.

### CA02-079 — Universal Systems Remain Universal Unless Explicitly Delegated
Realm, biome, structure or feature documents may consume global systems without silently capturing their ownership.

### CA02-080 — Local Consequence Does Not Transfer Source Ownership
A receiving realm/system may own its local aftermath while the initiating event/material/person retains provenance and source ownership.

### CA02-081 — Shared Runtime Does Not Collapse Semantic Identity
Multiple concepts may use one runtime framework while remaining distinct canonical concepts.

### CA02-082 — Shared Concept Does Not Force Shared Runtime Implementation
A universal semantic concept may still permit different technical implementations where architecture allows it.

---

# 09. Supersession, Amendment & Reconciliation

### CA02-083 — Supersession Must Be Explicit or Demonstrable
Branch C records the source and basis by which one authority replaced another.

### CA02-084 — Partial Supersession Is Allowed
A newer source may replace only part of an older source; unaffected sections remain governed by their existing owner.

### CA02-085 — Supersession Does Not Delete Provenance
The old authority remains traceable for history, migration and audit.

### CA02-086 — Amendment Records Are Not Permanent Patchwork
Accepted amendments must eventually be integrated into clean V1 text where practical.

### CA02-087 — Reconciliation May Clarify Authority Without Changing Semantics
Branch C may document an already-existing ownership relationship without creating new content meaning.

### CA02-088 — Semantic Reconciliation Requires Owner Authority
If reconciliation changes what a concept actually means, the owning authority must make or ratify that change.

### CA02-089 — Global Reconciliation Can Supersede Local Deferral
When a later global owner explicitly resolves a question previously deferred by local documents, the older deferral no longer represents an open issue.

### CA02-090 — Local Detail Survives Unless Explicitly Replaced
Global reconciliation of one semantic relationship does not erase unrelated local details.

---

# 10. Source Gaps & Owner Decisions

### CA02-091 — Exhaust Sources Before Creating New Canon
A missing relationship triggers targeted source recovery before an owner interview or new decision.

### CA02-092 — Search Must Include Higher and Lower Authority Evidence Appropriately
Current canon is searched first; lower-authority history/evidence may be used to recover provenance but cannot silently overrule current authority.

### CA02-093 — Evidence Exhaustion Is a Valid Result
If relevant sources have been searched and do not establish the answer, record `SOURCE EVIDENCE EXHAUSTED`.

### CA02-094 — Evidence Exhaustion Does Not Authorise Guessing
Similarity, naming, thematic resemblance or implementation convenience are not substitutes for owner authority.

### CA02-095 — Narrow Owner Decision Is Preferred to Broad Reopening
When one semantic relationship remains unresolved, route the smallest question necessary.

### CA02-096 — Owner Decision Must Name the Owning Domain
A routed question identifies who is authorised to decide it and why.

### CA02-097 — Decision Output Must Be Integrated
Once accepted, the decision must enter the appropriate authoritative source/amendment path and affected audit records.

### CA02-098 — Source Gap and Contradiction Are Different
A contradiction means active authorities cannot all remain true. A source gap means no active source safely answers the question.

---

# 11. Authority Finding Severity & Types

Authority findings use C-AUD-00 severity plus a specific type.

Recommended finding IDs:

```text
AUTH-FIND-####
```

Types include:

- `OWNER_MISSING`
- `OWNER_AMBIGUOUS`
- `DUPLICATED_AUTHORITY`
- `BOUNDARY_COLLISION`
- `PRECEDENCE_UNRESOLVED`
- `STALE_OWNER`
- `AUTHORITY_LEAKAGE`
- `INVALID_SPECIALISATION`
- `UNTRACKED_SUPERSESSION`
- `SOURCE_GAP`
- `CIRCULAR_AUTHORITY`
- `MIRROR_MASQUERADING_AS_SOURCE`
- `IMPLEMENTATION_MASQUERADING_AS_CANON`
- `EVIDENCE_MASQUERADING_AS_AUTHORITY`

### CA02-099 — Finding Severity Reflects Consequence
A missing owner for cosmetic flavour may be AUD-2; ambiguous ownership for stable IDs, saves, realms or architecture may be AUD-4 or AUD-5.

### CA02-100 — Duplicated Authority Is Not Automatically a Conflict
If the statements are compatible and the conceptual owner is clear, classify as reinforcement/mirror rather than fabricating a problem.

### CA02-101 — Conflicts Are Recorded at the Narrowest Meaningful Scope
Do not mark an entire document contradictory when only one bounded concept conflicts.

---

# 12. Authority Reconciliation Matrix

C-AUD-02 execution should produce a machine-friendly reconciliation matrix.

Minimum row fields:

```text
authority_record_id
concept
domain
candidate_sources
active_sources
primary_owner
relationship_class
precedence_basis
specialist_or_binding_owner
conflict_state
source_gap_state
supersession_state
downstream_consumers
finding_ids
resolution_owner
resolution_state
v1_authority_result
notes
```

### CA02-102 — Rows May Group Closely Related Concepts Where Safe
The matrix need not become sentence-level bureaucracy if one ownership rule legitimately covers a coherent concept family.

### CA02-103 — High-Risk Domains Receive Finer Granularity
Stable identity, persistence, migration, realm boundaries, security, multiplayer authority, economics ownership, architecture boundaries and similar domains should be audited more finely.

### CA02-104 — Reverse Queries Are Required
The system should answer both:

```text
concept → who owns it?
source → what does it own?
```

and ideally:

```text
consumer → what authorities constrain it?
owner → what consumers depend on it?
```

---

# 13. Family-Specific Authority Patterns

## 13.1 FCC

### CA02-105 — Realm-Local Documents Own Realm-Local Detail
Realm-local canon retains ownership of its internal identity, ecology, geography, peoples, structures, hazards, progression and equivalent scoped material unless later global reconciliation explicitly changes the relationship.

### CA02-106 — FCC-12 Owns Global Material Ontology Where Locked
Later realm-local wording cannot silently override locked global identity/state/provenance/form relationships.

### CA02-107 — FCC-13 Owns Definitive Binding Where Locked
Stable binding, aliases, migration rows, definitive registry/recipe/portal binding and related delegated outputs follow FCC-13 within its locked scope.

### CA02-108 — FCC-14 Owns Cross-Realm Certification
FCC-14 certifies global coherence and may route unresolved semantic holds, but does not become the detailed owner of every realm concept.

## 13.2 ENG-GOV / B-OPS

### CA02-109 — ENG-GOV Owns Engineering Rule Text
B-OPS, AGENTS, validators, tests and CI consume/operationalise that law.

### CA02-110 — B-OPS May Own Operational Representation
Enforcement maturity, evidence links, validator backlog and operational mappings may be B-OPS-owned without altering ENG-GOV semantics.

## 13.3 PRD / LFE / FORGE-ENG

### CA02-111 — PRD Owns Discovery Evidence and Technical Unknown Mapping
PRD does not automatically become final architecture simply because it discovers a promising implementation.

### CA02-112 — LFE / FORGE-ENG Own Final Delegated Technical Architecture
They may choose implementation structures within upstream product canon, evidence and ENG-GOV constraints.

## 13.4 Project Brain

### CA02-113 — LF-BRAIN Owns Brain Representation and Navigation Contracts
It may define how authority is indexed, linked and surfaced but not redefine the underlying authority.

## 13.5 Branch D

### CA02-114 — Branch D Owns Programme Sequence and Gate Placement
Its status views are downstream navigation/roadmap authority, not replacements for audited semantic sources.

---

# 14. Current Real-World Validation Cases

C-AUD-02 is informed by existing Leyforge authority behaviour.

### Case A — ENG-GOV vs B-OPS
ENG-GOV defines engineering law; B-OPS operationalises it. A B-OPS enforcement row can state that a validator is planned or missing, but cannot weaken the underlying rule to manufacture compliance.

### Case B — FCC Realm J Documents
A realm J certification/index source may certify the realm while detailed A–I sources retain their owned behaviours unless J explicitly reconciles them.

### Case C — FCC-12 / FCC-13 Later Global Ownership
Older realm-global deferrals can be closed by later locked global owners without treating the older wording as a present contradiction.

### Case D — Deepcap Hold
Overworld `Deepcap Mushroom` and Impossible Deep `Deepcap` are both active, but current sources do not define their biological relationship. Naming similarity does not establish identity, separation, ancestry or synonymy. The correct result is a narrow owner decision rather than an inferred merge or split.

### Case E — Legacy POC Registry
A historical machine-readable registry may preserve old identifiers and implementation assumptions but cannot override later FCC material/binding canon merely because it is executable or structured.

---

# 15. Authority Leakage Audit

### CA02-115 — Global Concepts Are Checked for Local Capture
The audit must detect realm/system documents that accidentally claim universal death, personhood, save, economy, portal, event, material or other global ownership.

### CA02-116 — Technical Documents Are Checked for Product Redefinition
LFE/FORGE-ENG/implementation documents must not silently alter accepted gameplay/content semantics to simplify implementation.

### CA02-117 — Registries Are Checked for Semantic Invention
Registry rows must bind accepted concepts rather than invent unsupported canonical content.

### CA02-118 — Tests Are Checked for Requirement Invention
A test may encode a requirement only if an authority supports it or the test is explicitly exploratory.

### CA02-119 — Brain Summaries Are Checked for Semantic Drift
Navigation summaries must not become stronger or different claims than their underlying sources.

### CA02-120 — Roadmaps Are Checked for Authority Drift
Scheduling/status documents must not accidentally convert planned work into completed canon or historical evidence into current authority.

---

# 16. Circularity & Dependency Integrity

### CA02-121 — Authority Graph Must Be Acyclic for the Same Decision
A concept's semantic truth cannot depend circularly on downstream consumers that themselves depend on that truth.

### CA02-122 — Implementation Feedback May Trigger Upstream Change Without Becoming Circular Authority
Prototype evidence may cause the product owner to amend a requirement, but the amended product authority—not the prototype alone—becomes the new semantic source.

### CA02-123 — Certification Cannot Depend on Its Own Output as Evidence of Truth
A certification report may summarise evidence but cannot prove itself merely by asserting pass.

### CA02-124 — Generated Mirrors Cannot Validate Their Own Source
A generated registry/index cannot resolve disagreement with its generating authority by declaring itself current.

---

# 17. Authority Completeness States

Every consequential concept should end the authority pass in one of these states:

- **OWNED — CLEAR**
- **OWNED — SPECIALISED**
- **OWNED — BINDING HANDOFF**
- **OWNED — IMPLEMENTATION HANDOFF**
- **OWNED — CERTIFICATION LAYERED**
- **OWNED — LEGACY/MIGRATION ONLY**
- **SOURCE GAP — OWNER KNOWN**
- **OWNER UNRESOLVED**
- **ACTIVE CONFLICT**
- **DEFERRED OUTSIDE V1**
- **SUPERSEDED / HISTORICAL**

### CA02-125 — Only Clear/Routed States Can Support V1 Certification
`OWNER UNRESOLVED` and `ACTIVE CONFLICT` block certification of the affected in-scope concept.

### CA02-126 — Source Gap With Known Owner May Still Block Semantic V1
If the missing answer is inside the document's claimed semantic scope, certification remains blocked until the owner decides or the scope is legitimately narrowed.

### CA02-127 — Routed Technical Handoff Can Pass Semantic Authority
If semantic truth is complete and only implementation detail remains, the concept may pass with an explicit downstream implementation owner.

---

# 18. Resolution Workflow

The operational reconciliation workflow is:

```text
INVENTORIED SOURCES
        ↓
EXTRACT CONSEQUENTIAL CONCEPTS
        ↓
IDENTIFY CANDIDATE AUTHORITIES
        ↓
CLASSIFY ACTIVE / HISTORICAL / EVIDENCE
        ↓
ASSIGN PRIMARY OWNER
        ↓
CLASSIFY OVERLAP
        ↓
TEST PRECEDENCE / SPECIALISATION / SUPERSESSION
        ↓
SEARCH EXISTING RESOLUTION
        ↓
PASS / SOURCE GAP / CONFLICT / OWNER GAP
        ↓
ROUTE OWNER DECISION IF REQUIRED
        ↓
PROPAGATE RESOLUTION
        ↓
RE-AUDIT
        ↓
AUTHORITY-COMPLETE
```

### CA02-128 — Batch by Domain
Authority auditing should be performed in coherent domain batches rather than random file order.

### CA02-129 — Record Evidence for Precedence Decisions
A precedence result should cite the source statement, handoff, amendment, index or accepted rule that supports it.

### CA02-130 — Do Not Create Owner Interviews for Routine Precedence
If authority chain or supersession already resolves the issue, Branch C records the result without reopening design.

---

# 19. V1 Authority Certification Gate

A document/concept passes the C-AUD-02 authority gate only when applicable checks are satisfied:

```text
[ ] consequential concepts have discoverable owners
[ ] document-level ownership claims match concept-level ownership
[ ] no active mirror/evidence/history source masquerades as primary authority
[ ] legitimate specialist scopes are explicit
[ ] binding handoffs are explicit where applicable
[ ] implementation handoffs are explicit where applicable
[ ] certification layers do not erase detailed owners
[ ] precedence decisions have a recorded basis
[ ] supersession/amendment relationships are traceable
[ ] stale owners are removed from the active authority path
[ ] no unresolved duplicated authority remains
[ ] no unresolved boundary collision remains
[ ] no circular same-decision authority remains
[ ] no unresolved authority leakage remains
[ ] source gaps are explicitly classified and owned
[ ] owner decisions are integrated and propagated
[ ] downstream consumers point to the correct current authority
[ ] V1 candidate wording does not overclaim authority
```

### CA02-131 — Authority Gate Is Required Before Semantic Consistency Certification
C-AUD-03 must not try to reconcile semantic contradictions without first knowing which sources are allowed to define the concepts involved.

---

# 20. Whole-Corpus Authority Gate

Before the final V1 corpus lock, Branch C must be able to state:

> **Every consequential active Leyforge domain has a discoverable authority owner, every specialist/binding/implementation handoff has a coherent place in the authority graph, and no unresolved active source can credibly claim incompatible primary authority over the same in-scope concept.**

The gate requires:

```text
[ ] all V1-required logical documents classified by authority role
[ ] all consequential domains represented in authority map
[ ] primary owner coverage complete
[ ] specialist-owner boundaries coherent
[ ] binding-owner boundaries coherent
[ ] implementation-owner handoffs coherent
[ ] certification-owner relationships coherent
[ ] no unresolved active duplicated-authority findings
[ ] no unresolved circular-authority findings
[ ] no unresolved in-scope owner gaps
[ ] no unresolved AUD-4/AUD-5 authority leakage
[ ] source gaps routed to actual owners
[ ] accepted owner decisions propagated
[ ] authority map and underlying sources agree
```

---

# 21. Machine-Readable / Brain Interface

### CA02-132 — Authority Graph Should Become Machine-Queryable
Where practical, the final authority matrix should support automated queries and validation.

### CA02-133 — Machine Representation Mirrors C-AUD
Structured data may implement these records but does not replace C-AUD-02 semantics.

### CA02-134 — Brain Should Surface Authority Without Copying Canon
The Project Brain may render concept-owner maps, dependencies and unresolved findings while linking back to source authority.

### CA02-135 — Broken Owner References Should Become Detectable
Where feasible, validators should detect authority records that point to missing, retired or unknown sources.

### CA02-136 — New Consequential Documents Should Declare Ownership
Future governed documents should state what they own, what they consume and what they do not own, reducing future reconciliation cost.

---

# 22. Parallel-Branch Delta Handling

### CA02-137 — New Authority Reopens Only Affected Records
Incoming FCC, B-OPS, PRD, LFE, FORGE-ENG or roadmap changes invalidate only affected authority rows.

### CA02-138 — Ownership Transfer Is a Consequential Delta
If a concept's primary owner moves, all downstream consumers and old owner claims must be rechecked.

### CA02-139 — New Specialist Detail Does Not Automatically Reopen the Primary Owner
A valid specialisation can be added without invalidating unrelated upstream ownership.

### CA02-140 — Final Freeze Requires No Unprocessed Authority Delta
At final C-AUD freeze, all authority-affecting changes known to the project must be incorporated or explicitly excluded/deferred.

---

# 23. C-AUD-02 Acceptance Gate

C-AUD-02 may be theoretically locked when the project accepts that it has defined:

```text
[ ] concept-level ownership model
[ ] authority-role vocabulary
[ ] authority-record structure
[ ] domain hierarchy principles
[ ] precedence decision order
[ ] non-precedence signals
[ ] legitimate overlap classes
[ ] collision/leakage/orphan classes
[ ] scope partitioning rules
[ ] supersession/amendment rules
[ ] source-gap and owner-decision process
[ ] authority finding types
[ ] reconciliation matrix
[ ] family-specific authority patterns
[ ] authority-leakage audit
[ ] circularity rules
[ ] authority completeness states
[ ] resolution workflow
[ ] document/concept V1 authority gate
[ ] whole-corpus authority gate
[ ] machine-readable / Brain interface
[ ] parallel-delta handling
```

---

# 24. Next Document

After C-AUD-02 is locked, proceed to:

> **C-AUD-03 — Leyforge Canon, Terminology & Semantic Consistency Audit Standard v0.1**

C-AUD-03 will use the authority graph established here to test whether the active V1 corpus actually agrees on meanings, definitions, classifications, terms, invariants and cross-document semantic relationships.

C-AUD-02 answers **who gets to define the truth**.

C-AUD-03 will answer **whether the truths they define compose coherently**.

---

# 25. Foundational Statement

> **Leyforge may contain many documents about the same system, but it must never require a reader to guess which one is authorised to decide the meaning.**

Precedence is established through owned scope, explicit delegation, accepted supersession and governed authority chains—not timestamps, filenames, implementation convenience or repetition.

The final V1 corpus must therefore have an authority graph that is as deliberate as its content graph.

---

**End of C-AUD-02 v0.1**
