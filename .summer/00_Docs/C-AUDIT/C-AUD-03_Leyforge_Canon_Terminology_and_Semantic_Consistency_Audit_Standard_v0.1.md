# C-AUD-03 — Leyforge Canon, Terminology & Semantic Consistency Audit Standard

**Document ID:** C-AUD-03  
**Title:** Leyforge Canon, Terminology & Semantic Consistency Audit Standard  
**Version:** v0.1  
**Status:** BRANCH C DRAFT — READY FOR REVIEW / LOCK DECISION  
**Branch:** Branch C — V1 Documentation Audit & Finalisation  
**Parent Authority:** C-AUD-00 — Leyforge V1 Audit Constitution, Scope & Certification Model  
**Consumes:** C-AUD-01 — Master Corpus Inventory & Disposition Standard; C-AUD-02 — Authority, Ownership & Precedence Reconciliation Standard  
**Project:** Leyforge  
**Date:** 30 August 2026  
**Owns:** canon-consistency audit method, controlled terminology reconciliation, semantic relationship classification, taxonomy-drift detection, invariant auditing, ambiguity classification, semantic finding closure and V1 semantic-consistency certification  
**Does not own:** new content decisions, new engineering law, stable-ID allocation, registry migration execution, Project Brain architecture, production sequencing, or implementation architecture owned elsewhere  
**Primary interfaces:** FCC-12/13/14; Foundation Sets; ENG-GOV; B-OPS; LF-BRAIN; PRD; LFE; FORGE-ENG; registries; ADRs; testing/verification; C-AUD-04 through C-AUD-11

---

# 00. Purpose

C-AUD-03 defines how Leyforge determines whether its **authoritative meanings actually compose into one coherent specification**.

C-AUD-01 establishes what sources exist.

C-AUD-02 establishes which sources are authorised to define each consequential concept.

C-AUD-03 asks:

> **When the current authoritative statements are read together, do they mean one coherent thing, or does the reader still have to guess whether two names, categories, rules, states, quantities, relationships or system descriptions are intended to agree?**

The governing principle is:

> **ONE PROJECT MAY USE MANY TERMS AND MANY SPECIALISED DOCUMENTS, BUT ONE CONSEQUENTIAL MEANING MUST NOT QUIETLY SPLIT INTO MULTIPLE INCOMPATIBLE INTERPRETATIONS.**

C-AUD-03 is deliberately stricter than proofreading and deliberately narrower than redesign.

It hunts semantic defects. It does not manufacture replacement canon.

---

# 01. Foundational Semantic Laws

### CA03-001 — Authority Precedes Semantic Reconciliation
C-AUD-03 consumes the ownership and precedence results of C-AUD-02 before deciding whether two statements are genuinely contradictory.

### CA03-002 — Similar Wording Does Not Prove Shared Meaning
Two concepts with similar names may be distinct identities, states, forms, regional variants, cultural aliases or unrelated terms.

### CA03-003 — Different Wording Does Not Prove Different Meaning
Different labels may represent one concept through current name, legacy alias, cultural term, implementation label or contextual shorthand.

### CA03-004 — Semantic Equality Requires Evidence
Terms or statements are treated as equivalent only when authoritative meaning supports equivalence.

### CA03-005 — Semantic Difference Requires Evidence
A reviewer may not invent a distinction merely to avoid reconciling duplicated authority.

### CA03-006 — Context Is Part of Meaning
Realm, system, lifecycle state, provenance, form, scope, audience and time/version may legitimately alter the interpretation of a term.

### CA03-007 — Scope-Limited Truth Is Not Automatically Global Truth
A rule written for one realm, subsystem or lifecycle phase must not silently become universal.

### CA03-008 — Global Truth Constrains Local Specialisation
A local document may specialise a global semantic rule but may not contradict it without explicit authority.

### CA03-009 — Implementation Language Cannot Quietly Rewrite Product Meaning
Runtime classes, code names, scene names, schema labels and POC terminology are implementation evidence unless the owning semantic authority adopts them.

### CA03-010 — Semantic Audit Is Claim-Aware
C-AUD-03 audits what a source actually claims, not what a reader wishes it claimed.

### CA03-011 — Ambiguity Is a Defect Only When Consequential
Harmless stylistic variation is not elevated into bureaucracy. Ambiguity becomes an audit issue when it can change interpretation, ownership, implementation, migration, gameplay, art handoff, testing or player-facing identity.

### CA03-012 — No False Precision
If canon establishes a category, relationship or range but not an exact value, C-AUD-03 must not convert it into an exact value for neatness.

---

# 02. Semantic Object Model

C-AUD-03 reasons about more than words. It audits semantic objects and the relationships among them.

### CA03-013 — `CONCEPT`
A meaningful project idea that may be defined, constrained, specialised, represented or implemented.

### CA03-014 — `TERM`
A human-readable or machine-readable label used to refer to a concept.

### CA03-015 — `DEFINITION`
The authoritative statement of what a concept is within an owned scope.

### CA03-016 — `INVARIANT`
A condition that must remain true across all applicable representations or states.

### CA03-017 — `CLASSIFICATION`
A semantic placement of a concept within a taxonomy or category system.

### CA03-018 — `RELATIONSHIP`
An explicit semantic connection between two concepts such as alias, state-of, form-of, derived-from, member-of, provenance-of or distinct-from.

### CA03-019 — `CONSTRAINT`
A rule limiting what a concept may do, become, contain, connect to or imply.

### CA03-020 — `QUANTIFIER`
Language controlling cardinality or amount such as exactly, one, at least, at most, optional, typical, rare or unlimited.

### CA03-021 — `SCOPE`
The domain in which a semantic statement is authoritative.

### CA03-022 — `PROVENANCE`
Origin information that may affect identity, state, interpretation, legality, behaviour or presentation without necessarily creating a new identity.

### CA03-023 — `STATE`
A mutable or conditional condition of an identity that does not necessarily create a new semantic identity.

### CA03-024 — `FORM`
A physical, representational or manufactured expression of an underlying identity.

### CA03-025 — `PROJECTION`
A representation of a definition into a specific domain such as Block, Object, Item, UI, Forge or runtime data.

### CA03-026 — Semantic Objects May Be Many-to-Many
One concept may have multiple terms; one term may be contextually overloaded; one definition may constrain multiple projections.

---

# 03. Controlled Term Lifecycle

Every consequential term may be classified using the following lifecycle vocabulary.

### CA03-027 — `CANONICAL TERM`
The preferred current project term within the owned scope.

### CA03-028 — `ALLOWED ALIAS`
A current accepted alternate label that resolves unambiguously to the same concept.

### CA03-029 — `CONTEXTUAL TERM`
A valid term only within a declared cultural, realm, UI, implementation or other bounded context.

### CA03-030 — `LEGACY ALIAS`
An older label retained for migration, historical lookup or compatibility but not preferred for new authority.

### CA03-031 — `DISPLAY VARIANT`
Presentation wording that may differ without changing semantic identity.

### CA03-032 — `TECHNICAL LABEL`
A schema/code/implementation label whose scope is technical and which must not be mistaken for broader product terminology.

### CA03-033 — `PLACEHOLDER`
A deliberately temporary label whose final semantic identity or presentation name remains unresolved.

### CA03-034 — `AMBIGUOUS TERM`
A label currently capable of resolving to more than one plausible concept without sufficient context.

### CA03-035 — `COLLIDING TERM`
The same or confusingly similar label is used for distinct active concepts in a way that creates consequential ambiguity.

### CA03-036 — `RETIRED TERM`
A former label that must not be used as current authority except where migration/history explicitly requires it.

### CA03-037 — `REJECTED GENERIC TERM`
A term deliberately prohibited from re-entering current canon because it collapses distinctions or acts as filler.

### CA03-038 — `DEFERRED TERM`
A reserved or future-facing term outside the current V1 scope.

### CA03-039 — Preferred Naming Is Scope-Specific
A term may be canonical in one bounded context and an alias or technical label in another.

### CA03-040 — Alias Does Not Mean Interchangeable Everywhere
An alias relationship may be valid for migration/search while one display name remains required for player-facing clarity.

### CA03-041 — Retired Terms Remain Searchable Where Useful
Retirement removes active authority, not provenance.

### CA03-042 — Placeholder Status Must Be Visible
A placeholder must never masquerade as a final canonical name.

---

# 04. Semantic Relationship Vocabulary

C-AUD-03 uses explicit relationship classes rather than prose-only judgments such as “basically the same.”

### CA03-043 — `SAME CONCEPT`
Two references resolve to one underlying semantic concept.

### CA03-044 — `DISTINCT CONCEPT`
Two references are intentionally separate semantic identities.

### CA03-045 — `ALIAS OF`
One term is an alternate label for the same concept.

### CA03-046 — `LEGACY ALIAS OF`
One obsolete/compatibility label resolves to a current concept.

### CA03-047 — `SUBTYPE OF`
One concept is a specialised member of a broader semantic class.

### CA03-048 — `MEMBER OF`
A concept belongs to a collection/taxonomy without inheriting every property of the group as an identity.

### CA03-049 — `STATE OF`
A concept represents a condition of an underlying identity rather than a separate base identity.

### CA03-050 — `FORM OF`
A concept is a form/projection of an underlying identity.

### CA03-051 — `DERIVED FROM`
A concept is produced from another through a transformation that may or may not create a new identity according to owning canon.

### CA03-052 — `PROVENANCE OF`
A label or attribute records origin without automatically creating a new underlying identity.

### CA03-053 — `REGIONAL / REALM VARIANT OF`
A concept is a scoped variation of a broader family where current canon explicitly establishes that relationship.

### CA03-054 — `CULTURAL TERM FOR`
A cultural or in-world label refers to a concept whose system/canonical identity remains separate from the cultural name.

### CA03-055 — `PROJECTION OF`
A Block, Object, Item, UI or equivalent representation projects a definition rather than creating a second definition.

### CA03-056 — `INSTANCE OF`
A runtime/persistent occurrence references a definition plus instance state.

### CA03-057 — `SUCCESSOR TO`
A current concept or rule replaces an older one through explicit evolution/migration.

### CA03-058 — `SUPERSEDES`
A newer authority replaces an older semantic statement within a declared scope.

### CA03-059 — `COMPATIBLE WITH`
Two concepts can interact or coexist but are not therefore identical.

### CA03-060 — `MUTUALLY EXCLUSIVE WITH`
Two classifications or states cannot simultaneously apply within the audited model.

### CA03-061 — `ORTHOGONAL TO`
Two dimensions can vary independently and must not be collapsed into one taxonomy.

### CA03-062 — `UNKNOWN RELATIONSHIP`
The project knows the concepts but current authority does not establish their relationship.

### CA03-063 — Relationship Direction Matters
`derived_from`, `state_of`, `subtype_of`, `successor_to` and equivalent relationships are directional and must not be inverted casually.

### CA03-064 — Relationship Type Must Match Owner Semantics
C-AUD-03 may classify an already-supported relationship but cannot invent a new lineage, transformation or identity relationship merely because it would simplify the graph.

---

# 05. Semantic Defect Classes

### CA03-065 — `DIRECT CONTRADICTION`
Two applicable active statements cannot both be true under the same scope and conditions.

### CA03-066 — `CONDITIONAL CONTRADICTION`
Statements only conflict under a specific state, realm, version, lifecycle phase or interaction.

### CA03-067 — `DEFINITION DRIFT`
A concept's meaning changes across active sources without an explicit authorised reason.

### CA03-068 — `TERM DRIFT`
A current term is used for materially different meanings across the corpus.

### CA03-069 — `FALSE SYNONYM`
Two distinct concepts are treated as interchangeable because their names are similar.

### CA03-070 — `FALSE DISTINCTION`
One concept is accidentally split into multiple identities or categories without authority.

### CA03-071 — `TAXONOMY DRIFT`
The same concept is placed into incompatible classifications across active sources.

### CA03-072 — `SCOPE LEAKAGE`
A local or contextual rule is written/consumed as global truth.

### CA03-073 — `GLOBAL RULE BYPASS`
A local source behaves as though an applicable global semantic invariant does not exist.

### CA03-074 — `STATE / IDENTITY COLLAPSE`
A mutable state is treated as a new base identity, or a genuinely distinct identity is incorrectly treated as mere state.

### CA03-075 — `FORM / IDENTITY COLLAPSE`
A physical form/projection is mistaken for an independent semantic identity, or vice versa.

### CA03-076 — `PROVENANCE / IDENTITY COLLAPSE`
Origin is incorrectly treated as identity, or an identity-defining provenance distinction is erased despite authority.

### CA03-077 — `INSTANCE / DEFINITION COLLAPSE`
Per-instance runtime state is accidentally promoted into definition-level canon.

### CA03-078 — `OWNERSHIP / MEANING COLLAPSE`
A document that owns representation/operation is treated as though it owns the semantic meaning itself.

### CA03-079 — `QUANTIFIER DRIFT`
Exact counts, minimums, maximums, optionality or frequency change across sources.

### CA03-080 — `BOUNDARY DRIFT`
A system, realm, structure, site, event or object crosses an authority/domain boundary differently across active sources.

### CA03-081 — `LIFECYCLE DRIFT`
Terms such as active, deprecated, retired, historical, destroyed, damaged, restored or migrated are used inconsistently enough to change behaviour or interpretation.

### CA03-082 — `NEGATION LOSS`
A prohibition or explicit “does not imply” rule disappears downstream, causing a false positive capability or relationship.

### CA03-083 — `CONDITION LOSS`
A rule that is only valid under specified conditions is copied downstream without those conditions.

### CA03-084 — `EXCEPTION LOSS`
A valid exception is omitted downstream, making a general rule falsely universal.

### CA03-085 — `UNAUTHORISED SEMANTIC EXPANSION`
A summary, registry, implementation note or rewrite claims more meaning than its source supports.

### CA03-086 — `UNAUTHORISED SEMANTIC NARROWING`
A downstream artifact accidentally removes valid scope or possibilities established by the owner.

### CA03-087 — `UNRESOLVED AMBIGUITY`
Two or more materially different interpretations remain plausible after relevant sources are consulted.

### CA03-088 — `STALE SEMANTIC ASSUMPTION`
An active-looking source still embeds a superseded world, engine, identity or design assumption.

### CA03-089 — `PLAYER-FACING COLLISION`
Canonical distinctions exist internally but current naming/presentation would make them materially indistinguishable to players or creators.

### CA03-090 — `MACHINE-FACING COLLISION`
Distinct semantic concepts could be conflated by schema, registry, migration or generated data naming.

---

# 06. Canonical Invariant Audit

### CA03-091 — Consequential Invariants Must Be Extractable
Where a project rule is repeatedly relied upon, the audit should be able to express its invariant explicitly.

### CA03-092 — Invariants Are Audited Across All Applicable Consumers
A rule is not semantically coherent if its owner states it correctly but downstream documents routinely assume the opposite.

### CA03-093 — Repetition Is Evidence of Dependency, Not New Ownership
Repeated restatements should point back to the conceptual owner where practical.

### CA03-094 — Invariants May Be Negative
“Does not imply,” “must not merge,” “cannot bypass” and similar negative constraints are first-class semantic truth.

### CA03-095 — Invariants May Be Conditional
A rule can be invariant within a defined condition rather than universally true.

### CA03-096 — Invariants May Span Families
Examples may connect FCC identity to registry projection, engineering persistence and testing requirements.

### CA03-097 — Invariant Violations Are Classified by Consequence
A harmless wording mismatch is not treated the same as a rule that would corrupt stable identity or cross-realm travel semantics.

### CA03-098 — High-Risk Invariants Receive Dedicated Audit Rows
Persistent identity, realm topology, portal access, universal death, personhood, save interpretation, deterministic world identity, security boundaries and similar foundation rules warrant explicit rows.

### CA03-099 — Semantic Invariant Does Not Require Duplicate Prose
A single owner plus explicit references is preferable to many independently maintained copies.

### CA03-100 — V1 Rewrite Should Make Important Invariants Discoverable
Where an invariant is currently scattered or implied, final V1 normalisation may centralise/reference it without changing its meaning.

---

# 07. Quantifier, Cardinality & Numeric Meaning

### CA03-101 — Exact Quantifiers Are Binding
Words such as `exactly`, `one`, `six`, `nine`, `never`, `always` and `must` are semantically stronger than approximate language.

### CA03-102 — Minimum and Maximum Are Not Exact Counts
`at least 5`, `up to 6`, and `exactly 6` must never be normalised into one another.

### CA03-103 — Typical Is Not Mandatory
Typical/default/common behaviour must not become a universal invariant without authority.

### CA03-104 — Example Is Not Requirement
Illustrative values or examples do not become canonical limits merely because they are concrete.

### CA03-105 — Candidate Is Not Locked
Candidate lists from discovery/reconciliation remain distinguishable from accepted rosters.

### CA03-106 — Current Count and Maximum Count Are Separate
A current canonical roster size must not be mistaken for an architectural maximum unless stated.

### CA03-107 — Unit Meaning Must Be Consistent
Where units are consequential, scale, coordinate frame, duration and unit semantics must remain consistent or explicitly converted.

### CA03-108 — Tuning Values Need Correct Ownership
Numbers intentionally left to PRD/benchmarking/LFE or balancing must not be promoted into product canon by an old prototype.

### CA03-109 — Historical Measurements Remain Evidence
Measured POC performance or test values remain evidence rather than semantic requirements unless an owner adopts them as a target/limit.

### CA03-110 — Quantifier Conflict Receives Higher Scrutiny When It Controls Identity or Topology
Portal family counts, realm counts, fixed authority counts, stable roster constraints and equivalent structures are audit-sensitive.

---

# 08. Taxonomy & Classification Consistency

### CA03-111 — Taxonomy Dimensions Must Be Named
Body family, culture, faction, government, species, material class, form, state, provenance, site type and similar dimensions should not be mixed merely because they are all “categories.”

### CA03-112 — Orthogonal Dimensions Stay Orthogonal
A concept may simultaneously have values in multiple independent taxonomies.

### CA03-113 — Broad Class Does Not Erase Personhood
Creature/being/ancestry/personhood classifications must preserve the owner-defined distinction between biological/supernatural class and personhood status.

### CA03-114 — Geography and Realm Are Distinct Where Canon Says So
Deep Overworld, Impossible Deep, sky provinces, other realms and ordinary geography must not be collapsed because of thematic resemblance.

### CA03-115 — Site, Structure, Settlement and Instance State Stay Distinct
A place can be a site, contain structures, host a settlement and have persistent instance state without those words becoming synonyms.

### CA03-116 — Material Class and Material Identity Stay Distinct
`metal`, `glass`, `stone`, `fibre` and similar classes do not imply that members are interchangeable identities.

### CA03-117 — Form Families Are Not Material Families
Plate, beam, slab, stair, wire, shard, pane and equivalent forms do not create universal material identity.

### CA03-118 — State Taxonomy Must Match Transformation Rules
Wet, damaged, corrupted, attuned, refined, pressure-altered and other conditions require the owner-defined state-versus-identity threshold.

### CA03-119 — Provenance Categories Are Not Filler Materials
Realm origin, boss provenance, corruption provenance or cultural importance cannot automatically become generic resource identities.

### CA03-120 — Taxonomy Migration Is Explicit
When later canon changes a classification, old classifications are routed to alias/history/migration rather than silently coexisting.

---

# 09. Naming, Identity & Alias Discipline

### CA03-121 — Display Name Is Not Stable Identity
A display-name change does not by itself create a new semantic identity.

### CA03-122 — Shared Display Name Does Not Prove Shared Identity
Two scoped concepts may use similar language while remaining distinct.

### CA03-123 — Stable ID Cannot Decide Unresolved Biology or Canon
Machine IDs consume semantic ownership; they do not create semantic truth by themselves.

### CA03-124 — Alias Cannot Merge Two Active Meanings Silently
Migration aliases may preserve compatibility but cannot settle a disputed identity relationship.

### CA03-125 — Player-Facing Disambiguation May Be Required Without Semantic Merge
Two distinct canonical identities may remain distinct while one display name changes for clarity.

### CA03-126 — Cultural Names May Coexist With System Names
In-world terminology should map to system/canonical terminology where needed without forcing cultures to use system labels.

### CA03-127 — Universal Naming Rules Apply Only Within Their Authority
Plain real-material names and fantasy-unique names may guide content naming without flattening specialised canonical exceptions.

### CA03-128 — Retired Generic Names Must Not Reappear Through Legacy Data
Historical `Deepstone`, generic realm ore, generic boss essence or similar retired/filler terminology requires explicit migration treatment before appearing in current V1 authority.

### CA03-129 — One-Definition Semantics Must Survive Naming
Block and Item labels must not trick the corpus into defining two independent semantic materials when the owning single-definition rule says one definition with projections.

### CA03-130 — Naming Consistency Includes Capitalisation Where Identity Depends on It
Stylistic capitalisation is normally editorial, but exact canonical names and stable machine identifiers must preserve their governed form.

---

# 10. Cross-Domain Semantic Handoff

### CA03-131 — Handoffs Preserve Meaning, Not Just Names
A downstream family must consume the semantic contract carried by the upstream authority.

### CA03-132 — FCC → Registry Handoff
Registry binding must preserve FCC identity, relationships, aliases, provenance and projection rules.

### CA03-133 — FCC → PRD/LFE Handoff
Technical discovery and architecture may choose mechanisms while preserving locked product meaning.

### CA03-134 — ENG-GOV → B-OPS Handoff
Operational enforcement may describe maturity/evidence without weakening or rewriting the rule.

### CA03-135 — LFE/FORGE-ENG → Implementation Handoff
Implementation structures may vary internally but may not change accepted external semantics without governed design change.

### CA03-136 — Authority → Brain Handoff
Brain summaries/indexes may simplify navigation while exact consequential semantics remain in source authority.

### CA03-137 — Requirement → Test Handoff
A test must verify the actual requirement, not an accidental implementation interpretation.

### CA03-138 — Semantic Conditions Must Travel With the Handoff
If a rule depends on provenance, state, environment, permission, realm, capability or lifecycle phase, those conditions cannot be omitted downstream.

### CA03-139 — Negative Constraints Must Travel With the Handoff
“No portal-free passage,” “not universal death destination,” “does not imply corruption,” “not a second authority corpus” and equivalent negatives remain first-class constraints.

### CA03-140 — Downstream Precision May Increase Without Semantic Mutation
A technical owner may define algorithms, schemas or thresholds within delegated freedom as long as the higher-level meaning remains true.

---

# 11. Legacy, Prototype & Historical Semantics

### CA03-141 — Historical Behaviour Is Audited as Evidence/Legacy Unless Adopted
Old Summer/POC implementation does not automatically control current semantics.

### CA03-142 — Historical Terminology Must Be Mapped
Old names that appear in saves, registries, code, testing guides or documentation require current disposition where they can affect migration or interpretation.

### CA03-143 — Historical Success Does Not Lock Old Architecture
A POC behaviour may prove feasibility while its architecture remains superseded.

### CA03-144 — Old Registry Rows Are Not Current Canon by Survival
A row surviving in a historical registry only proves that the old implementation knew it.

### CA03-145 — Old Tests May Preserve Important Invariants
Legacy tests are valuable where they encode conservation, migration, deterministic behaviour or other accepted semantics, but must be checked against current authority.

### CA03-146 — Legacy Labels Must Not Leak Into New Canon Unreviewed
Migration support may retain them internally while current docs use present terminology.

### CA03-147 — Historical Contradictions Need Not Be “Fixed” in History
Old documents may remain historically accurate representations of earlier project states as long as they cannot masquerade as current authority.

### CA03-148 — V1 Rewrite Removes Stale Active Assumptions, Not Historical Evidence
The active corpus is cleaned while provenance remains reconstructable.

---

# 12. Semantic Audit Matrix

C-AUD-03 execution should produce a machine-friendly semantic reconciliation matrix.

Minimum row fields:

```text
semantic_record_id
concept_or_invariant
domain
owner
source_a
source_b_or_consumer
statement_a
statement_b
scope_a
scope_b
term_state
relationship_class
quantifier_state
taxonomy_state
consistency_result
finding_type
severity
resolution_owner
resolution_state
affected_consumers
v1_semantic_result
notes
```

### CA03-149 — Rows May Compare More Than Two Sources
A concept family may require one row group spanning several active sources.

### CA03-150 — Rows May Represent Invariants Rather Than Pairwise Documents
High-value audit rows should sometimes ask whether an invariant survives across all consumers.

### CA03-151 — Closely Related Low-Risk Wording May Be Grouped
The audit avoids sentence-level paperwork when one classification safely covers a coherent family.

### CA03-152 — High-Risk Semantics Receive Finer Granularity
Stable identity, persistence, topology, personhood, realm interfaces, security, economy ownership, migration and architecture boundaries warrant finer rows.

### CA03-153 — Source Quotes Are Bounded and Traceable
Audit rows may preserve short exact phrases where wording controls semantics, with references back to the owning source.

### CA03-154 — Paraphrase Must Preserve Modality
`must`, `may`, `should`, `cannot`, `typically`, `exactly`, `at least` and equivalent strength/quantifier language must survive summarisation.

### CA03-155 — Semantic Matrix Does Not Become Canon
It records reconciliation results and points back to source authority.

---

# 13. Audit Execution Procedure

### CA03-156 — Step 1: Select Owned Concept/Invariant
Use C-AUD-02 authority records to choose what is being semantically audited.

### CA03-157 — Step 2: Gather Active Statements
Collect current authoritative and consequential consuming statements from the C-AUD-01 corpus inventory.

### CA03-158 — Step 3: Normalise Context, Not Meaning
Record scope, state, realm, version, provenance and other contextual dimensions before comparing wording.

### CA03-159 — Step 4: Extract Terms and Quantifiers
Identify controlled names, relationship words, classifications, counts, modality and negative constraints.

### CA03-160 — Step 5: Classify Relationships
Determine whether references are same concept, distinct, alias, state, form, subtype, projection, provenance or another supported relationship.

### CA03-161 — Step 6: Test Coexistence
Ask whether all applicable statements can be true at once under their declared conditions.

### CA03-162 — Step 7: Search for Missing Qualifier Before Declaring Contradiction
Many apparent conflicts are scope, lifecycle or condition differences.

### CA03-163 — Step 8: Search Existing Authority Before Owner Escalation
Use current sources, accepted decisions, reconciliation matrices and evidence before asking a new semantic question.

### CA03-164 — Step 9: Classify Result
PASS, PASS WITH NOTE, PASS — ROUTED, SOURCE GAP, CONFLICT, BLOCKED, DEFERRED, NON-BLOCKING UNKNOWN, NOT APPLICABLE or SUPERSEDED according to C-AUD-00.

### CA03-165 — Step 10: Create Finding Where Material
Assign a stable finding ID when resolution/propagation must be tracked.

### CA03-166 — Step 11: Route to Semantic Owner
Branch C does not decide an unresolved product/engineering/architecture truth outside its authority.

### CA03-167 — Step 12: Propagate Approved Resolution
Update affected sources, aliases, summaries, registry demands, handoffs or future rewrite instructions.

### CA03-168 — Step 13: Re-Audit the Relationship
Closure requires proving that the corrected semantic graph now composes.

---

# 14. Finding Types & Resolution

C-AUD-03 semantic findings may use:

```text
SEM-CONTRADICTION
SEM-DEFINITION-DRIFT
SEM-TERM-DRIFT
SEM-FALSE-SYNONYM
SEM-FALSE-DISTINCTION
SEM-TAXONOMY-DRIFT
SEM-SCOPE-LEAK
SEM-STATE-IDENTITY
SEM-FORM-IDENTITY
SEM-PROVENANCE-IDENTITY
SEM-QUANTIFIER
SEM-BOUNDARY
SEM-NEGATION-LOSS
SEM-CONDITION-LOSS
SEM-UNAUTHORISED-EXPANSION
SEM-UNAUTHORISED-NARROWING
SEM-AMBIGUITY
SEM-STALE-ASSUMPTION
SEM-PLAYER-COLLISION
SEM-MACHINE-COLLISION
```

### CA03-169 — Finding IDs Are Stable
Semantic findings remain traceable through resolution and V1 rewrite.

### CA03-170 — Findings Name the Owning Resolution Domain
A finding records whether FCC, ENG-GOV, PRD, LFE, FORGE-ENG, Branch A, Branch D or another authority must decide/fix it.

### CA03-171 — Editorial Fixes May Close Locally
Pure terminology normalisation that does not alter meaning may be corrected during V1 rewrite without reopening the domain owner.

### CA03-172 — Semantic Choices Require Owner Approval
Merge/split/lineage/state/identity/topology/authority/behaviour decisions require the appropriate owner.

### CA03-173 — Minimal Amendment Is Preferred
A narrow inconsistency should not trigger broad redesign when one bounded amendment can restore coherence.

### CA03-174 — Resolution Records Preserve Why
Where the choice was non-obvious, retain enough rationale/evidence to prevent rediscovery.

### CA03-175 — Closure Includes Downstream Consumers
The owner document being corrected is not enough if consumers still encode stale semantics.

---

# 15. Family-Specific Semantic Profiles

## 15.1 FCC / Content Canon

### CA03-176 — Audit Realm Identity and Topology
Realm-local geography, realm identity, portal topology and Overworld-vs-realm boundaries must compose globally.

### CA03-177 — Audit Material Identity Relationships
Same material, distinct material, state, form, provenance, lineage and transformation relationships must agree with FCC-12.

### CA03-178 — Audit Registry Demand Semantics
FCC-13 bindings must consume current canon without using machine binding to invent missing semantic relationships.

### CA03-179 — Audit Personhood Separately From Being Class
Ancestry/body/creature class and personhood must not drift into one taxonomy.

### CA03-180 — Audit Native / Imported / Naturalised / Invasive Distinctions
Cross-realm ecology must preserve provenance and status rather than treating presence as proof of native origin.

## 15.2 ENG-GOV / B-OPS

### CA03-181 — Audit Rule Strength
MUST/SHOULD/MAY/PROHIBITED and equivalent semantic strength must remain stable across operationalisation.

### CA03-182 — Audit Rule vs Enforcement Meaning
Missing automation may create governance debt but must not make a mandatory rule optional.

### CA03-183 — Audit Risk Vocabulary Within Branch B Scope
A–E engineering risk classes must not be conflated with C-AUD AUD-1–AUD-5 documentation finding severity.

### CA03-184 — Audit Exception Vocabulary
Waiver, exception, deprecation, quarantine and debt must retain their distinct governed meanings.

## 15.3 Project Brain

### CA03-185 — Audit Navigation vs Authority
Brain summaries/status/views must not be worded as though they own the underlying semantic truth.

### CA03-186 — Audit Current vs Historical Knowledge
Skills, Work Logs and historical records must not override current authority.

## 15.4 PRD / LFE / FORGE-ENG

### CA03-187 — Audit Fact vs Design vs Engineering Decision
Technology facts, product decisions and engineering choices must remain distinguishable.

### CA03-188 — Audit Evidence Strength
Prototype evidence must not silently become a universal architecture requirement beyond what it proves.

### CA03-189 — Audit Delegated Freedom
Technical architecture may choose mechanisms within upstream constraints without being falsely flagged merely because the implementation vocabulary is more precise.

## 15.5 Branch D

### CA03-190 — Audit Status Meaning
READY, ACTIVE, BLOCKED, COMPLETE, LOCKED, V1 CERTIFIED and NOT REQUIRED FOR REBUILD must remain distinct.

### CA03-191 — Audit Dependency Semantics
A planning preference must not be represented as a hard dependency, and a genuine hard gate must not be softened for schedule convenience.

---

# 16. Current Leyforge Validation Cases

These cases validate the audit model against real project behaviour. They are examples, not substitute authority.

## Case A — Deepcap Mushroom ↔ Deepcap

Current FCC-14 evidence establishes two independently native crop records but does not establish their biological relationship.

Correct C-AUD-03 treatment:

```text
similar term
+ distinct realm-native records
+ no proven lineage
+ no proven distinct-species statement
=
UNKNOWN RELATIONSHIP / PLAYER-FACING COLLISION RISK
→ narrow owning semantic decision
```

### CA03-192 — Name Similarity Alone Cannot Merge Deepcap Records
No synonym/lineage decision may be inferred from the shared word `Deepcap`.

### CA03-193 — Separate Records Alone Cannot Invent Distinct Species
Separate registry/canon demands are insufficient to invent biological taxonomy.

## Case B — Pressure Pearl / Blackwater Pearl

Where current canon establishes Blackwater Pearl as provenance/state of Pressure Pearl rather than a separate biomineral identity, C-AUD-03 must prevent later docs from resurrecting two independent base identities.

### CA03-194 — Provenance/State Relationships Survive Downstream
A player-facing or historical name may remain searchable without splitting identity.

## Case C — Deepstone Retirement

Where later FCC reconciliation retires or reclassifies historical Deepstone usage, old POC/registry references remain migration/history evidence rather than current material canon.

### CA03-195 — Historical Implementation Cannot Reanimate Retired Canon
A surviving code/registry row does not undo a later authoritative retirement.

## Case D — Block / Item Single-Definition Semantics

Where one underlying thing remains the same when placed, broken and inventoried, Block and Item projections must not silently create duplicate semantic definitions.

### CA03-196 — Projection Difference Is Not Automatic Identity Difference
Registry/UI/tooling may represent multiple projections while one definition remains authoritative.

## Case E — ENG-GOV ↔ B-OPS

ENG-GOV defines engineering law; B-OPS operationalises enforcement, evidence, debt and navigation.

### CA03-197 — Operational State Cannot Weaken Semantic Rule Strength
`PLANNED` automation or `PARTIAL` enforcement does not mean the source MUST became optional.

## Case F — Project Brain Summaries

The Brain may display concise summaries and status, while exact semantic authority remains in source documents.

### CA03-198 — Summary Drift Is a Maintenance Defect
A stale Brain summary is corrected; it does not become competing canon.

---

# 17. V1 Semantic Certification Gate — Individual Document

A normative document may pass C-AUD-03 semantic certification when every applicable item is true:

```text
[ ] controlled terms are current or explicitly classified
[ ] definitions match their owning authority
[ ] no unresolved material direct contradiction remains
[ ] scope and conditions are explicit enough to prevent leakage
[ ] taxonomy/classification agrees with current project model
[ ] state/form/provenance/identity boundaries are correct
[ ] exact quantifiers/cardinalities agree with current authority
[ ] negative constraints and exceptions are preserved
[ ] aliases/legacy terms do not masquerade as current identities
[ ] implementation terminology does not redefine product canon
[ ] downstream semantic handoffs preserve required meaning
[ ] stale historical assumptions are removed/routed
[ ] unresolved ambiguities are owned and either resolved or outside scope
[ ] blocking semantic findings are closed
[ ] V1 rewrite instructions preserve accepted semantics
```

### CA03-199 — AUD-4/5 Semantic Defects Block Certification
Known unresolved identity, topology, architecture-boundary or systemic semantic conflicts cannot be normalised into a pass.

### CA03-200 — AUD-1/2 Findings May Be Repaired During Rewrite
Low-risk wording defects may be closed through controlled V1 normalisation when no owner decision is required.

### CA03-201 — Source Gap Is Not Contradiction
A source gap blocks only the scope that genuinely requires the missing semantic answer.

---

# 18. Whole-Corpus Semantic Consistency Gate

The semantic layer of the global V1 audit passes only when:

```text
[ ] every consequential current concept has a discoverable definition/owner
[ ] controlled terminology does not contain unresolved consequential collisions
[ ] realm/system/domain boundaries compose coherently
[ ] global invariants survive local specialisation
[ ] no active false synonym/false distinction remains in blocking scope
[ ] taxonomies are internally coherent and cross-linked where orthogonal
[ ] exact counts/quantifiers agree across applicable sources
[ ] stable semantic relationships required by registries are explicit
[ ] current aliases/legacy labels are correctly classified
[ ] no historical implementation assumption masquerades as current canon
[ ] cross-family handoffs preserve conditions, negations and exceptions
[ ] player-facing naming collisions that affect identity are resolved/routed
[ ] machine-facing semantic collision risks are handed to C-AUD-04
[ ] all AUD-4/AUD-5 semantic findings are closed
[ ] all remaining unknowns are legitimate, owned and outside the certified claim
```

### CA03-202 — Semantic Coherence Is Graph-Wide
The project does not pass merely because each document is internally self-consistent; their relationships must also be coherent.

### CA03-203 — Final Semantic Gate Consumes FCC-14
Branch C does not duplicate FCC-14's detailed realm certification; it consumes its certified result and checks that the rest of the corpus agrees with it.

---

# 19. Project Brain & Machine-Readable Interface

### CA03-204 — Semantic Findings Should Be Indexable
The Brain should eventually expose semantic conflicts, ambiguity holds, term lifecycle and reconciliation state without duplicating full authority.

### CA03-205 — Controlled Terms May Have Stable Term Records
Where useful, a terminology index may expose canonical term, aliases, scope, owner and lifecycle.

### CA03-206 — Term Index Is Derived Navigation Unless Explicitly Delegated
The index records owner-defined meaning; it does not invent definitions.

### CA03-207 — Reverse Queries Are Required
The system should ideally answer:

```text
term → concept(s)
concept → canonical term / aliases
concept → owner
concept → relationships
finding → affected sources
source → semantic findings
```

### CA03-208 — Automation May Detect Candidate Collisions
Machine tooling may flag duplicate names, changed quantifiers, forbidden legacy terms or broken controlled vocabulary, but semantic review determines meaning.

### CA03-209 — Machine Green Is Not Semantic Proof
A lint-clean corpus can still contain conceptual contradiction.

---

# 20. Parallel Delta Handling

### CA03-210 — New Locked Canon Reopens Affected Semantic Rows
Incoming FCC-14 decisions or later amendments reopen only impacted relationships/invariants.

### CA03-211 — New B-OPS Material Reopens Only Applicable Engineering-Semantic Rows
Operational additions do not invalidate unrelated content semantic certification.

### CA03-212 — New PRD/LFE Precision Is Compared Against Upstream Meaning
More detailed technical semantics are accepted when they remain within delegated freedom.

### CA03-213 — Branch D Status Updates Do Not Reopen Product Semantics
Roadmap movement only affects semantic audit if it introduces/uncovers an authority or scope contradiction.

### CA03-214 — Terminology Renames Trigger Alias/Consumer Recheck
A canonical rename requires downstream search, alias/migration review and player/machine collision checks as applicable.

### CA03-215 — Final Freeze Requires No Unprocessed Semantic Delta
All known meaning-affecting changes must be incorporated or explicitly excluded before final V1 semantic certification.

---

# 21. Relationship to C-AUD-04

C-AUD-03 decides semantic relationships.

C-AUD-04 will test whether stable IDs, registry definitions, aliases, migrations and machine bindings faithfully encode them.

The handoff is:

```text
C-AUD-03
WHAT DOES THIS MEAN?
      ↓
C-AUD-04
HOW IS THAT MEANING DURABLY IDENTIFIED / BOUND / MIGRATED?
```

### CA03-216 — C-AUD-04 Cannot Repair Semantic Ambiguity by ID Assignment
If C-AUD-03 says the relationship is unresolved, registry tooling must preserve the hold rather than decide it.

### CA03-217 — C-AUD-03 Does Not Allocate Final IDs
Identity semantics and exact stable binding are distinct concerns.

### CA03-218 — Machine Collision Findings Flow Forward
Naming/definition problems likely to create registry collision become explicit C-AUD-04 inputs.

---

# 22. C-AUD-03 Acceptance Gate

C-AUD-03 may be theoretically locked when the project accepts that it has defined:

```text
[ ] foundational semantic laws
[ ] semantic object model
[ ] controlled term lifecycle vocabulary
[ ] explicit semantic relationship vocabulary
[ ] semantic defect classes
[ ] canonical invariant auditing
[ ] quantifier/cardinality rules
[ ] taxonomy/classification consistency rules
[ ] naming/identity/alias discipline
[ ] cross-domain semantic handoff rules
[ ] legacy/prototype semantic treatment
[ ] semantic audit matrix structure
[ ] execution procedure
[ ] finding taxonomy and closure workflow
[ ] family-specific semantic profiles
[ ] current Leyforge validation cases
[ ] individual-document semantic V1 gate
[ ] whole-corpus semantic gate
[ ] Project Brain / machine-readable interface
[ ] parallel delta handling
[ ] C-AUD-04 handoff boundary
```

---

# 23. Next Document

After C-AUD-03 is locked, proceed to:

> **C-AUD-04 — Leyforge Stable Identity, Registry & Migration Audit Standard v0.1**

C-AUD-04 will test whether Leyforge's durable machine-facing identities faithfully encode the semantic truth certified here.

It will cover:

- stable-ID uniqueness and persistence;
- namespaces;
- definitions vs Block/Object/Item projections;
- aliases;
- redirects;
- migrations;
- retired IDs;
- generated forms;
- reference closure;
- save compatibility;
- legacy POC row disposition;
- registry/source-of-truth boundaries;
- collision detection;
- migration evidence;
- machine-binding certification.

---

# 24. Foundational Statement

> **Leyforge is semantically consistent when its active authoritative sources can be read together without silently changing the meaning of a concept as it crosses documents, realms, taxonomies, registries, engineering layers, implementation handoffs or historical boundaries.**

The final V1 corpus does not require every author to use identical prose.

It requires every consequential distinction to remain deliberate, every equivalence to be justified, every scope to remain visible, every controlled term to resolve safely, and every unresolved meaning to be admitted rather than guessed.

C-AUD-03 therefore turns “these documents sound roughly compatible” into a testable project property.

---

**End of C-AUD-03 v0.1**
