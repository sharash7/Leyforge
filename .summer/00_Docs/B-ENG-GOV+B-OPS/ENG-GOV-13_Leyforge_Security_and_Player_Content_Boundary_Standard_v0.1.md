# ENG-GOV-13 — Leyforge Security / Player Content Boundary Standard

**Document ID:** ENG-GOV-13  
**Title:** Leyforge Security / Player Content Boundary Standard  
**Version:** v0.1  
**Status:** THEORETICALLY LOCKED  
**Authority Domain:** Engineering Governance — Security / Player Content Boundary  
**Parent Authority:** ENG-GOV-00 — Leyforge Engineering Constitution  
**Related Standards:** ENG-GOV-05, ENG-GOV-06, ENG-GOV-07, ENG-GOV-08, ENG-GOV-09, ENG-GOV-11, ENG-GOV-12, ENG-GOV-14, ENG-GOV-15  
**Project:** Leyforge

---

## 00. Purpose and Scope

ENG-GOV-13 defines Leyforge trust boundaries for external content, Forge packages, mods, imported worlds, networking, server/client authority, secrets, filesystem/process access, package permissions, sandboxing, resource limits, security diagnostics and hostile-input validation.

The governing principles are:

> Anything entering Leyforge from outside its trusted runtime boundary is data first, not authority.

> Player creativity may be powerful without automatically receiving arbitrary host-machine access.

---

## 01. Security Scope and Trust Model

### EG13-001 — ENG-GOV-13 Governs Trust Boundaries and Untrusted Inputs
The standard covers Forge/player content, mods/packages, imported worlds, network input, server/client authority, filesystem access, external processes, secrets, package permissions, sandboxing, resource limits, parsing boundaries, content validation, safe activation, security diagnostics and security-sensitive agent behaviour.

### EG13-002 — Security Is a System Property
Security crosses Forge, registries, persistence, networking, mods, CI, dependencies, servers, diagnostics and release infrastructure rather than living in one isolated “security module.”

### EG13-003 — Trusted and Untrusted Inputs Are Explicitly Distinguished
Downloaded packages, third-party mods, multiplayer requests, imported saves/worlds, workshop content, external assets and user-controlled configuration are untrusted by default.

### EG13-004 — Player-Created Does Not Mean Safe to Execute
Player-authored content does not automatically receive arbitrary filesystem, process, network, native-library or credential access.

### EG13-005 — Trust Is Explicit Rather Than Inferred From File Location
Copying a file into a project-controlled directory does not by itself make it trusted.

---

## 02. Security Zones and Least Privilege

### EG13-006 — Leyforge Defines Identifiable Security Zones
Conceptual zones include trusted core, trusted project tooling, validated declarative content, restricted executable extensions, remote/network input and the host environment.

### EG13-007 — Trust-Zone Crossings Require Appropriate Validation
Downstream systems may rely on upstream validation only where that guarantee is an explicit interface contract.

### EG13-008 — Components Receive Only the Capabilities They Require
A content importer, recipe pack or dedicated server should not receive broader host privilege than its purpose requires.

### EG13-009 — Privilege Is Capability-Based Where Practical
Explicit capabilities are preferred over broad undifferentiated trust flags.

### EG13-010 — Undeclared Privileged Capabilities Are Denied by Default
Arbitrary host filesystem, network, process execution, native-library loading and credential access require explicit authority.

---

## 03. Declarative and Executable Extension Tiers

### EG13-011 — Forge and Player Content Defaults to Declarative Data
Blocks, items, recipes, structures, models, animations and ordinary content packs should use validated data/contracts where sufficient.

### EG13-012 — Data-Driven Extension Is Preferred Before Arbitrary Executable Mod Capability
Registry definitions, capabilities, events, behaviour graphs and bounded DSLs are preferred where they satisfy the requirement.

### EG13-013 — Executable Mods/Plugins Are a Distinct Security Class
Data packs and native executable extensions are not treated as equivalent risk.

### EG13-014 — Native Extensions Are Never Silently Loaded From Ordinary Player Packages
Native code requires an explicit extension and trust mechanism.

### EG13-015 — Scriptable Mods Require a Real Sandbox or Explicit Full-Trust Classification
Future scripting architecture must state its security tier clearly.

### EG13-016 — “Sandboxed” Requires Enforceable Isolation
Conventions alone do not constitute a sandbox.

---

## 04. Forge and Package Activation

### EG13-017 — Forge Authoring Freedom Ends at Validated Publication/Import Contracts
Content is authored, validated, packaged, inspected and only then activated.

### EG13-018 — Forge Preview Is Not Security Acceptance
Successful preview does not prove path safety, registry validity, resource safety, script safety or dependency validity.

### EG13-019 — Forge Validation Occurs Before Content Becomes a Persistent World Dependency
External content must be validated before worlds rely on it.

### EG13-020 — External Packages Have Explicit Manifests
A manifest should eventually include package identity/version, schema, provenance, namespace, dependencies, capabilities, entry resources and integrity metadata.

### EG13-021 — Package Identity Is Independent of Filename
Renaming an archive does not change package identity.

### EG13-022 — Capabilities and Dependencies Are Declared Before Activation
Hidden runtime requirements are prohibited.

### EG13-023 — Package Installation and Activation Are Separate States
Presence on disk does not imply active trust.

### EG13-024 — Untrusted Packages Are Validated Before Activation
Manifest, schema, paths, IDs, dependencies, sizes, permission class and integrity are checked as applicable.

### EG13-025 — Invalid Packages Fail Closed
Partial activation is prohibited.

### EG13-026 — Activation Is Transactional When Persistent World Dependency Is Created
Failed activation must not leave the world in an ambiguous half-active state.

---

## 05. Core Isolation and Path Safety

### EG13-027 — External Packages Cannot Overwrite Leyforge Core Through Normal Installation
Package extraction must never be able to escape into project/runtime core files.

### EG13-028 — External Content Cannot Silently Claim Official Namespaces
ENG-GOV-09 namespace ownership remains enforced.

### EG13-029 — Core Overrides Use Explicit Modding Contracts
Core behaviour changes occur through declared patch/override architecture rather than filesystem replacement.

### EG13-030 — Archive Paths Are Normalized and Constrained
Traversal, absolute-path and root-escape patterns are rejected.

### EG13-031 — Package Extraction Writes Only Inside Its Assigned Destination
Storage boundaries are enforced.

### EG13-032 — Symlink/Reparse-Like Escapes Are Security-Sensitive
Extraction/import must not follow crafted links outside the package boundary.

### EG13-033 — File Extensions Alone Are Not Sufficient Validation
Actual content structure/type is validated where relevant.

---

## 06. Parser and Resource Safety

### EG13-034 — Externally Influenced Parsers Have Explicit Failure Handling
Malformed input causes safe rejection and diagnostics rather than partial authority.

### EG13-035 — Parsers Enforce Bounded Input Sizes
Manifest size, strings, nesting, collections, dimensions and equivalent limits are bounded as appropriate.

### EG13-036 — Untrusted Recursive Structures Have Depth Limits
Attacker-controlled nesting may not exhaust stacks/resources without bound.

### EG13-037 — Syntactically Valid Content Does Not Gain Unlimited Resource Consumption
Valid packages may still be rejected for abusive resource cost.

### EG13-038 — Imports and Runtime Content Use Role-Appropriate Resource Quotas
Disk, memory, CPU, entity counts, definitions, geometry, textures, script budgets and bandwidth may be bounded.

### EG13-039 — Compressed Content Is Checked for Decompression Amplification
Small archives must not expand into uncontrolled storage/memory use.

### EG13-040 — High-Risk Validation Happens Before Broad Runtime Authority
Staging/quarantine precedes activation where architecture permits.

### EG13-041 — Validation Tooling Uses Least Privilege
A malicious package reaching a validator must not automatically gain full machine access.

---

## 07. Save/World Import Security

### EG13-042 — Imported Saves and Worlds Are Untrusted Data
They may be corrupt, maliciously modified, newer than supported or dependent on unavailable content.

### EG13-043 — Imported Worlds Pass ENG-GOV-08 Validation Before Activation
Persistence rules remain authoritative.

### EG13-044 — Imported Worlds Cannot Overwrite Existing Worlds Merely by Claiming Their ID
Identity conflicts require explicit handling.

---

## 08. Configuration and Network Input

### EG13-045 — User Configuration Is Untrusted at Parse Boundaries
Editable configuration may still be malformed or hostile.

### EG13-046 — Configuration Cannot Grant Undeclared Privileged Capability
Privilege cannot be obtained through arbitrary fields outside the secure architecture.

### EG13-047 — Remote Clients Are Not Authoritative Merely Because They Are Legitimate Players
Shared-state direction is request/intent → server validation → authoritative result.

### EG13-048 — Client Prediction Does Not Equal Shared Authority
Presentation prediction remains subordinate to authoritative resolution.

### EG13-049 — Server Validation Covers Rules, Ownership and Conservation
Clients cannot directly assert arbitrary authoritative inventory/state.

### EG13-050 — Network Requests Are Schema-Validated Before Authoritative Processing
Malformed or unsupported requests fail before authority.

### EG13-051 — Network-Facing Systems Enforce Message and Rate Limits
Oversized requests, floods and unbounded queue growth are constrained.

### EG13-052 — Repeated Invalid Requests May Be Throttled, Rejected or Disconnected
Exact policy belongs to networking/server architecture.

### EG13-053 — Security Logging Cannot Become a Denial-of-Service Vector
Repeated attacks are rate-limited/aggregated diagnostically.

---

## 09. Network and Server Identity

### EG13-054 — Authentication Identity and Gameplay Entity Identity Are Distinct
Accounts/connections, characters, settlements and NPCs are separate domains unless explicitly mapped.

### EG13-055 — Permission Checks Use Authoritative Identity Rather Than Display Names
Display names never grant privileges.

### EG13-056 — Dedicated Servers Minimise Trust in Clients
Shared authoritative simulation is server-owned according to the eventual networking architecture.

### EG13-057 — Server Operator Privileges Are Separate From Ordinary Player Privileges
Role separation is explicit.

### EG13-058 — Administrative Operations Require Explicit Authorization
Kick, ban, rollback, package activation, operator grants and server configuration mutation are privileged actions.

### EG13-059 — Single-Player Security Remains Proportional
Local ordinary gameplay does not require unnecessary remote-style authorization machinery.

### EG13-060 — External Content Remains Untrusted in Single Player
Host-machine risk still exists.

---

## 10. Secrets and Signing

### EG13-061 — Secrets Never Belong in Source Control
Tokens, passwords, private keys and similar credentials are excluded.

### EG13-062 — Secrets Use Appropriate Secure Environment/Configuration Mechanisms
Development, CI and release may use different secure stores.

### EG13-063 — Secrets Are Not Written to Diagnostics or Support Bundles
ENG-GOV-07 redaction rules apply.

### EG13-064 — Secret Exposure Requires Rotation/Revocation Appropriate to Risk
Deleting current text is insufficient where history/log exposure occurred.

### EG13-065 — Sensitive Machine-Local Configuration Is Excluded From Git
Example/template files may be committed without real secrets.

### EG13-066 — Signing Proves Provenance, Not Universal Safety
A valid signature identifies the signer but does not prove content correctness.

### EG13-067 — Signing Keys Receive Stronger Handling
Release-key controls are more restrictive than ordinary configuration.

### EG13-068 — Integrity Hashes Detect Alteration but Do Not Replace Semantic Validation
Integrity and semantics remain separate.

### EG13-069 — Package Identity, Version, Manifest and Integrity Must Agree Before Activation
Inconsistency blocks activation.

---

## 11. Package Permissions and Lifecycle

### EG13-070 — Permission Requests Are Comprehensible and Capability-Oriented
Permissions describe real access rather than opaque numeric flags.

### EG13-071 — Packages Cannot Self-Grant New Privileges After Installation
Privilege changes require an authorization path.

### EG13-072 — Capability Expansion During Package Update Is Security-Significant
New privileged access cannot silently inherit prior approval.

### EG13-073 — Disabled Content Cannot Continue Exercising Active Privilege
Deactivation means privileged behavior stops.

### EG13-074 — Uninstalling Content Does Not Automatically Destroy Dependent World Data
Persistence missing-content rules apply.

### EG13-075 — Re-Enabling Content Resolves Preserved Identities Rather Than Guessing Replacements
Stable identity is preserved.

---

## 12. External Resources, Processes and Filesystem

### EG13-076 — Runtime Content Does Not Fetch Arbitrary Remote Resources by Default
External network fetch is denied unless explicitly governed.

### EG13-077 — Remote Resource Capability Requires Security/Privacy Architecture
Redirects, caching, size, type and privacy become part of the contract.

### EG13-078 — Player Content Cannot Launch Arbitrary Host Processes Under Ordinary Permissions
Process execution is denied by default.

### EG13-079 — Trusted Development Tool Process Execution Is Separate From Player Content Capability
Build/tooling privilege does not leak into mods.

### EG13-080 — Player Content Is Confined to Declared Virtual/Package Storage Where Practical
Storage access is scoped.

### EG13-081 — Writes Outside Assigned Storage Require Explicit Privileged Architecture
Broad filesystem write access is not default.

### EG13-082 — Absolute Host Paths From Untrusted Content Are Not Authoritative References
Portable package/domain identity is preferred.

### EG13-083 — Native Libraries Are Full-Trust Code Unless Real Isolation Exists
Polite API convention is not a sandbox.

### EG13-084 — Native Extensions Require Explicit Trust and Provenance
Native-code activation is a high-trust decision.

---

## 13. Deserialization and Command Security

### EG13-085 — Untrusted Serialized Input Becomes Validated Domain Data Before Authority
Arbitrary external object materialization is avoided.

### EG13-086 — Untrusted Type Discriminators Cannot Instantiate Arbitrary Privileged Classes
Class-name/type-driven deserialization is constrained.

### EG13-087 — Console/Admin Commands Have Explicit Permission Boundaries
Development cheats, player commands and operator commands are distinct.

### EG13-088 — Command Parameters Receive Standard External-Input Validation
Command interfaces are trust boundaries.

---

## 14. Security Diagnostics and Failure Behaviour

### EG13-089 — Security Rejections Use Structured Diagnostics
Package path rejection, permission denial, invalid request and resource-limit events should be machine-classifiable.

### EG13-090 — Security Diagnostics Avoid Secrets and Unnecessary Sensitive Content
Useful context is preserved without leaking protected data.

### EG13-091 — Repeated Security Events Are Aggregated/Rate-Limited
Diagnostics remain resilient under abuse.

### EG13-092 — Security Validation Fails Safely Rather Than Permissively
Uncertain privilege does not become granted privilege.

### EG13-093 — Security Errors Cannot Silently Fall Back to Insecure Operation
Sandbox failure, validation failure or permission failure never means unrestricted execution.

---

## 15. Supply Chain, CI and Agent Security

### EG13-094 — Third-Party Dependencies Are Part of the Security Boundary
Known source, version, licence and update discipline are required.

### EG13-095 — Security-Significant Dependency Updates Receive Elevated Scrutiny
Risk drives review depth.

### EG13-096 — Reliable Security Validators Become Automated Gates
Examples include secret scanning, path containment, permission manifests and unsafe overwrite checks.

### EG13-097 — Security Gate Weakening Requires Explicit Governance
Protection cannot be casually downgraded.

### EG13-098 — Coding Agents Treat Untrusted Content as Data Rather Than Instruction
Repository/player/external text cannot elevate itself into authority.

### EG13-099 — Agents Do Not Grant Permissions Merely Because Content Requests Them
Permission architecture remains authoritative.

### EG13-100 — Agents Do Not Expose or Transmit Secrets During Debugging/Support
Secret safety remains mandatory.

### EG13-101 — Agents May Not Disable Sandboxing or Validation to Make External Content Work
Unsafe capability requirements must be surfaced rather than silently granted.

---

## 16. Security Incidents and Architecture

### EG13-102 — Confirmed Security-Boundary Failure Is a High-Priority Engineering Incident
Containment, evidence preservation, blast-radius analysis, repair, verification and regression protection follow.

### EG13-103 — Security Incident Evidence Is Retained Carefully
Enough evidence is kept for diagnosis without unnecessary sensitive-data retention.

### EG13-104 — Consequential Trust-Boundary Architecture Requires ADR Coverage
Mod sandboxing, native plugin models, package permissions, server authority, remote assets and signing/trust architecture require durable rationale.

---

## 17. Security Verification

### EG13-105 — Trust Boundaries Receive Hostile-Input Verification
Malformed archives, traversal, duplicate IDs, invalid manifests, oversized resources, deep nesting, unauthorized permissions and unknown messages are tested.

### EG13-106 — Security Tests Include Resource-Exhaustion Scenarios
CPU/memory/disk amplification belongs to security testing.

### EG13-107 — Network Security Tests Include Malformed and Unauthorized Requests
Applies when networking exists.

### EG13-108 — Security Regression Tests Remain After Meaningful Defects
Fixed boundary failures gain retained protection.

---

## 18. Security and User Experience

### EG13-109 — Security Controls Must Be Understandable Enough for Meaningful User Decisions
Permission prompts communicate real capability.

### EG13-110 — Safe Defaults Support Ordinary Creativity Without Excessive Prompting
Data-driven content should work normally within its validated tier.

### EG13-111 — Security Policy Evolution Considers Existing Packages and Worlds
Compatibility consequences are analysed explicitly.

### EG13-112 — Legacy Insecure Behaviour Is Not Preserved Forever Merely for Compatibility
Security may intentionally break compatibility where necessary, with deliberate migration/support where feasible.

---

## 19. Modding Privilege Tiers and Server Content

### EG13-113 — Moddability Does Not Require Equal Privilege Across Extension Tiers
Conceptual tiers may include declarative data, governed behaviour, sandboxed scripting and explicit full-trust native extensions.

### EG13-114 — Higher Privilege Requires Stronger Trust and Distribution Requirements
Decorative data packs and native plugins are not equivalent.

### EG13-115 — Servers May Require Content Compatibility Without Receiving Arbitrary Client Host Authority
Required content uses a governed compatibility/distribution mechanism.

### EG13-116 — Automatic Server Content Defaults Toward Validated Non-Executable Data
Executable code is not silently auto-installed.

### EG13-117 — Executable Server-Required Extensions Require Explicit User Trust
No silent native-code execution on join.

### EG13-118 — Security-Relevant Package Provenance Is Inspectable
Identity, version, source, permissions, dependencies and signing/provenance state should be visible where supported.

---

## 20. World Isolation, Security Debt and Development Mode

### EG13-119 — Untrusted Content Should Not Unnecessarily Risk Unrelated Worlds
World isolation from ENG-GOV-08 applies.

### EG13-120 — External Content Failure Is Contained to the Smallest Practical Scope
One broken package should not corrupt an entire installation.

### EG13-121 — Missing Enforcement May Be Tracked as SECURITY-DEBT
Debt records identify boundary, current protection, required control and exposure trigger.

### EG13-122 — Security Debt Becomes Blocking Before Real Untrusted Exposure
Known uncontrolled boundaries must not be publicly exposed.

### EG13-123 — Development Convenience May Relax Selected Controls Only Through Explicit Development Modes
Bypasses are deliberate.

### EG13-124 — Development Security Bypasses Are Visibly Identified
Developers know when protections are relaxed.

### EG13-125 — Release Certification Verifies Development Bypasses Are Disabled or Explicitly Supported
Debug shortcuts do not leak into release accidentally.

---

## 21. Final Security Laws

### EG13-126 — Security Does Not Rely on Obscurity
Hidden folder names, undocumented commands or secret packet structures are not primary controls.

### EG13-127 — Ambiguous Privilege Is Denied Until Explicitly Authorised
When architecture cannot prove that external content has permission for a privileged action, permission is denied.

---

## External Content Lifecycle

```text
UNTRUSTED INPUT
      ↓
STAGING / QUARANTINE
      ↓
FORMAT + PATH VALIDATION
      ↓
RESOURCE-LIMIT VALIDATION
      ↓
MANIFEST / IDENTITY
      ↓
DEPENDENCY + PERMISSION CHECK
      ↓
REGISTRY / SEMANTIC VALIDATION
      ↓
SECURITY CLASSIFICATION
      ↓
TRANSACTIONAL ACTIVATION
      ↓
WORLD / RUNTIME ACCESS
```

## Extension Privilege Ladder

```text
DECLARATIVE CONTENT
      ↓
GOVERNED BEHAVIOUR
      ↓
SANDBOXED SCRIPTING
      ↓
EXPLICIT FULL-TRUST NATIVE EXTENSION
```

Not every tier must be implemented. The security standard requires that materially different privilege classes remain distinguishable.

---

## Closing Principle

Leyforge treats outside input as data first.

Trust is explicit. Privilege is minimal. Declarative content is preferred. Executable extensions are classified honestly. Packages cannot escape their storage boundaries or silently overwrite core authority. Servers validate client intent. Imported worlds remain untrusted. Secrets remain outside source and diagnostics. Security failures fail closed. Development bypasses are explicit. Higher privilege demands stronger trust.

When privilege is ambiguous, Leyforge denies it until authority says otherwise.
