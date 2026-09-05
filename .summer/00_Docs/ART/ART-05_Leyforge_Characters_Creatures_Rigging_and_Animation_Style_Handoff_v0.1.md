# Leyforge Art Production Corpus

## ART-05 — Characters, Creatures, Rigging & Animation Style Handoff

**Document ID:** ART-05  
**Title:** Leyforge Characters, Creatures, Rigging & Animation Style Handoff  
**Version:** v0.1  
**Date:** 4 September 2026  
**Status:** **LOCKED CHARACTER/CREATURE/MOTION BASELINE — OWNER APPROVED 4 SEPTEMBER 2026**  
**Project:** Leyforge  
**Product context:** Ley Realms / The Forge  
**Corpus:** ART — Final Art Direction, Asset Production & Codex/Forge Handoff  
**Direct parent:** ART-01 — Master Leyforge Visual Language & Style Bible  
**Material parent:** ART-02 — Materials, Colour, Texture, Surface & Shader Art Standard  
**World/culture parent:** ART-03 — World, Realm, Biome, Architecture & Culture Art Direction  
**Model parent:** ART-04 — Blocks, Items, Machines, Structures, Equipment & Vessel Modelling Standard  
**Constitutional parent:** ART-00 — Art Production Constitution & Authority Map  
**Primary upstream authorities:** FCC ancestry/personhood/creature canon; current realm/fauna/monster/people canon; FCC-12/13/14 physical-form and stable-identity canon; Document Set 22B-22H entity/anatomy/rig/animation/customisation/gameplay-integration authority  
**Inherited production baselines:** 22B body-plan graphs and anatomy architecture; 22C humanoid creator; 22D creature/monster/boss creator; 22E skeletons, rigging, joints, IK and attachments; 22F animation, locomotion, combat and runtime states; 22G equipment/customisation/visual inheritance; 22H gameplay markers and simulation LOD; 22L visual production/migration plan; applicable ENG-GOV and FORGE-ENG law  
**Primary downstream consumers:** ART-06 through ART-10, Codex/coding agents, The Forge, character and creature production, animation libraries, gameplay presentation, VFX/audio synchronisation, visual QA, Project Brain  

---

# 00. Executive Character and Motion Statement

Leyforge characters and creatures must feel **built from the same voxel world they inhabit, alive enough to carry personality and consequence, and readable enough that posture and motion communicate before UI text is needed**.

The character promise is:

> **A Leyforge person should remain recognisable by body plan, posture, face, clothing, equipment and lived history before decorative rarity effects are considered.**

The creature promise is:

> **A Leyforge creature should move according to anatomy, mass, habitat, temperament and supernatural condition rather than sharing one universal animation personality.**

The animation promise is:

> **Motion must preserve voxel clarity, visible weight, contact, anticipation and follow-through while remaining responsive enough for play and bounded enough for deterministic production.**

The production promise is:

> **Codex should be able to receive a canonical person, creature or animation-family request, resolve the correct body plan and visual inheritance, build or select the correct source model and rig, author a readable motion set, attach equipment and effect anchors, validate first/third-person and gameplay-distance readability, and hand reproducible editable source to The Forge without inventing anatomy, mechanics, ancestry traits or combat rules.**

ART-05 does not replace Set 22's technical systems. It establishes the **final Leyforge artistic law** those systems must express.

---

# 01. Authority and Scope

## 01.1 ART-05 owns

ART-05 owns final global art-direction and production rules for:

- humanoid and person body stylisation;
- head, face, gaze and expression readability;
- visible age, build, posture and life-history presentation;
- personhood-safe and ancestry-safe visual variation;
- clothing/equipment fit presentation as it relates to bodies and motion;
- creature silhouette and anatomy presentation;
- ordinary fauna, magical fauna, monsters, spirits, undead, constructs, plant/fungal beings and anomaly motion style;
- skeleton/rig visual expectations;
- joint/deformation style;
- contact, IK and secondary-motion artistic expectations;
- first-person and third-person body relationship;
- idle and locomotion style;
- work, social and civilisation animation language;
- combat anticipation, commitment, follow-through and recovery presentation;
- ranged and magic-casting body language;
- hurt, injury, exhaustion, incapacitation and death presentation;
- boss phase and colossal-creature motion hierarchy;
- deterministic motion/personality variation;
- animation readability and accessibility;
- animation LOD presentation rules;
- art-facing animation events and effect/audio timing references;
- Codex character/creature/animation production sequence;
- ART-05 golden-reference candidates and QA.

## 01.2 ART-05 does not own

ART-05 does not decide:

- whether a people/creature/entity exists;
- ancestry, culture, faction or species canon;
- AI decision-making;
- navigation authority;
- combat damage, hitbox truth or attack stats;
- movement speed values;
- exact gameplay collision dimensions;
- animation-event gameplay authority;
- VFX design owned by ART-06;
- sound design owned by ART-07;
- UI portrait/icon graphic language owned by ART-08;
- implementation architecture owned by FORGE-ENG;
- final runtime performance budgets owned by engineering/performance authority;
- mechanical consequences of age, injury, disability or body variation unless defined upstream.

## 01.3 Presentation cannot invent gameplay truth

A dramatic animation may communicate an action. It does not create that action's mechanics.

Examples:

- a sword swing does not choose damage;
- a large creature model does not gain more health;
- a hunched posture does not imply weakness;
- a muscular body does not grant Strength;
- a glowing eye does not create magical sight;
- a missing limb does not automatically change movement unless gameplay authority says it does;
- an intimidating boss roar does not stun the player unless gameplay systems own that effect.

---

# 02. Core Entity Presentation Ontology

Every character/creature production task must resolve these layers independently:

1. **Canonical identity** — what entity/person/creature is this?
2. **Body-plan family** — what anatomical architecture supports it?
3. **Individual body presentation** — proportions, posture, age/build and approved anatomy variation.
4. **Surface/material presentation** — skin, fur, scales, chitin, bark, stone, cloth, armour and state layers.
5. **Cultural/professional equipment** — clothing, tools, weapons, carried objects and adornment.
6. **Rig family** — which skeleton/joint/IK/attachment contract expresses the body plan?
7. **Motion family** — how does this body idle, move, work, fight, cast and react?
8. **Personality/state variation** — bounded individual timing/posture/gesture variation.
9. **Gameplay contracts** — markers, contact roles, sockets, hit regions and interaction anchors inherited from upstream systems.
10. **Presentation products** — world actor, first-person owner presentation, portrait/icon capture source, LOD products and approved state variants.

No one layer may silently redefine another.

---

# 03. Leyforge Character Design Pillars

All people and character-like entities should be reviewed against these pillars.

## 03.1 Silhouette before facial micro-detail

At ordinary gameplay distance, the player should first read:

- overall height and mass;
- head/body ratio;
- shoulder/hip structure;
- limb length;
- posture;
- carried equipment;
- clothing mass;
- distinctive anatomy such as ears, horns, tails, wings or additional arms.

Face detail then strengthens identity at dialogue distance.

## 03.2 Person before costume

Clothing and profession should not be the only thing making two people distinguishable.

Named or recurring people should retain recognisable:

- body frame;
- head/face family;
- hair/adornment structure;
- posture or gesture signature;
- scars/marks where canonical;
- stable colour/material choices.

## 03.3 Material truth remains visible on bodies

Leather must read as leather, plate as metal, cloth as cloth, bark as bark, bone as bone and magical crystal as crystal under ART-02.

A character should not become a single colour-coded blob merely because they belong to a faction or role.

## 03.4 Function before ornament

Equipment placement and clothing construction should explain use:

- belts support pouches/tools;
- armour covers plausible regions;
- straps connect carried items;
- backpacks sit against the torso rather than float;
- helmets respect head and facial anatomy;
- weapons have reachable grips;
- profession tools have sensible carry/rest positions.

## 03.5 Lived history is allowed to accumulate

Where canon supports it, characters may visibly carry:

- wear;
- repaired clothing;
- patched armour;
- scars;
- prosthetics;
- dirt/soot/mud;
- weather exposure;
- settlement/cultural adaptation;
- age-related presentation;
- persistent story consequences.

---

# 04. Voxel-Native Body Language

## 04.1 Voxel form must survive motion

Animation must not make characters look like smooth rubber models wrapped in voxel textures.

Prefer:

- rigid or near-rigid part movement where the body/material supports it;
- crisp rotations at visible joints;
- controlled shoulder/hip blending;
- bounded neck/tail/spine deformation;
- purposeful voxel-frame changes for topology/silhouette shifts;
- restrained skin weighting.

## 04.2 Controlled deformation

Deformation is allowed where it improves believable connection or motion, especially:

- shoulders;
- hips;
- necks;
- flexible torsos;
- tails;
- serpentine bodies;
- wing membranes;
- limited facial regions.

Deformation must not:

- smear hard armour plates;
- melt tools into hands;
- bend horns like rubber;
- distort blocky silhouette beyond recognition;
- cause texture/palette swimming that weakens voxel readability.

## 04.3 Topology changes may use frame/state products

Use voxel-frame or baked mesh-state changes where topology genuinely changes, including:

- blinking;
- mouth/jaw states;
- feather/wing spread;
- slime compression;
- magical transformation;
- armour/part breakage;
- boss mutation;
- construct reconfiguration.

---

# 05. Character Scale and Proportion Philosophy

## 05.1 World scale is shared

Bodies must be authored and reviewed against the one-metre voxel world grid, standard architecture and gameplay clearance references inherited from Set 22 and ART-04.

## 05.2 Proportions are stylised, not arbitrary

Leyforge supports broad variation, but proportions should feel intentionally designed around readable voxel silhouettes.

The global default preference is:

- slightly simplified/block-readable anatomy;
- heads large enough for gaze and expression to read at normal distance;
- hands/feet large enough to communicate tool use/contact;
- limb thickness sufficient to survive voxel resolution;
- shoulders/hips readable enough for locomotion and equipment fit;
- no requirement for realistic human anatomical ratios.

## 05.3 Body-frame variation is bounded

Approved presentation axes include:

- short to tall;
- slender to broad;
- light to heavy build;
- soft to angular;
- narrow to wide shoulders;
- narrow to wide hips;
- short to long limbs;
- upright to hunched posture;
- compact to elongated torso.

Variation is visual unless upstream gameplay explicitly assigns consequences.

## 05.4 Extreme silhouettes require explicit profiles

If a body shape would substantially affect:

- door/stair clearance;
- camera position;
- equipment compatibility;
- mount compatibility;
- attack reach presentation;
- navigation footprint;
- first-person framing;

it must use an explicit compatibility profile rather than silently extending ordinary humanoid variation.

---

# 06. Humanoid and Person Presentation

## 06.1 Shared personhood principle

Personhood is not a body type, culture, species or visual rarity tier.

Any sapient people represented by current canon should receive the same production respect for:

- facial readability where anatomy supports it;
- clothing/equipment fit;
- social gesture;
- individual variation;
- age/life-history presentation;
- expression or equivalent communication;
- named-character distinctiveness.

## 06.2 No ancestry caricature grammar

An ancestry must not be reduced to one exaggerated stereotype, one profession, one morality or one colour treatment.

Approved ancestry profiles may define:

- anatomical ranges;
- head/face families;
- ears/horns/tails/wings or other traits;
- material/skin/fur/scale ranges;
- proportion compatibility;
- rig compatibility;
- expression alternatives.

Culture, occupation and faction remain separate layers.

## 06.3 Internal diversity is required

Generated populations should contain bounded variation within ancestry and culture rules.

Named settlements should avoid visual clone populations unless intentional (for example constructs from one manufacturing series).

---

# 07. Head, Face and Gaze Language

## 07.1 Gaze must read

Where an entity has eyes or equivalent sensory direction, orientation should be readable from normal interaction distance.

Eyes may be:

- inset voxel parts;
- surface patterns;
- separate components;
- emissive magical organs;
- non-human sensory clusters.

The chosen form must still communicate attention when attention is meaningful.

## 07.2 Face hierarchy

For humanoid-compatible faces, prioritise:

1. head silhouette;
2. eye line and gaze;
3. brow/upper-face state;
4. mouth/jaw state;
5. nose/muzzle/ear structure;
6. hair/facial hair/adornment;
7. micro-markings.

## 07.3 Expression must survive voxel scale

Expressions should be designed from a small number of strong changes rather than subtle smooth-face deformation.

Useful levers include:

- brow tilt;
- eyelid/eye state;
- mouth/jaw shape;
- head pitch/turn;
- shoulder/posture change;
- hand/arm gesture;
- limited material/emissive change where canonical.

## 07.4 Non-face communication

Entities without conventional faces should communicate using appropriate anatomy:

- ear or crest angle;
- head/neck orientation;
- body compression/expansion;
- wing position;
- tail posture;
- limb spread;
- glow/intensity change;
- floating/orbit patterns;
- flower/frond posture;
- mask/plate orientation.

---

# 08. Expression Baseline

Humanoid-compatible head families should support at minimum:

- neutral;
- blink/eye rest;
- talk/communication;
- friendly/positive;
- concern;
- anger/hostility;
- fear;
- sadness/mourning;
- fatigue;
- pain/injury;
- concentration/casting;
- sleep/unconscious;
- shout/effort;
- defeated/dead presentation where applicable.

Not every entity requires human facial expressions. Equivalent readable states may be substituted according to anatomy.

---

# 09. Hair, Fur, Feathers, Fronds and Secondary Silhouette

## 09.1 Secondary forms support identity

Hair, facial hair, fur tufts, feathers, fronds, tails, ears, cloth tabs and similar parts may add secondary motion and identity.

They should not obscure:

- gaze;
- weapon reads;
- hand contacts;
- critical weak points;
- locomotion silhouettes;
- interaction markers.

## 09.2 Secondary motion is subordinate

Secondary motion should lag or settle behind primary movement.

It must not become constant noise.

## 09.3 Physics is optional, not the default artistic solution

Prefer authored/procedural bounded motion where:

- deterministic silhouette matters;
- collisions are complex;
- multiplayer/replay consistency matters;
- performance would be excessive;
- loose physics causes clipping or twitching.

---

# 10. Clothing and Armour on Moving Bodies

## 10.1 Clothing must belong to the body

Garments should visibly wrap, hang from or attach to anatomy rather than float as unrelated shells.

## 10.2 Motion hierarchy

Clothing motion follows:

1. body/root motion;
2. primary garment attachment;
3. authored fold/plate movement;
4. bounded secondary motion;
5. state effects such as wetness or wind influence.

## 10.3 Armour preserves hard construction

Hard armour should generally move as plates/segments and should not visibly squash like cloth.

## 10.4 Equipment clearance

Required animation sets must be reviewed with representative:

- light clothing;
- heavy armour;
- backpacks;
- shields;
- one-handed tools/weapons;
- two-handed tools/weapons;
- staffs/polearms;
- culture-specific silhouettes.

---

# 11. Hands, Feet and Contact Readability

## 11.1 Hands are functional presentation anchors

Hands must visibly support:

- grips;
- carrying;
- pushing/pulling;
- workstation contact;
- climbing;
- gestures;
- casting poses where hands are involved.

They do not need realistic finger articulation unless the asset/action genuinely requires it.

## 11.2 Grip clarity beats finger complexity

A readable closed/open/pointing/grip family is preferable to micro-articulation that cannot be seen at gameplay distance.

## 11.3 Feet communicate support

Feet, paws, hooves, claws or equivalent contacts should visibly plant on surfaces.

Persistent hovering caused by poor root/IK setup is a production failure unless intentional floating is canonical.

---

# 12. Posture as Identity

Posture is a major Leyforge character tool.

Approved uses include:

- age presentation;
- profession habits;
- injury;
- fatigue;
- confidence/alertness;
- heavy carried load;
- culture-specific formality;
- creature temperament;
- boss phase change.

Posture must not automatically imply moral alignment, intelligence or gameplay capability.

---

# 13. Age and Life-Stage Presentation

## 13.1 Adults are not one template

Adult variation may use:

- posture;
- hair colour/style;
- face markings;
- body-frame changes;
- clothing choices;
- scars/wear;
- motion cadence.

## 13.2 Children/youth require dedicated proportion profiles

Youth must not be produced by uniformly scaling adult bodies.

Dedicated profiles should account for:

- head/body ratio;
- limb proportions;
- hand/foot scale;
- rig and stride;
- clothing fit;
- interaction height;
- camera/framing where relevant;
- safe animation libraries.

## 13.3 Age presentation is not a stat shortcut

Visual age does not itself dictate speed, health, profession or capability.

---

# 14. Injury, Scars, Prosthetics and Persistent Consequence

## 14.1 Persistent marks may record history

Where systems/canon support it, an entity may retain:

- scars;
- missing/damaged horns or ears;
- bandages;
- damaged armour;
- prosthetics;
- repaired clothing;
- limp posture;
- persistent magical corruption;
- soot/burn evidence.

## 14.2 Injury presentation must preserve identity

Damage should layer onto the existing person/creature rather than transform everyone into one generic wounded model.

## 14.3 Prosthetics follow attachment and material rules

A prosthetic must have:

- stable body-role attachment;
- suitable Material DNA;
- movement/clearance rules;
- equipment compatibility where appropriate;
- explicit gameplay consequences only if upstream systems define them.

---

# 15. First-Person and Third-Person Character Unity

## 15.1 One-body principle

The preferred Leyforge player presentation is one coherent character identity across first- and third-person contexts.

The POC's connected-body direction remains a useful production precedent: first person may hide only camera-obstructing owner geometry while keeping body/arms/legs derived from the same character presentation.

## 15.2 Camera must pivot from a real head/eye anchor

The first-person camera should rotate from the approved head/eye pivot rather than orbiting around an offset torso.

## 15.3 Owner-body hiding is surgical

Hide only what is required to prevent:

- camera interior clipping;
- hair/head obstruction;
- helmet interior obstruction where policy requires it.

Do not create an unrelated floating camera-arm style unless a future accessibility/performance mode explicitly authorises it.

## 15.4 First-person held actions must match world actions

The first-person hand/weapon presentation may use camera-aware framing, but:

- grip identity remains the same;
- action family remains recognisably the same;
- timing markers remain compatible;
- weapon/tool orientation remains consistent;
- an outside observer should see an equivalent action.

---

# 16. Rig Selection Philosophy

## 16.1 Body plan chooses rig family

Use the simplest approved rig family that correctly expresses the anatomy.

Initial families inherited from Set 22 include:

- humanoid/biped;
- altered/additional-arm humanoid;
- quadruped;
- arthropod/multi-legged;
- segmented crawler;
- serpent/flexible chain;
- avian/bat/flying creature;
- dragon/wyvern/great beast;
- aquatic;
- amorphous/floating;
- construct/golem;
- hybrid/composite.

## 16.2 Do not force every creature onto a humanoid skeleton

Retargeting convenience is not sufficient reason to erase anatomy.

## 16.3 Custom rigs require justified anatomy

A custom rig is appropriate when:

- no existing body-plan family can represent the anatomy cleanly;
- required motion would be visibly wrong on an existing template;
- important attachment/attack/contact roles cannot be expressed;
- boss/unique anatomy is part of identity.

---

# 17. Skeleton and Joint Presentation Law

## 17.1 Joints should explain body construction

Joint placement should correspond to visible anatomy and motion centres.

## 17.2 Hard parts remain hard

Use rigid binding or constrained articulation for:

- armour plates;
- construct segments;
- chitin limb sections;
- horns;
- claws/hooves;
- jaws where appropriate;
- weapon/tool attachments.

## 17.3 Flexible regions remain controlled

Use constrained skinning or chains for:

- shoulders/hips;
- necks;
- tails;
- flexible spines;
- wing membranes;
- tentacles;
- serpentine bodies.

## 17.4 Extreme joint folding must be reviewed in silhouette

No joint may be accepted because it is mathematically valid if it visually collapses voxel form.

---

# 18. Rest Pose and Reference Pose

Every rig family should maintain:

- a stable authoring/reference pose;
- a neutral gameplay idle reference;
- attachment-safe equipment reference poses;
- pose-library references appropriate to the body family.

Humanoids may use a T-pose/A-pose authoring reference as required by tooling, but the final game's visual identity is judged in gameplay poses, not the rigging pose.

---

# 19. Inverse Kinematics and Contact Expectations

## 19.1 IK assists authored motion

IK is not a substitute for good animation.

Use it to improve:

- foot placement;
- hand-to-tool/workstation alignment;
- quadruped terrain contact;
- climbing/contact points;
- perching;
- rider/mount placement;
- large-body terrain adaptation.

## 19.2 IK corrections are bounded

If solving a target requires anatomy-breaking stretch/twist, the correct response is to:

- reject/reposition the target;
- choose another animation;
- adjust interaction geometry;
- use an explicit fallback.

Do not stretch bodies into invalid poses to satisfy markers.

## 19.3 Contact must look intentional

A hand should not visibly miss the hammer handle while the gameplay marker claims contact.

A foot should not penetrate half a voxel into the ground while the character is considered grounded.

---

# 20. Root Motion and Movement Authority

ART-05 supports both in-place and authored root motion under Set 22 rules.

The artistic rule is:

> **The visible body must agree with authoritative movement well enough that feet, mass and direction do not obviously slide or detach from travel.**

Use root motion when it materially improves authored displacement for actions such as:

- lunges;
- leaps;
- knockback presentation;
- vaults/mantles;
- boss charges;
- cinematic phase transitions.

Gameplay/movement systems remain authoritative.

---

# 21. Animation Timing Language

Leyforge motion should favour **clear preparation, decisive action and readable recovery** over constant twitchy motion.

## 21.1 Ordinary motion

Ordinary civilian/work/animal motion should feel:

- grounded;
- economical;
- purposeful;
- slightly stylised for readability;
- varied without being restless.

## 21.2 Combat motion

Combat should generally expose:

> **Ready → Anticipation → Commitment → Active/Release → Follow-through → Recovery → Return/Chain**

The relative duration varies by action, but the structure should remain learnable.

## 21.3 Magic motion

Magic may depart more strongly from physical timing, but should still communicate:

- gathering/focus;
- channel path;
- release or sustained control;
- strain/recovery where applicable.

---

# 22. Weight and Mass

## 22.1 Mass is communicated through multiple channels

Visible weight comes from:

- acceleration/deceleration;
- stride length/frequency;
- body rise/fall;
- planted contact;
- turn radius;
- recoil;
- follow-through;
- secondary motion;
- terrain response;
- sound/VFX later supplied by ART-07/06.

## 22.2 Size alone is insufficient

A giant creature moving like a normal human scaled to 400% is not acceptable.

## 22.3 Heavy does not mean slow in all cases

Powerful beasts or magical entities may accelerate quickly, but their motion must still communicate displaced mass through bracing, impact, body compression, ground contact or supernatural counter-language.

---

# 23. Idle Animation Language

## 23.1 Idles are low-frequency identity signals

An idle may communicate:

- breathing;
- stance;
- alertness;
- fatigue;
- profession habit;
- carried load;
- creature temperament;
- magical instability.

## 23.2 Avoid perpetual fidgeting

Characters should not constantly wave, bounce, inspect gear or shift weight with no reason.

Quiet moments matter to Leyforge's visual-rest philosophy.

## 23.3 Idle variation should be deterministic/bounded

Variation may use seeded timing and optional gestures, while preserving replay/save consistency where required.

---

# 24. Humanoid Ground Locomotion Style

The baseline humanoid set should include or support:

- relaxed idle;
- alert idle;
- walk;
- backward movement;
- strafe;
- jog/run;
- sprint;
- start/stop;
- turn;
- crouch;
- jump rise/fall/land;
- injured locomotion when required;
- carried-load locomotion when required.

## 24.1 Player vs NPC distinction

Player motion may use faster transitions and reduced anticipation to preserve responsiveness.

NPC motion may show more complete starts/stops, posture and individual rhythm.

They must still belong to the same movement language.

## 24.2 Foot sliding is a high-priority defect

Minor stylisation is acceptable. Persistent obvious sliding is not.

---

# 25. Traversal and Voxel-Terrain Motion

Traversal animation must respect the world as a voxel environment.

Test against:

- one-block rises;
- slabs;
- stairs;
- ladders;
- ledges;
- doors;
- narrow corridors;
- water edges;
- uneven cave terrain;
- ship/vessel decks where applicable.

Actions may include:

- step-up;
- jump;
- vault;
- mantle;
- ladder/rope climb;
- wade;
- surface swim;
- underwater swim;
- crawl;
- mount/dismount.

Failure must resolve safely back to valid locomotion.

---

# 26. NPC Work Animation Language

Civilisation is a core Leyforge identity. Work animation therefore receives first-class production attention.

Required families should be developed around authoritative tasks, including:

| Work family | Primary visual language |
|---|---|
| Mining | Brace, lift, strike, recover, inspect, carry ore/material. |
| Lumber | Set stance, swing/chop, brace, drag/carry timber. |
| Farming | Hoe/till, sow, water, harvest, carry produce. |
| Building | Carry, align/place, hammer/fasten, inspect scaffold/structure. |
| Smithing | Heat/hold, hammer, turn, quench, inspect. |
| Crafting | Reach, cut, mix, assemble, operate station. |
| Logistics | Lift, shoulder/carry, push/pull, load/unload, count/sort. |
| Trading | Present, count, gesture, record/write. |
| Guarding | Patrol, scan, signal, ready, challenge. |
| Magic work | Read/trace rune, channel, inspect conduit, maintain ward/device. |
| Maritime | Haul line, brace, steer, load cargo, operate rigging/device. |

## 26.1 Work must visibly connect to world objects

Hands/tools/materials should align with the actual workstation, voxel, machine or blueprint target.

## 26.2 Animation cannot fake task completion

Gameplay/task systems remain authoritative over resource consumption and progress.

---

# 27. Social and Daily-Life Motion

A living settlement should support readable ordinary behaviour such as:

- greeting;
- wave;
- point;
- agreement/refusal;
- celebration;
- mourning;
- fear;
- argument;
- eating/drinking;
- sitting/standing;
- sleeping/waking;
- reading/writing;
- carrying objects;
- tending fires;
- interacting with doors/storage/workstations;
- caring for another person where canonical.

Social gestures should vary by culture only where ART-03/canon supports a real cultural distinction; do not invent caricatured gesture sets.

---

# 28. Profession and Culture Motion Overlays

Profession/culture may influence:

- stance;
- tool familiarity;
- carrying method;
- greeting/formality;
- work rhythm;
- habitual gestures;
- ceremonial movement;
- weapon readiness.

These are **overlays**, not separate anatomy systems.

A culture must not have a universal gait unless canon genuinely requires it.

---

# 29. Additional Arms and Altered Humanoid Motion

## 29.1 Action hierarchy is mandatory

Multi-arm characters must still present one readable primary action hierarchy.

Possible coordination includes:

- primary pair acts while secondary pair stabilises;
- upper pair gestures while lower pair carries;
- paired weapon/shield roles;
- coordinated two-pair work;
- ritual/magic choreography.

## 29.2 Avoid limb noise

All arms should not move maximally all the time.

## 29.3 Clip masks must be semantic

Animation control should target body roles/arm banks rather than arbitrary bone-name assumptions.

---

# 30. Quadruped Motion Language

Quadruped locomotion should be anatomy-led.

Typical gait bands may include:

- careful/grazing step;
- walk;
- trot;
- run/canter;
- gallop/charge/species-specific sprint.

ART-05 requires:

- readable footfall rhythm;
- body support between contacts;
- plausible head/neck counter-motion;
- turn radius appropriate to size;
- terrain IK that corrects, rather than rewrites, the gait;
- distinct temperament between livestock, predators, mounts and heavy beasts.

---

# 31. Predator, Prey and Domestic Animal Character

Ordinary fauna should not all share one generic animal animation set.

Broad motion tendencies may include:

- prey animals: scanning, startle readiness, herd/flock coordination;
- predators: lower stalking posture, focus, burst commitment, recovery observation;
- domestic/livestock: calmer proximity behaviour, feeding/rooting/grazing, handling familiarity;
- mounts: rider-aware balance, controlled starts/stops and equipment motion.

These tendencies are not moral alignments and must remain subordinate to actual species ecology/canon.

---

# 32. Arthropod and Multi-Legged Motion

## 32.1 Limb groups should produce readable rhythm

Spiders, hexapods and other multi-legged bodies need authored/procedural gait grouping rather than random leg cycling.

## 32.2 Body support matters

The torso should appear supported by contacts and respond to terrain.

## 32.3 Climbing changes orientation language

Wall/ceiling locomotion must clearly communicate the new support surface and avoid limb chaos.

## 32.4 Performance simplification must preserve gait signature

Distant LOD may reduce individual limb updates while preserving the apparent group rhythm and body travel.

---

# 33. Segmented Crawler and Serpentine Motion

Segmented bodies should use controlled travelling waves, following and compression rather than each segment behaving independently.

Important rules:

- head direction leads intent;
- body waves follow movement rather than vibrate continuously;
- turns distribute through the chain;
- damaged/missing segments require authored compatibility;
- distant versions may simplify segment updates without losing silhouette flow.

Serpents/worms may use terrain-following/path motion, but should retain visible propulsion rather than appearing to slide as rigid tubes.

---

# 34. Avian, Bat and Flying-Creature Motion

Flight needs a full motion language, not just a looping wing flap.

## 34.1 Ground states

Where applicable:

- stand/perch;
- walk/hop;
- look/preen;
- take-off prepare;
- take-off;
- landing.

## 34.2 Flight states

May include:

- powered flight;
- glide;
- bank/turn;
- climb;
- dive;
- hover where anatomy permits;
- braking;
- landing approach.

## 34.3 Wings and tail work together

Wing motion, body pitch and tail/steering surfaces should communicate the flight state.

---

# 35. Dragon, Wyvern and Great-Beast Motion

Dragons and colossal flying beasts must communicate scale through:

- longer preparation for major movements;
- body-wide transfer of force;
- strong wing/limb contact;
- delayed tail/neck follow-through;
- broad turns;
- visible landing/braking effort;
- phase-specific posture;
- injury changes that affect silhouette/motion where gameplay permits.

Do not create a dragon by scaling up a small quadruped or bird animation set.

---

# 36. Aquatic Motion

Aquatic motion should respect body propulsion type.

Possible families include:

- tail-driven fish/reptile;
- fin/limb-driven swimmers;
- undulating bodies;
- jet/pulse-like magical or biological motion;
- amphibious transition between land and water.

Avoid rigid underwater translation with no visible propulsion unless the entity is intentionally supernatural/construct-like.

---

# 37. Amorphous, Elemental, Spirit and Floating Motion

## 37.1 Amorphous entities

May use:

- compression/expansion;
- voxel-frame topology changes;
- controlled surface pulse;
- mass shift;
- pseudopod/contact events.

## 37.2 Spirits/floating entities

Floating does not mean motionless translation.

Identity may come from:

- hover cadence;
- orbiting parts;
- cloth/flame-like follow-through;
- directional lean;
- pulse/phase change;
- environment response.

## 37.3 Supernatural motion must have rules

Breaking gravity or anatomy should read as an intentional realm/magic property, not unfinished animation.

---

# 38. Constructs and Golems

Construct motion should reveal construction.

Possible characteristics:

- rigid segmented joints;
- deliberate mechanical/stone weight;
- rune-driven actuation;
- visible wind-up or stored-energy release;
- independently moving modules;
- replaceable/breakable parts.

A magical construct may move unnaturally smoothly only when that contrast is an intentional part of its identity.

---

# 39. Plant and Fungal Beings

Plant/fungal motion may draw from:

- growth/unfurling;
- root anchoring;
- tendril/branch articulation;
- spore release preparation;
- cap/frond compression;
- wind-like sway distinct from voluntary motion.

Voluntary action should remain distinguishable from passive environmental movement.

---

# 40. Hybrid and Composite Entities

Composite bodies require a clear motion hierarchy at anatomical junctions.

For example:

- centaur-like forms must coordinate humanoid torso intent with quadruped propulsion;
- chimera forms need clear primary locomotor anatomy and secondary attack anatomy;
- multi-headed bodies require head-interest hierarchy rather than constant independent scanning;
- attached symbiotes/modules must have explicit parent/child motion relationships.

---

# 41. Combat Animation Style

Combat in Leyforge should be readable, physical and learnable rather than visually noisy.

## 41.1 Anticipation belongs to danger

Dangerous actions need proportionate cues.

Fast attacks may have short cues, but must still connect visually to the release.

## 41.2 Commitment should be visible

Heavy actions should show when the entity has committed its body/weapon.

## 41.3 Recovery creates rhythm

Recovery prevents every attack from reading as an instantaneous loop and gives weight to large actions.

## 41.4 Effects do not replace body mechanics

VFX may enhance a strike/cast under ART-06, but the body motion should remain readable with effects reduced or disabled.

---

# 42. Humanoid Melee Motion

Melee families may include:

- unarmed;
- one-handed sword/axe;
- two-handed weapon;
- spear/polearm;
- shield block/bash;
- dual wield;
- staff;
- tool used defensively.

Production rules:

- weapon arc must match grip/orientation;
- feet/hips/torso should contribute appropriately;
- large weapons need visible preparation/follow-through;
- short weapons can use tighter motion;
- shields must visually intercept/cover rather than hover beside the body;
- weapon family remains identifiable before cultural/magical embellishment.

---

# 43. Ranged Weapon Motion

Ranged animation must communicate:

- ready;
- load/nock where applicable;
- aim;
- tension/charge;
- release;
- recoil/recovery;
- reload/reset.

Projectile spawn remains gameplay authority, but the release marker must visually correspond to the weapon state.

Bow limbs/string/device parts should visibly agree with authored tension where the model supports it.

---

# 44. Magic-Casting Motion Language

Magic casting should not be one universal “raise hands and glow” animation.

ART-05 defines broad body-language families that ART-06 later gives effect language:

- direct projection;
- focus/staff-mediated casting;
- rune tracing/inscription;
- channel/sustain;
- ward placement/maintenance;
- ritual/circle interaction;
- summoning/command;
- internal transformation/empowerment;
- overload/backlash/interruption.

## 44.1 Magic remains school/source-aware

Different magical traditions may vary in posture, rhythm, gesture and tool use where upstream canon supports it.

## 44.2 Physical cost should be visible when canonical

Powerful casting may communicate:

- bracing;
- recoil;
- strain;
- loss of balance;
- recovery;
- environmental interaction.

Do not add fatigue or pain consequences unless gameplay defines them.

---

# 45. Creature Attack Telegraphs

Creature attacks should emerge from anatomy.

Examples:

- bite: head/neck retracts or jaw opens before commitment;
- charge: head/body lowers, feet brace, body aligns;
- leap/pounce: body compresses before launch;
- tail strike: hips/body turn and tail coils;
- sting: abdomen/tail positions before release;
- web/spit: mouth/organ aim and pressure posture;
- breath/beam: chest/throat/head builds toward release;
- wing strike: wing draws back and body braces.

A generic flash alone is not an acceptable telegraph.

---

# 46. Boss and Colossal Motion Hierarchy

Bosses need animation that communicates encounter structure.

Required reads may include:

- neutral/phase stance;
- attack family recognition;
- weak-point exposure;
- breakable-part loss;
- arena relocation;
- recovery opportunity;
- phase transition;
- defeat/retreat/escape state.

## 46.1 Large-body camera test

All critical boss actions must be reviewed from expected gameplay distance and camera height, not only in the Forge close-up viewer.

## 46.2 Phase transitions change more than colour

Where a phase is meant to feel materially different, combine some subset of:

- stance;
- locomotion profile;
- part visibility;
- breakage;
- new movement rhythm;
- new attack preparation;
- ART-02 material state;
- ART-06 VFX;
- ART-07 audio.

---

# 47. Hit Reactions, Stagger and Knockback

Reactions should communicate direction and force without turning every hit into full-body ragdoll chaos.

Possible layers:

- local flinch;
- directional upper-body reaction;
- guarded impact;
- stagger;
- heavy knockback;
- knockdown/incapacitation.

Reaction magnitude should remain subordinate to gameplay state and action authority.

---

# 48. Injury and Exhaustion Motion

Where state is authoritative, animation may communicate:

- limp;
- guarded limb;
- lowered posture;
- reduced arm swing;
- slower rise/settle;
- heavy breathing presentation;
- inability to use a broken part;
- damaged flight asymmetry;
- construct malfunction.

Do not visually imply mechanical debuffs that do not exist unless clearly cosmetic and non-misleading.

---

# 49. Incapacitation and Death Presentation

## 49.1 Death must fit body/material

A humanoid, slime, spirit, construct and plant being should not all share the same collapse language.

## 49.2 Avoid gratuitous physics dependence

Authored or bounded procedural deaths are preferred when they better preserve:

- voxel silhouette;
- stable collision/persistence;
- save/reload reproducibility;
- multiplayer consistency;
- age-rating intent.

## 49.3 Persistent bodies/loot remain gameplay authority

ART-05 supplies presentation only.

---

# 50. Environmental and Runtime-State Motion

Animation may respond to states such as:

- wetness;
- mud/snow resistance;
- wind exposure;
- burning;
- frozen/chilled;
- corruption;
- magical empowerment;
- carrying heavy loads;
- low-health/injury where authoritative.

The body-state layer should remain readable even when ART-06/07 effects are reduced.

---

# 51. Animation Events and Synchronisation

Animation clips may expose named art-facing events such as:

- foot_contact;
- tool_contact;
- weapon_release;
- projectile_release_reference;
- cast_release;
- channel_start/end;
- mouth_attack_origin;
- wing_beat;
- land_impact;
- resource_pickup/place;
- interaction_complete_reference;
- phase_transition_marker.

These are synchronisation references for gameplay/VFX/audio systems. They do not independently author gameplay consequences.

Duplicate or missing critical events are validation failures where downstream systems depend on them.

---

# 52. Retargeting and Shared Libraries

## 52.1 Reuse is encouraged within compatibility families

Shared animation libraries should reduce duplication for genuinely compatible bodies.

## 52.2 Retargeting must preserve character

A technically successful retarget is rejected if it causes:

- bad contact;
- broken proportions;
- inappropriate stride;
- weapon misalignment;
- lost mass/temperament;
- culturally/personally inappropriate gesture;
- anatomy misuse.

## 52.3 Unique motion can be a legitimate identity asset

Named bosses, unusual creatures, key NPCs or culture-defining ceremonies may justify bespoke motion when reuse would erase important identity.

---

# 53. Individuality and Deterministic Variation

Population motion may vary using bounded profiles for:

- posture;
- stride length;
- arm swing;
- idle frequency;
- head-look cadence;
- carry stance;
- gesture preference;
- animation phase offsets;
- age/injury presentation;
- profession familiarity.

Variation must not alter:

- authoritative movement speed;
- attack timing windows;
- interaction contact requirements;
- hitbox truth;
- traversal validity;
- animation events required by gameplay.

Important persistent characters should retain stable resolved variation choices across save/load.

---

# 54. Animation LOD and Crowd Readability

## 54.1 LOD preserves action truth

At distance, simplify:

- bone updates;
- face animation;
- secondary chains;
- finger/hand detail;
- individual limb solvers;
- optional gestures.

Preserve:

- movement direction;
- major locomotion rhythm;
- attack/cast danger;
- state silhouette;
- death/incapacitation;
- boss phase identity;
- critical interaction state where visible.

## 54.2 Crowd variation must not become noise

Use phase offsets and bounded variation to avoid synchronised clone motion, but maintain readable settlement-wide activity.

## 54.3 Performance profiles may simplify presentation, not semantics

Low-end modes may reduce update frequency/secondary motion without changing authoritative simulation.

---

# 55. Accessibility and Motion Safety

ART-05 inherits ART-01 accessibility principles.

Character/creature motion should remain understandable with:

- reduced motion;
- reduced flashes;
- reduced particle effects;
- high contrast;
- lower animation detail.

## 55.1 Telegraphs may not depend only on VFX colour

Dangerous actions should have body/silhouette/timing cues.

## 55.2 Reduced-motion mode

Where an animation contains intense camera-relative or oscillatory presentation, provide a reduced-motion alternative or suppress non-essential layers while keeping gameplay timing legible.

## 55.3 Camera shake is not owned here

ART-05 may request impact emphasis, but camera effects require appropriate downstream/system authority and accessibility compliance.

---

# 56. Forge Character/Creature Laboratory

The Forge test laboratory should support at minimum:

- neutral studio lighting;
- daylight/night world lighting;
- one-metre grid and standard doorway/stair references;
- standard workstation heights;
- first-person camera preview;
- third-person gameplay camera preview;
- dialogue distance;
- combat distance;
- crowd line-up;
- uneven terrain;
- water/swim test;
- ladder/climb test;
- equipment fit tests;
- representative culture clothing;
- light/heavy armour;
- weapon/tool families;
- mount/rider test where applicable;
- damage/state overlays;
- animation LOD preview;
- slow motion/frame scrub;
- event marker display;
- IK/contact debug;
- silhouette-only view.

---

# 57. Character and Creature QA Gates

A production-ready entity should pass:

## 57.1 Identity gate

- readable body plan;
- stable silhouette;
- recognisable named-character traits where applicable;
- ancestry/culture/profession layers not conflated;
- material identity correct.

## 57.2 Anatomy gate

- joints correspond to visible anatomy;
- no impossible default intersections;
- contacts/attachments exist;
- required sockets/markers exist;
- scale/clearance profile is explicit.

## 57.3 Motion gate

- locomotion does not visibly slide;
- contacts are plausible;
- start/stop/turn are readable;
- primary actions have anticipation/commitment/recovery appropriate to their type;
- secondary motion does not overpower primary motion.

## 57.4 Equipment gate

- grips align;
- shields/armour/backpacks fit;
- heavy equipment does not clip through common poses;
- first/third-person presentation remains coherent.

## 57.5 Distance gate

Review at:

- creator close-up;
- dialogue distance;
- ordinary gameplay distance;
- combat distance;
- distant LOD;
- portrait/icon capture.

## 57.6 State gate

Review relevant:

- injury;
- wet/muddy/frozen/burning/corrupted states;
- equipment breakage;
- boss phases;
- age/life-history variants.

---

# 58. Codex Character/Creature Production Sequence

Codex should follow this order for entity production:

1. Resolve canonical entity/person/creature ID and authority.
2. Resolve body-plan/anatomy family.
3. Resolve required scale/clearance compatibility.
4. Resolve ancestry/species/body-profile ranges without conflating culture/faction.
5. Define primary silhouette and distinctive anatomical reads.
6. Resolve Material DNA and surface families under ART-02.
7. Resolve cultural/professional clothing/equipment under ART-03/04 where applicable.
8. Select/create the approved rig family.
9. Validate joint roles, pivots, sockets, attachments and contact markers.
10. Define neutral/reference poses.
11. Select/create the required locomotion family.
12. Author work/social/combat/casting/creature actions required by canonical gameplay.
13. Apply bounded IK/contact correction.
14. Add expression/secondary motion.
15. Add deterministic individual/variant profiles where allowed.
16. Validate first-person/third-person relationship where relevant.
17. Validate representative equipment and state layers.
18. Add named animation events for downstream gameplay/VFX/audio synchronisation.
19. Validate gameplay-distance silhouettes and telegraphs with VFX/audio off.
20. Validate LOD/reduced-motion products.
21. Save editable Forge source, dependency metadata and resolved authority references.
22. Produce a production report for ART-09/Brain logging.

Decoration or polish should never be used to hide unresolved anatomy, contact or motion problems.

---

# 59. Codex STOP AND ESCALATE Conditions

Codex must stop and raise an authority/governance question when any of the following cannot be resolved from approved sources:

- whether an entity is sapient/personhood-bearing;
- ancestry/species anatomy;
- body-plan classification;
- number/location/function of limbs, wings, heads, tails or sensory organs;
- required gameplay clearance incompatible with proposed body proportions;
- canonical age/life-stage requirements;
- whether a visible injury/prosthetic has mechanical consequences;
- weapon/tool grip requirements conflict with ART-04 contracts;
- required sockets/attack origins are absent or contradictory;
- a retargeted library cannot preserve required anatomy/action readability;
- movement/attack timing would need to change gameplay truth;
- a magical motion language would invent a new school/source distinction;
- a boss phase requires undefined anatomy or gameplay state;
- equipment fit would require changing canonical body geometry outside approved ranges;
- first-person owner-body requirements conflict with camera/gameplay law;
- performance simplification would remove required gameplay telegraph/state readability.

Codex must not “solve” these by silently inventing new canon.

---

# 60. Golden Character and Motion Reference Programme

ART-10 should eventually certify a reference set spanning at least:

1. standard player-compatible humanoid in neutral clothing;
2. named ordinary NPC with strong individual identity;
3. heavy-armoured humanoid;
4. additional-arm or altered-humanoid case;
5. compact quadruped/livestock reference;
6. predator quadruped reference;
7. mount/rider reference;
8. spider/multi-legged reference;
9. segmented crawler reference;
10. avian flight reference;
11. dragon/colossal reference;
12. aquatic reference;
13. amorphous/spirit reference;
14. construct/golem reference;
15. plant/fungal being reference;
16. humanoid work-animation set;
17. humanoid melee/ranged/casting set;
18. boss telegraph/phase set;
19. first-person/third-person unified-player set;
20. injury/state/LOD comparison set.

Each golden reference should include:

- editable Forge source;
- body-plan/rig definition;
- neutral/reference poses;
- representative animation clips;
- event markers;
- equipment fit evidence;
- first/third-person evidence where applicable;
- silhouette captures;
- gameplay-distance captures;
- LOD captures;
- validation report;
- authority/dependency record.

---

# 61. Minimum Animation-Family Coverage

Before an entity family is considered production-capable, it should have the minimum animation categories actually required by its gameplay role.

A general matrix:

| Entity family | Minimum expected coverage |
|---|---|
| Humanoid civilian/NPC | idle, locomotion, turn, traversal basics, interaction/work, social, hurt, incapacitation/death where applicable. |
| Humanoid combatant | civilian basics + ready, attacks, guard/reactions, ranged/casting if used, equipment-aware locomotion. |
| Quadruped animal | idle/behaviour, gait bands, turn, start/stop, relevant attack/flee, hurt/death. |
| Mount | quadruped basics + rider-aware idle/locomotion/start/stop/turn/mount transitions as supported. |
| Arthropod | idle, gait groups, turn, terrain/climb as needed, attack, hurt/death. |
| Segmented/serpent | idle, propulsion/follow system, turn, attack, damage compatibility, death. |
| Flying creature | ground/perch if applicable, take-off, powered flight/glide/turn/dive/land, attack, hurt/injured flight where needed. |
| Aquatic | idle, swim propulsion, turn/depth change, attack/flee, hurt/death. |
| Construct | idle/power state, locomotion, work/combat, damage/malfunction, shutdown/death. |
| Boss | locomotion + every attack family + phase transitions + weak-point/breakage states + defeat/escape. |

No requirement exists to author unused clips simply to complete a checklist.

---

# 62. Relationship to Runtime Visual States

ART-05 treats animation and runtime visual states as coordinated but separable.

A final entity presentation may combine:

```text
Reference body
+ body/appearance variant
+ clothing/equipment
+ base locomotion
+ action layer
+ expression/gesture layer
+ IK/contact correction
+ secondary motion
+ voxel-frame/topology state
+ ART-02 material state
+ ART-06 VFX/lighting state
+ ART-07 audio state
```

Priority generally follows:

1. gameplay-critical action;
2. incapacitation/death;
3. locomotion safety/contact;
4. interaction alignment;
5. expression/gesture;
6. cosmetic secondary motion.

---

# 63. Migration from POC Visuals

The existing POC humanoid/player/goblin models and animations are migration evidence, not final art authority.

Useful retained proofs include:

- articulated head/torso/arms/legs;
- opposite-limb walk motion;
- job-tool presentation;
- basic work/build/mine/chop/cast/guard/hurt/attack poses;
- connected owner body in first person;
- camera located at a real head anchor;
- common held-item orientation and grip rules;
- external full-body presentation;
- test-room T-pose/reference workflow.

ART-05 supersedes their placeholder proportions, polish and movement quality while preserving validated integration concepts unless future implementation authority changes them.

---

# 64. ART-05 Decision Register

The following decisions are proposed for owner lock.

| ID | Decision |
|---|---|
| ART05-D001 | Leyforge people/creatures must remain voxel-world-native in silhouette and motion rather than appearing as smooth imported models with voxel skins. |
| ART05-D002 | Character readability is led by silhouette, posture, gaze, equipment and large-scale anatomy before facial micro-detail. |
| ART05-D003 | Personhood, ancestry, culture, faction and profession remain separate presentation layers; art may not collapse them into stereotypes. |
| ART05-D004 | Body-frame/proportion variation is broad but bounded by explicit compatibility profiles and does not grant gameplay stats by appearance alone. |
| ART05-D005 | Youth/child presentations require dedicated proportion/rig/fit profiles and may not be created by uniform adult scaling. |
| ART05-D006 | Faces use strong voxel-readable gaze/brow/mouth/posture cues; non-faced entities use equivalent anatomy-specific communication. |
| ART05-D007 | Secondary forms such as hair, fur, cloth, tails and feathers support identity but remain subordinate to primary action readability. |
| ART05-D008 | Hard armour/construct/chitin parts preserve rigid construction; controlled deformation is reserved for anatomy that genuinely requires it. |
| ART05-D009 | Hands/feet/contact ends are functional anchors; grip and support readability outrank finger/toe micro-complexity. |
| ART05-D010 | Posture may communicate life history, profession, state and temperament but may not imply unowned gameplay stats or morality. |
| ART05-D011 | The preferred player presentation is one coherent character identity across first- and third-person contexts, with surgical owner-geometry hiding as required. |
| ART05-D012 | First-person camera rotation should use a real approved head/eye anchor rather than an offset orbiting body setup. |
| ART05-D013 | Body plan chooses rig family; retargeting convenience may not force anatomically distinct creatures onto inappropriate rigs. |
| ART05-D014 | Joint placement must correspond to visible anatomy and motion centres; mathematically valid but silhouette-breaking articulation is rejected. |
| ART05-D015 | IK assists authored motion and may not stretch bodies into anatomically invalid poses to satisfy interaction targets. |
| ART05-D016 | Visible body travel must agree with authoritative movement sufficiently to avoid obvious foot/contact sliding. |
| ART05-D017 | Leyforge motion favours clear preparation, decisive action and readable recovery over constant twitchy motion. |
| ART05-D018 | Mass is communicated through acceleration, contact, stride, turn, recoil and follow-through; large bodies may not simply use scaled-up small-body clips. |
| ART05-D019 | Idle animation is low-frequency identity communication; perpetual fidgeting is discouraged. |
| ART05-D020 | Player locomotion may prioritise faster responsiveness while NPCs retain fuller starts/stops and individual rhythm within the same visual language. |
| ART05-D021 | Voxel traversal animation must be tested against actual blocks, slabs, stairs, ladders, ledges, doors, water and uneven terrain. |
| ART05-D022 | Civilisation/work animation is first-class production content and must visibly connect hands/tools/materials to real work targets. |
| ART05-D023 | Profession/culture motion differences are bounded overlays and may not become universal anatomy or caricatured gait rules. |
| ART05-D024 | Multi-arm entities require a clear primary action hierarchy and must avoid continuous limb noise. |
| ART05-D025 | Quadruped, arthropod, segmented, avian, aquatic, amorphous, construct, plant and hybrid bodies each retain anatomy-specific locomotion language. |
| ART05-D026 | Supernatural movement may break ordinary physics only when its rule is intentional and visually legible rather than appearing unfinished. |
| ART05-D027 | Combat actions should expose anticipation, commitment, active/release, follow-through and recovery appropriate to danger and speed. |
| ART05-D028 | VFX may enhance combat/magic but may not replace body/silhouette telegraphs required for readability. |
| ART05-D029 | Weapon motion must respect ART-04 grip/orientation and use feet/hips/torso/weapon mass appropriately. |
| ART05-D030 | Magic uses multiple body-language families and may not collapse all casting into one generic raised-hands animation. |
| ART05-D031 | Creature attack telegraphs must emerge from anatomy rather than rely on generic flashes/effects. |
| ART05-D032 | Boss animation must communicate phase identity, danger, weak-point/breakage opportunities, arena movement and recovery windows at gameplay camera distance. |
| ART05-D033 | Hit reactions should communicate force/direction without defaulting to uncontrolled full-body ragdoll behaviour. |
| ART05-D034 | Injury/exhaustion animation may only imply mechanical limitations that are authoritative or clearly non-misleading cosmetic presentation. |
| ART05-D035 | Death/incapacitation style should fit body/material and favour bounded reproducible presentation where uncontrolled physics would harm voxel identity or consistency. |
| ART05-D036 | Shared/retargeted animation is encouraged within compatibility families but must preserve contact, proportions, mass, equipment alignment and character identity. |
| ART05-D037 | Deterministic individual motion variation may affect posture/stride/gesture cadence but not gameplay timing, movement speed, hit truth or required event timing. |
| ART05-D038 | Animation LOD may simplify bones, face, secondary chains and optional gestures while preserving movement/action/state truth and combat telegraphs. |
| ART05-D039 | Critical danger/action readability must survive reduced VFX, reduced motion and colour-independent accessibility conditions. |
| ART05-D040 | Editable Forge character/rig/animation source and validation evidence are production truth; runtime products are reproducible derivatives. |
| ART05-D041 | Codex must resolve identity, anatomy, scale, silhouette, rig and motion family before expression polish or cosmetic animation variation. |
| ART05-D042 | Codex must stop and escalate rather than invent unresolved personhood, anatomy, gameplay clearance, attack timing, magic source or boss-phase canon. |

---

# 65. Cross-Document Boundary Map

## ART-01

Owns global stylisation, silhouette hierarchy, detail/rest philosophy and readability. ART-05 expresses those rules on living/moving entities.

## ART-02

Owns skin/fur/scale/chitin/cloth/armour/material presentation and runtime material states. ART-05 determines how those surfaces move/deform on bodies.

## ART-03

Owns realm, biome, culture and settlement art direction. ART-05 applies those layers to clothing, equipment, posture/gesture and creature environmental adaptation without redefining culture/ecology.

## ART-04

Owns equipment/tool/weapon models, grips, pivots, sockets and physical model contracts. ART-05 owns their fit and motion on entities.

## ART-06

Will own VFX, lighting, magic/weather/environmental effect language. ART-05 provides body motion and effect/event anchors.

## ART-07

Will own sound/music/sonic identity. ART-05 provides footfall, contact, effort, weapon, wing, cast and phase timing references.

## ART-08

Will own UI/icons/cartography/2D presentation. ART-05 supplies stable portrait/icon poses and live-model capture sources.

## ART-09

Will own Codex/The Forge end-to-end execution and reporting contracts. ART-05 supplies the character/creature/animation sub-process.

## ART-10

Will own golden-reference certification and final production QA thresholds.

---

# 66. Source Crosswalk

| ART-05 area | Primary upstream source |
|---|---|
| Body plans/anatomy taxonomy | 22B |
| Humanoid body/head/face/clothing/customisation | 22C |
| Creature/monster/boss body production | 22D |
| Skeletons, joint roles, IK, sockets, retargeting | 22E |
| Locomotion, work, combat, visual states, events, animation LOD | 22F |
| Equipment/variant/visual inheritance | 22G |
| Gameplay markers, hit regions, simulation LOD | 22H |
| Production batches, golden templates, migration workflow | 22L |
| Global visual language | ART-01 |
| Materials/runtime states | ART-02 |
| Culture/realm/ecology art direction | ART-03 |
| Equipment/model/grip/pivot contracts | ART-04 |
| Current POC connected-body/test-room evidence | POC Manual Testing Guide — prototype evidence only |

---

# 67. Principal Source Basis

ART-05 was drafted from the current Leyforge authority state, especially:

- ART-00 through ART-04;
- Document 22B — Entity Model Taxonomy, Anatomy and Body Architecture;
- Document 22C — Humanoid Player Character and NPC Creator;
- Document 22D — Creature, Mob, Monster and Boss Model Creator;
- Document 22E — Skeletons, Rigging, Joints, IK and Attachment Systems;
- Document 22F — Entity Animation, Locomotion, Combat and Visual States;
- Document 22G — Character Customisation, Equipment, Variants and Visual Inheritance;
- Document 22H — Entity Gameplay Integration, Hitboxes, AI Markers and Simulation LOD;
- Document 22L — Entity and Blueprint Visual Production and Migration Plan;
- current FCC people/fauna/monster/personhood/body-form authority;
- current realm/ecology/culture authority;
- current POC manual and visual-test-room evidence as migration evidence, not final style authority.

Key inherited technical concepts deliberately preserved rather than redefined include:

- body-plan/anatomy graphs;
- semantic rig roles;
- approved rig template families;
- rigid-part vs constrained-skinning binding modes;
- IK assistance and contact solving;
- stable sockets/attachment roles;
- animation layering and semantic masks;
- locomotion/action/gesture/procedural/frame/state stacks;
- combat phase metadata;
- named animation events;
- deterministic animation variation;
- retarget compatibility;
- animation and rig LOD;
- editable source vs baked runtime separation;
- Forge test-laboratory/validation workflows.

---

# 68. ART-05 Acceptance Gate

ART-05 is ready for owner lock when the owner agrees with this statement:

> **Leyforge people and creatures are voxel-world-native living forms whose identity is communicated through body plan, silhouette, posture, gaze, material, equipment and motion before decorative effects. Personhood, ancestry, culture, profession and faction remain separate visual layers. Proportion variation is broad but compatibility-bounded, youth uses dedicated profiles, hard construction stays hard, flexible anatomy deforms only where necessary, and the preferred player presentation remains one coherent first/third-person body identity. Body plan chooses rig family; IK assists rather than replaces authored motion; contacts must read; movement must agree with authoritative travel; and animation favours clear preparation, decisive action, visible mass and readable recovery. Civilisation work/social motion is first-class, every creature family keeps anatomy-specific locomotion, combat telegraphs originate in body motion, bosses remain legible from gameplay distance, deterministic variation cannot alter gameplay truth, and LOD/accessibility simplification preserves action/state readability. Codex must resolve identity, anatomy, scale, rig and motion family before polish and must escalate rather than invent unresolved canon or mechanics.**

If accepted, ART05-D001 through ART05-D042 become the locked global character/creature/rig/animation art baseline unless superseded through ART-00 governance.

---

# 69. Next Document

After ART-05 lock, continue to:

## ART-06 — VFX, Lighting, Weather, Magic & Environmental Effects Bible

ART-06 should establish final production direction for:

- particle shape and density language;
- effect scale hierarchy;
- physical impacts/dust/debris;
- fire/smoke/steam;
- rain/snow/fog/storm presentation;
- water/splash/underwater effects;
- ordinary vs magical emission;
- magic-school/source effect identities;
- mana, runes, wards, portals and corruption;
- realm-specific atmospheric effects;
- combat impacts/projectiles/telegraphs;
- enchantment/status effects;
- machine/automation feedback effects;
- lighting hierarchy;
- bloom and flash restraint;
- reduced-flash/reduced-motion accessibility;
- effect LOD/performance hierarchy;
- Codex VFX production rules;
- golden VFX/lighting references.

---

# 70. End Statement

ART-05 closes the character-and-motion handoff between Leyforge's canon, final visual language and the powerful but previously style-neutral Set 22 Forge entity/animation systems.

The intended production result is:

> **Codex should be able to receive requests such as “produce a Hearthland builder with a persistent personal appearance and complete work-animation family,” “author the Canopy Strider body/rig/locomotion presentation,” “build the Gloamcat predator motion set,” “create a four-armed sapient equipment/animation profile,” “prepare the player body's unified first/third-person locomotion and tool actions,” or “author a colossal dragon boss phase transition,” then resolve the correct canon, body plan, proportions, materials, rig, equipment, motion family, contacts, event anchors and LOD rules; validate the result at gameplay distance; and produce reproducible Forge source without inventing anatomy, combat mechanics or magical law.**

---

**End of ART-05 v0.1**
