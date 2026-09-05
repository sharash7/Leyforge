# C-AUD-00 — Leyforge V1 Audit Constitution, Scope & Certification Model

**Document ID:** C-AUD-00  
**Title:** Leyforge V1 Audit Constitution, Scope & Certification Model  
**Version:** v0.1  
**Status:** BRANCH C FOUNDATIONAL DRAFT — READY FOR REVIEW / LOCK DECISION  
**Branch:** Branch C — V1 Documentation Audit & Finalisation  
**Project:** Leyforge  
**Date:** 29 August 2026  
**Owns:** V1 audit meaning, scope, audit law, disposition model, certification model, issue routing, delta reconciliation, V1 promotion and whole-corpus lock semantics  
**Does not own:** underlying content canon, engineering law, Project Brain architecture, production sequencing, implementation architecture or domain-specific design decisions  
**Primary interfaces:** FCC-14; PRD; ENG-GOV; B-OPS; LF-BRAIN; Branch D roadmap; LFE; FORGE-ENG; registries; testing/verification; active source corpus

---

# 00. Purpose

C-AUD-00 establishes the constitutional rules for Leyforge's final V1 documentation audit.

The V1 audit is not a cosmetic version-number pass. It is the project-wide maturation process that determines whether the active Leyforge documentation corpus is coherent, current, traceable, correctly owned, implementation-usable and fit to become the authoritative V1 baseline for the clean rebuild and subsequent production.

The governing question is:

> **Can the active Leyforge specification corpus be relied upon as one coherent body of authority without requiring a developer, agent or project owner to rediscover hidden corrections, guess which source wins, reconstruct supersession history, or invent missing implementation meaning?**

If the answer is not yet yes, the corpus is not yet V1-certified.

---

# 01. Constitutional Authority & Branch Boundary

### CA00-001 — Branch C Owns V1 Audit Methodology
Branch C owns the process by which Leyforge documents are inventoried, classified, reconciled, audited, promoted and finally certified as the V1 documentation baseline.

### CA00-002 — Branch C Does Not Own Every Underlying Truth
Branch C may detect, classify and route a contradiction, gap, ambiguity or stale statement. It may not silently invent a replacement meaning in a domain owned by another authority.

### CA00-003 — Owning Authority Resolves Semantic Conflict
Where resolution changes actual content, architecture, engineering law, Project Brain architecture, production sequencing or another owned domain, the owning authority must resolve the semantic question.

### CA00-004 — Branch C Verifies the Resolution
After an owning authority resolves an issue, Branch C verifies that affected documents, references, registries and downstream consumers have been reconciled before certification resumes.

### CA00-005 — Existing Domain Authority Chains Are Preserved
C-AUD does not replace the authority hierarchy defined inside FCC, ENG-GOV, LF-BRAIN, PRD, LFE, FORGE-ENG or other governed families.

### CA00-006 — Missing Authority Is Recorded, Not Guessed
If the owning source cannot be established safely, the result is an authority gap or source gap rather than an invented precedence decision.

### CA00-007 — Certification Is Distinct From Redesign
The default audit posture is:

> **CERTIFY WHAT IS LOCKED; RECONCILE WHAT DRIFTED; ROUTE WHAT BELONGS ELSEWHERE; REOPEN ONLY WHAT CANNOT REMAIN TRUE.**

### CA00-008 — Audit Governance Is Itself Versioned
C-AUD documents are governed artifacts and may evolve through controlled amendment before the final V1 audit begins.

---

# 02. Definition of Leyforge Documentation V1

### CA00-009 — V1 Is a Certification State, Not Merely a Filename
A document is not V1-certified merely because its title or metadata says `v1.0`.

### CA00-010 — V1 Means Current Within Declared Scope
A V1-certified document must correctly represent the current accepted Leyforge truth within the scope it claims to own or support.

### CA00-011 — V1 Means Reconciled Against Applicable Later Authority
Accepted later decisions, amendments, certification results and authority changes that affect the document must be incorporated or explicitly routed.

### CA00-012 — V1 Means No Known Material Contradiction Within Certified Scope
No unresolved contradiction that would materially change interpretation, implementation, persistent identity, migration, ownership or required behaviour may remain inside certified scope.

### CA00-013 — V1 Means Implementation-Usable Where Implementation Is Claimed
A document that claims to define implementation requirements must be specific enough that implementation does not require silent invention of consequential behaviour.

### CA00-014 — V1 Does Not Mean Every Future Detail Is Decided
A document may certify while explicitly routing numerical tuning, implementation mechanics, art values, future expansion content or other matters that genuinely belong outside its scope.

### CA00-015 — V1 Does Not Mean Implementation Is Complete
Documentation certification and implementation certification are separate states unless a document explicitly owns both.

### CA00-016 — Corpus V1 Is Stronger Than Individual Document V1
The project-wide declaration `LEYFORGE DOCUMENTATION V1.0 LOCKED` requires both individual certification and cross-corpus certification.

---

# 03. Audit Scope & Corpus Boundary

### CA00-017 — The Audit Begins With an Explicit Corpus Boundary
Before final execution, Branch C must define which source families are inside the base-game V1 certification boundary.

### CA00-018 — In-Scope Does Not Mean Normative
Historical files, prototypes, research and legacy registries may be in the audit corpus as evidence without becoming V1 authority.

### CA00-019 — Final-Game Authority Receives Priority
The V1 audit prioritises current production-critical authority over exhaustive archival cleanup.

### CA00-020 — Future Expansion Content Is Separated
Deferred expansion content may be retained, indexed and migration-aware without being treated as required base-game V1 content.

### CA00-021 — Current Technical Unknowns Must Be Routed
An implementation unknown may remain open only when its owning downstream process is explicit and the unknown does not invalidate the truth being certified.

### CA00-022 — Unclassified Sources Cannot Silently Enter V1
A newly discovered file remains unclassified until its authority, role and disposition are determined.

---

# 04. Source & Document Disposition Model

Every audited source receives one primary disposition.

### CA00-023 — `V1-CANONICAL`
Current normative authority that must be reconciled and certified for the V1 baseline.

### CA00-024 — `V1-SUPPORTING`
Current supporting authority required for reliable production, governance, operation, verification or traceability but not itself primary product canon.

### CA00-025 — `CURRENT-REFERENCE`
Current useful reference material that informs work but does not establish binding authority by itself.

### CA00-026 — `EVIDENCE`
Research, benchmark, prototype, testing or observed implementation evidence used to support decisions or verification.

### CA00-027 — `HISTORICAL`
Project history retained for provenance, understanding or archaeology but not current authority.

### CA00-028 — `SUPERSEDED`
Former authority that has been replaced by a newer accepted source.

### CA00-029 — `ARCHIVE`
Material intentionally retained outside normal active resolution paths.

### CA00-030 — `GENERATED`
Derived output whose source-of-truth lives elsewhere and which must not be manually treated as an independent authority.

### CA00-031 — `RETIRED`
A concept, document or identity explicitly removed from current Leyforge and preserved only where migration/provenance requires it.

### CA00-032 — One Primary Disposition, Additional Relationships Allowed
A source has one primary disposition but may additionally carry relationships such as evidence-for, superseded-by, generated-from, migrated-to or referenced-by.

---

# 05. Audit State Vocabulary

### CA00-033 — Audit State Must Be Explicit
Every in-scope audit target must expose its current audit state.

The baseline states are:

- **NOT STARTED** — registered but not yet audited;
- **INVENTORIED** — source identified and recorded;
- **CLASSIFIED** — authority/disposition established sufficiently to continue;
- **AUDITING** — active review in progress;
- **ISSUES OPEN** — one or more unresolved findings prevent reconciliation;
- **BLOCKED** — required authority, evidence or dependency is unavailable;
- **RECONCILED** — identified material issues have been resolved and propagated;
- **V1 CANDIDATE** — rewritten/normalised output is ready for final fidelity review;
- **V1 CERTIFIED** — all applicable certification gates pass;
- **SUPERSEDED / OUT OF V1** — retained but excluded from active V1 authority.

### CA00-034 — Audit Result and Lifecycle State Are Separate
A document may be `AUDITING` while individual checks are PASS, FAIL, SOURCE GAP or NOT APPLICABLE.

### CA00-035 — No False Green
Unknown, blocked, deferred, waived and not-applicable states must never be reported as ordinary PASS.

---

# 06. Check Result Vocabulary

The generic Branch C check-result vocabulary is:

- **PASS** — applicable authorities agree and the audited condition is satisfied;
- **PASS WITH NOTE** — satisfied, with a non-blocking observation retained;
- **PASS — ROUTED** — the audited scope is coherent and a legitimate downstream owner is recorded;
- **SOURCE GAP** — available sources do not safely establish the answer;
- **CONFLICT** — active authorities or requirements cannot all be true as written;
- **BLOCKED** — the audit cannot continue until a dependency/evidence source exists;
- **DEFERRED / FUTURE** — explicitly outside the current V1 boundary;
- **NON-BLOCKING UNKNOWN** — unresolved detail exists but does not prevent the specific scope from certifying;
- **NOT APPLICABLE** — the check genuinely does not apply;
- **SUPERSEDED** — the audited statement/source is no longer active authority.

### CA00-036 — Domain Vocabulary May Be More Specific
FCC, ENG-GOV, PRD, LFE, FORGE-ENG and other families may use richer local classifications. Branch C preserves those meanings and maps them into the generic audit model rather than rewriting them.

---

# 07. Audit Finding Severity

Branch C findings use a five-level audit severity model.

### AUD-1 — Editorial / Presentation
Typos, harmless formatting, non-semantic metadata defects, broken convenience links or equivalent low-impact issues.

### AUD-2 — Local Semantic
Bounded ambiguity, stale wording or inconsistency that could mislead locally but does not alter a major authority boundary or persistent identity.

### AUD-3 — Cross-Document / Interface
Conflicting terminology, ownership, requirement, relationship or interface across multiple active documents.

### AUD-4 — Canon / Identity / Architecture
A defect capable of causing incorrect implementation, stable-ID behaviour, migration, save interpretation, architecture ownership or material game semantics.

### AUD-5 — Systemic / V1 Blocking
A foundational contradiction or missing authority capable of invalidating substantial parts of the specification or the reliability of the final V1 corpus.

### CA00-037 — Audit Severity Is Not Branch B Risk Class
AUD-1 through AUD-5 classify documentation audit impact. Branch B A–E classifies engineering/change risk. They may correlate but are not interchangeable.

### CA00-038 — Highest Consequence Governs
Where a finding has multiple impacts, it is classified at the highest credible severity.

### CA00-039 — Uncertainty Does Not Downgrade Severity
If uncertainty itself could hide a higher-impact defect, Branch C may conservatively escalate until evidence resolves it.

---

# 08. Authority & Conflict Resolution Rules

### CA00-040 — Use the Owning Domain's Authority Chain First
Branch C resolves precedence using the accepted authority model for the domain being audited.

### CA00-041 — Newest File Is Not Automatically Highest Authority
Creation date, modification date, filename version and recency do not by themselves establish semantic authority.

### CA00-042 — Machine Readability Is Not Authority
A JSON/YAML/registry file does not outrank prose canon merely because software can parse it.

### CA00-043 — Existing Implementation Is Not Automatic Canon
Working POC or legacy behaviour is evidence unless current authority explicitly adopts it.

### CA00-044 — Explicit Supersession Beats Accidental Duplication
Where a current authority explicitly supersedes an older rule, the older rule is routed to migration/history rather than treated as an equal active contradiction.

### CA00-045 — Source Gap Precedes Owner Interview
When sources are incomplete, Branch C must search applicable evidence and ownership records before escalating to a new owner decision.

### CA00-046 — Broad Interviews Are a Last Resort
Branch C should generate owner questions only for genuine unresolved semantic forks that cannot be answered from current authority, evidence or declared downstream ownership.

---

# 09. Source Fidelity & Reconciliation

### CA00-047 — Preserve Accepted Semantics
Reconciliation may clarify, consolidate, move or normalise material without silently changing accepted meaning.

### CA00-048 — Preserve Stable Terms and IDs
Official terminology, stable IDs, aliases, migration relationships and ownership distinctions must remain traceable through rewrite.

### CA00-049 — Reconciliation Must Account for Every Material Change
Substantive old statements must be classified as one or more of:

- preserved;
- amended;
- moved;
- merged;
- superseded;
- deferred;
- retired;
- historical.

### CA00-050 — No Silent Deletion
Material content must not disappear from the active corpus without a defensible disposition or migration explanation.

### CA00-051 — No Amendment-Chains in Final Reading Where Avoidable
The V1 output should read as a clean current specification rather than requiring readers to reconstruct a chain of old amendments.

---

# 10. Dependency-Ordered Audit Pipeline

The final whole-corpus audit executes in dependency order rather than alphabetically.

### Stage C0 — Audit Framework Lock
Lock the C-AUD methodology needed to conduct the audit.

### Stage C1 — Corpus Freeze & Inventory
Create the authoritative audit inventory and establish the V1 boundary.

### Stage C2 — Source Disposition
Classify every registered source by authority role and disposition.

### Stage C3 — Authority & Ownership Audit
Prove that active concepts have discoverable owners and that competing definitions are reconciled.

### Stage C4 — Canon & Semantic Consistency Audit
Check accepted product/world/system meaning for contradiction and stale assumptions.

### Stage C5 — Terminology & Taxonomy Audit
Normalise controlled language, aliases, classifications and vocabulary.

### Stage C6 — Stable Identity, Registry & Migration Audit
Audit durable IDs, definition/projection boundaries, aliases, migration, reference closure and generated data.

### Stage C7 — Cross-Family Interface Audit
Check FCC ↔ foundation Sets ↔ PRD ↔ ENG-GOV ↔ LFE ↔ FORGE-ENG ↔ registries ↔ tests and other owned interfaces.

### Stage C8 — Forward & Reverse Traceability Audit
Trace important requirements toward implementation/test contracts and implementation/data artifacts back toward authority.

### Stage C9 — Completeness & Missing-Contract Audit
Identify accepted behaviours for which no responsible downstream contract exists.

### Stage C10 — Evidence & Acceptance Audit
Check research, prototype, automated test, manual test and certification evidence where required.

### Stage C11 — Legacy & Supersession Cleanup
Remove stale active-path references while retaining required migration and provenance.

### Stage C12 — Clean V1 Rewrite
Produce clean reconciled V1 candidate documents.

### Stage C13 — V1 Fidelity Re-Audit
Audit the rewritten outputs against their accepted source meaning and resolved findings.

### Stage C14 — Final Cross-Corpus Certification
Prove the V1 candidate corpus is coherent as one system and issue the final lock report.

### CA00-052 — Upstream First
Where one family defines truth consumed by another, the upstream authority should normally certify before the dependent consumer receives final certification.

### CA00-053 — Local Exceptions Require Recorded Reason
The audit order may be varied where dependency structure or practical batching requires it, but the reason must be recorded.

---

# 11. Domain-Specific Certification Profiles

### CA00-054 — There Is No One Giant Checklist for Every Document
Each document receives a certification profile appropriate to its role.

Examples include:

**Content / FCC**
- authority;
- canon consistency;
- terminology;
- cross-realm/interface consistency;
- registry implications;
- downstream technical handoff.

**Engineering Governance / ENG-GOV / B-OPS**
- rule ownership;
- cross-standard coherence;
- enforceability representation;
- exception/deprecation integration;
- architecture applicability;
- operational evidence mapping.

**PRD / Technical Discovery**
- requirement extraction completeness;
- evidence fidelity;
- unresolved unknown ownership;
- proof level;
- delta incorporation;
- architecture handoff.

**LFE / FORGE-ENG**
- requirements traceability;
- evidence support;
- ownership boundaries;
- engineering-governance compliance;
- testability;
- persistence/identity implications;
- performance/security constraints.

**Registries / Schemas**
- stable identity uniqueness;
- namespace rules;
- source-of-truth ownership;
- aliases;
- migrations;
- reference closure;
- generated/source distinction;
- deterministic resolution.

**Testing / Verification**
- requirement linkage;
- correct environment;
- evidence integrity;
- automated/manual distinction;
- pass/fail truthfulness;
- historical/current distinction.

---

# 12. Traceability Model

### CA00-055 — Forward Traceability Is Required Where Consequential
Important accepted requirements should be traceable toward their owning technical contract, registry/data representation and verification path as applicable.

### CA00-056 — Reverse Traceability Is Required Where Consequential
Important implementation, registry and test artifacts should be traceable back to the authority that justifies their existence and behaviour.

### CA00-057 — Traceability Is Relationship-Based, Not Copy-Based
The audit should prefer stable references and relationship records over duplicating source text into indexes or dashboards.

### CA00-058 — Dashboards Are Derived
Audit dashboards, Brain views and coverage summaries report source state; they do not become independent authority.

### CA00-059 — Traceability Depth Is Risk-Scaled
Not every sentence requires a unique trace row. Stable identity, persistence, realm interfaces, security, architecture, high-risk mechanics and other consequential contracts receive deeper traceability than harmless descriptive prose.

---

# 13. Evidence & Verification

### CA00-060 — Evidence Must Match the Claim
Research evidence proves research claims; prototypes prove demonstrated capability; automated tests prove encoded behaviour; manual acceptance proves genuinely perceptual or environmental outcomes.

### CA00-061 — Historical Success Is Not Current Certification
Old passing tests and successful POC behaviour remain evidence but do not automatically certify the rebuilt architecture or current V1 specification.

### CA00-062 — Manual Evidence Is Not Fabricated
Where real human/perceptual/environmental verification is required, the audit records that requirement honestly instead of substituting automated confidence.

### CA00-063 — Evidence Provenance Must Be Retained
Certification evidence must identify the source, relevant version/build/context and result sufficiently for later review.

### CA00-064 — Absence of Evidence Is Not Evidence of Failure
Missing proof is classified as a gap or blocked certification state unless the specification explicitly requires existing proof at that stage.

---

# 14. Unknowns, Deferrals & Source Gaps

### CA00-065 — Unknown Is a Legitimate State
The audit may record uncertainty without forcing a premature decision.

### CA00-066 — Unknowns Require Ownership
Every material unknown must identify the authority or future work package responsible for resolution.

### CA00-067 — In-Scope Source Gaps Block Relevant Certification
A source gap inside the document's claimed authoritative scope prevents V1 certification until resolved, narrowed or formally moved outside that scope.

### CA00-068 — Out-of-Scope Technical Unknowns May Be Routed
A content document may certify while exact runtime algorithms remain downstream if the content semantics are complete and the technical owner is explicit.

### CA00-069 — Deferred Does Not Mean Forgotten
Deferred work remains discoverable and must not silently re-enter current authority through stale documents.

---

# 15. Issue Resolution & Propagation

### CA00-070 — Findings Have Stable IDs
Material audit findings should receive stable identifiers so resolutions and downstream impacts can be tracked.

### CA00-071 — Findings Identify Affected Sources
Each finding records the documents, registries, interfaces or systems known to be affected.

### CA00-072 — Resolution Requires Propagation
Fixing the owning source is insufficient if downstream consumers still preserve the stale interpretation.

### CA00-073 — Closure Requires Re-Audit
An issue is closed only after the resolution and affected propagation have been checked.

### CA00-074 — Rejected Resolution Attempts Remain Traceable Where Useful
Consequential failed interpretations may be retained as historical/audit evidence so the same ambiguity is not repeatedly rediscovered.

---

# 16. Parallel-Branch Delta Reconciliation

### CA00-075 — Branch C May Be Designed While Other Branches Continue
C-AUD methodology may be developed before FCC-14, B-OPS, Branch D and other pre-production work are finished.

### CA00-076 — New Authority Does Not Force Full Restart
When a parallel branch produces new accepted authority, Branch C identifies the affected domains and reopens only impacted audit rows or certification targets.

### CA00-077 — Delta Impact Must Be Explicit
Each consequential incoming change should record:

- source change;
- authority domain;
- affected documents/systems;
- audit rows invalidated;
- required reconciliation;
- re-certification outcome.

### CA00-078 — Unaffected Certification Work Remains Valid
A delta does not invalidate unrelated audit work merely because it is newer.

### CA00-079 — Final Corpus Freeze Changes the Rules
Before final corpus freeze, controlled deltas are normal. After freeze begins, semantic changes require explicit change control and may reopen affected certification gates.

---

# 17. V1 Rewrite & Normalisation

### CA00-080 — Audit Before Rewrite
Documents are not promoted by renaming first and reconciling later.

### CA00-081 — Rewrite From Resolved Truth
The clean V1 candidate is produced only after relevant findings have been resolved or legitimately routed.

### CA00-082 — V1 Should Read as Current Truth
Where history is not required for interpretation or migration, the final document should state the accepted current rule directly.

### CA00-083 — Preserve Necessary Migration History
Legacy IDs, aliases, schema transitions and other compatibility-critical history remain where current systems require them.

### CA00-084 — Remove Obsolete Engine Assumptions From Active Authority
Historical Unreal, Summer or other superseded implementation assumptions must not remain phrased as current requirements unless intentionally retained as evidence/history.

### CA00-085 — Rewrite Cannot Expand Scope by Accident
Editorial cleanup must not quietly add new requirements or design content.

### CA00-086 — V1 Candidate Receives Fidelity Audit
The rewritten output is checked against accepted source semantics before certification.

---

# 18. Active-File Replacement, Git & Provenance

### CA00-087 — Active Working Copies May Be Replaced
Once a V1 candidate is certified, the active working document may replace its pre-V1 draft copy in the active project tree.

### CA00-088 — Git Preserves Historical Provenance
Historical comparison, restoration and diffs are expected to remain available through repository history and retained archival material where required.

### CA00-089 — Active Tree Should Prefer Current Authority
The normal project path should not be cluttered with obsolete draft versions when doing so increases authority confusion.

### CA00-090 — Destructive Replacement Occurs Only After Certification
An active source is not overwritten as final merely because a rewrite has been generated.

### CA00-091 — Exact Git Mechanics Belong to Branch B
Branch C requires durable provenance and baseline identification; Branch B governs the exact branch/tag/commit procedure used to implement it.

---

# 19. Versioning & Certification Labels

### CA00-092 — Pre-V1 Version Strings Are Development Labels
`v0.x` documents remain development-stage artifacts even when locally stable.

### CA00-093 — Existing `v1.0` Labels Do Not Bypass C-AUD
A document already labelled v1.0 must still pass the applicable Branch C certification if it belongs to the final corpus.

### CA00-094 — Final Baseline May Be Normalised to V1.0
The project-wide certification may establish `v1.0` as the reconciled baseline regardless of earlier draft numbering, with Git and audit records preserving provenance.

### CA00-095 — Post-Lock Changes Are Versioned
After the V1 corpus lock, later accepted changes must use the applicable governed versioning/amendment process rather than silently mutating the baseline.

---

# 20. Exceptions, Waivers & Certification Debt

### CA00-096 — Certification Exceptions Must Be Explicit
No failed audit condition may be hidden to obtain green status.

### CA00-097 — Branch C Does Not Invent Engineering Waiver Law
Engineering waivers/deprecations remain governed by ENG-GOV/B-OPS where applicable.

### CA00-098 — Documentation Certification Exceptions Are Scoped
Any Branch C certification exception must identify the exact check, affected scope, justification, owner, expiry/review condition where relevant and downstream risk.

### CA00-099 — A Waiver Does Not Rewrite Truth
An exception may permit temporary certification treatment; it does not convert a contradiction into agreement.

### CA00-100 — AUD-5 Cannot Be Waived Into Global V1 Lock
A known unresolved systemic V1-blocking contradiction prevents the final corpus lock.

---

# 21. Branch & Programme Interfaces

## 21.1 FCC-14

### CA00-101 — FCC-14 Certifies Final Content Canon
FCC-14 is the current cross-realm content-certification owner.

### CA00-102 — Branch C Consumes FCC-14
Branch C later checks the wider corpus against FCC-14's certified content result rather than duplicating FCC-14's realm audit.

### CA00-103 — FCC-14 Technical Handoffs Remain Downstream
FCC-14 may legitimately route runtime algorithms, implementation schemas, art execution and Forge architecture into PRD/LFE/FORGE-ENG without failing content certification.

## 21.2 Branch A / Project Brain

### CA00-104 — Branch A Owns Brain Architecture
C-AUD does not redesign LF-BRAIN schemas, note types, navigation or Project Brain governance.

### CA00-105 — The Brain Supports Branch C
Once operational, the Brain should host/index the document register, authority state, findings, evidence, traceability and certification views defined by Branch C.

### CA00-106 — The Brain Does Not Become Audit Authority
Brain dashboards and proxies report C-AUD state; they do not independently declare V1 truth.

## 21.3 Branch B / ENG-GOV / B-OPS

### CA00-107 — Branch B Owns Engineering Governance
Branch C may identify gaps or propose amendments but may not silently rewrite ENG-GOV or B-OPS semantics.

### CA00-108 — B-OPS Provides Operational Enforcement Context
Branch C may consume governance enforcement state, evidence maturity, debt and exceptions when certifying engineering documentation.

## 21.4 Branch D

### CA00-109 — Branch D Owns Production Sequencing
Branch C determines V1 audit/certification truth; Branch D determines where that certification sits in the production/rebuild gate sequence.

### CA00-110 — Branch D Cannot Declare a Failed C-AUD Gate Passed
Roadmap sequencing may defer when a gate is required, but it may not reinterpret a Branch C failure as certification.

## 21.5 PRD / LFE / FORGE-ENG

### CA00-111 — PRD Evidence Feeds Technical Certification
PRD requirements, unknowns, research, prototypes and evidence become inputs to later LFE/FORGE-ENG and V1 technical-audit checks.

### CA00-112 — LFE / FORGE-ENG Must Trace Upstream
Final technical canon must be traceable to accepted product requirements, evidence and engineering governance.

---

# 22. Minimum Document V1 Certification Gate

A normative document may become `V1 CERTIFIED` only when every applicable condition below is satisfied:

```text
[ ] Document identity and scope are explicit
[ ] Primary authority owner is known
[ ] Disposition is correct
[ ] Applicable upstream authorities are current
[ ] Later accepted decisions are incorporated or routed
[ ] No unresolved in-scope material contradiction remains
[ ] Terminology/taxonomy matches current controlled usage
[ ] Stable IDs/aliases/migrations agree where applicable
[ ] Cross-references resolve
[ ] Downstream/interface obligations are represented
[ ] Registry/data relationships agree where applicable
[ ] Required technical handoffs exist where applicable
[ ] Required verification/evidence links exist where applicable
[ ] Unknowns and deferrals are explicit and owned
[ ] Superseded/historical assumptions are not presented as current truth
[ ] Rewrite preserves accepted semantics
[ ] V1 candidate fidelity audit passes
[ ] All blocking findings are closed
[ ] Any permitted exception is explicit and governed
```

### CA00-113 — Certification Is Scope-Aware
A document is not failed for refusing to decide something outside its legitimate scope.

### CA00-114 — Certification Is Claim-Aware
A document that claims more authority or completeness than its evidence supports must narrow the claim or resolve the deficiency.

---

# 23. Whole-Corpus V1 Lock Gate

The project may declare:

> **LEYFORGE DOCUMENTATION V1.0 — GLOBAL CORPUS LOCKED**

only when all of the following are true:

```text
[ ] C-AUD audit methodology required for execution is locked
[ ] final V1 corpus boundary is frozen
[ ] every registered in-scope source has a disposition
[ ] every V1-required normative document is individually certified
[ ] authority ownership is complete for all consequential active domains
[ ] no unresolved active-authority contradiction remains
[ ] no unresolved AUD-5 finding remains
[ ] no unresolved in-scope AUD-4 finding remains
[ ] cross-family interface audit passes
[ ] stable identity / registry / migration audit passes
[ ] required traceability audit passes
[ ] required completeness / missing-contract audit passes
[ ] evidence and verification state is truthful
[ ] superseded and historical sources cannot masquerade as active authority
[ ] final V1 outputs have passed fidelity re-audit
[ ] final certification register is complete
[ ] final lock report records exceptions, if any
[ ] durable repository baseline identification exists
[ ] Branch D receives the certification result for production gating
[ ] Project Brain state is updated or queued for authoritative update
```

### CA00-115 — Global Lock Means No Known Hidden Patchwork
The active V1 corpus should be usable without relying on undocumented chat memory, secret corrections, forgotten amendment chains or accidental knowledge of which old file to ignore.

### CA00-116 — Global Lock Is a Baseline, Not the End of Development
Future discoveries and changes remain possible, but they occur against a known coherent baseline through governed amendment/versioning.

---

# 24. Initial C-AUD Document Family

The Branch C V1 audit family is initially planned as:

```text
C-AUD-00 — V1 Audit Constitution, Scope & Certification Model
C-AUD-01 — Master Corpus Inventory & Disposition Standard
C-AUD-02 — Authority, Ownership & Precedence Reconciliation
C-AUD-03 — Canon, Terminology & Semantic Consistency Audit
C-AUD-04 — Stable Identity, Registry & Migration Audit
C-AUD-05 — Cross-Family Interface & Traceability Audit
C-AUD-06 — Completeness & Implementation-Contract Audit
C-AUD-07 — Evidence, Verification & Acceptance Audit
C-AUD-08 — Legacy, Supersession & Archive Disposition Audit
C-AUD-09 — V1 Rewrite, Normalisation & Promotion Standard
C-AUD-10 — Master V1 Certification Register
C-AUD-11 — Final Cross-Corpus Certification & V1 Lock Report
```

### CA00-117 — Family Shape May Be Refined Before Execution
The family may be split or consolidated if later Branch C work proves a cleaner ownership boundary, provided C-AUD-00 responsibilities remain fully covered.

---

# 25. Current Interoperability Notes

At the time of this v0.1 draft:

- Branch A LF-BRAIN-01 through LF-BRAIN-13 are design-locked and explicitly assign V1 audit methodology to Branch C.
- Branch B ENG-GOV-00 through ENG-GOV-15 are theoretically locked, with B-OPS operationalisation underway.
- B-OPS defines an operational family from B-OPS-00 through B-OPS-06 and preserves ENG-GOV as the rule-text authority.
- FCC-14 has begun its final content-certification programme and has already established the certification-not-redesign principle, content authority chain and cross-realm collision audit model.
- PRD work remains an evidence/technical-discovery input and must accept controlled deltas from later FCC certification before technical freeze.
- Branch D remains the owner of the production/rebuild roadmap and determines when Branch C certification becomes a hard rebuild gate.

These notes are current-state context, not permanent replacements for the owning Branch A/B/D/FCC/PRD records.

---

# 26. C-AUD-00 Acceptance Gate

C-AUD-00 may be considered theoretically locked when the project accepts that it has defined:

```text
[ ] Branch C ownership boundary
[ ] V1 certification meaning
[ ] individual-document vs whole-corpus certification distinction
[ ] audit corpus boundary rules
[ ] source/document dispositions
[ ] audit lifecycle states
[ ] generic check-result vocabulary
[ ] audit finding severity AUD-1 through AUD-5
[ ] authority/conflict-resolution principles
[ ] source-fidelity rules
[ ] dependency-ordered audit pipeline
[ ] domain-specific certification profiles
[ ] forward and reverse traceability requirements
[ ] evidence rules
[ ] unknown/source-gap/deferral handling
[ ] issue propagation and closure rules
[ ] parallel-branch delta reconciliation
[ ] V1 rewrite/normalisation rules
[ ] active-file replacement and provenance rules
[ ] V1 versioning semantics
[ ] certification exception boundaries
[ ] FCC-14 interface
[ ] Branch A interface
[ ] Branch B interface
[ ] Branch D interface
[ ] PRD/LFE/FORGE-ENG interface
[ ] minimum document V1 gate
[ ] whole-corpus V1 lock gate
[ ] initial C-AUD family structure
```

---

# 27. Next Document

After C-AUD-00 is locked, proceed to:

> **C-AUD-01 — Leyforge Master Corpus Inventory & Disposition Standard v0.1**

C-AUD-01 will define how every source is registered, deduplicated, related, dispositioned and prepared for the eventual V1 audit without allowing archive material, prototypes, duplicate exports or stale versions to masquerade as current authority.

---

# 28. Foundational Statement

> **Leyforge Documentation V1.0 is the first project-wide baseline in which “current”, “authoritative”, “implemented”, “tested”, “historical”, “superseded”, “deferred” and “unknown” are deliberately distinguishable rather than inferred from filenames, recency or memory.**

The purpose of Branch C is not to make every document look finished.

The purpose is to make the complete active Leyforge specification trustworthy enough that production can proceed without rediscovering what the project already knows.

---

**End of C-AUD-00 v0.1**
