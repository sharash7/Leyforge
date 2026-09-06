# Summer Progress Audit Spec

## Why
The project has a large documentation corpus and a substantial but uneven implementation baseline. The user needs a reconciled audit that compares Documents 00-20 and Sets 24-30 against the current repository and `.summer` evidence to show actual progress and remaining implementation work.

## What Changes
- Audit the requested documentation ranges in `.summer/00_Docs` and extract intended features, milestones, and deliverables.
- Audit current implementation evidence in `.summer/requirements`, `.summer/plans`, `.summer/release`, `.summer/verification`, and the live repository.
- Reconcile intended scope against implemented systems and classify coverage by subsystem and document family.
- Produce a detailed progress report and a detailed remaining-work report with blockers, gaps, and recommended next implementation priorities.

## Impact
- Affected specs: foundation scope, atlas scope, governance scope, validation scope, implementation coverage reporting
- Affected code: no runtime code changes; audit inputs are `.summer/00_Docs`, `.summer/requirements`, `.summer/plans`, `.summer/release`, `.summer/verification`, `project.godot`, and `scripts/`

## ADDED Requirements
### Requirement: Documentation To Implementation Audit
The system SHALL reconcile the requested documentation sets with the current implementation baseline and identify what is implemented, partial, stubbed, and missing.

#### Scenario: Audit requested ranges
- **WHEN** the user requests an audit of Documents 00-20 and Sets 24-30
- **THEN** the audit reads the relevant markdown and text sources from `.summer/00_Docs`
- **AND** extracts intended systems, milestones, and explicit deliverables for each requested range

#### Scenario: Compare against live implementation
- **WHEN** the audit evaluates current project status
- **THEN** it cross-checks `.summer` coverage and roadmap artifacts against the live repository structure and runtime systems
- **AND** identifies supported implementation evidence for each major subsystem

### Requirement: Progress And Remaining Work Report
The system SHALL provide a detailed report that summarizes current progress and clearly identifies the work left to implement.

#### Scenario: Produce progress report
- **WHEN** the audit completes reconciliation
- **THEN** the report groups findings by subsystem and document family
- **AND** describes current maturity, strongest evidence, and notable inconsistencies between design, roadmap, and implementation

#### Scenario: Produce remaining-work report
- **WHEN** the report lists unresolved scope
- **THEN** it identifies missing and stubbed systems, major partial areas, and implementation blockers
- **AND** recommends a priority order for future work based on current coverage evidence
