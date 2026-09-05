# C-AUD-01 — Leyforge Master Corpus Inventory & Disposition Standard

**Document ID:** C-AUD-01  
**Title:** Leyforge Master Corpus Inventory & Disposition Standard  
**Version:** v0.1  
**Status:** BRANCH C DRAFT — READY FOR REVIEW / LOCK DECISION  
**Branch:** Branch C — V1 Documentation Audit & Finalisation  
**Parent Authority:** C-AUD-00 — Leyforge V1 Audit Constitution, Scope & Certification Model  
**Project:** Leyforge  
**Date:** 30 August 2026  
**Owns:** corpus inventory architecture, source discovery, logical-document/file-instance separation, duplicate/version handling, source disposition recording, bundle/container handling, provenance capture, inventory freeze mechanics and inventory completeness gates  
**Does not own:** semantic authority precedence beyond recording/routing, content-canon resolution, engineering-law resolution, Brain architecture, Git operating policy, or final V1 certification  
**Primary interfaces:** C-AUD-00; C-AUD-02; LF-BRAIN; ENG-GOV; B-OPS; FCC-14; PRD; LFE; FORGE-ENG; registries; repository history; testing/evidence corpus

---

# 00. Purpose

C-AUD-01 defines how Leyforge discovers, identifies, deduplicates, records, classifies and freezes the source corpus that will later undergo V1 reconciliation and certification.

Its governing problem is simple:

> **Before Leyforge can certify what is true, it must know exactly what material exists, which files represent the same logical document, which sources are current or historical, where they came from, and whether anything expected is missing.**

The Master Corpus Inventory is therefore an accounting system before it is a semantic audit.

It does not decide every conflict. It ensures no source can disappear, multiply, masquerade as authority, or remain silently unclassified.

---

# 01. Foundational Inventory Model

### CA01-001 — Inventory the Corpus Before Auditing Its Meaning
The final V1 audit must begin from an explicit inventory rather than an informal folder walk or remembered document list.

### CA01-002 — Logical Document and File Instance Are Different Things
A logical Leyforge document is the governed work identified by meaning and document identity. A file instance is one physical representation or copy of that work.

### CA01-003 — One Logical Document May Have Multiple File Instances
Markdown, DOCX, PDF, JSON export, ZIP member, archive copy, historical revision or generated derivative may all relate to one logical document without becoming separate authorities.

### CA01-004 — One File May Contain Multiple Logical Documents
Bundles, combined exports, transcripts, master compilations and archives may contain multiple governed works and must be decomposed at the inventory level where practical.

### CA01-005 — Containers Are Not Automatically Documents
ZIP, 7z and similar containers are inventory objects but do not become semantic authorities merely because they contain authoritative documents.

### CA01-006 — Generated Views Are Not New Truth
Indexes, dashboards, bundles, merged exports and generated reports must remain linked to their source records and may not silently create another authority layer.

### CA01-007 — Physical Recency Does Not Establish Semantic Recency
File timestamps, upload dates, copy dates and archive creation times are evidence only; they do not prove which edition is current.

### CA01-008 — Filename Version Is Evidence, Not Final Authority
A filename such as `v1_0`, `FINAL`, `LOCKED` or `latest` is recorded but must be corroborated by document content, governance or accepted project state.

---

# 02. Inventory Object Types

The Master Corpus Inventory recognises the following object types.

### CA01-009 — `LOGICAL_DOCUMENT`
A governed Leyforge document or specification with a stable document identity.

### CA01-010 — `DOCUMENT_EDITION`
A specific meaningful revision/version of a logical document.

### CA01-011 — `FILE_INSTANCE`
A physical file representing all or part of an edition.

### CA01-012 — `CONTAINER`
A ZIP, 7z, folder package or other grouping artifact containing file instances.

### CA01-013 — `COMPOSITE`
A file that intentionally combines multiple logical documents or editions into one artifact.

### CA01-014 — `GENERATED_ARTIFACT`
A derived file produced from one or more governed sources.

### CA01-015 — `EVIDENCE_ARTIFACT`
Research, benchmark, prototype output, test report, screenshot, transcript or other evidence-bearing artifact.

### CA01-016 — `REGISTRY_OR_SCHEMA`
Machine-readable source, schema, controlled registry, manifest or equivalent structured artifact requiring identity/provenance handling.

### CA01-017 — `IMPLEMENTATION_REFERENCE`
Legacy or current code/configuration used as evidence during documentation audit without automatically becoming product canon.

### CA01-018 — `EXTERNAL_REFERENCE`
A cited external source not owned by Leyforge but needed to understand evidence or provenance.

---

# 03. Stable Inventory Identity

### CA01-019 — Logical Documents Retain Their Existing Document IDs
Where an accepted stable document ID already exists, the inventory uses it rather than inventing a second semantic identity.

### CA01-020 — Inventory Records Receive Their Own Stable Record IDs
Inventory bookkeeping requires stable record IDs that are distinct from the document IDs being inventoried.

Recommended patterns:

```text
MCR-DOC-####   logical-document record
MCR-ED-####    edition record
MCR-FILE-####  file-instance record
MCR-CNT-####   container/composite record
MCR-EVD-####   evidence record where needed
```

Exact storage syntax may be implemented by the Project Brain/schema layer, but the semantic distinctions are binding.

### CA01-021 — Inventory IDs Are Never Reused
Retired or merged inventory records preserve their historical IDs.

### CA01-022 — Missing Document IDs Are Not Silently Invented as Canon IDs
A provisional inventory identity may be assigned for bookkeeping while the true semantic owner/document ID is unresolved.

### CA01-023 — Provisional Identity Must Be Visible
Provisional records carry an explicit unresolved-identity flag and cannot be mistaken for a final canonical document identity.

---

# 04. Minimum Master Corpus Register Fields

Every logical-document record must support at least:

```text
inventory_record_id
logical_document_id
title
document_family
domain
owner
current_known_version
current_known_status
primary_disposition
v1_required
canonical_path_if_known
authority_state
inventory_state
upstream_dependencies
downstream_consumers
supersedes
superseded_by
related_records
known_file_instances
open_inventory_findings
notes
```

Every edition/file-instance record must support at least:

```text
inventory_record_id
parent_logical_document
claimed_document_id
claimed_version
claimed_status
filename
format
path_or_locator
container_parent
size
content_hash
normalised_fingerprint_where_supported
created_or_modified_metadata
source_origin
is_generated
is_export
is_exact_duplicate
is_semantic_duplicate_candidate
readability_state
integrity_state
primary_copy_candidate
provenance_notes
```

### CA01-024 — Required Fields May Be Extended, Not Narrowed
LF-BRAIN or implementation tooling may add fields without removing the semantic information required by C-AUD-01.

### CA01-025 — Unknown Values Stay Unknown
Missing metadata uses an explicit unknown/null state rather than fabricated values.

---

# 05. Discovery Sources

### CA01-026 — Repository Is the Primary Operational Discovery Surface
The active Leyforge repository is the primary location from which the final production corpus is discovered and frozen.

### CA01-027 — Git History Is a Provenance Surface
Repository history may establish prior versions, movement, deletion and supersession evidence but is not automatically part of the active V1 corpus.

### CA01-028 — Project Brain Is an Index and Discovery Aid
The Brain may enumerate expected documents, authority relationships and current paths, but the underlying source artifact remains the audited object.

### CA01-029 — External Backups Are Recovery/Provenance Sources
External copies may be used to recover missing material or prove provenance but do not automatically outrank repository authority.

### CA01-030 — Chat Attachments Are Evidence/Transfer Surfaces, Not Default Canonical Paths
Files exchanged through chats may supply source material, but final inventory status depends on their relationship to the governed project corpus.

### CA01-031 — File Library / Upload Date Does Not Determine Currentness
An older canonical document uploaded recently remains older; a newer file uploaded earlier remains newer if authority establishes it.

### CA01-032 — Expected-Document Lists Are Discovery Controls
Known families such as Sets, FCC, PRD, ENG-GOV, B-OPS, LF-BRAIN, LFE, FORGE-ENG and C-AUD must be reconciled against physical discovery so missing expected artifacts are visible.

---

# 06. Discovery Pass

### CA01-033 — Initial Discovery Is Broad
The first inventory pass should favour recall: enumerate files and containers before trying to decide what may be safely ignored.

### CA01-034 — Supported Extensions Are Enumerated
Inventory tooling should explicitly include expected textual, structured, document, spreadsheet, presentation, image, archive and code/config formats relevant to the audit.

### CA01-035 — Tooling/Build Junk Is Filtered by Rule, Not Guess
Caches, dependency outputs and generated build products may be excluded using governed path/type rules rather than manual convenience.

### CA01-036 — Exclusion Rules Are Reviewable
The inventory records or tooling configuration must make clear which paths/patterns were intentionally excluded.

### CA01-037 — Hidden Files Are Not Automatically Ignored
Hidden/project-support paths may contain authoritative configuration, schemas or generated-control files and require explicit exclusion rules.

### CA01-038 — Unreadable Files Remain Registered
A corrupted, unsupported or inaccessible file is recorded with a readability/integrity issue rather than disappearing from the inventory.

---

# 07. Bundle, ZIP & Archive Handling

### CA01-039 — Containers Receive Their Own Inventory Records
Every relevant ZIP/7z/package is recorded as a container with provenance and hash.

### CA01-040 — Container Members Are Individually Enumerated Where Practical
If a bundle contains auditable documents, member paths and identities must be indexed even if the container is retained intact.

### CA01-041 — Bundled and Loose Copies Are Compared
The same document appearing both loose and inside a ZIP is linked rather than counted twice as independent authority.

### CA01-042 — Bundle Name Does Not Override Member Content
A package named `FINAL` cannot make every contained draft final.

### CA01-043 — Archive Preservation Is Separate From Active-Path Use
A historical package may remain archived even after its relevant documents are individually registered or replaced.

### CA01-044 — Extraction Does Not Create New Semantic Versions
Extracting a file from a container creates another file instance unless content or governance establishes a distinct edition.

---

# 08. Hashing & Fingerprinting

### CA01-045 — Exact File Hashes Support Byte-Level Deduplication
Relevant file instances should receive cryptographic hashes where practical.

### CA01-046 — Hash Equality Proves Exact Byte Equality, Not Authority
Two identical files are exact duplicates; their semantic authority still derives from the logical document record.

### CA01-047 — Different Hashes Do Not Necessarily Mean Different Semantics
Formatting, metadata, export container structure or line endings may change bytes without changing governed meaning.

### CA01-048 — Normalised Fingerprints May Support Semantic-Duplicate Detection
Textual formats may use normalised-content fingerprints for duplicate discovery, provided original files remain preserved for audit.

### CA01-049 — Normalisation Cannot Erase Meaningful Differences
Normalised comparisons must not strip IDs, values, tables or text whose differences could alter semantics.

### CA01-050 — Hashes Are Recomputed at Freeze
The final inventory freeze must capture hashes/fingerprints for the exact baseline being certified where technically practical.

---

# 09. Duplicate Classification

Duplicate relationships use explicit classes.

### CA01-051 — `EXACT_DUPLICATE`
Byte-identical file instances.

### CA01-052 — `FORMAT_EQUIVALENT`
Different export formats representing the same logical edition with no known semantic difference.

### CA01-053 — `NORMALISED_EQUIVALENT`
Text differs only through accepted non-semantic formatting/transport changes.

### CA01-054 — `EDITION_PREDECESSOR`
An older meaningful revision of the same logical document.

### CA01-055 — `DIVERGENT_SAME_ID`
Two materially different artifacts claim the same document identity/version without an established supersession relationship.

### CA01-056 — `TITLE_COLLISION`
Similar or identical titles appear to represent different logical works or ownership scopes.

### CA01-057 — `EXPORT_DERIVATIVE`
Generated PDF/DOCX/combined output derived from an editable source.

### CA01-058 — `BUNDLE_DUPLICATE`
A member copy duplicates a loose or separately packaged file.

### CA01-059 — Divergent Same-ID Is an Audit Finding
`DIVERGENT_SAME_ID` cannot be silently resolved by choosing the newer timestamp.

### CA01-060 — Exact Duplicates Need One Semantic Home
Redundant physical copies may remain for archive/recovery purposes, but one logical-document relationship must represent their shared meaning.

---

# 10. Version & Edition Resolution

### CA01-061 — Version Resolution Uses Authority, Not Filename Sorting
`v0.10` vs `v0.9`, `FINAL2`, copy numbers and similar naming patterns are not sufficient by themselves.

### CA01-062 — Internal Metadata Is Stronger Than Filename When Coherent
Document-declared ID/version/status generally outweigh a filename label unless governing evidence establishes otherwise.

### CA01-063 — Accepted Lock/Certification Records May Outrank Both
A separate accepted certification/handoff may identify which edition is current even if file metadata was not perfectly updated.

### CA01-064 — Same-Version Divergence Must Be Resolved
Two materially different `v0.1` files cannot both silently remain the current edition of one logical document.

### CA01-065 — Version Gaps Are Not Automatic Errors
Missing numerical versions may reflect abandoned drafts or local history; only consequential provenance gaps require resolution.

### CA01-066 — Current Edition Resolution Is Provisional Until Authority Audit
C-AUD-01 may nominate a `current_candidate`; C-AUD-02 confirms semantic authority/precedence where needed.

---

# 11. Disposition Recording

C-AUD-01 implements the primary disposition vocabulary defined by C-AUD-00:

```text
V1-CANONICAL
V1-SUPPORTING
CURRENT-REFERENCE
EVIDENCE
HISTORICAL
SUPERSEDED
ARCHIVE
GENERATED
RETIRED
```

### CA01-067 — Disposition Applies to the Logical Role
File copies may inherit or refine the logical-document disposition but cannot independently elevate themselves.

### CA01-068 — Historical Does Not Mean Worthless
Historical documents may contain migration, provenance or design rationale required later in the audit.

### CA01-069 — Evidence Does Not Mean Canon
A highly successful POC or benchmark may be strong evidence without owning final game semantics.

### CA01-070 — Generated Does Not Mean Disposable Without Source Verification
A generated artifact is safely reproducible only if its source and generation relationship are known.

### CA01-071 — Superseded Sources Remain Linked to Replacements
A superseded artifact must point toward the replacement/current authority when known.

### CA01-072 — Retired Concepts Preserve Migration Hooks Where Required
Retirement does not justify destroying identity history needed by saves, registries or audit provenance.

---

# 12. Authority-State Recording

C-AUD-01 records, but does not finally adjudicate, authority state.

Recommended states:

```text
CONFIRMED_CURRENT
CURRENT_CANDIDATE
CONFIRMED_SUPPORTING
HISTORICAL_ONLY
SUPERSEDED_CONFIRMED
GENERATED_DERIVATIVE
AUTHORITY_UNRESOLVED
OWNER_UNRESOLVED
SOURCE_GAP
```

### CA01-073 — Authority State and Disposition Are Separate
For example, an evidence source can be confirmed current evidence without becoming canonical product authority.

### CA01-074 — Unresolved Authority Routes to C-AUD-02
C-AUD-01 inventories ambiguity; C-AUD-02 owns systematic authority/precedence reconciliation.

---

# 13. Relationship Vocabulary

The inventory must be able to record at least:

```text
supersedes
superseded_by
previous_edition
next_edition
exact_duplicate_of
format_of
derived_from
generated_from
contained_in
contains
evidence_for
depends_on
consumed_by
authority_for
references
replaces
migrates_from
migrates_to
alias_of
related_to
```

### CA01-075 — Relationships Are Directional Where Meaning Is Directional
`supersedes` and `superseded_by` must not be collapsed into a generic link.

### CA01-076 — Relationship Claims Need Provenance
Important inventory relationships should identify the source/evidence that established them when not obvious from file identity.

---

# 14. Family & Programme Coverage

### CA01-077 — Known Families Receive Expected-Membership Registers
The inventory should know which documents are expected for each currently governed family.

### CA01-078 — Expected Does Not Mean Already Existing
Planned-but-unwritten documents are recorded as expected future artifacts, not fabricated file instances.

### CA01-079 — Missing Expected Artifacts Are Visible
If a document is required but absent, the family coverage view records the gap.

### CA01-080 — Unexpected Artifacts Are Also Visible
A discovered file with no known family/owner is not discarded merely because it was not on the expected list.

### CA01-081 — Numbering Gaps Are Classified
A numbering gap may be intentional provenance, missing work or retired allocation; the inventory records which rather than assuming.

### CA01-082 — Family Completion Is Calculated From Governed Expectations
A folder merely containing many files is not proof that the family is complete.

---

# 15. Special Handling for Machine-Readable Registries

### CA01-083 — Registry Files Are First-Class Inventory Objects
JSON/YAML/CSV/schema/manifest artifacts relevant to canonical or migration identity are inventoried independently from prose documents.

### CA01-084 — Registry Source vs Runtime Mirror Must Be Distinguished
Editable/source-of-truth registries, generated runtime mirrors and historical POC registries require different relationships.

### CA01-085 — Structured Data Does Not Self-Certify
Machine readability, stable-looking IDs or successful loading do not establish current canonical correctness.

### CA01-086 — Schema Version and Content Version May Differ
Inventory records preserve both when the project distinguishes them.

### CA01-087 — Generated Registries Require Generation Provenance
The generating source/process/version must be known sufficiently to decide whether the artifact is rebuildable.

---

# 16. Special Handling for Testing, POC & Evidence

### CA01-088 — Testing Guides Are Inventory Sources
Manual test guides, acceptance reports and automated probe manifests are retained where they provide implementation/evidence history.

### CA01-089 — Historical Test Success Is Timestamped Evidence
A historical passing test result does not become a timeless claim about current architecture.

### CA01-090 — POC Implementation Is Recorded as Evidence/Implementation Reference
Legacy POC code and behaviour may reveal solved problems, reusable lessons, migrations and regression expectations without controlling final canon.

### CA01-091 — Evidence Must Link to the Claim or Programme It Supports
Loose evidence with no supported claim remains discoverable but should not be treated as proof until linked.

---

# 17. Missing, Corrupt & Inaccessible Sources

### CA01-092 — Missing Known Source Creates an Inventory Finding
A referenced or expected artifact that cannot be located receives a stable finding rather than silently disappearing.

### CA01-093 — Corruption Is Recorded Separately From Semantic Failure
Unreadable bytes are an integrity problem, not a content contradiction.

### CA01-094 — Recovery Sources Are Searched Before Declaring Loss
Where warranted, repository history, external backups, packages and other known provenance sources may be checked.

### CA01-095 — Recovered Copies Retain Recovery Provenance
A recovered file is marked with its recovery source and is not assumed current merely because it was recovered successfully.

### CA01-096 — Permanently Missing Historical Material Need Not Block V1 Automatically
Blocking status depends on whether current authority, migration or certification still requires the missing information.

---

# 18. Inventory Findings

Inventory-specific findings should cover at least:

```text
MISSING_EXPECTED_SOURCE
UNCLASSIFIED_SOURCE
UNRESOLVED_DOCUMENT_ID
DIVERGENT_SAME_ID
DUPLICATE_ACTIVE_COPY
BROKEN_SUPERSESSION_CHAIN
UNREADABLE_FILE
UNKNOWN_GENERATION_SOURCE
ORPHAN_GENERATED_ARTIFACT
UNRESOLVED_OWNER
VERSION_AMBIGUITY
UNEXPECTED_ACTIVE_REFERENCE
CONTAINER_MEMBER_NOT_ACCOUNTED
```

### CA01-097 — Findings Receive Stable IDs
Material inventory findings are tracked through resolution and later audit stages.

### CA01-098 — Findings Use C-AUD-00 Severity
Inventory findings receive AUD-1 through AUD-5 according to actual consequence.

### CA01-099 — Inventory Findings Are Not Content Findings Unless Meaning Is Affected
A duplicate copy may be bookkeeping-only; a divergent same-ID stable-identity registry may be AUD-4 or AUD-5.

---

# 19. Source Selection for Later Audit

### CA01-100 — The Inventory Produces an Audit Candidate Set
After discovery/classification, Branch C can identify which logical editions actually require semantic audit.

### CA01-101 — Later Audits Prefer Logical Documents Over Repeated File Copies
Exact/format duplicate copies should not each receive full independent semantic review unless a fidelity/export check requires it.

### CA01-102 — Historical Editions May Receive Targeted Review
Historical material is reviewed when needed for migration, provenance, supersession or detecting stale leakage.

### CA01-103 — Evidence Sources Receive Claim-Scoped Review
Evidence is examined against the claims it supports rather than promoted into a general authority audit.

---

# 20. Inventory Workflow

The recommended execution workflow is:

```text
PASS I   — DISCOVER
Enumerate files, containers, registries and known expected artifacts.

PASS II  — IDENTIFY
Extract claimed document ID, title, family, version, status, owner and format.

PASS III — HASH & GROUP
Detect exact duplicates, export equivalents and probable same-document families.

PASS IV  — RESOLVE LOGICAL DOCUMENTS
Create logical-document and edition records; attach physical file instances.

PASS V   — CLASSIFY
Assign provisional disposition, authority state, V1 requirement and family/domain.

PASS VI  — RELATE
Build supersession, generation, containment, dependency and evidence relationships.

PASS VII — GAP CHECK
Find missing expected sources, unresolved identities, version divergence and orphans.

PASS VIII — AUTHORITY HANDOFF
Route unresolved authority/ownership questions into C-AUD-02.

PASS IX  — FREEZE CANDIDATE
Produce the candidate inventory snapshot for the final V1 audit.
```

### CA01-104 — Workflow May Be Incremental Before Final Freeze
The inventory can grow throughout pre-production; final freeze occurs only when Branch D/C-AUD sequencing reaches the global audit stage.

### CA01-105 — Automation Should Handle Mechanical Discovery
Agents/scripts should enumerate, hash, parse metadata and flag candidates where safe.

### CA01-106 — Automation Must Not Invent Semantic Equivalence
A similarity score may propose duplicates; consequential semantic merging requires governed review.

---

# 21. Master Corpus Inventory Views

The operational system should be able to answer at least:

```text
What documents exist?
What is the current candidate for each document?
Which documents are required for V1?
Which files are exact duplicates?
Which same-ID files diverge?
Which sources are historical or superseded?
Which expected documents are missing?
Which generated files lack source provenance?
Which archives contain unique material?
Which documents have unresolved owner/authority state?
Which families are complete?
Which files have not yet been classified?
Which records changed since the last snapshot?
```

### CA01-107 — Views Are Derived From the Register
Dashboards and Brain pages do not maintain separate manual inventories where avoidable.

---

# 22. Project Brain Interface

### CA01-108 — C-AUD Owns Audit Inventory Semantics
LF-BRAIN implements storage/navigation consistent with Branch A, but C-AUD defines what the V1 audit inventory must mean.

### CA01-109 — Brain Document Proxies Link to Underlying Sources
A Brain note about a document should reference the Master Corpus record and canonical source rather than duplicate full source text.

### CA01-110 — Brain Doctor May Validate Inventory Integrity
Applicable checks may include missing files, duplicate IDs, invalid relationships, broken paths, orphan generated records and schema violations.

### CA01-111 — Inventory Changes Become Durable Project Knowledge
Consequential classification/resolution should be logged through the Brain/Work/Decision mechanisms defined by Branch A.

---

# 23. Branch B / Agent Interface

### CA01-112 — Agents Read the Register Before Mass Audit Operations
A coding/document agent must not assume every similarly named file is current.

### CA01-113 — B-OPS Governs Operational Mechanics
Exact scripts, command conventions, Git behaviour, CI and agent execution remain governed by ENG-GOV/B-OPS.

### CA01-114 — Existing Work Is Presumed Valuable Until Classified
Unknown files are not deleted merely because they appear duplicate or old.

### CA01-115 — Destructive Cleanup Follows Classification
Repository cleanup or relocation happens only after provenance and disposition are sufficiently established.

---

# 24. Delta Handling Before Final Freeze

### CA01-116 — Inventory Is Living During Pre-Production
New FCC, B-OPS, PRD, Branch C/D and other accepted documents may continue entering the register.

### CA01-117 — New Editions Do Not Delete Old Edition Records
The current pointer moves; the historical edition remains traceable.

### CA01-118 — Delta Ingestion Records What Changed
New, removed, moved, superseded and reclassified artifacts are captured between snapshots.

### CA01-119 — Unaffected Records Need Not Be Rebuilt
Incremental inventory refresh should preserve stable record identity.

### CA01-120 — Final Semantic Audit Uses a Named Inventory Snapshot
The V1 audit execution begins against an explicit corpus snapshot, not a moving implicit folder state.

---

# 25. Final Corpus Freeze

### CA01-121 — Freeze Identifies an Exact Repository Baseline
The final V1 audit candidate snapshot records the repository commit/tag/baseline identifier defined through Branch B/Git governance.

### CA01-122 — Freeze Captures the Master Register
The exact logical-document, edition, file-instance, disposition and relationship state used for certification is preserved.

### CA01-123 — Freeze Captures File Integrity Where Practical
Hashes/fingerprints of in-scope source artifacts are captured so later mutation can be detected.

### CA01-124 — Freeze Does Not Prohibit Controlled Change
A discovered blocker may require a governed fix, but the change must produce a delta and reopen affected audit rows under C-AUD-00.

### CA01-125 — Post-Freeze Additions Cannot Sneak Into V1
New artifacts require explicit classification and change-control inclusion before they become part of the certified baseline.

---

# 26. Inventory Completeness Gate

The Master Corpus Inventory is ready to hand off into the deeper V1 audit only when:

```text
[ ] all governed repository source locations were scanned
[ ] all relevant containers were registered
[ ] auditable container members were enumerated where practical
[ ] every discovered source has an inventory record or governed exclusion
[ ] every expected V1 family has a coverage record
[ ] every V1-required logical document has a known current candidate or explicit missing-source finding
[ ] exact duplicates are grouped
[ ] same-ID divergence is flagged
[ ] generated artifacts identify sources or have findings
[ ] machine-readable registries are classified as source/generated/historical as applicable
[ ] supersession relationships are captured where known
[ ] unresolved owner/authority questions are routed to C-AUD-02
[ ] every logical document has a primary disposition or explicit unresolved-disposition finding
[ ] every V1-required document has a V1-required flag
[ ] excluded paths/patterns are documented
[ ] unreadable/corrupt/inaccessible files are visible
[ ] material missing-source findings are visible
[ ] current inventory snapshot is reproducible
[ ] final audit freeze baseline can be identified exactly
```

### CA01-126 — Completeness Means Accounted For, Not Necessarily Resolved
The inventory gate can pass with explicit findings routed into later stages; it cannot pass with unknown unaccounted material.

---

# 27. Example: One Document, Many Files

```text
LOGICAL_DOCUMENT
20H — Detailed Building Catalogue
        |
        +-- EDITION v0.1
        |      +-- old markdown copy
        |      +-- PDF export
        |
        +-- EDITION v0.2  < CURRENT CANDIDATE
               +-- canonical markdown
               +-- DOCX export
               +-- copy inside Set-20 ZIP
               +-- generated combined master
```

The inventory therefore reports:

- one logical document;
- two meaningful editions;
- several file instances;
- one current candidate;
- multiple derivatives/duplicates;
- preserved provenance.

It does **not** report six competing authorities.

---

# 28. Example: Legacy Registry

```text
VoxelRegistry.json

Object type:
REGISTRY_OR_SCHEMA

Role:
historical POC registry / implementation evidence

Possible relationships:
evidence_for -> legacy implementation
migrates_to -> FCC-13-aligned registry architecture
superseded_by -> future authoritative registry source

Disposition:
HISTORICAL or EVIDENCE

Warning:
machine-readable != current canonical
```

This preserves its migration value while preventing an old runtime registry from overriding later FCC identity rules.

---

# 29. Example: Archive Package

```text
FCC SETS.zip
        |
        +-- FCC-02 ...
        +-- FCC-03 ...
        +-- FCC-04 ...
        +-- ...
```

The ZIP receives a container record.

Each relevant FCC member maps to its own logical-document/edition record.

If an identical loose copy exists, the bundle member becomes a duplicate file instance rather than another logical authority.

If the bundle contains a unique historical edition, that edition remains inventoried even if it is not current.

---

# 30. C-AUD-01 Deliverables During Final Execution

C-AUD-01 requires the eventual operational audit to produce:

1. **Master Corpus Register** — logical-document level.
2. **Edition Register** — meaningful versions/revisions.
3. **File Instance Manifest** — physical files, hashes and locators.
4. **Container Manifest** — packages and member relationships.
5. **Duplicate & Divergence Report** — exact duplicates, equivalent exports and same-ID conflicts.
6. **Expected Family Coverage Report** — planned/required vs discovered.
7. **Missing / Unreadable Source Register**.
8. **Generated Artifact Provenance Report**.
9. **Authority/Owner Questions Handoff** to C-AUD-02.
10. **Final Corpus Freeze Manifest** used by the global V1 audit.

---

# 31. Current Known Family Seeds

The initial inventory implementation should be prepared to register, at minimum, current/project families such as:

```text
Foundation / Game Design Sets 00–30
Post-30 production/future-constraint sets and roadmap material
Forge design sets
FCC / Final Content Canon
PRD / Pre-Rebuild Discovery
LF-BRAIN / Project Brain
ENG-GOV / Engineering Governance
B-OPS / Governance Operationalisation
C-AUD / V1 Documentation Audit
LFE / Leyforge Engine technical canon
FORGE-ENG / Forge engineering canon
Registries / schemas / manifests
Testing / verification / benchmark evidence
Legacy POC implementation references
Research / comparative evidence
ADRs / decisions / migrations where governed
```

This is a seed list, not the final frozen corpus boundary.

---

# 32. C-AUD-01 Acceptance Gate

C-AUD-01 may be theoretically locked when the project accepts that it has defined:

```text
[ ] logical document vs edition vs file instance
[ ] container/composite/generated/evidence object types
[ ] stable inventory identity model
[ ] minimum Master Corpus fields
[ ] discovery-source rules
[ ] broad discovery and governed exclusion rules
[ ] bundle/archive handling
[ ] hashing and fingerprinting rules
[ ] duplicate classifications
[ ] version/current-candidate resolution rules
[ ] C-AUD-00 disposition implementation
[ ] authority-state recording
[ ] relationship vocabulary
[ ] family coverage model
[ ] machine-readable registry handling
[ ] testing/POC/evidence handling
[ ] missing/corrupt/inaccessible-source handling
[ ] inventory finding classes
[ ] audit-candidate selection
[ ] inventory execution workflow
[ ] required operational views
[ ] Project Brain interface
[ ] Branch B/agent interface
[ ] pre-freeze delta handling
[ ] final corpus freeze rules
[ ] inventory completeness gate
[ ] final execution deliverables
```

---

# 33. Next Document

After C-AUD-01 is locked, proceed to:

> **C-AUD-02 — Leyforge Authority, Ownership & Precedence Reconciliation Standard v0.1**

C-AUD-02 will define how Branch C proves which active document owns each consequential concept, how overlapping authority is classified, how precedence is resolved without relying on timestamps, how source gaps are routed, and how unresolved ownership prevents false V1 certification.

---

# 34. Foundational Statement

> **The Master Corpus Inventory exists so that every Leyforge source can be answered for: what is it, where did it come from, what does it represent, which copies relate to it, whether it is current, historical, generated or evidence, and whether it belongs inside the V1 certification boundary.**

Leyforge cannot safely reconcile what it cannot account for.

C-AUD-01 therefore establishes the bookkeeping foundation beneath every later V1 audit claim.

---

**End of C-AUD-01 v0.1**
