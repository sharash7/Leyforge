# C-AUD-08 — Leyforge Legacy, Supersession & Archive Disposition Audit Standard

**Document ID:** C-AUD-08  
**Title:** Leyforge Legacy, Supersession & Archive Disposition Audit Standard  
**Version:** v0.1  
**Status:** BRANCH C LOCK CANDIDATE — READY FOR REVIEW / ACCEPTANCE  
**Branch:** Branch C — V1 Documentation Audit & Finalisation  
**Project:** Leyforge  
**Date:** 30 August 2026  

**Parent Authority:** C-AUD-00 through C-AUD-07  
**Primary Interfaces:** C-AUD-01 Master Corpus Inventory; C-AUD-02 authority/precedence; C-AUD-03 semantic consistency; C-AUD-04 identity/migration; C-AUD-07 evidence; FCC-12/13/14; ENG-GOV-08/09/11/14/15; B-OPS; PRD; D-ROAD; LF-BRAIN; Git/repository history; legacy POC code; historical registries; save fixtures; archive packages  
**Owns:** Branch C methodology for classifying, superseding, retiring, preserving, archiving and sanitising legacy documentation/evidence so the V1 active corpus is clean without destroying required provenance or migration history  
**Does Not Own:** semantic replacement decisions, engineering deprecation law, exact Git branch/tag commands, save-loader implementation, final archive filesystem layout, legal retention policy, or new canon created merely to explain legacy material

---

# 00. Purpose

C-AUD-08 defines how Leyforge handles the enormous amount of project material that is useful, historically important, migration-relevant, superseded, obsolete, duplicated or no longer allowed to act as current authority.

The governing question is:

> **Can Leyforge preserve everything needed to understand, migrate, verify and learn from its history while ensuring that no obsolete document, engine assumption, registry row, ID, prototype behaviour, old test, archived bundle or superseded term can masquerade as current V1 truth?**

The goal is not deletion.

The goal is **controlled historical separation**.

A healthy V1 corpus must make it easy to answer both:

> “What is true now?”

and:

> “What used to be true, why did it change, and what old persistent data still depends on that history?”

without confusing those two questions.

---

# 01. Foundational Legacy Doctrine

### CA08-001 — History Is Preserved, Authority Is Not
Superseded material may remain valuable without remaining current authority.

### CA08-002 — Legacy Is a Relationship, Not an Insult
A legacy artifact may be excellent evidence or migration input even when it must not guide current implementation.

### CA08-003 — Supersession Must Be Explicit
Material does not cease being current merely because a newer-looking file exists.

### CA08-004 — Archive Must Not Become a Shadow Active Corpus
Historical material must remain discoverable without forcing contributors to guess which archived copy is current.

### CA08-005 — Current V1 Paths Prefer Current Truth
The normal operational source tree and Brain navigation should lead contributors to current authority first.

### CA08-006 — No Silent Historical Deletion
Material with semantic, migration, evidence, decision or provenance value is not removed without recorded disposition.

### CA08-007 — Preservation Does Not Require Duplication Everywhere
One well-indexed immutable archive copy plus provenance can be preferable to many uncontrolled duplicates.

### CA08-008 — Historical Implementation Does Not Become Current Design
Working POC behaviour remains implementation/evidence history unless current authority explicitly re-adopts it.

### CA08-009 — Migration History Is Part of Current Compatibility
Retired IDs, aliases, old schema meanings and supported save versions may remain operationally relevant long after their source design is superseded.

### CA08-010 — Legacy Interpretation Follows Current Authority
When current canon explains how old content maps forward, the current migration rule governs the interpretation of the legacy artifact.

---

# 02. Legacy Audit Object Model

C-AUD-08 distinguishes the following historical objects.

### CA08-011 — Superseded Document
A formerly current document replaced within all or part of its authority scope.

### CA08-012 — Superseded Edition
An older meaningful edition of the same logical document.

### CA08-013 — Retired Concept
A concept intentionally removed from current active design.

### CA08-014 — Deprecated Concept
A concept still supported temporarily or for compatibility but discouraged/forbidden for new use.

### CA08-015 — Historical Alias / Term
A prior name retained for search, migration or provenance.

### CA08-016 — Retired Stable ID
A durable identifier that no longer names active canonical content but remains reserved.

### CA08-017 — Migration Source
An old representation that current migration logic must still interpret.

### CA08-018 — Compatibility Artifact
A deliberately retained object/schema/definition used only to preserve old data.

### CA08-019 — Historical Evidence Artifact
An old test, benchmark, prototype, screenshot, log, POC guide or implementation result.

### CA08-020 — Historical Implementation Artifact
Old source code, scenes, assets or configuration used for archaeology rather than current architecture.

### CA08-021 — Rejected Alternative
A documented approach deliberately not adopted.

### CA08-022 — Generated Legacy Export
An old PDF/DOCX/combined bundle produced from a former source edition.

### CA08-023 — Archive Container
A ZIP/tag/branch/package preserving a historical corpus snapshot.

### CA08-024 — Tombstone Record
A durable lightweight record proving that a removed/retired identity, document or path once existed and explaining its disposition.

### CA08-025 — Supersession Relationship
A typed link explaining how old and new material relate.

---

# 03. Disposition Vocabulary

C-AUD-08 consumes the primary C-AUD-00/01 dispositions and specialises them for legacy audit.

### CA08-026 — `CURRENT ACTIVE`
Required current authority or operational source.

### CA08-027 — `CURRENT SUPPORTING`
Current supporting material that remains active but is not primary semantic authority.

### CA08-028 — `EVIDENCE — CURRENT`
Current evidence supporting active claims.

### CA08-029 — `EVIDENCE — HISTORICAL`
Historical evidence retained for lessons, regression intent or comparison.

### CA08-030 — `SUPERSEDED`
Former authority replaced by another accepted source.

### CA08-031 — `DEPRECATED`
Still understood/supported but not valid for new normal use.

### CA08-032 — `MIGRATION ONLY`
Retained solely because supported old data may reference it.

### CA08-033 — `COMPATIBILITY ONLY`
Retained as a safe historical representation without normal canonical use.

### CA08-034 — `HISTORICAL`
Retained for provenance/context, with no active operational dependency.

### CA08-035 — `ARCHIVE`
Retained outside normal active navigation.

### CA08-036 — `RETIRED`
Explicitly removed from current semantics/use.

### CA08-037 — `REJECTED`
A considered approach/content path deliberately not adopted.

### CA08-038 — `GENERATED LEGACY`
Derived historical output whose source-of-truth is elsewhere.

### CA08-039 — `DUPLICATE — PRESERVATION NOT REQUIRED`
A redundant physical copy with no unique provenance once exact equivalence and safe archive coverage are proven.

### CA08-040 — Primary Disposition Does Not Erase Secondary Value
A `SUPERSEDED` document may simultaneously be historical evidence or migration provenance through typed relationships.

---

# 04. Supersession Types

### CA08-041 — Full Supersession
A later authority replaces the entire active scope of an older source.

### CA08-042 — Partial Supersession
Only declared sections/concepts are replaced; unaffected scope may remain active.

### CA08-043 — Edition Supersession
A newer edition of the same logical document replaces an older edition.

### CA08-044 — Authority Transfer
Semantic ownership moves from one document/family to another.

### CA08-045 — Canon Supersession
Accepted design meaning changes or is replaced by later canon.

### CA08-046 — Technical Supersession
Architecture/implementation guidance is replaced while product semantics remain.

### CA08-047 — Evidence Supersession
Newer evidence replaces older evidence for a current claim without deleting the historical result.

### CA08-048 — Terminology Supersession
A canonical term changes while historical aliases remain searchable.

### CA08-049 — Registry Supersession
An older registry/schema representation is replaced by a new canonical representation.

### CA08-050 — Workflow Supersession
An operational procedure is replaced while historical records remain.

### CA08-051 — Tool/Engine Supersession
An implementation technology is replaced without automatically changing product canon.

### CA08-052 — Scope Supersession Must Be Recorded
“Superseded” without describing the affected scope is insufficient where partial authority may remain.

---

# 05. Supersession Record

A material supersession should support:

```text
Supersession ID:
Old Source / Concept:
Old Version:
New Source / Concept:
New Version:
Supersession Type:
Effective Scope:
Effective Status:
Reason / Authority:
Preserved Semantics:
Changed Semantics:
Migration Consequence:
Evidence Consequence:
Downstream Consumers Affected:
Historical Search Aliases:
Archive Location:
Tombstone Required:
Open Actions:
Re-Audit Status:
```

### CA08-053 — Supersession Record Is Derived
The record explains the relationship; it does not replace the owning sources.

### CA08-054 — Effective Scope Must Be Machine/Human Discoverable
Consumers should know whether the entire document or only specific concepts are obsolete.

### CA08-055 — Changed Semantics Require Owner Authority
Branch C records change; it does not invent the new meaning.

### CA08-056 — Downstream Consumers Must Be Rechecked
Supersession is incomplete while active consumers still rely on obsolete authority.

---

# 06. Active-Path Sanitisation

### CA08-057 — Active Navigation Must Prefer Current Authority
Main indexes, Brain views, project READMEs and current folders should lead to the current source.

### CA08-058 — Superseded Sources Need Visible Status
Opening an old document should make its historical/superseded state obvious where practical.

### CA08-059 — Historical Files Must Not Claim Unqualified `FINAL`
Old filenames may be preserved, but active navigation/status metadata must prevent `FINAL` from being interpreted as current.

### CA08-060 — Current Documents Must Not Cite Superseded Rules as Current
Historical references are allowed only when their relationship is clear.

### CA08-061 — Active Build/Agent Instructions Must Not Point to Obsolete Architecture
Current AGENTS/bootstrap/runbooks cannot direct work through Summer/Unreal-era instructions unless explicitly performing archaeology.

### CA08-062 — Active Registries Must Not Import Historical Canon Accidentally
Legacy rows require migration/compatibility treatment rather than normal active registration.

### CA08-063 — Current Search Must Distinguish Historical Results
Search/index systems should expose status so old sources do not outrank current results merely by keyword match.

### CA08-064 — Archive Links Are Typed
Links to history should say why the old source is relevant: migration, evidence, rationale, rejected alternative or provenance.

---

# 07. Document Edition Audit

### CA08-065 — Older Editions Are Not Independent Current Documents
C-AUD-01 logical-document relationships govern edition history.

### CA08-066 — Meaningful Editions Are Preserved
An edition that changed semantics, requirements, migration or evidence remains historically recoverable.

### CA08-067 — Pure Export Copies Need Not All Be Preserved
Redundant format exports may be deduplicated after source/provenance equivalence is proven.

### CA08-068 — Divergent Same-Version Files Are Not Auto-Archived
They require C-AUD-01/02 reconciliation before any copy is demoted.

### CA08-069 — Combined Bundles Do Not Override Source Edition History
A master package is a container/derivative unless authority explicitly makes it source.

### CA08-070 — Final V1 Rewrite Creates a New Certified Edition
Pre-V1 drafts remain historical predecessors after V1 promotion.

### CA08-071 — Pre-V1 Drafts Do Not Remain in the Active Authority Path
Once V1 is certified, normal navigation should point to the V1 edition.

### CA08-072 — Historical Diffability Is Preserved
Git/history/archive should allow material changes to be reconstructed without requiring duplicate active files.

---

# 08. Legacy Engine / Architecture Audit

### CA08-073 — Unreal Assumptions Are Historical Unless Re-Adopted
Old Unreal-specific paths, APIs, asset conventions and architecture must not survive as current requirements by inertia.

### CA08-074 — Summer Engine Assumptions Are Historical Unless Re-Adopted
Summer-specific scenes, runtime structure, save implementation and voxel architecture remain POC history after the rebuild direction changed.

### CA08-075 — Godot Remains Distinct From Old Godot POC Architecture
The current use of Godot does not make every earlier Godot/Summer implementation decision current.

### CA08-076 — Zylann/Voxel Tools Adoption Does Not Delete POC Lessons
Old POC behaviour and failure cases may become PRD evidence/regression requirements.

### CA08-077 — Engine Paths Must Be Demoted
Obsolete `/Game/...`, Summer scene paths, old resource locations and similar paths become migration/evidence metadata only.

### CA08-078 — Architecture Names Need Status
Terms like “Summer worldgen”, “POC registry” or old engine modules should be explicitly historical in current documentation.

### CA08-079 — Rebuild Must Not Copy Architecture by Default
Legacy code reuse requires current authority/evidence justification.

### CA08-080 — Behaviour May Survive While Mechanism Is Retired
A conservation rule or manual acceptance criterion can remain valid even when the code that once implemented it is archived.

---

# 09. Legacy Code Audit

### CA08-081 — Legacy Code Is Implementation Evidence
Old code can prove how a behaviour was achieved, tested or failed.

### CA08-082 — Legacy Code Is Not Current Architecture Authority
Current architecture must arise through PRD/LFE/FORGE-ENG/ADRs.

### CA08-083 — Reusable Algorithms Require Re-Qualification
Copying a legacy algorithm into rebuild code requires current constraints/tests and licensing/provenance where applicable.

### CA08-084 — Legacy Bugs Are Valuable Evidence
Known bugs and workarounds should be preserved as lessons/regression scenarios.

### CA08-085 — Dead Code Does Not Need Active Visibility
Archived code should not clutter the current source tree after its evidence/provenance role is indexed.

### CA08-086 — Historical Code Must Be Reproducibly Identifiable
A tag/branch/commit/archive identifier should locate the frozen POC state where practical.

### CA08-087 — Legacy Code Search Results Need Context
The Brain/README should prevent developers from copying historical code unaware of its status.

### CA08-088 — POC Behavioural Archaeology Is Allowed
Agents may inspect archived code when current sources say historical implementation evidence is relevant.

---

# 10. Legacy Registry & Schema Audit

### CA08-089 — Historical Registries Are Migration Sources
Old arrays/tables/JSON/CSV registries remain useful for mapping historical identity.

### CA08-090 — Historical Registries Do Not Own Current Semantics
FCC-12/13/current registry authority govern V1 identity.

### CA08-091 — Old Numeric IDs Need Version Context
A numeric value without registry/schema version cannot safely regain meaning by position.

### CA08-092 — Retired IDs Remain Reserved
Archiving a source does not free its shipped stable IDs for reuse.

### CA08-093 — Old Block/Item Duplication Is Historical Structure
Separate POC entries must not survive as duplicate current canonical identities unless current lifecycle semantics justify them.

### CA08-094 — Old Generic Materials Need Current Disposition
Legacy generic Stone, Deepstone, Plant Fibre and similar entries must be rebound, migrated, retired, compat-preserved or quarantined under current authority.

### CA08-095 — Deprecated Aliases Remain Discoverable
Search/migration systems should find historical names without treating them as preferred current naming.

### CA08-096 — Tombstones Support Long-Term Migration
Where an old ID/path is no longer represented by a full current definition, a durable tombstone/redirect may preserve safe interpretation.

### CA08-097 — Registry Compaction Cannot Erase Meaning
Long-term storage optimisation must preserve enough alias/tombstone history to load supported persistent data.

### CA08-098 — Compatibility Registry Is Not Canon Registry
Compat-only definitions must remain isolated from normal generation/crafting/progression.

---

# 11. Save & Migration Legacy Audit

### CA08-099 — Supported Save Versions Define Retention Need
A legacy identity/schema remains operationally relevant while supported saves can reference it.

### CA08-100 — Migration Source Data Must Be Preserved
Fixtures, mappings and registry version metadata needed to interpret supported saves cannot be discarded.

### CA08-101 — Unsupported Save Versions Still Need Declared Policy
The project should state whether they are rejected, imported through a compatibility path or intentionally unsupported.

### CA08-102 — Migration Cannot Recreate Retired Canon
Old data may be mapped safely without promoting obsolete architecture/content into normal V1 gameplay.

### CA08-103 — No-Guess Rule Applies
If safe interpretation is impossible, quarantine/compatibility beats nearest-name replacement.

### CA08-104 — Historical Version Meaning Is Immutable
An old numeric/stable ID means what it meant in its original version, even if the current content differs.

### CA08-105 — Migration Auditability Is Retained
The project should be able to explain how old representation became current representation.

### CA08-106 — Migration Support Can Eventually End
Dropping support is a governed compatibility/deprecation decision, not silent archive cleanup.

---

# 12. Historical Evidence Audit

### CA08-107 — Historical Evidence Keeps Its Original Result
A former passing benchmark remains historically passing under its original conditions even if current qualification is stale.

### CA08-108 — Historical Evidence Status Must Be Clear
Current dashboards cannot show old POC PASS alongside current PASS without distinguishing evidence era/status.

### CA08-109 — Regression Intent May Be Promoted
A historical test's *requirement intent* may become current after source reconciliation.

### CA08-110 — Historical Procedure May Be Rewritten
Summer-specific test steps may be replaced by new equivalent procedures while preserving what the old test intended to prove.

### CA08-111 — Test Counts Stay Historical
The number of old assertions is provenance, not current coverage.

### CA08-112 — Old Performance Baselines Are Comparison Evidence
They may inform expectations or methodology but require current reproduction before qualification.

### CA08-113 — Failed Historical Experiments Are Preserved
Rejected/failed approaches should remain discoverable enough to avoid blind rediscovery.

### CA08-114 — Historical Evidence Can Be Superseded Without Deletion
New current evidence takes qualification precedence while old evidence remains archaeology.

---

# 13. POC Manual Test Mapping

### CA08-115 — Separate Intent From Procedure
For each valuable old manual/automated test, identify the behaviour/invariant being tested separately from the Summer-specific steps.

### CA08-116 — Preserve Current-Relevant Intent
Conservation, recovery, accessibility, controller navigation, visual acceptance and other still-valid behaviours may become current requirements/tests.

### CA08-117 — Retire Obsolete Procedure
Scene paths, engine-specific commands and POC-only launch steps that no longer apply remain historical.

### CA08-118 — Preserve Historical Result
The original result stays attached to the old procedure/build.

### CA08-119 — New Test Gets New Evidence Identity
A rebuild test derived from old intent is new current evidence rather than pretending the old evidence was rerun.

### CA08-120 — Mapping Must Not Inflate Coverage
Only behaviours explicitly extracted and re-authorised count toward current requirements.

---

# 14. Rejected Alternative Audit

### CA08-121 — Rejected Alternatives Are Not Current Options by Default
An old design/architecture that was explicitly rejected should remain labelled rejected.

### CA08-122 — Rejection Reason Should Be Retained
Especially for high-cost or high-risk choices, preserve why the alternative failed.

### CA08-123 — Rejected Does Not Mean Forever Impossible
New evidence may justify reopening through the owning decision process.

### CA08-124 — Reopening Requires Explicit Action
A future contributor cannot silently revive an old rejected architecture because it appears convenient.

### CA08-125 — ADRs Are Preferred for Consequential Technical Rejections
Current/future technical choice rationale should flow through governed ADRs.

### CA08-126 — Old Chat Reasoning May Support Provenance
Where no formal source exists, preserved conversation/export may explain history but should be promoted to a governed record before becoming current rationale.

---

# 15. Retired Content Audit

### CA08-127 — Retired Content Leaves Active Canon
A retired concept must not appear in current lists as though merely forgotten.

### CA08-128 — Retired Content May Retain Historical References
Lore/document archaeology can mention it when context clearly marks historical/project-history meaning.

### CA08-129 — Player Save References Require Migration or Compatibility
Retirement does not justify destroying supported persistent instances.

### CA08-130 — Retired Content Cannot Receive New Normal References
Current recipes, worldgen, progression and authored content must not newly depend on retired identity.

### CA08-131 — Retired Names Need Searchability Where Useful
Historical aliases help locate old documents/migration rows.

### CA08-132 — Retirement Reason Need Not Pollute V1 Prose
The clean V1 document states current truth; detailed project-history rationale belongs in ADR/audit/archive where appropriate.

---

# 16. Deprecated Content Audit

### CA08-133 — Deprecated Content Has an Exit Path
A deprecated concept should identify its preferred replacement or retirement plan where applicable.

### CA08-134 — Deprecated Use Must Be Bounded
Existing saves/compat may continue while new authoring is forbidden.

### CA08-135 — Deprecation Is Not Immediate Retirement
Current systems may still need to recognise the old identity.

### CA08-136 — Deprecation End Condition Is Owned
Exact removal timing belongs to the applicable owner/governance process.

### CA08-137 — Deprecation Warnings Are Evidence
Build/validator diagnostics may help prevent new use but do not define the semantic rule.

---

# 17. Terminology & Alias Legacy Audit

### CA08-138 — Historical Names Are Typed
Legacy alias, cultural term, old canonical name and implementation label are distinct.

### CA08-139 — Old Name Search Is Allowed
Search can resolve old terminology to current terms without treating them as synonyms unless canon says so.

### CA08-140 — Canonical Rename Requires Redirect/History
Stable machine identity and player-facing terminology may have different migration needs.

### CA08-141 — False Historical Synonyms Must Not Be Created
Similar legacy names do not justify merging concepts.

### CA08-142 — Retired Generic Terms Can Be Forbidden
Names such as rejected generic portal filler may remain searchable but invalid for new canonical definitions.

### CA08-143 — Current Documentation Should Prefer Current Controlled Terms
Historical terms appear only when migration/history needs them.

---

# 18. Archive Container & Snapshot Audit

### CA08-144 — Important Historical Baselines Need Stable Snapshot Identity
A POC freeze, pre-rebuild baseline or V1 baseline should be identifiable by tag/commit/archive manifest.

### CA08-145 — Snapshot Must Identify Included Scope
Archive contents should be knowable rather than inferred from a vague folder name.

### CA08-146 — Snapshot Integrity Should Be Verifiable
Hashes/manifest/immutable repository history should support later trust where practical.

### CA08-147 — Snapshot Date Is Not Semantic Authority
The timestamp describes capture time, not truth precedence.

### CA08-148 — Snapshot Need Not Duplicate Every Export
Preserve authoritative/editable sources plus required evidence/assets; redundant derived copies may be optional.

### CA08-149 — Archive Restore Should Be Feasible Enough for Archaeology
The project should be able to inspect historical content without relying on disappearing chat context.

### CA08-150 — Executability Is Not Required for Every Archive
An old build may be preserved as source/evidence even when its environment can no longer run.

---

# 19. Archive Location & Navigation Requirements

### CA08-151 — Archive Is Separated From Active Work
Historical corpus should live outside normal active source paths or be clearly status-partitioned.

### CA08-152 — Archive Has an Index
A contributor should know what major historical baselines and document families are retained.

### CA08-153 — Archive Entries Link Forward
Where practical, old sources should identify the current replacement/disposition.

### CA08-154 — Current Sources May Link Back
Migration/rationale sections may point to historical evidence without importing its authority.

### CA08-155 — Archive Search Includes Status
Search results should expose `SUPERSEDED`, `HISTORICAL`, `MIGRATION ONLY`, etc.

### CA08-156 — Archive Path Is Not Authority
Moving a file into archive changes operational status only after authority/disposition is established.

---

# 20. Git / Repository Interface

### CA08-157 — Git Preserves Historical Change
Branch C expects durable history but exact Git policy remains Branch B.

### CA08-158 — Legacy Freeze Should Have Stable Reference
The pre-rebuild POC should be recoverable through a governed tag/branch/commit or equivalent archive.

### CA08-159 — Clean Rebuild Branch Does Not Delete History
A fresh active branch/tree can coexist with preserved legacy history.

### CA08-160 — Active-Tree Cleanup Follows Disposition
Files should not be removed from active paths until current replacement/archive relationship is known.

### CA08-161 — Force-Rewrite of Shared History Is Not a Branch C Solution
Archive cleanliness should not require destroying valuable repository provenance.

### CA08-162 — Generated/Build Junk May Be Excluded
Disposable artifacts without provenance/evidence value need not be retained as historical project sources.

---

# 21. Project Brain Interface

### CA08-163 — Brain Must Distinguish Current and Historical
Navigation should show status prominently enough to prevent authority confusion.

### CA08-164 — Brain Maintains Supersession Links
Current source ↔ predecessor/history relationships should be queryable.

### CA08-165 — Brain Supports Legacy Search
Searching old ID/term/path should help locate migration/history while pointing toward current meaning.

### CA08-166 — Brain Lessons Can Capture Archaeology
Useful implementation shortcuts/failures discovered from legacy inspection may become Skills/Procedures/Lessons only after current authority validation.

### CA08-167 — Brain Does Not Copy Full Archive as New Authority
Indexes/summaries link to preserved artifacts.

### CA08-168 — Brain Health Can Flag Active→Superseded References
A future validator may detect current documents that cite archived/superseded sources as active authority.

### CA08-169 — Brain Can Surface Tombstones
Retired IDs/documents should remain searchable without appearing current.

---

# 22. ENG-GOV / B-OPS Interface

### CA08-170 — ENG-GOV-14 Governs Engineering Deprecation
Branch C audits disposition consistency; Branch B owns engineering waiver/deprecation lifecycle.

### CA08-171 — ENG-GOV-11 Governs ADR History
Consequential technical supersession/rationale should retain ADR lineage where applicable.

### CA08-172 — ENG-GOV-08/09 Govern Runtime Migration / Stable Identity
C-AUD-08 audits documentation/archive treatment without replacing implementation rules.

### CA08-173 — B-OPS Operationalises Retired-ID and Legacy Checks
Validator maturity/debt remains B-OPS responsibility.

### CA08-174 — Branch B Certified Baseline Is Current
Old pre-certification ENG-GOV/B-OPS drafts become historical predecessors, not equal active governance sources.

### CA08-175 — Governance History Remains Available
Superseded rules may be needed to interpret historical engineering decisions.

---

# 23. FCC Interface

### CA08-176 — FCC-12/13 Current Locks Outrank Legacy Content Models
Old material/registry semantics cannot survive current canon by inertia.

### CA08-177 — FCC-14 Certification Can Demote Legacy Semantics
Where FCC-14 certifies a current relationship, conflicting old realm/portal assumptions become superseded/history.

### CA08-178 — FCC-14 Step 1D Is a Model Legacy Certification
It preserves portal migration identity while rejecting resurrection of obsolete portal families.

### CA08-179 — Old Portal Art/Engine Metadata Is Evidence
Historical visuals/paths/engine structure may assist migration/art archaeology but cannot create current portal semantics.

### CA08-180 — Deepcap Hold Is Not Solved by Archive Disposition
Archiving old sources cannot convert an unresolved current semantic relationship into a decision.

---

# 24. PRD Interface

### CA08-181 — PRD Consumes Legacy Evidence Selectively
POC capability/tests/failures may become current requirements/risk evidence after mapping.

### CA08-182 — PRD Does Not Inherit Legacy Architecture
Summer implementation should not silently determine LFE architecture.

### CA08-183 — PRD Owns Technology Re-Qualification
Old performance/capability claims require current evidence through the PRD ladder.

### CA08-184 — Legacy Test Mapping Is a PRD Evidence Task
C-AUD-08 defines disposition rules; PRD-05/07 may implement the detailed current requirement/test crosswalk.

### CA08-185 — Alias/Tombstone Technical Storage Remains PRD/LFE Work
C-AUD-08 requires semantic/history retention but does not pick hash/index/storage structures.

### CA08-186 — PRD Delta Must Preserve Legacy Status
A historical source cannot become current merely because PRD cites it.

---

# 25. Branch D Interface

### CA08-187 — Branch D Tracks Legacy Preservation as Readiness
Legacy archive readiness is one rebuild-readiness domain.

### CA08-188 — Superseded Work Leaves Critical Path
Once replacement authority is accepted, old work should not remain a current dependency except for migration/evidence.

### CA08-189 — Archive Preparation Can Precede Rebuild
POC freeze/archive is safe support work once governance prerequisites exist.

### CA08-190 — D-ROAD Does Not Decide Semantic Disposition
Roadmap may schedule archive work but Branch C/owners determine current vs historical meaning.

### CA08-191 — Rebuild Cannot Start From Unfrozen Legacy Ambiguity
The project should know what historical state is being preserved before destructive active-tree cleanup.

---

# 26. External / Third-Party Historical Material

### CA08-192 — External References Are Not Project Authority by Default
Old upstream docs/examples remain evidence/reference.

### CA08-193 — Version Matters
Historical plugin documentation may be useful only for the corresponding version.

### CA08-194 — Vendored/Fork History Must Be Preserved Where Needed
Local modifications to third-party code require enough provenance to understand current/upstream relationships.

### CA08-195 — License/Attribution Material Must Not Be Lost
Archive cleanup cannot remove required legal notices or provenance.

### CA08-196 — Deprecated Dependencies Need Migration Records
Removing/replacing a dependency should preserve rationale/compatibility information where operationally important.

---

# 27. Chat / Conversation Archaeology

### CA08-197 — Chat Is Not Default Canon
Conversation history may contain decisions but current project authority should exist in governed documents/registries.

### CA08-198 — Important Hidden Decisions Must Be Promoted Before V1
If the final audit discovers a materially relied-upon decision existing only in chat, it becomes a trace/authority gap until promoted.

### CA08-199 — Conversation Exports May Be Historical Evidence
They can preserve rationale, wording and project history.

### CA08-200 — Chat Recency Does Not Establish Precedence
A later casual conversation cannot silently overrule locked authority.

### CA08-201 — Archive Should Reduce Chat Dependence
A fresh contributor must not need old conversation memory to know what is current.

---

# 28. Physical Deletion Rules

### CA08-202 — Deletion Is the Last Step, Not the First
Classification, deduplication and archive coverage precede removal.

### CA08-203 — Authoritative Source Is Never Deleted Merely as Duplicate
Exact duplicate file instances may be removed only after the primary governed source is proven.

### CA08-204 — Unique Historical Semantics Prevent Deletion
Any unique decision, migration meaning, evidence result or provenance requires retention.

### CA08-205 — Unique Legal/Attribution Data Prevents Deletion
Required notices/provenance remain.

### CA08-206 — Pure Generated Redundancy May Be Deleted
Reproducible exports/build artifacts with no unique historical value may be omitted from archive when source and generator are preserved.

### CA08-207 — Deletion Candidate Requires Recorded Basis
The inventory should say why no preservation value remains.

### CA08-208 — Git History May Satisfy Historical Retention
Where an artifact is reliably recoverable and not needed as a standalone snapshot, repository history may be sufficient.

### CA08-209 — External Backup Does Not Replace Project Provenance by Itself
A personal copy may reduce disaster risk but should not be the only evidence that a governed artifact ever existed.

---

# 29. Tombstone Audit

### CA08-210 — Tombstones Preserve Existence
A tombstone records that an ID/document/path/concept existed and is no longer active.

### CA08-211 — Tombstone Identifies Replacement/Disposition
Where applicable it points to current target, migration outcome, retirement or compatibility handling.

### CA08-212 — Tombstone Does Not Recreate Full Authority
It is a navigation/migration record, not a resurrected definition.

### CA08-213 — Tombstones Are Durable for Persistent IDs
Any retired shipped ID remains reserved and searchable.

### CA08-214 — Tombstone Storage May Be Compact
Exact storage/compaction is technical provided semantic recoverability is preserved.

### CA08-215 — Tombstone Chain Must Terminate
Rename/deprecation histories should resolve deterministically to current, compatibility or retired outcome.

---

# 30. Archive Integrity & Recoverability

### CA08-216 — Important Archive Artifacts Need Integrity Evidence
Hash, Git object identity or controlled storage should allow corruption detection where practical.

### CA08-217 — Archive Manifest Is Preferred
Major baselines should list important contents and status.

### CA08-218 — Archive Loss Is an Audit Finding
Missing unique migration/evidence/history data that the project claims to preserve must be surfaced.

### CA08-219 — Archive Corruption Is Not Silent
Unreadable files remain registered as integrity defects.

### CA08-220 — Restore Drill May Be Required for Critical Baselines
Where rebuild/migration depends heavily on archived state, the project may verify that the snapshot is actually readable/recoverable.

---

# 31. Legacy Finding Taxonomy

### LEG-01 — Active Legacy Leakage
Superseded/historical material is used as current authority.

### LEG-02 — Missing Supersession Link
Old/new sources exist but their relationship is not recorded.

### LEG-03 — Partial Supersession Ambiguity
It is unclear which old scope remains active.

### LEG-04 — Zombie Engine Assumption
Retired Unreal/Summer/POC architecture survives in current requirements.

### LEG-05 — Zombie Registry Identity
Retired/legacy row re-enters active canonical registry.

### LEG-06 — Retired ID Reuse
Historical semantic ID is assigned new unrelated meaning.

### LEG-07 — Missing Migration Source
Required historical mapping/fixture/version data is absent.

### LEG-08 — Missing Tombstone / Redirect
Retired durable identity cannot be interpreted safely.

### LEG-09 — Historical Evidence as Current
Old test/benchmark/prototype is presented as present qualification.

### LEG-10 — Legacy Procedure as Current
Old engine-specific test/workflow is still instructed operationally.

### LEG-11 — Missing Historical Result
Procedure/source exists but the result/provenance needed for evidence interpretation is lost.

### LEG-12 — Archive Shadow Authority
An archive copy is treated as equal/current because status is unclear.

### LEG-13 — Duplicate Archive Noise
Redundant copies obscure actual source lineage.

### LEG-14 — Lost Rejected Rationale
A costly/high-risk rejected approach lacks enough rationale to prevent rediscovery.

### LEG-15 — Chat-Only Material Decision
Current behaviour relies on unpromoted conversation context.

### LEG-16 — Broken Forward Link
Historical source has no discoverable current replacement/disposition where one should exist.

### LEG-17 — Broken Backward Provenance
Current source cannot trace a consequential superseded/migrated predecessor.

### LEG-18 — Compatibility Leakage
Compat-only content appears in normal current generation/progression.

### LEG-19 — Test Leakage
Historical/test-only content appears in current production behaviour.

### LEG-20 — Premature Deletion
Artifact removed before unique value/archive coverage was established.

### LEG-21 — Archive Integrity Failure
Claimed retained source is corrupt/unreadable/unverifiable.

### LEG-22 — Unsupported Version Ambiguity
Project cannot state treatment of an old persistent version.

### LEG-23 — Superseded Consumer
Current downstream source still depends on obsolete authority.

### LEG-24 — Unprocessed Historical Delta
New current authority has not updated affected legacy/supersession records.

### LEG-25 — Systemic Legacy Contamination
The active corpus cannot be reliably separated from historical/prototype authority.

---

# 32. Severity Guidance

### CA08-221 — Cosmetic Archive Defects May Be AUD-1/AUD-2
Minor labels or redundant copies are lower severity when authority is otherwise clear.

### CA08-222 — Active Superseded References Are AUD-3+
A current consumer relying on obsolete authority can propagate cross-document errors.

### CA08-223 — Persistent Identity / Migration Legacy Defects Are AUD-4+
Retired-ID reuse, missing migration history or compatibility leakage can corrupt long-lived worlds.

### CA08-224 — Systemic Legacy Contamination Is AUD-5
If contributors cannot tell current V1 truth from POC/history, global certification is not trustworthy.

---

# 33. Legacy Audit Record

A legacy/disposition row may record:

```text
Legacy Row ID:
Artifact / Concept:
Logical Document / Stable ID:
Historical Version / Era:
Old Authority Domain:
Current Authority / Replacement:
Supersession Type:
Primary Disposition:
Secondary Value:
Migration Dependency:
Evidence Dependency:
Historical Alias(es):
Active Consumers:
Archive Location:
Snapshot / Commit / Hash:
Tombstone:
Deletion Eligibility:
Finding Type:
Severity:
Resolution Owner:
Re-Audit Result:
```

### CA08-225 — Records Link to C-AUD-01 Inventory
Legacy audit should reuse inventory identities rather than duplicate file bookkeeping.

### CA08-226 — Records Link to C-AUD-04 Migration
Stable-ID/save relationships should connect to the identity/migration audit.

### CA08-227 — Records Link to C-AUD-07 Evidence
Historical tests/benchmarks should retain evidence status/claim relationships.

---

# 34. Archive / Disposition Coverage States

### CA08-228 — `CURRENT CLEAN`
Artifact is correctly active and no legacy ambiguity remains.

### CA08-229 — `SUPERSEDED — ARCHIVED`
Old authority is preserved and removed from active precedence.

### CA08-230 — `MIGRATION RETAINED`
Historical artifact remains because supported data needs it.

### CA08-231 — `EVIDENCE RETAINED`
Historical artifact remains for tests/lessons/comparison.

### CA08-232 — `COMPATIBILITY RETAINED`
Artifact remains only to preserve old content safely.

### CA08-233 — `RETIRED — TOMBSTONED`
No active definition remains; historical identity is reserved/searchable.

### CA08-234 — `REJECTED — RATIONALE RETAINED`
Alternative is not active but reasoning is preserved.

### CA08-235 — `ARCHIVE ONLY`
No active/migration/evidence role beyond history.

### CA08-236 — `DELETION ELIGIBLE`
No unique semantic/evidence/provenance/legal value remains and reliable retained source/history exists.

### CA08-237 — `BLOCKED`
Disposition cannot be finalised because authority/provenance/migration need is unresolved.

---

# 35. Audit Execution Procedure

### Phase 1 — Consume Master Inventory
Begin from C-AUD-01 logical documents, editions, files and containers.

### Phase 2 — Resolve Current Authority
Use C-AUD-02 to identify current owner/replacement.

### Phase 3 — Compare Semantics
Use C-AUD-03 to determine what meaning changed, survived or remains unresolved.

### Phase 4 — Identify Identity/Migration Dependencies
Use C-AUD-04 for IDs, aliases, saves and compatibility.

### Phase 5 — Identify Evidence Value
Use C-AUD-07 for prototypes, tests, benchmarks and manual records.

### Phase 6 — Classify Supersession Type
Full/partial/edition/technical/canon/evidence/etc.

### Phase 7 — Assign Disposition
Current, superseded, migration-only, evidence-history, compatibility, archive, retired, rejected or deletion-eligible.

### Phase 8 — Sanitize Active Consumers
Remove/redirect current references that treat legacy material as active authority.

### Phase 9 — Build Forward/Backward Links
Old → current replacement and current → historical provenance where consequential.

### Phase 10 — Freeze Archive Baselines
Preserve important POC/pre-rebuild/V1 snapshots through governed repository/archive mechanisms.

### Phase 11 — Validate Recoverability
Ensure unique migration/evidence/history data remains readable.

### Phase 12 — Re-Audit
Close only when active path and historical path are both unambiguous.

---

# 36. Automated / Tooling Handoff

### CA08-238 — Active→Superseded Reference Detection
Tooling should identify current documents/registries pointing to superseded sources where metadata allows.

### CA08-239 — Retired-ID Reference Detection
Current content should fail or warn when creating new references to retired IDs.

### CA08-240 — Alias/Tombstone Graph Validation
Cycles, missing targets and ambiguous retirement histories should be detectable.

### CA08-241 — Duplicate Hash Reporting
Exact historical duplicates can be surfaced for safe archive compaction.

### CA08-242 — Archive Manifest Validation
Expected critical files/hashes can be checked mechanically.

### CA08-243 — Historical Status Search
Brain/search tooling should expose current/historical disposition.

### CA08-244 — Legacy Engine Token Scan
Known obsolete paths/engine identifiers may be scanned as candidate findings, subject to semantic review.

### CA08-245 — Automation Cannot Decide Historical Value Alone
A file with no current references may still contain unique rationale/evidence/migration data.

---

# 37. Delta Reconciliation

### CA08-246 — New Current Authority Reopens Legacy Relationships
When a source supersedes another, affected records/consumers must update.

### CA08-247 — New Migration Support Extends Retention
Supporting an older save/schema may require retaining additional historical data.

### CA08-248 — Dropped Migration Support May Reduce Operational Retention
After governed removal, some artifacts may move from migration-retained to archive-only.

### CA08-249 — New Evidence Can Reclassify Rejected Alternatives
A previously rejected approach may be reopened by owner process without erasing historical rejection.

### CA08-250 — Archive Compaction Is a Controlled Delta
Removing duplicate physical copies requires updated manifests/inventory.

### CA08-251 — Final Freeze Requires No Unprocessed Legacy Delta
Known V1-relevant supersession/archive changes must be incorporated before global lock.

---

# 38. Current Leyforge Validation Cases

## 38.1 Unreal → Summer → Godot + Zylann

The project has passed through multiple implementation architectures.

Correct disposition:

```text
UNREAL-SPECIFIC IMPLEMENTATION
    → HISTORICAL / SUPERSEDED TECHNICAL

SUMMER POC IMPLEMENTATION
    → HISTORICAL IMPLEMENTATION + EVIDENCE

GODOT + ZYLANN CURRENT REBUILD DIRECTION
    → CURRENT TECHNICAL DIRECTION
       subject to PRD/LFE qualification
```

The old architectures remain useful archaeology; they do not remain current merely because some design language originated there.

## 38.2 Historical POC Registry

The old registry is:

- migration evidence;
- identity archaeology;
- historical implementation evidence.

It is not the current FCC-13 registry authority.

Rows such as Deepstone, old Block/Item duplicates and old generic categories must receive explicit modern dispositions.

## 38.3 FCC-14 Portal Legacy

Step 1D demonstrates the desired rule:

- old portal assets/paths/names can be migration evidence;
- aliases cannot create new destinations;
- obsolete portal families cannot reappear;
- stable IDs cannot be reused;
- compatibility/test content stays isolated;
- no guessed replacement is allowed.

## 38.4 POC Manual Test Guide

The guide remains valuable for:

- regression intent;
- manual acceptance structure;
- failure scenarios;
- historical performance;
- proof that some behaviours once existed.

Summer-specific scene paths and exact old commands remain historical procedure.

A new rebuild test receives new current evidence identity.

## 38.5 Deepstone Retirement

Historical use remains searchable for migration and archaeology.

Deepstone does not return to current material canon merely because old code/docs/registries mention it.

## 38.6 Branch B Pre-Certification Drafts

ENG-GOV/B-OPS drafts remain lineage/history after the certified 23-document baseline.

Current technical work should consume the certified baseline, not whichever older draft happens to be found first.

---

# 39. Individual Document Legacy Gate

A V1 document may certify only when applicable conditions are satisfied:

```text
[ ] current/superseded status is explicit
[ ] predecessor/successor relationships are known
[ ] partial supersession scope is unambiguous
[ ] historical engine assumptions are removed or marked
[ ] old terminology is routed through aliases/history
[ ] retired concepts are not presented as current
[ ] retired IDs are not reused
[ ] migration dependencies are retained where required
[ ] historical evidence is clearly distinguished from current proof
[ ] obsolete procedures are not presented as current operations
[ ] current references do not rely on superseded authority
[ ] rejected alternatives are not silently revived
[ ] chat-only relied-upon decisions have been promoted
[ ] necessary history/provenance remains discoverable
[ ] no blocking LEG finding remains
```

---

# 40. Whole-Corpus Legacy Gate

Before `LEYFORGE DOCUMENTATION V1.0 — GLOBAL CORPUS LOCKED`, Branch C must be able to certify:

```text
[ ] every in-scope superseded source has a disposition
[ ] current active paths point to current authority
[ ] historical archives cannot masquerade as active canon
[ ] significant supersession chains are recorded
[ ] partial supersession boundaries are explicit
[ ] Unreal/Summer/POC technical assumptions are removed from current authority unless re-adopted
[ ] historical POC code is frozen/recoverable enough for archaeology
[ ] historical registries are preserved where migration requires them
[ ] retired stable IDs remain reserved/tombstoned
[ ] alias/tombstone/migration history is sufficient for supported persistent data
[ ] compatibility/test identities remain isolated
[ ] old POC tests are mapped by intent rather than copied blindly
[ ] historical evidence cannot satisfy current qualification by accident
[ ] rejected high-risk approaches retain enough rationale
[ ] no consequential current decision exists only in hidden chat history
[ ] major archive baselines have stable repository/archive identity
[ ] unique historical evidence/migration/provenance has not been deleted
[ ] active→superseded references are reconciled
[ ] no unresolved LEG-25 systemic legacy contamination remains
[ ] no unresolved in-scope AUD-4/AUD-5 legacy defect remains
```

---

# 41. C-AUD-08 Acceptance Gate

C-AUD-08 may be theoretically locked when the project accepts that it has defined:

```text
[ ] foundational legacy doctrine
[ ] legacy audit object model
[ ] specialised disposition vocabulary
[ ] supersession types
[ ] supersession record
[ ] active-path sanitisation
[ ] edition-history audit
[ ] legacy engine/architecture audit
[ ] legacy code audit
[ ] legacy registry/schema audit
[ ] save/migration legacy audit
[ ] historical evidence audit
[ ] POC test intent/procedure separation
[ ] rejected-alternative treatment
[ ] retired-content treatment
[ ] deprecated-content treatment
[ ] terminology/alias history treatment
[ ] archive snapshot/container rules
[ ] archive navigation requirements
[ ] Git/repository interface
[ ] Project Brain interface
[ ] ENG-GOV/B-OPS interface
[ ] FCC interface
[ ] PRD interface
[ ] Branch D interface
[ ] third-party history treatment
[ ] chat archaeology treatment
[ ] physical deletion rules
[ ] tombstone rules
[ ] archive integrity/recoverability
[ ] LEG-01 through LEG-25 taxonomy
[ ] severity guidance
[ ] legacy audit record
[ ] disposition coverage states
[ ] execution procedure
[ ] automation handoff
[ ] delta reconciliation
[ ] representative Leyforge cases
[ ] individual-document legacy gate
[ ] whole-corpus legacy gate
```

---

# 42. Immediate Handoff

After C-AUD-08 is accepted, proceed to:

> **C-AUD-09 — Leyforge V1 Rewrite, Normalisation & Promotion Standard v0.1**

The Branch C sequence becomes:

```text
C-AUD-01 — What sources exist?
        ↓
C-AUD-02 — Who owns each truth?
        ↓
C-AUD-03 — Do those truths agree?
        ↓
C-AUD-04 — Are identities / registries / migrations coherent?
        ↓
C-AUD-05 — Do requirements and handoffs connect?
        ↓
C-AUD-06 — Are contracts complete enough to build?
        ↓
C-AUD-07 — Is the claimed proof actually valid?
        ↓
C-AUD-08 — Is legacy/history safely separated from current truth?
        ↓
C-AUD-09 — How do we turn the reconciled result into clean V1 documents?
```

C-AUD-09 will define the actual transformation from reconciled pre-V1 material into clean V1 output:

- semantic preservation;
- removal of amendment-chain clutter;
- controlled terminology normalisation;
- stable-ID preservation;
- source-fidelity checks;
- section restructuring;
- historical-note placement;
- current-path overwrite rules;
- V1 candidate generation;
- diff/fidelity verification;
- promotion;
- rollback;
- certification metadata;
- post-promotion delta handling.

---

# 43. Foundational Statement

> **Leyforge V1 should remember its history without making contributors live inside it.**

The active corpus should present current truth cleanly.

The archive should preserve enough historical truth to explain how the project got there, migrate what must survive, reproduce what matters, and prevent old mistakes from being rediscovered.

History remains accessible.

Authority moves forward.

---

**End of C-AUD-08 v0.1**
