# Leyforge Final Content Canon Collection

## FCC-13 — Definitive Blocks, Items, Forms, Recipes, IDs & Portal Binding
### Step 1E — Interview Architecture, Decision Map & Completeness Gate

**Version:** 0.1  
**Date:** 29 August 2026  
**Status:** FCC-13 PRE-INTERVIEW ARCHITECTURE COMPLETE — No FCC-13 Binding Decisions Locked Here  
**Predecessors:** FCC-13 Steps 1A–1D  
**Primary Authority:** Locked FCC-12; locked current Overworld/realm FCCs; FCC-13 source-reconciliation results.

---

# 1. Purpose

FCC-13 Step 1E is the final pre-interview document.

Its job is to turn the unresolved binding space identified in Steps 1A–1D into one complete, ordered decision architecture.

The architecture must ensure that FCC-13 never:

- re-asks FCC-12 ontology questions;
- assigns stable IDs before deciding identity layers;
- creates Block/Item duplication before deciding projection rules;
- locks recipes before deciding provider semantics;
- locks portal recipes before deciding first-access dependency structure;
- creates migration aliases before deciding canonical target identities;
- lets POC content silently define the modern registry.

The final FCC-13 interview therefore proceeds from the most foundational binding decisions to the most content-specific ones.

---

# 2. FCC-13 Interview Scope

The interview is limited to binding and registry decisions.

It may decide:

- stable ID architecture;
- namespace structure;
- material/form/content-object bindings;
- world/inventory projection;
- generated-form IDs;
- exact Block/Object/Item representation;
- exact recipe structure;
- exact quantities;
- provider bindings;
- process/station capability binding;
- exact portal components;
- exact six portal recipes;
- repair/recovery;
- migration aliases;
- legacy redirects;
- completeness/certification handoff.

It may not decide again:

- what counts as a material;
- whether form is separate from identity;
- whether provenance is separate from identity;
- whether provider substitution exists;
- whether Deepstone is a real material;
- whether Plant Fibre is one exact material;
- whether standard forms can inherit/generate;
- whether wrong-realm lockout exists;
- whether a seventh normal portal exists.

Those questions are already closed by FCC-12.

---

# 3. Interview Decision Style

Each question should be labelled by one of the following types.

## LOCKED-CONSTRAINT QUESTION
The answer space is bounded by upstream canon.

## ARCHITECTURE QUESTION
Selects final registry/recipe representation.

## CONTENT-BINDING QUESTION
Selects an exact canonical target, component, provider or quantity.

## MIGRATION QUESTION
Defines how old POC IDs/rows map into the new registry.

## PORTAL-GRAPH QUESTION
Defines first-access dependencies and portal reachability.

## CERTIFICATION QUESTION
Confirms completeness rather than inventing new content.

---

# 4. Recommended FCC-13 Interview Mode

The FCC-13 interview is suitable for the same autonomous recommendation mode used successfully in FCC-12.

Recommended operating rule:

> **Resolve routine registry, migration, quantity, form, namespace and capability questions autonomously using locked canon and source evidence. Surface only genuinely consequential creative forks where multiple canon-consistent choices would materially change Leyforge progression, player freedom, portal order or long-term registry architecture.**

Likely consequential forks include:

- portal dependency model;
- Veilgate first-access strategy;
- Dreamgate mandatory core strategy;
- stable-ID architecture if alternatives materially affect save/modding behaviour;
- generated-form identity architecture if alternatives materially affect scale/performance.

This recommendation is not itself a locked FCC-13 decision.

---

# 5. Interview Order

| Section | Topic | Questions |
|---|---|---:|
| R01 | Registry Identity, Namespace & Stability | Q1–20 |
| R02 | Block/Object/Item/Inventory Projection | Q21–44 |
| R03 | Material/Form Binding & Generated Forms | Q45–64 |
| R04 | Recipe Record Architecture & Provider Semantics | Q65–92 |
| R05 | Quantities, Conservation, Repair & Projects | Q93–112 |
| P01 | Global Portal Dependency Graph | Q113–132 |
| P02 | Covenant Portal Binding | Q133–148 |
| P03 | Veilgate Binding | Q149–166 |
| P04 | Dreamgate Binding | Q167–184 |
| P05 | Ascension Gate Binding | Q185–202 |
| P06 | Deepgate Binding | Q203–220 |
| P07 | Ashgate Binding | Q221–238 |
| M01 | Legacy Migration, Completeness & FCC-14 Handoff | Q239–268 |

**Total planned questions: 268**

---

# 6. R01 — Registry Identity, Namespace & Stability
## Q1–Q20

Q1. Define canonical stable-ID layers.  
Q2. One technical namespace, multiple namespaces, or hybrid?  
Q3. Human-readable semantic IDs, opaque IDs, or semantic + compact runtime ID?  
Q4. Which identifier is authoritative in save data?  
Q5. What is the role of numeric IDs?  
Q6. How are numeric-ID reorder/removal hazards prevented?  
Q7. Confirm display/localised names never become durable identity.  
Q8. Should canonical rows support multiple migration aliases?  
Q9. Should alias classes distinguish migration/deprecated/cultural/compatibility roles?  
Q10. When may a stable ID ever change?  
Q11. Should IDs encode domain ownership?  
Q12. Should realm prefixes appear only for genuinely realm-specific content?  
Q13. Must generated-form IDs be deterministic from material + form?  
Q14. How are multi-material object archetypes identified?  
Q15. How are player-created/generated material variants stored?  
Q16. How are mod namespaces isolated?  
Q17. How does Forge-authored content receive stable IDs?  
Q18. Which namespaces are reserved for core Leyforge?  
Q19. Can deleted canonical IDs ever be reused?  
Q20. Certify save/network/Forge/modding/migration/generated-form compatibility.

---

# 7. R02 — Block/Object/Item/Inventory Projection
## Q21–Q44

Q21. Can one physical object identity expose world and inventory projections?  
Q22. Is Block primarily world representation, semantic subtype, or implementation detail?  
Q23. Is Item primarily inventory projection where physical identity is unchanged?  
Q24. Lock implementation of the single-definition rule.  
Q25. Resolve Oak Log Block 9 / Item 142.  
Q26. Resolve Stone Brick Block 31 / Item 170.  
Q27. Resolve Cobblestone Block 32 / Item 169.  
Q28. Resolve Oak Beam Block 33 / Item 168.  
Q29. Resolve Clay Roof Tile Block 61 / Item 224.  
Q30. Resolve Oak Planks/Oak Plank.  
Q31. Resolve Clay Brick Block/Clay Brick.  
Q32. Resolve Cave Mushroom living-versus-harvested lifecycle.  
Q33. Establish general living plant/harvested product rule.  
Q34. Bind world fluid vs stored fluid.  
Q35. Bind world gas vs stored gas.  
Q36. Define installed removable component identity.  
Q37. Define machine multiblock/object representation.  
Q38. Define structure-versus-item boundary.  
Q39. Define placeable furniture projection.  
Q40. Define natural boulder/world-source projection.  
Q41. Define broken/damaged object representation.  
Q42. Define valid/inactive/damaged/ruined portal relationship.  
Q43. Define unsupported legacy-object migration outcome.  
Q44. Certify no accidental Block/Item duplication remains.

---

# 8. R03 — Material/Form Binding & Generated Forms
## Q45–Q64

Q45. Lock globally standard form families.  
Q46. Decide where material→form eligibility is stored.  
Q47. Generated forms: materialised rows, virtual deterministic forms, or hybrid?  
Q48. Define stable generated-form IDs.  
Q49. Are ordinary form recipes generated from shared conversion profiles?  
Q50. Define visual/art inheritance.  
Q51. Define geometry/collision inheritance.  
Q52. Define specialist form overrides.  
Q53. Define forbidden material/form combinations.  
Q54. Bind timber form profiles.  
Q55. Bind stone/masonry form profiles.  
Q56. Bind metal/alloy form profiles.  
Q57. Bind glass/crystal form profiles.  
Q58. Bind fibre/textile form profiles.  
Q59. Bind ceramic form/material transition.  
Q60. Resolve filled-container form/composite/state representation.  
Q61. Define multi-material object composition persistence.  
Q62. Confirm visible material variants remain render-accessible.  
Q63. Define legacy explicit-form migration to generated forms.  
Q64. Certify scalable/save-stable form architecture.

---

# 9. R04 — Recipe Record Architecture & Provider Semantics
## Q65–Q92

Q65. Lock recipe stable-ID architecture.  
Q66. Lock recipe namespace structure.  
Q67. Represent exact-material inputs.  
Q68. Represent exact-component inputs.  
Q69. Represent provider inputs.  
Q70. Represent required form independently.  
Q71. Represent required state.  
Q72. Represent quality/grade/purity thresholds.  
Q73. Represent provenance requirements.  
Q74. Reference recipe knowledge.  
Q75. Reference permission/legal/contract conditions.  
Q76. Represent environmental requirements.  
Q77. Represent process capabilities.  
Q78. Define when exact named station is justified.  
Q79. Represent station capability bundles.  
Q80. Resolve alternative station providers.  
Q81. Keep operator knowledge separate from station capability.  
Q82. Apply same recipe rules to automation.  
Q83. Distinguish output categories: form/state/transformed material/component/composite/project.  
Q84. Define by-product representation.  
Q85. Define waste/loss representation.  
Q86. Define scrap/offcut representation.  
Q87. Define recycling links.  
Q88. Define provenance carry-through.  
Q89. Define quality carry-through.  
Q90. Allow provider choice to alter performance without changing archetype.  
Q91. Define provider-validation UI explanation requirements.  
Q92. Certify FCC-12 recipe semantics are preserved.

---

# 10. R05 — Quantities, Conservation, Repair & Projects
## Q93–Q112

Q93. Global timber yield standard.  
Q94. Global stone-cutting yield.  
Q95. Slab/stair/wall geometry-conserving yields.  
Q96. Metal-forming yield standard.  
Q97. Fibre/textile yield standard.  
Q98. Glass-forming yield standard.  
Q99. Ceramic yield standard.  
Q100. Define valid specialist-yield overrides.  
Q101. Define physical abstraction of one material unit.  
Q102. Decide whether fractional units exist internally.  
Q103. Define fluid/gas quantity/capacity representation.  
Q104. Final filled-container identity.  
Q105. Final installed-component recovery rule.  
Q106. Choose repair architecture.  
Q107. Decide provider substitution in repair.  
Q108. Apply repair architecture to portals.  
Q109. Define staged/project recipes.  
Q110. Define project material reservation.  
Q111. Define dismantling/salvage recovery.  
Q112. Certify conservation.

---

# 11. P01 — Global Portal Dependency Graph
## Q113–Q132

Q113. Choose portal first-access philosophy: mostly independent, cross-realm graph, or hybrid.  
Q114. Which portals must be independently Overworld-bootstrappable?  
Q115. Is Covenant Portal normally first, one of several first options, or unrestricted?  
Q116. May first Veilgate require another realm?  
Q117. May first Dreamgate require another realm?  
Q118. Should Ascension Gate require earlier-realm matter?  
Q119. Should Deepgate require earlier-realm matter?  
Q120. Should Ashgate require earlier-realm matter?  
Q121. What provenance classes count as guaranteed pre-access foreign matter?  
Q122. Which authored channels may supply guaranteed foreign components?  
Q123. How is RNG prevented from gating mandatory portal ingredients?  
Q124. Confirm valid sequence breaking.  
Q125. Must portal construction require knowledge separate from materials?  
Q126. How may portal knowledge be discovered?  
Q127. Choose portal-upgrade representation standard.  
Q128. Choose destination-calibration representation.  
Q129. Confirm activation consumables may be portal-specific.  
Q130. Choose portal repair/recovery default pattern.  
Q131. Decide whether six portals share one Realm Access runtime with family-specific validators.  
Q132. Certify the dependency graph is reachable/non-circular before exact recipes proceed.

---

# 12. P02 — Covenant Portal Binding
## Q133–Q148

The following upstream quantities remain protected:
- 12 frame-family pieces for standard build;
- 1 Keystone Socket;
- 1 Covenant Heart;
- frame craft output = 2;
- frame craft roles = 2 stone / 1 hardwood / 1 plant binding / 1 mana-attunement component;
- locked Covenant Heart subcomponent counts;
- first activation consumes 1 Verdant Growth Catalyst.

Q133. Lock cut-stone provider.  
Q134. Lock hardwood provider.  
Q135. Lock plant binding provider.  
Q136. Lock mana-conductive component/provider.  
Q137. Lock precision fitting provider.  
Q138. Lock Attunement Vessel provider/material.  
Q139. Lock Carved Heart Core hardwood provider.  
Q140. Lock Botanical Binding provider.  
Q141. Lock Mana-Conductive Insert provider.  
Q142. Lock Growth Catalyst water-dose representation.  
Q143. Lock Growth Catalyst botanical inputs.  
Q144. Lock fertility/growth reagent.  
Q145. Lock mana charge/catalyst representation.  
Q146. Lock process/station capabilities for subcomponents.  
Q147. Lock repair/recovery.  
Q148. Certify FCC-02G quantitative contract remains intact.

---

# 13. P03 — Veilgate Binding
## Q149–Q166

Q149. Choose first-access model: guaranteed pre-access Ancestral matter, universal frame + authentic core roles, restored historical Veilgate, or hybrid.  
Q150. Which of the six Ancestral roles are mandatory in first construction?  
Q151. Lock Memory Stone form/quantity.  
Q152. Lock Memory Glass form/quantity.  
Q153. Lock Soul Silver form/quantity.  
Q154. Echo Pearl: direct installation or crafted core?  
Q155. If crafted, define Veilgate core identity/name.  
Q156. Lock Echo Pearl quantity.  
Q157. Lock Grave Salt quantity/representation.  
Q158. Lock recognition/inscription representation.  
Q159. Separate recognition knowledge from physical inscription?  
Q160. If needed, lock guaranteed pre-access Ancestral provenance route.  
Q161. Lock any mandatory external-realm dependency.  
Q162. Lock universal supporting provider roles.  
Q163. Decide activation consumable.  
Q164. Lock repair.  
Q165. Lock recovery.  
Q166. Certify no inaccessible first-entry Ancestral dependency.

---

# 14. P04 — Dreamgate Binding
## Q167–Q184

Q167. Choose first-access model.  
Q168. Lock mandatory subset of Dreamgate role pool.  
Q169. Decide whether Dreamgate has one mandatory core identity.  
Q170. Coherence Core: mandatory core, optional stabiliser, or upgrade?  
Q171. If another core exists, define its identity.  
Q172. Lock frame provider.  
Q173. Lock Lucid Glass role/form/quantity.  
Q174. Lock Dream Mote role.  
Q175. Lock Waking Stone role.  
Q176. Lock Memory Thread role.  
Q177. Lock allowed universal imported roles.  
Q178. If needed, lock guaranteed pre-access Somnolent provenance.  
Q179. Lock any earlier-realm dependency.  
Q180. Decide activation consumable.  
Q181. Lock coherence-attunement representation.  
Q182. Lock repair.  
Q183. Lock recovery.  
Q184. Certify Dreamgate remains the only normal physical Somnolent portal.

---

# 15. P05 — Ascension Gate Binding
## Q185–Q202

Q185. Lock first-access dependency model.  
Q186. Lock structural frame provider.  
Q187. Lock conductive/stabilising fitting provider.  
Q188. Define Ascension Keystone recipe architecture.  
Q189. Lock Keystone structural component.  
Q190. Lock Keystone conductive component.  
Q191. Lock Keystone magical/aetheric component.  
Q192. Lock Keystone attunement step.  
Q193. Lock vertical/aetheric attunement-layer representation.  
Q194. Lock activation interface.  
Q195. Decide mandatory earlier-realm ingredient.  
Q196. Lock first-access quantities.  
Q197. Decide activation consumable.  
Q198. Lock Keystone recovery.  
Q199. Lock portal repair.  
Q200. Lock native upgrade inputs.  
Q201. Lock Keystone upgrade representation.  
Q202. Certify first access is not self-locked behind Ascendant matter.

---

# 16. P06 — Deepgate Binding
## Q203–Q220

Q203. Lock first-access dependency model.  
Q204. Lock structural frame provider.  
Q205. Lock anchoring/stabilisation representation.  
Q206. Define Deep Keystone recipe architecture.  
Q207. Lock Keystone structural component.  
Q208. Lock Keystone pressure/depth component.  
Q209. Lock Keystone magical/spatial component.  
Q210. Lock pressure/depth attunement representation.  
Q211. Lock activation interface.  
Q212. Decide mandatory earlier-realm ingredient.  
Q213. Lock first-access quantities.  
Q214. Lock destination calibration.  
Q215. Decide activation consumable.  
Q216. Lock Deep Keystone recovery.  
Q217. Lock portal repair.  
Q218. Lock native upgrade inputs.  
Q219. Lock native upgrade representation.  
Q220. Certify first Deepgate has no inaccessible Deep-native dependency.

---

# 17. P07 — Ashgate Binding
## Q221–Q238

Q221. Lock first-access dependency model.  
Q222. Lock reinforced-frame provider.  
Q223. Lock thermal-stabilisation representation.  
Q224. Define Ash Keystone recipe architecture.  
Q225. Lock Keystone structural component.  
Q226. Lock Keystone heat-stabilising component.  
Q227. Lock Keystone magical/realm component.  
Q228. Lock realm/depth attunement representation.  
Q229. Lock activation interface.  
Q230. Decide mandatory earlier-realm ingredient.  
Q231. Lock first-access quantities.  
Q232. Decide activation consumable.  
Q233. Lock Ash Keystone recovery.  
Q234. Lock portal repair.  
Q235. Lock native upgrade inputs.  
Q236. Lock deeper-destination calibration representation.  
Q237. Lock native-upgrade representation.  
Q238. Certify first Ashgate has no inaccessible Ashen-only dependency.

---

# 18. M01 — Legacy Migration, Completeness & FCC-14 Handoff
## Q239–Q268

Q239. Define legacy alias storage.  
Q240. Allow multiple legacy IDs per canonical target?  
Q241. Confirm removed IDs cannot be reused.  
Q242. Choose default unsupported-legacy-object policy.  
Q243. Define salvage-conversion policy.  
Q244. Define deprecated compatibility-object policy.  
Q245. Define migration warning/reporting.  
Q246. Define learned-recipe migration.  
Q247. Define removed learned-recipe handling.  
Q248. Define contextual migration of generic Stone/Plant Fibre/etc. recipes.  
Q249. Define duplicate Block/Item recipe redirects.  
Q250. Define numeric-only save recovery.  
Q251. Confirm old asset paths are migration metadata only.  
Q252. Confirm old texture/colour values are not canon.  
Q253. Resolve POC named-station migration.  
Q254. Set evidence threshold for retaining exact POC equipment/food/loot.  
Q255. Segregate useful test fixtures from canon.  
Q256. Resolve Goblin `Monster Drop` category migration.  
Q257. Resolve old coin/token rows without universalising currency.  
Q258. Map Ancient Portal Frame/Broken Portal Block/Unstable Rift Block.  
Q259. Confirm Deepstone redirects.  
Q260. Confirm Plant Fibre redirects.  
Q261. Certify remaining FCC-12 legacy terms.  
Q262. Confirm every current canonical binding demand has a target.  
Q263. Confirm all 312 POC rows have final disposition.  
Q264. Confirm every retained recipe/process has semantic binding.  
Q265. Confirm all six exact portal recipes and recovery paths exist.  
Q266. Confirm FCC-14 ownership remains intact.  
Q267. Generate FCC-14 handoff requirements.  
Q268. Confirm zero unresolved binding holds before FCC-13 lock.

---

# 19. Mapping Step-1D Decisions D01–D78

- **D01–D15** → R01/R03/R04/R05
- **D16–D22** → P01
- **D23–D30** → P02 Covenant
- **D31–D39** → P03 Veilgate
- **D40–D48** → P04 Dreamgate
- **D49–D56** → P05 Ascension Gate
- **D57–D64** → P06 Deepgate
- **D65–D72** → P07 Ashgate
- **D73–D78** → M01 Migration/Certification

All Step-1D unresolved decisions have an explicit interview destination.

---

# 20. Consequential Creative Fork C1 — Portal Dependency Philosophy

## Option A — Mostly Independent Bootstrap
Most realms can be first-accessed from Overworld capability + knowledge.

Effect:
- high sandbox realm-order freedom;
- minimal hard cross-realm dependency.

## Option B — Deliberate Realm Dependency Graph
Some portals require earlier-realm materials/components.

Effect:
- stronger inter-realm progression structure;
- tighter realm ordering.

## Option C — Hybrid
Several realms independently bootstrap while some dangerous/advanced realms depend on earlier ones.

Effect:
- preserves substantial freedom while retaining meaningful inter-realm progression.

This is likely the single most consequential FCC-13 progression decision.

---

# 21. Consequential Creative Fork C2 — Veilgate First Access

## Option A — Guaranteed Pre-Access Ancestral Matter
Authentic Ancestral material is deliberately guaranteed in the Overworld before first entry.

## Option B — Universal Frame + Authentic Ancestral Core
First Veilgate preserves Ancestral identity in its core/recognition layer while universal providers handle ordinary structure.

## Option C — Restore Existing Historical Veilgate
First access is reconstruction/reactivation of a legitimate historical Veilgate.

## Option D — Hybrid
Combine guaranteed relic/core material with newly built universal support structure.

Each remains source-consistent but changes exploration tone materially.

---

# 22. Consequential Creative Fork C3 — Dreamgate Core

## Option A — Coherence Core Mandatory
Clear engineered central identity.

## Option B — Coherence Core Optional/Alternative
Dreamgate remains flexible and more dreamlike.

## Option C — Another Authored Core
Allowed only if it remains consistent with FCC-04 and does not create filler ontology.

---

# 23. Consequential Architecture Fork C4 — Generated Forms

## Option A — Fully Materialised Registry Rows
Every valid material+form has an explicit row.

## Option B — Deterministic Virtual Forms
Material+form resolves dynamically.

## Option C — Hybrid
Standard forms deterministic/generated; specialist authored forms explicit.

This is the likely recommendation path, but it remains interview-owned.

---

# 24. Explicitly Excluded Questions

Do not reopen:

- material ontology;
- provenance ontology;
- realm ecology;
- settlement/government/culture;
- creature/boss/dungeon rosters;
- universal death;
- realm-material naming;
- final palette values;
- deferred realms;
- playable Void;
- Pocket Realm Construction;
- engine implementation beyond registry contract.

---

# 25. Expected Final FCC-13 Canon Documents

## FCC-13A — Stable Identity, Registry Architecture & Namespace Rules
Consumes R01 plus core R02/R03 decisions.

## FCC-13B — Definitive Block, Object, Item, Form & Inventory Projection Registry
Consumes R02, R03 and the canonical binding matrix.

## FCC-13C — Definitive Recipe, Process, Provider & Quantity Registry
Consumes R04, R05 and realm-local process contracts.

## FCC-13D — Realm Portal Components, Recipes & Access Binding
Consumes P01–P07.

## FCC-13E — Legacy Migration Matrix, Completeness Audit & FCC-14 Handoff
Consumes M01 and the final POC migration resolution.

---

# 26. Interview Completion Conditions

The interview is complete only when:

- [ ] Q1–Q268 answered;
- [ ] all consequential forks resolved;
- [ ] stable-ID architecture locked;
- [ ] generated-form architecture locked;
- [ ] single-definition projection locked;
- [ ] recipe/provider schema locked;
- [ ] quantity/conservation defaults locked;
- [ ] global portal dependency graph locked;
- [ ] Covenant provider bindings locked;
- [ ] Veilgate first-access/core strategy locked;
- [ ] Dreamgate role/core strategy locked;
- [ ] Ascension Keystone recipe locked;
- [ ] Deep Keystone recipe locked;
- [ ] Ash Keystone recipe locked;
- [ ] all six first-access recipes reachable;
- [ ] portal repair/recovery locked;
- [ ] all 312 legacy POC rows have final migration status;
- [ ] all current-canon binding demands have targets;
- [ ] no FCC-12 ontology decision reopened;
- [ ] no FCC-14 authority consumed.

---

# 27. Pre-Writing Completeness Gate

Before FCC-13A–E writing begins:

## Registry
- [ ] stable IDs complete
- [ ] namespaces complete
- [ ] aliases complete
- [ ] generated forms complete
- [ ] object projection complete

## Recipes
- [ ] recipe schema complete
- [ ] provider schema complete
- [ ] station capability schema complete
- [ ] quantities complete
- [ ] repair/project architecture complete

## Portals
- [ ] global dependency graph complete
- [ ] Covenant Portal complete
- [ ] Veilgate complete
- [ ] Dreamgate complete
- [ ] Ascension Gate complete
- [ ] Deepgate complete
- [ ] Ashgate complete

## Migration
- [ ] 312-row POC matrix fully resolved
- [ ] legacy IDs redirected
- [ ] unsupported legacy content handled
- [ ] learned recipes migrated
- [ ] no rejected FCC-12 placeholder resurrected

---

# 28. Final FCC-13 Lock Conditions

FCC-13 may be formally locked only when:

1. FCC-13A complete;
2. FCC-13B complete;
3. FCC-13C complete;
4. FCC-13D complete;
5. FCC-13E complete;
6. interview-to-document fidelity audit complete;
7. all 312 legacy rows accounted for;
8. all current-canon binding demands accounted for;
9. all six portal recipes verified reachable;
10. zero unresolved registry/recipe/migration holds.

Formal status:

> **FCC-13 — DEFINITIVE BLOCKS, ITEMS, FORMS, RECIPES, IDS & PORTAL BINDING — CONTENT CANON LOCKED**

Then FCC-14 may begin final cross-realm reconciliation/certification.

---

# 29. Step 1E Completeness Audit

- [x] D01–D78 mapped;
- [x] question order follows dependency structure;
- [x] identity precedes content binding;
- [x] content binding precedes recipes;
- [x] recipe/provider rules precede portal recipes;
- [x] global portal graph precedes portal-specific recipes;
- [x] all six portals have dedicated sections;
- [x] Covenant quantitative contract protected;
- [x] Veilgate dependency/core fork preserved;
- [x] Dreamgate role/core fork preserved;
- [x] Ascension/Deep/Ash Keystone recipes isolated;
- [x] migration follows canonical target decisions;
- [x] FCC-12 ontology excluded;
- [x] FCC-14 authority preserved;
- [x] consequential creative forks surfaced;
- [x] FCC-13A–E writing architecture defined;
- [x] formal lock gate defined.

---

# 30. Step 1E Result

> **FCC-13 STEP 1E — INTERVIEW ARCHITECTURE, DECISION MAP & COMPLETENESS GATE — COMPLETE v0.1**

The FCC-13 pre-interview reconciliation phase is now complete.

Completed:

- Step 1A — source authority and binding extraction;
- Step 1B — 312-row legacy POC reconciliation;
- Step 1C — current-canon binding-demand extraction;
- Step 1D — recipe/provider/portal dependency matrix;
- Step 1E — complete interview architecture.

The next phase is:

> **FCC-13 DEFINITIVE BINDING INTERVIEW — Q1–Q268**

Recommended execution:

1. resolve R01–R05 first;
2. explicitly resolve the global portal dependency philosophy;
3. resolve P02–P07;
4. finish migration/certification;
5. write FCC-13A–E only after all interview decisions are locked.

No additional source-reconciliation document is currently required before the interview begins.

---

**End of FCC-13 Step 1E v0.1**
