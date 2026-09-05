# C-AUD-09 — Leyforge V1 Rewrite, Normalisation & Promotion Standard

**Document ID:** C-AUD-09  
**Title:** Leyforge V1 Rewrite, Normalisation & Promotion Standard  
**Version:** v0.1  
**Status:** BRANCH C LOCK CANDIDATE — READY FOR REVIEW / ACCEPTANCE  
**Branch:** Branch C — V1 Documentation Audit & Finalisation  
**Project:** Leyforge  
**Date:** 30 August 2026  

**Parent Authority:** C-AUD-00 through C-AUD-08  
**Primary Interfaces:** FCC-14A–D; PRD; ENG-GOV/B-OPS; LF-BRAIN; D-ROAD; LFE; FRG-ENG/FORGE-ENG; registries; ADRs; Git/repository history; active document corpus; certification registers  
**Owns:** Branch C methodology for converting reconciled pre-V1 documents into clean V1 candidates, proving semantic fidelity, promoting certified outputs into the active corpus, and preserving rollback/provenance  
**Does Not Own:** the underlying semantic decisions being rewritten, engineering implementation, exact repository command sequence, document-family authority, styling systems owned elsewhere, or final global certification itself

---

# 00. Purpose

C-AUD-09 defines the controlled transformation from reconciled Leyforge documentation into clean, readable, implementation-authoritative V1 documents.

The governing question is:

> **How do we rewrite a complicated, amended, historically layered document into a clean V1 source without losing accepted meaning, reintroducing retired concepts, weakening requirements, changing stable identity, inventing technical detail, or accidentally turning editorial cleanup into a new design decision?**

C-AUD-09 exists because a correct audit result is not yet a good production document.

Leyforge V1 should not force a reader to reconstruct old amendments, superseded names, chat decisions, obsolete engine assumptions, stale TODOs, contradictory draft history, legacy registry structures, old evidence status, repeated correction notes or amendment chains in order to understand what is true now.

The final V1 corpus should present current truth directly while preserving history elsewhere through controlled provenance.

---

# 01. Foundational Rewrite Doctrine

### CA09-001 — Reconcile Before Rewrite
No document enters final V1 rewrite while unresolved material semantic findings remain inside the rewrite scope.

### CA09-002 — Rewrite Is Not a Decision-Making Stage
C-AUD-09 may clarify and normalise accepted meaning but may not silently settle open design, architecture, identity or governance questions.

### CA09-003 — Clean Prose Must Preserve Dirty History
The V1 document may become clean while Git, audit records, amendment registers, ADRs and archives preserve how that truth was reached.

### CA09-004 — Current Truth Is the Reading Priority
A normal reader should encounter the current rule first rather than amendment chronology.

### CA09-005 — Fidelity Outranks Elegance
A beautiful rewrite that changes meaning fails.

### CA09-006 — Concision Cannot Remove Conditions
Shortening is allowed only when scope, negation, quantifiers, exceptions and ownership survive.

### CA09-007 — Normalisation Cannot Collapse Distinctions
Material/form/state/provenance, definition/projection/instance, native/imported/corrupted, current/historical and evidence/authority remain distinct where canon requires them.

### CA09-008 — V1 Is a New Certified Edition
Promotion creates a certified current edition; it does not erase previous editions from history.

### CA09-009 — Rewriting Does Not Increase Authority
A rewritten source owns only the scope its predecessor/current authority chain permits.

### CA09-010 — Unchanged Meaning May Be Reorganised Aggressively
Sections, headings, order, redundancy and prose may be substantially improved when semantic fidelity is demonstrably preserved.

---

# 02. Rewrite Preconditions

### CA09-011 — Inventory Resolved
The logical document, current candidate, editions and duplicate physical copies are known under C-AUD-01.

### CA09-012 — Authority Resolved
The current owner and precedence relationships are known under C-AUD-02.

### CA09-013 — Semantics Resolved
No blocking semantic contradiction remains under C-AUD-03.

### CA09-014 — Identity Issues Resolved
Stable-ID, registry, migration and projection defects relevant to the document are resolved or validly routed under C-AUD-04.

### CA09-015 — Interfaces Resolved
Required cross-family handoffs are known under C-AUD-05.

### CA09-016 — Completeness Resolved
The document is sufficiently complete within claimed scope under C-AUD-06.

### CA09-017 — Evidence Claims Resolved
Current proof claims and historical evidence status are valid under C-AUD-07.

### CA09-018 — Legacy Disposition Resolved
Superseded/historical material is classified under C-AUD-08.

### CA09-019 — Open Findings Must Be Rewrite-Compatible
Low-risk editorial findings may remain; unresolved semantic or V1-blocking findings may not be hidden inside rewrite.

### CA09-020 — Rewrite Scope Is Declared
The project identifies whether the operation is full-document, section-level, family-level or package-level.

---

# 03. Two-Pass Promotion Model

```text
SOURCE CORPUS
      ↓
AUDITED / RECONCILED TRUTH
      ↓
PASS 1 — SEMANTIC V1 CANDIDATE
      ↓
FIDELITY AUDIT A
      ↓
PASS 2 — STRUCTURAL / EDITORIAL NORMALISATION
      ↓
FIDELITY AUDIT B
      ↓
CERTIFICATION CANDIDATE
      ↓
PROMOTION
      ↓
POST-PROMOTION INTEGRITY CHECK
```

### CA09-021 — Pass 1 Prioritises Meaning
The first candidate incorporates resolved truth with minimal concern for stylistic perfection.

### CA09-022 — Fidelity Audit A Compares Meaning
The first audit verifies that every substantive source disposition is represented correctly.

### CA09-023 — Pass 2 Prioritises Readability
After semantic fidelity is proven, structure, prose, tables, navigation and redundancy may be improved.

### CA09-024 — Fidelity Audit B Protects Against Editorial Drift
The final candidate is checked again because restructuring itself can accidentally change meaning.

### CA09-025 — Promotion Requires Both Fidelity Passes
A single review is insufficient for high-consequence normative documents.

### CA09-026 — Low-Risk Documents May Use Combined Execution
Where no material semantic complexity exists, the two conceptual passes may be executed in one working session but both checks remain required.

---

# 04. Source Disposition During Rewrite

### CA09-027 — PRESERVE
Current meaning survives substantially unchanged.

### CA09-028 — CLARIFY
Meaning is unchanged but wording becomes less ambiguous.

### CA09-029 — NORMALISE
Terminology/structure changes to current controlled form without semantic change.

### CA09-030 — MERGE
Multiple equivalent current statements become one authoritative statement.

### CA09-031 — SPLIT
One overloaded statement becomes multiple clearer current rules.

### CA09-032 — MOVE
Content changes section/document location without changing ownership/meaning.

### CA09-033 — AMEND
A resolved owner-approved semantic change is incorporated.

### CA09-034 — SUPERSEDE
Old meaning is intentionally replaced by accepted current authority.

### CA09-035 — ROUTE
Detail remains valid but belongs in a different current owner/document.

### CA09-036 — DEFER
Detail remains intentionally unresolved under explicit future ownership.

### CA09-037 — HISTORICISE
Content leaves current prose and survives only as history/evidence/provenance.

### CA09-038 — RETIRE
Concept is removed from current active semantics.

### CA09-039 — TOMBSTONE
Durable identity/history remains discoverable although full definition is retired.

### CA09-040 — DELETE REDUNDANCY
Pure duplication with no unique semantic/provenance value is removed from the active candidate.

---

# 05. Semantic Preservation Rules

### CA09-041 — Requirements Strength Is Preserved
MUST/SHOULD/MAY meaning cannot be weakened through prose cleanup.

### CA09-042 — Negation Is Preserved
“Must not”, “does not”, “cannot” and equivalent exclusions are semantic content.

### CA09-043 — Conditions Are Preserved
Triggers, prerequisites, realm scope, lifecycle state and exceptions remain explicit.

### CA09-044 — Quantifiers Are Preserved
Exactly, at least, at most, one-per, six-only and other cardinality semantics survive.

### CA09-045 — Ownership Is Preserved
The rewrite does not imply that a document now owns downstream implementation merely because it mentions it.

### CA09-046 — Boundaries Are Preserved
Content/technical, source/generated, current/historical, semantic/presentation and other authority boundaries remain clear.

### CA09-047 — Unknowns Are Preserved Honestly
A valid unresolved technical unknown is not rewritten into a fake solution.

### CA09-048 — Deferrals Are Preserved With Owner
Future work remains explicit enough to avoid accidental implementation choice.

### CA09-049 — Invariants Remain Identifiable
Consequential project-wide rules retain stable references where available.

### CA09-050 — Exceptions Are Preserved
A rewrite cannot silently convert a rule-with-exceptions into an absolute.

---

# 06. Terminology Normalisation

### CA09-051 — Current Canonical Terms Are Preferred
V1 prose uses the accepted current term by default.

### CA09-052 — Historical Terms Move Out of Mainline Prose
Legacy names remain only where migration/history/search value requires them.

### CA09-053 — Alias Notes Are Bounded
A current document may state a historical alias once where useful rather than repeat it throughout.

### CA09-054 — False Synonyms Are Forbidden
Normalisation cannot merge different concepts for stylistic consistency.

### CA09-055 — Display Name and Stable ID Are Separate
A display rename need not force stable-ID wording changes.

### CA09-056 — Realm / Culture Names Remain Contextual Where Intended
Cultural names may coexist with system names without becoming identity duplicates.

### CA09-057 — Controlled Vocabulary Wins Over Casual Draft Phrasing
Accepted taxonomy should replace old informal wording.

### CA09-058 — Technical Labels Need Audience Context
Internal names may remain when useful but should not become unexplained product terminology.

### CA09-059 — Abbreviations Are Defined
A V1 document should not depend on forgotten project-chat abbreviations.

### CA09-060 — Renamed Concepts Preserve Searchability Through History
Current prose stays clean while alias/tombstone indexes preserve findability.

---

# 07. Structural Normalisation

### CA09-061 — Scope Appears Early
A reader should quickly know what the document owns and does not own.

### CA09-062 — Authority Appears Early
Normative documents identify parent/upstream authority and major consumers.

### CA09-063 — Current Rules Precede Historical Notes
History should not interrupt understanding of current behaviour.

### CA09-064 — Repeated Rules Are Consolidated
Duplicate prose is replaced by one owning statement plus references.

### CA09-065 — Tables Are Used for Structured Truth
Matrices, enumerations and stable registers may replace repetitive prose where readability improves.

### CA09-066 — Prose Is Used for Meaning
Tables should not compress nuanced semantic constraints into ambiguous cells.

### CA09-067 — Headings Reflect Ownership
Section structure should help readers understand distinct responsibility domains.

### CA09-068 — Appendices Carry Supporting Detail
Large evidence lists, migration inventories and historical mappings may move to appendices/companion registries where authority remains clear.

### CA09-069 — Navigation Is Not Duplicated Authority
Indexes and summaries reference current owner sections.

### CA09-070 — Monoliths May Be Split
A large document may become tightly owned companion volumes when distinct consumers/update lifecycles justify it.

---

# 08. Document Splitting & Merging

### CA09-071 — Split by Stable Ownership
A split is valid when each resulting document has coherent authority and maintenance responsibility.

### CA09-072 — Split by Consumer Lifecycle
Art handoff, technical handoff, certification and runtime architecture may be separate when they evolve independently.

### CA09-073 — Split Must Preserve Traceability
Every old section maps to its new location/disposition.

### CA09-074 — Merge Only Truly Shared Ownership
Two documents should not be merged merely because they discuss similar topics.

### CA09-075 — Merge Does Not Erase Source History
Predecessors remain recorded.

### CA09-076 — Stable IDs Should Survive Restructure
Rule/invariant IDs are retained where their meaning remains unchanged.

### CA09-077 — ID Retirement Requires Mapping
If an old rule ID cannot survive, its disposition and successor are recorded.

### CA09-078 — Split Rules Need Parent Mapping
One old rule becoming multiple new rules must remain traceable.

### CA09-079 — Package-Level Lock May Span Multiple Files
A V1 authority family may certify as a package rather than forcing one giant document.

---

# 09. Amendment Incorporation

### CA09-080 — Accepted Amendments Become Direct Current Truth
V1 prose states the amended result rather than forcing the reader through amendment chronology.

### CA09-081 — Amendment History Remains External
Audit/amendment registers preserve who/why/when.

### CA09-082 — Narrow Amendment Stays Narrow
A correction to one concept cannot trigger opportunistic unrelated redesign during rewrite.

### CA09-083 — Downstream Amendments Must Be Propagated
Aliases, registries, PRD requirements and technical consumers reflect accepted change where applicable.

### CA09-084 — Closed Holds Leave Mainline Open-Issue Prose
They may remain in history/closure records.

### CA09-085 — Current Names Replace Resolved Placeholders
Once owner-approved, a final name/term becomes normal current wording.

### CA09-086 — Historical Placeholder Remains Searchable
Old placeholder names may survive through alias/history records where useful.

---

# 10. FCC-14A Abysscap Case

Current certified truth:
- Overworld **Deepcap Mushroom** remains its own native biological identity.
- Impossible Deep **Deepcap** receives the final display name **Abysscap**.
- The two are distinct native biological crop identities.
- No ancestry/import/cultivar/shared-species relationship is implied.
- `Deepcap` may remain an Impossible Deep historical/colloquial alias where useful.

### CA09-087 — Mainline V1 Uses Abysscap
Current Impossible Deep prose uses the final accepted name.

### CA09-088 — Mainline V1 Does Not Re-Litigate the Hold
The final content source need not reproduce the entire uncertainty narrative.

### CA09-089 — Amendment Record Preserves the Hold History
FCC-14D/audit history records how the ambiguity was resolved.

### CA09-090 — Migration/Binding Consumers Receive Narrow Delta
FCC-13-compatible downstream binding/alias treatment preserves distinct identity.

### CA09-091 — Searchability May Preserve Deepcap Alias
Historical references remain discoverable without merging crops.

---

# 11. Stable-ID Preservation

### CA09-092 — Stable IDs Are Not Rewritten for Style
Cosmetic naming consistency cannot change durable IDs.

### CA09-093 — ID Meaning Must Match Current Prose
A retained stable ID cannot point to rewritten semantic meaning.

### CA09-094 — Rename Uses Alias/Redirect
Where a stable ID genuinely changes, C-AUD-04 migration rules apply.

### CA09-095 — Retired IDs Stay Out of Current Tables
Mainline V1 canonical lists do not present retired identities as active.

### CA09-096 — Tombstones/Legacy Tables Hold Retired IDs
Historical lookup remains possible.

### CA09-097 — Generated Identity Rules Stay Source-Driven
A rewrite cannot materialise generated IDs as independent authored truth merely for convenience.

### CA09-098 — Runtime Numeric Handles Stay Out of Canonical Prose Unless Needed
Technical implementation values do not become V1 semantic identity.

---

# 12. Evidence Normalisation

### CA09-099 — Current Qualification Claims Use Current Evidence
Historical POC evidence is not phrased as present proof.

### CA09-100 — Historical Results Move to Evidence/History Sections
Valuable old numbers and test outcomes retain dates/build context.

### CA09-101 — Planned Evidence Is Labelled Planned
A future benchmark/test cannot be written as completed.

### CA09-102 — Failed Evidence Remains Visible Where It Affects Meaning
Known current limitations cannot be edited away.

### CA09-103 — Evidence Detail May Be Referenced
Mainline normative prose may cite an evidence record rather than include every log/result.

### CA09-104 — Proof Level Labels Are Preserved Accurately
P0–P5 claims follow PRD authority.

### CA09-105 — Stale Evidence Is Not Used for Present-Tense Assurance
Old evidence may inform rationale without certifying current behaviour.

---

# 13. Legacy Removal From Active Prose

### CA09-106 — Obsolete Engine Instructions Are Removed
Summer/Unreal-specific operational instructions leave current V1 unless intentionally retained as archaeology guidance.

### CA09-107 — Obsolete Paths Are Removed
Historical scene/file/asset paths move to archive/migration metadata.

### CA09-108 — POC Scenario Names Are Removed From Current Production Requirements
Unless a surviving behavioural requirement explicitly references them historically.

### CA09-109 — Historical Registry Layout Is Removed
Current V1 describes current identity architecture rather than legacy arrays.

### CA09-110 — Old TODO Chains Are Removed
Resolved TODOs become direct truth or historical issue records.

### CA09-111 — Rejected Options Leave Mainline Recommendations
They remain in ADR/audit history where rationale matters.

### CA09-112 — Old Warnings Are Re-Evaluated
A historical warning survives only if current conditions still make it relevant.

---

# 14. Unknown / Deferred Detail Handling

### CA09-113 — Unknowns Need Explicit State
Current documents may include UNKNOWN, EVIDENCE REQUIRED, DEFERRED or equivalent governed status.

### CA09-114 — Unknowns Are Not Hidden in Soft Language
“Typically” or “probably” must not mask unresolved requirements.

### CA09-115 — Deferred Technical Mechanics Stay Downstream
Content V1 does not invent Godot/Zylann algorithms to appear complete.

### CA09-116 — Deferral Identifies Owner
PRD, LFE, FORGE-ENG, art governance or other target is named where consequential.

### CA09-117 — Deferral Identifies Boundary
Already-locked semantics remain visible so downstream freedom is bounded.

### CA09-118 — Deferral Identifies Trigger Where Needed
The point at which the issue becomes blocking is recorded.

---

# 15. Cross-Reference Normalisation

### CA09-119 — Current References Use Current Document IDs
Links target current certified sources where available.

### CA09-120 — Stable Rule IDs Are Preferred
References should survive heading/prose changes.

### CA09-121 — Historical References Are Typed
A citation to old material says it is evidence/history/migration where ambiguity could arise.

### CA09-122 — Broken References Block Promotion Where Material
Current normative links to missing sources must be repaired.

### CA09-123 — Circular Reference Does Not Substitute for Definition
A document cannot claim completeness through endless “see other document” loops.

### CA09-124 — Summary Links Do Not Replace Owner Links
Brain/index/roadmap pages aid navigation; final semantic references resolve to authority.

---

# 16. Metadata Normalisation

### CA09-125 — Document ID Is Stable
The logical V1 document identifier is explicit.

### CA09-126 — Title Is Current
Title reflects actual scope rather than obsolete project phase.

### CA09-127 — Version Is Explicit
V1 candidate and certified versions are distinguishable.

### CA09-128 — Status Is Formal
Avoid vague “basically final” language.

### CA09-129 — Authority Fields Are Explicit
Parent/upstream/owner/consumers are discoverable.

### CA09-130 — Supersession Metadata Is Explicit
The new V1 edition identifies predecessor relationship where applicable.

### CA09-131 — Certification Metadata Is Added Only After Certification
A candidate cannot label itself V1-certified before the gate passes.

### CA09-132 — Date Is Provenance, Not Precedence
Metadata dates do not imply authority.

---

# 17. Rule / Requirement ID Normalisation

### CA09-133 — Existing Stable IDs Survive Unchanged Meaning
EG, GI, REQ, CA and other stable references are not renumbered casually.

### CA09-134 — New IDs Are Added Without Reusing Retired IDs
Identifier history remains monotonic where the owning family requires it.

### CA09-135 — Deleted/Retired Rules Receive Disposition
Downstream consumers can determine what happened.

### CA09-136 — Merged Rules May Retain Alias Mapping
Old IDs can point to a consolidated successor where useful.

### CA09-137 — Split Rules Need Parent Mapping
One old rule becoming multiple new rules remains traceable.

### CA09-138 — Cosmetic Reordering Does Not Force Renumbering
Document layout and semantic identity are separate.

---

# 18. V1 Candidate Package

A V1 candidate package includes, where applicable:

```text
1. V1 candidate document(s)
2. Source/predecessor identifiers
3. Rewrite/disposition map
4. Open finding list
5. Fidelity Audit A result
6. Fidelity Audit B result
7. Cross-reference validation
8. Stable-ID/rule-ID validation
9. Legacy/supersession disposition
10. Certification metadata draft
11. Promotion target path
12. Rollback source/baseline
```

### CA09-139 — Candidate Package Is Reviewable
A reviewer can prove what changed without reconstructing chat history.

### CA09-140 — Candidate Package Is Not Active Authority Yet
Current authority remains the pre-promotion source until certification/promotion succeeds.

### CA09-141 — Candidate May Exist in Separate Working Path
Exact branch/worktree mechanics belong to Branch B.

---

# 19. Fidelity Audit A — Semantic Incorporation

### CA09-142 — Every Material Source Disposition Is Accounted For
No substantive source meaning disappears without mapping.

### CA09-143 — Every Approved Amendment Is Incorporated
Resolved owner decisions are present.

### CA09-144 — No Unapproved Semantic Change Appears
New meaning not supported by audit/authority is a failure.

### CA09-145 — No Current Requirement Is Lost
Mandatory conditions remain.

### CA09-146 — No Retired Concept Is Reintroduced
Legacy leakage fails.

### CA09-147 — Stable Identities Match
IDs, aliases and projections agree with C-AUD-04.

### CA09-148 — Cross-Family Handoffs Match
The candidate preserves required consumers/routes.

### CA09-149 — Evidence Claims Match Current Status
Pass/planned/historical distinctions are truthful.

### CA09-150 — Unknowns/Deferrals Match Current Ownership
No hidden resolution is introduced.

---

# 20. Fidelity Audit B — Post-Normalisation

### CA09-151 — Section Moves Preserve Scope
A moved rule still applies to the same entities/conditions.

### CA09-152 — Merged Prose Preserves All Conditions
Consolidation cannot drop an exception/qualifier.

### CA09-153 — Table Conversion Preserves Meaning
Compact presentation remains semantically complete.

### CA09-154 — Summary Does Not Replace Detail Accidentally
A concise overview cannot become the only surviving authoritative statement if nuance is required.

### CA09-155 — Headings Do Not Change Ownership
Renaming a section must not imply new authority.

### CA09-156 — Terminology Changes Are Valid
All replacements follow current controlled vocabulary.

### CA09-157 — References Still Resolve
Structural edits must not break traceability.

### CA09-158 — No Editorial Strengthening
SHOULD cannot accidentally become MUST.

### CA09-159 — No Editorial Weakening
MUST cannot disappear into descriptive language.

### CA09-160 — No Scope Widening
A local rule cannot become global through removal of context.

---

# 21. Diff Review

### CA09-161 — Semantic Diff Matters More Than Text Diff
Large text changes may be safe; one missing “not” may be catastrophic.

### CA09-162 — Automated Diff Is Supporting Evidence
Human/semantic review remains necessary for consequential documents.

### CA09-163 — Added Meaning Must Have Authority
Every new substantive statement maps to accepted resolution or legitimate clarification.

### CA09-164 — Removed Meaning Must Have Disposition
Deletion without classification fails.

### CA09-165 — Moved Meaning Must Be Traceable
Relocation should not look like disappearance.

### CA09-166 — Stable-ID / Rule-ID Diff Is Separately Reviewed
Durable references require machine-assisted checking where possible.

### CA09-167 — Cross-Reference Diff Is Separately Reviewed
Changed document IDs/paths/anchors can create hidden breakage.

---

# 22. Promotion States

### CA09-168 — AUDITED
Source completed relevant reconciliation but no V1 candidate exists.

### CA09-169 — REWRITE IN PROGRESS
Candidate drafting has begun.

### CA09-170 — SEMANTIC CANDIDATE
Pass 1 complete; Fidelity A pending/passed.

### CA09-171 — NORMALISED CANDIDATE
Pass 2 complete; Fidelity B pending.

### CA09-172 — CERTIFICATION CANDIDATE
All rewrite checks complete and ready for Branch C certification register.

### CA09-173 — V1 CERTIFIED — PENDING PROMOTION
Certification passed but active path switch not completed.

### CA09-174 — V1 ACTIVE
Certified candidate is the active authoritative edition.

### CA09-175 — PROMOTION FAILED / ROLLED BACK
Candidate did not safely become/stay active.

### CA09-176 — SUPERSEDED AFTER V1
A later governed version replaced the V1 edition.

---

# 23. Promotion Gate

### CA09-177 — Candidate Is Certified for Its Scope
Applicable C-AUD gates pass.

### CA09-178 — Blocking Findings Are Closed
No unresolved in-scope AUD-4/AUD-5 or family-blocking finding remains.

### CA09-179 — Fidelity A Passed
Semantic incorporation is proven.

### CA09-180 — Fidelity B Passed
Post-normalisation meaning is proven.

### CA09-181 — References Resolve
Required current links are valid.

### CA09-182 — Identity References Resolve
Stable IDs/rule IDs/migrations are valid.

### CA09-183 — Legacy Disposition Is Recorded
Predecessor history is safe.

### CA09-184 — Promotion Target Is Known
The active source path/document slot is explicit.

### CA09-185 — Rollback Is Possible
Previous active state remains recoverable.

### CA09-186 — Promotion Authority Is Correct
The process cannot activate a new V1 source without appropriate certification authority.

---

# 24. Active-Path Replacement

### CA09-187 — V1 Replaces the Active Working Edition
Normal project navigation points to certified V1 output.

### CA09-188 — Predecessor Becomes Historical/Superseded
Old active edition is retained under C-AUD-08.

### CA09-189 — Duplicate Working Copies Are Reconciled
Obsolete active-path duplicates do not remain to confuse agents.

### CA09-190 — Generated Exports Follow Source
PDF/DOCX/combined outputs are regenerated from certified source where appropriate rather than promoted independently.

### CA09-191 — External Backup Is Not Active Authority
Personal copies may exist; project authority follows governed active source.

### CA09-192 — Current Brain Index Is Updated
Once operational, the Brain points to promoted V1 source and predecessor history.

---

# 25. Git / Repository Promotion Interface

### CA09-193 — Exact Git Mechanics Belong to Branch B
C-AUD-09 defines semantic promotion requirements, not command syntax.

### CA09-194 — Promotion Is Commit-Identifiable
The certified baseline should be recoverable through repository history.

### CA09-195 — Pre-Promotion State Is Preserved
Rollback/history must not depend on memory.

### CA09-196 — Promotion Is Atomic Enough for Authority
Avoid extended states where half a family points to old authority and half to new.

### CA09-197 — Package Promotion May Require One Coordinated Change
Cross-document stable IDs/references move together where partial activation is unsafe.

### CA09-198 — Failed Validation Stops Promotion
Draft completion alone cannot mark a candidate active.

---

# 26. Rollback Rules

### CA09-199 — Rollback Is a Safety Mechanism
Using rollback after failed promotion is not itself a certification-process failure.

### CA09-200 — Rollback Restores Last Known Authority
The project returns to the prior valid active edition.

### CA09-201 — Candidate Failure Remains Evidence
The failed candidate and reason may be retained until resolved.

### CA09-202 — Rollback Does Not Undo Accepted Semantic Decisions
A formatting/reference failure does not invalidate the owner-approved semantic resolution.

### CA09-203 — Semantic Failure Reopens Audit
If rewrite exposed/caused a meaning conflict, applicable C-AUD stage reopens.

### CA09-204 — Partial Rollback Requires Dependency Review
A coupled package cannot roll back one file if that breaks current references/identity contracts.

---

# 27. Post-Promotion Integrity Check

### CA09-205 — Active Source Resolves
Navigation opens the correct V1 file.

### CA09-206 — Metadata Shows V1 Active State
Candidate wording is removed.

### CA09-207 — Predecessor Shows Superseded State
No equal-active ambiguity remains.

### CA09-208 — Cross-References Resolve
Consumers point to promoted authority.

### CA09-209 — Registry / Rule Links Resolve
Stable identifiers remain valid.

### CA09-210 — Brain / Index State Is Consistent
Derived navigation reflects current authority when operational.

### CA09-211 — Archive Link Is Available Where Required
Historical predecessor remains discoverable.

### CA09-212 — No Duplicate Active Candidate Remains
Working draft paths cannot masquerade as current V1.

---

# 28. V1 Clean-Prose Rules

### CA09-213 — Avoid Amendment Archaeology in Mainline
Current rules read directly.

### CA09-214 — Avoid Meta-Conversation
“We decided earlier” and “as discussed in chat” normally leave normative V1 prose.

### CA09-215 — Avoid Temporal Draft Language
“Eventually”, “for now”, “later maybe” requires real lifecycle/deferral meaning or removal.

### CA09-216 — Avoid Obsolete Comparative Language
“This replaces the old Summer version” belongs in history unless needed for current interpretation.

### CA09-217 — Avoid False Finality
Documents state scope rather than implying the entire game is complete.

### CA09-218 — Use Explicit Ownership Language
“Owned by”, “consumed by”, “routed to” are preferred where boundaries matter.

### CA09-219 — Use Direct Requirements
Normative rules should be readable without conversational hedging.

### CA09-220 — Preserve Readability Without Semantic Slang
Internal docs may remain human-readable, but informal wording cannot create ambiguity.

---

# 29. Tables, Registers & Generated Views

### CA09-221 — Canonical Registers Need Stable Source
A generated dashboard cannot become editable semantic owner by accident.

### CA09-222 — Generated Tables Identify Source
Derived outputs are reproducible.

### CA09-223 — Manually Maintained Registers Need Ownership
If a table itself is authoritative, the document explicitly says so.

### CA09-224 — Large Lists May Move to Machine-Readable Companions
Only when semantic ownership and generation/fidelity are controlled.

### CA09-225 — Human-Readable V1 Remains Navigable
Machine efficiency must not make core authority inscrutable.

---

# 30. Family-Level Rewrite Order

### CA09-226 — Rewrite Upstream Owner First
Dependent docs do not finalise against a still-changing owner.

### CA09-227 — Rewrite Shared Invariant/Register Sources Early
Stable global references reduce downstream churn.

### CA09-228 — Rewrite Consumers After Inputs Stabilise
This minimises repeated edits.

### CA09-229 — Package Certification Follows Internal Rewrite
Family lock occurs after member candidates/interfaces are coherent.

### CA09-230 — Parallel Rewrite Is Allowed With Stable Boundaries
Separate owners may work concurrently where shared interfaces are frozen.

---

# 31. Cross-Family Rewrite Order

```text
FINAL CONTENT / CANON
      ↓
PRODUCT / FOUNDATION DESIGN
      ↓
REGISTRY / IDENTITY
      ↓
PRD / EVIDENCE CLOSURE
      ↓
ENGINEERING GOVERNANCE / TECHNICAL CANON
      ↓
OPERATIONAL / TEST / NAVIGATION SOURCES
      ↓
GLOBAL CROSS-CORPUS RE-AUDIT
```

### CA09-231 — Order Is Dependency-Based
Alphabetical or numerical document order is secondary.

### CA09-232 — Existing V1 Labels Still Require Audit
A pre-existing `v1.0` label does not bypass Branch C reconciliation.

### CA09-233 — FCC Consolidations Are High-Value Upstream Inputs
FCC-14A–D reduce downstream reinterpretation after final package lock.

### CA09-234 — Technical Canon Waits for PRD Closure
LFE/FORGE-ENG V1 promotion cannot pre-empt discovery/authority process.

---

# 32. FCC-14 Final-Package Interface

### CA09-235 — FCC-14A Is a Model Consolidation Volume
It shows how many audit rows become a maintainable invariant register without replacing detailed realm owners.

### CA09-236 — FCC-14B/C/D Remain Distinct
Their final structure should not be collapsed merely for one-file convenience.

### CA09-237 — Zero FCC Holds Does Not Mean Global Documentation V1
FCC semantic certification is one upstream milestone.

### CA09-238 — FCC Amendments Must Reach PRD
PRD-01 and other consumers receive controlled deltas where previous status becomes stale.

---

# 33. PRD Interface

### CA09-239 — Working PRD Documents Are Not Promoted Prematurely
PRD-01 v0.x remains working until its closure conditions pass.

### CA09-240 — PRD Requirement IDs Stay Stable Across Rewrite
Resolved unknowns change status/disposition rather than disappearing blindly.

### CA09-241 — PRD-09 Is a Technical-Discovery Freeze Input
Final technical-canon rewrite depends on its closure.

### CA09-242 — Historical Unknowns May Move to Resolution Register
Final PRD prose can remain clean while preserving major decision history.

### CA09-243 — Evidence Crosswalks May Be Supporting Companions
Do not force every evidence detail into main architecture prose.

---

# 34. ENG-GOV / B-OPS Interface

### CA09-244 — Certified Branch B Baseline Is Current Governance
Older drafts should not survive as equal active authority.

### CA09-245 — ENG-GOV Rule IDs Are Preserved
Normalisation must not casually renumber the certified rule corpus.

### CA09-246 — B-OPS Operational Records Stay Separate From Rule Text
Promotion does not merge enforcement status into normative law.

### CA09-247 — Governance Amendments Follow Branch B Lifecycle
Branch C can require propagation but does not silently edit engineering law.

---

# 35. Branch D Interface

### CA09-248 — D-ROAD Consumes Promotion State
Roadmap gates distinguish candidate, certified and active V1 states.

### CA09-249 — Branch D Does Not Promote Documents
It records the result from Branch C/owning authority.

### CA09-250 — D-ROAD-06 Waits for Mature V1/Architecture
Implementation sequence uses promoted/near-final technical authority, not drafts.

### CA09-251 — Promotion Delta May Change Readiness
A major V1 activation may update D-ROAD state without changing semantic authority.

---

# 36. Project Brain Interface

### CA09-252 — Brain Tracks Active Edition
The Brain resolves a logical document to its current V1 source.

### CA09-253 — Brain Tracks Predecessor Chain
Historical editions remain discoverable.

### CA09-254 — Brain Surfaces Rewrite State
AUDITED, CANDIDATE, CERTIFIED and ACTIVE are queryable.

### CA09-255 — Brain Links Fidelity Evidence
Promotion records can expose rewrite maps and audits.

### CA09-256 — Brain Does Not Auto-Promote
Derived status changes require governed certification/promotion.

---

# 37. Rewrite Finding Taxonomy

### RWP-01 — Semantic Loss
Accepted current meaning disappeared.

### RWP-02 — Semantic Invention
Rewrite introduced unsupported meaning.

### RWP-03 — Requirement Weakening
Mandatory behaviour was softened.

### RWP-04 — Requirement Strengthening
Optional/recommended behaviour became mandatory without authority.

### RWP-05 — Condition Loss
Trigger/scope/precondition disappeared.

### RWP-06 — Negation Loss
A prohibition became permission/ambiguity.

### RWP-07 — Quantifier Drift
Cardinality changed.

### RWP-08 — Ownership Drift
Rewrite implies wrong authority owner.

### RWP-09 — Boundary Collapse
Distinct semantic layers were merged.

### RWP-10 — Legacy Resurrection
Retired/superseded concept returned.

### RWP-11 — Stable-ID Drift
Durable identity/reference changed incorrectly.

### RWP-12 — Alias/Migration Loss
Required historical interpretation disappeared.

### RWP-13 — Evidence Inflation
Historical/planned evidence became current proof.

### RWP-14 — Evidence Erasure
Known limitation/failure disappeared.

### RWP-15 — Unknown Erasure
Open uncertainty was silently treated as solved.

### RWP-16 — Deferral Loss
Downstream owner/boundary disappeared.

### RWP-17 — Cross-Reference Break
Current source link no longer resolves.

### RWP-18 — Rule-ID Break
Stable normative references became invalid.

### RWP-19 — Partial Supersession Loss
Still-current old scope was accidentally archived.

### RWP-20 — Duplicate Active Authority
Old and new editions both remain operationally current.

### RWP-21 — Candidate-As-Authority
Uncertified rewrite is treated as current source.

### RWP-22 — Promotion Without Rollback
Previous valid state cannot be recovered.

### RWP-23 — Partial Package Promotion
Related documents/registries activate inconsistently.

### RWP-24 — Post-Promotion Index Drift
Brain/index/navigation still directs users to obsolete authority.

### RWP-25 — Systemic Rewrite Fidelity Failure
The V1 rewrite programme cannot reliably prove preservation of accepted meaning.

---

# 38. Severity Guidance

### CA09-257 — Editorial Defects May Be AUD-1/AUD-2
Formatting or harmless navigation issues may be low severity.

### CA09-258 — Requirement/Interface Drift Is AUD-3+
Meaning changes affecting downstream consumers escalate.

### CA09-259 — Identity/Persistence/Authority Drift Is AUD-4+
Stable-ID or semantic-owner corruption is high consequence.

### CA09-260 — Systemic Fidelity Failure Is AUD-5
If V1 rewrites cannot be trusted to preserve accepted truth, global lock stops.

---

# 39. Rewrite Audit Record

```text
Rewrite Row ID:
Logical Document ID:
Source Edition:
Target V1 Edition:
Rewrite Scope:
Predecessor(s):
Source Disposition Map:
Amendments Incorporated:
Stable IDs / Rule IDs:
Historical Content Routed:
Unknowns / Deferrals:
Fidelity Audit A:
Fidelity Audit B:
Cross-Reference Check:
Identity Check:
Open Findings:
Certification State:
Promotion Target:
Promotion Evidence:
Rollback Baseline:
Post-Promotion Check:
Final Active Source:
```

### CA09-261 — Record Is Derived
The rewrite row proves transformation; it is not the normative source.

### CA09-262 — One Row May Cover Package Promotion
A tightly coupled family may use a package-level record referencing member records.

---

# 40. Rewrite Coverage States

### CA09-263 — NOT READY
Prerequisite reconciliation incomplete.

### CA09-264 — READY FOR REWRITE
Semantic scope sufficiently resolved.

### CA09-265 — SEMANTIC CANDIDATE
Pass 1 exists.

### CA09-266 — FIDELITY A PASS
Semantic incorporation proven.

### CA09-267 — NORMALISED CANDIDATE
Pass 2 exists.

### CA09-268 — FIDELITY B PASS
Final candidate meaning proven.

### CA09-269 — CERTIFICATION READY
All promotion prerequisites satisfied.

### CA09-270 — V1 ACTIVE
Promotion/integrity check completed.

### CA09-271 — BLOCKED
Rewrite/promotion cannot continue.

### CA09-272 — ROLLED BACK
Candidate activation was reversed safely.

---

# 41. Automation / Tooling Handoff

### CA09-273 — Stable-ID Diff Can Be Automated
Changes to durable IDs/rule IDs should be surfaced.

### CA09-274 — Cross-Reference Validation Can Be Automated
Missing document/rule targets should be detected.

### CA09-275 — Forbidden Legacy Token Scan Can Assist
Known obsolete engine paths/retired terms can be flagged as candidates.

### CA09-276 — MUST/SHOULD/MAY Diff Can Assist
Normative strength changes can be highlighted for review.

### CA09-277 — Negation Diff Can Assist
Loss/addition of prohibitions deserves special attention.

### CA09-278 — Quantifier Diff Can Assist
Numbers/exactly/at-least changes should be highlighted.

### CA09-279 — Heading/Structure Diff Is Supporting
Tools track moved sections but do not prove semantic preservation alone.

### CA09-280 — Semantic Review Cannot Be Fully Automated
Reasoning under authority remains necessary for consequential rewrites.

---

# 42. Delta Reconciliation After Candidate Creation

### CA09-281 — New Upstream Authority Invalidates Affected Candidate Scope
A candidate is not frozen against reality because rewrite started.

### CA09-282 — Delta Is Scoped
Only sections/rows consuming changed authority reopen.

### CA09-283 — Fidelity Checks Re-Run After Material Delta
The updated candidate proves incorporation again.

### CA09-284 — Promotion Pauses During Unprocessed Material Delta
Do not activate a knowingly stale V1 candidate.

### CA09-285 — Nonsemantic Metadata Delta Need Not Reopen Semantics
Minor source metadata changes reconcile proportionally.

### CA09-286 — Final Freeze Requires Delta Queue Empty
No known material upstream change remains unprocessed at certification.

---

# 43. Individual Document Rewrite Gate

A V1 candidate may proceed to certification/promotion only when:

```text
[ ] rewrite prerequisites satisfied
[ ] rewrite scope explicit
[ ] all material predecessor statements dispositioned
[ ] current authority preserved
[ ] approved amendments incorporated
[ ] no unsupported semantic invention
[ ] no requirement weakening/strengthening
[ ] conditions/negations/quantifiers preserved
[ ] terminology normalised
[ ] legacy/prototype wording removed or routed
[ ] stable IDs / rule IDs preserved or migrated correctly
[ ] historical aliases/tombstones retained where required
[ ] unknowns/deferrals remain truthful
[ ] cross-family handoffs remain correct
[ ] current evidence claims remain truthful
[ ] structure/readability improved without ownership drift
[ ] Fidelity Audit A passes
[ ] Fidelity Audit B passes
[ ] cross-reference validation passes
[ ] predecessor/archive disposition recorded
[ ] rollback baseline exists
[ ] no blocking RWP finding remains
```

---

# 44. Family / Package Rewrite Gate

```text
[ ] member ownership boundaries remain clear
[ ] shared invariant/register sources are stable
[ ] cross-member references resolve
[ ] no old edition remains equal-active
[ ] package manifest is current
[ ] member Fidelity A/B checks pass
[ ] package-level interface audit passes
[ ] package-level legacy disposition is complete
[ ] package rollback is feasible
[ ] downstream consumers are ready for new active source
```

---

# 45. Whole-Corpus Promotion Requirements

Before the final global V1 lock, Branch C must prove:

```text
[ ] every V1-required logical document has a certified active edition
[ ] active navigation resolves to current V1 sources
[ ] no uncertified candidate masquerades as authority
[ ] superseded editions are removed from active precedence
[ ] major amendment chains are incorporated into direct current truth
[ ] stable IDs / rule IDs remain traceable
[ ] historical aliases/tombstones remain available where required
[ ] old Unreal/Summer/POC instructions do not pollute active authority
[ ] evidence status is normalised
[ ] unknowns/deferrals are explicit and owned
[ ] cross-family handoffs survive rewrite
[ ] family/package manifests are complete
[ ] fidelity evidence exists for consequential rewrites
[ ] post-promotion integrity checks pass
[ ] rollback/provenance exists
[ ] no unresolved RWP-25 systemic fidelity failure remains
[ ] no unresolved in-scope AUD-4/AUD-5 rewrite defect remains
```

---

# 46. Current Programme Integration Snapshot

### CA09-287 — FCC-14 Step 1E Is Complete
The final FCC package architecture is four volumes.

### CA09-288 — FCC-14A Is Complete
The cross-realm semantic certification volume reports zero open FCC semantic holds.

### CA09-289 — Abysscap Amendment Is Closed
The former Deepcap ambiguity is a model narrow amendment for V1 rewrite propagation.

### CA09-290 — FCC-14B Is Complete
The semantic art-handoff volume is now complete with zero semantic holds; final art values remain deliberately downstream.

### CA09-291 — FCC-14C/D Remain the Current FCC Package Path
FCC-14C must carry the Forge/technical/validation/migration handoff and FCC-14D still owns the formal final FCC package lock.

### CA09-292 — PRD-01 Remains Working Under a Certified Governance Baseline
PRD-01 is a controlled downstream consumer that must ingest final FCC-14/Branch C deltas before freeze, while the certified Branch B corpus remains current engineering governance.

### CA09-293 — Branch D Is in Control/Maintenance Mode
Its formal gates consume V1 certification/promotion state rather than define it.

These snapshot statements require future delta reconciliation as the programme advances.

---

# 47. C-AUD-09 Acceptance Gate

C-AUD-09 may be theoretically locked when the project accepts that it has defined:

```text
[ ] foundational rewrite doctrine
[ ] rewrite prerequisites
[ ] two-pass promotion model
[ ] source-disposition actions
[ ] semantic preservation rules
[ ] terminology normalisation
[ ] structural normalisation
[ ] splitting/merging rules
[ ] amendment incorporation
[ ] Abysscap model case
[ ] stable-ID preservation
[ ] evidence normalisation
[ ] legacy removal from active prose
[ ] unknown/deferral treatment
[ ] cross-reference normalisation
[ ] metadata normalisation
[ ] rule/requirement ID normalisation
[ ] V1 candidate package
[ ] Fidelity Audit A
[ ] Fidelity Audit B
[ ] diff review
[ ] promotion states
[ ] promotion gate
[ ] active-path replacement
[ ] Git/repository interface
[ ] rollback rules
[ ] post-promotion integrity check
[ ] clean-prose rules
[ ] table/register/generated-view rules
[ ] family-level rewrite order
[ ] cross-family rewrite order
[ ] FCC-14 interface
[ ] PRD interface
[ ] ENG-GOV/B-OPS interface
[ ] Branch D interface
[ ] Project Brain interface
[ ] RWP-01 through RWP-25 taxonomy
[ ] severity guidance
[ ] rewrite audit record
[ ] coverage states
[ ] automation handoff
[ ] delta reconciliation
[ ] individual rewrite gate
[ ] family/package rewrite gate
[ ] whole-corpus promotion requirements
```

---

# 48. Immediate Handoff

After C-AUD-09 is accepted, proceed to:

> **C-AUD-10 — Leyforge Master V1 Certification Register v0.1**

The Branch C sequence becomes:

```text
C-AUD-00 — What does V1 mean?
C-AUD-01 — What sources exist?
C-AUD-02 — Who owns each truth?
C-AUD-03 — Do meanings agree?
C-AUD-04 — Are identities/migrations coherent?
C-AUD-05 — Do requirements/handoffs connect?
C-AUD-06 — Are contracts complete?
C-AUD-07 — Is proof valid?
C-AUD-08 — Is legacy safely separated?
C-AUD-09 — Can reconciled truth become clean V1?
        ↓
C-AUD-10 — What is the exact certification state of every V1 document?
        ↓
C-AUD-11 — Does the whole corpus pass the final lock?
```

C-AUD-10 will define the authoritative Branch C certification ledger: document/family registration, required audit profiles, per-audit status, findings/severity, rewrite state, evidence state, V1 candidate, certification result, exceptions, active promoted file, package status, delta/reopen state, readiness queries and global blocker views.

---

# 49. Foundational Statement

> **The purpose of a V1 rewrite is not to preserve the appearance of every draft. It is to preserve the accepted truth of every draft that still matters.**

Leyforge V1 should read as though the project already knew what it now knows.

Git, the Brain, audit records, ADRs and archives remember how hard it was to get there.

The active document should simply be right.

---

**End of C-AUD-09 v0.1**
