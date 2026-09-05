# Leyforge Art Production Corpus

## ART-06 — VFX, Lighting, Weather, Magic & Environmental Effects Bible

**Document ID:** ART-06  
**Title:** Leyforge VFX, Lighting, Weather, Magic & Environmental Effects Bible  
**Version:** v0.1  
**Date:** 4 September 2026  
**Status:** **LOCKED VFX/LIGHTING/ENVIRONMENTAL-EFFECTS BASELINE — OWNER APPROVED 4 SEPTEMBER 2026**  
**Project:** Leyforge  
**Product context:** Ley Realms / The Forge  
**Corpus:** ART — Final Art Direction, Asset Production & Codex/Forge Handoff  
**Direct parent:** ART-01 — Master Leyforge Visual Language & Style Bible  
**Material parent:** ART-02 — Materials, Colour, Texture, Surface & Shader Art Standard  
**Environment parent:** ART-03 — World, Realm, Biome, Architecture & Culture Art Direction  
**Model parent:** ART-04 — Blocks, Items, Machines, Structures, Equipment & Vessel Modelling Standard  
**Entity/motion parent:** ART-05 — Characters, Creatures, Rigging & Animation Style Handoff  
**Constitutional parent:** ART-00 — Art Production Constitution & Authority Map  
**Primary upstream authorities:** Document 09 v1.0 magic/mana/spell/rune/ritual/ward/portal semantics; current FCC realm/environment/magic canon; Document 21C animation/effects/runtime visual-state architecture; 25K animation/audio/VFX/socket/event-manifest contract; weather/environment/world simulation authorities; applicable ENG-GOV and FORGE-ENG law  
**Inherited production baselines:** socket-driven reusable effects; read-only authoritative state bindings; material/shader animation; particles; light/emission profiles; layered runtime states; deterministic cosmetic variation; animation/effect LOD; accessibility alternatives; editable Forge source separated from baked runtime products  
**Primary downstream consumers:** ART-07 through ART-10, Codex/coding agents, The Forge, VFX production, lighting/environment production, spell and machine presentation, realm atmosphere production, accessibility validation, performance/LOD validation, Project Brain  

---

# 00. Executive Effects Statement

Leyforge effects must make **cause, material, energy, danger, scale and world-state readable without drowning the voxel world beneath particles, bloom or post-processing**.

The VFX promise is:

> **Effects reveal what the world is doing; they do not replace the world with spectacle.**

The lighting promise is:

> **Light establishes form, time, safety, atmosphere and supernatural character while preserving material identity, spatial readability and accessibility.**

The magic-effects promise is:

> **Magic should be recognisable through behaviour, structure, motion, medium and consequence before colour alone is considered.**

The environmental promise is:

> **Weather and ambient effects must feel like conditions acting on a persistent voxel world, not a full-screen filter pasted over it.**

The production promise is:

> **Codex should be able to receive a canonical spell, machine, weather state, realm atmosphere, hazard, portal, ward or environmental-effect request; resolve the owning gameplay truth; choose the authorised effect family; bind it to stable sockets/events/state values; author full and reduced profiles; validate readability, photosensitivity and performance; and produce reproducible Forge source without inventing mechanics or magical law.**

ART-06 defines the final Leyforge artistic law for VFX, lighting and transient environmental presentation. It does not replace the simulation, magic, weather, combat, machine, audio or performance systems that provide authoritative state.

---

# 01. Authority and Scope

## 01.1 ART-06 owns

ART-06 owns final global art direction and production rules for:

- VFX shape, motion, density and temporal language;
- particles and transient geometry effects;
- art-facing shader animation and distortion use;
- ordinary physical impact effects;
- dust, debris, sparks, splashes, foam, smoke and steam presentation;
- fire and heat presentation;
- weather presentation;
- fog, mist, haze and atmospheric particles;
- water-surface, underwater and vessel-adjacent effects;
- realm-specific atmosphere;
- magic-family presentation identities;
- mana, runes, wards, rituals, enchantments and portals;
- corruption, cleansing, restoration and supernatural-state overlays where transient effects are involved;
- spell charge/release/travel/impact/channel/area presentation;
- machine/automation activity and fault effects;
- combat telegraphs and readable impact presentation;
- environmental hazard presentation;
- lighting hierarchy, emissive usage and dynamic-light direction;
- bloom, flare and flash restraint;
- screen-space effect art direction;
- effect LOD and importance hierarchy;
- reduced-flash/reduced-motion/reduced-effect alternatives;
- deterministic cosmetic effect variation;
- effect-source, socket, event and state-binding expectations;
- Codex VFX/lighting production sequence;
- ART-06 golden-reference candidates and visual QA.

## 01.2 ART-06 does not own

ART-06 does not decide:

- whether a spell, hazard, weather event, machine state or realm phenomenon exists;
- spell damage, mana cost, target legality or school membership;
- weather simulation, rainfall quantity, wind physics or climate truth;
- fire spread, heat damage or smoke toxicity;
- fluid simulation or buoyancy;
- combat hitboxes, damage windows or invulnerability;
- portal destination or traversal mechanics;
- ward coverage truth;
- corruption mechanics;
- machine processing, power, blockage or fault truth;
- camera gameplay behaviour;
- final runtime budgets where engineering authority sets stricter limits;
- sound/music design owned by ART-07;
- UI overlays/indicators owned by ART-08.

## 01.3 Presentation cannot create state

Examples:

- smoke does not mean a machine consumes fuel unless the machine state says so;
- lightning VFX does not apply electrical damage by itself;
- a ward pulse does not define the authoritative ward radius;
- portal distortion does not decide whether the portal is traversable;
- rain particles do not make a surface wet unless the world/material state says it is wet;
- a corruption haze does not spread corruption;
- a red flash does not create a critical hit;
- a glowing weapon does not become enchanted unless the item state is enchanted.

---

# 02. Core Effect Presentation Ontology

Every ART-06 production task must resolve the following layers independently:

1. **Authoritative phenomenon** — what is actually happening?
2. **Effect purpose** — ambience, feedback, telegraph, consequence, transition, decoration or inspection aid?
3. **Source** — where does the phenomenon originate?
4. **Medium** — air, water, ground, solid material, body, rune substrate, field, portal surface or machine channel?
5. **Scale** — micro, object, actor, local area, structure, settlement, regional or realm-scale?
6. **Motion grammar** — burst, flow, pulse, orbit, fall, drift, rise, spread, collapse, fracture, lens, flicker or other authorised family?
7. **Geometry grammar** — particles, voxel-frame geometry, ribbon, line, decal/mask, volume, mesh, screen-space layer or combination?
8. **Material/light grammar** — colour roles, emission, opacity, distortion, roughness response and light contribution?
9. **Temporal profile** — anticipation, onset, sustain, variation, decay, cooldown and interruption?
10. **State binding** — which authoritative values/events drive it?
11. **Accessibility equivalent** — what remains when motion, flash, bloom or colour are reduced?
12. **LOD family** — how does the effect simplify with distance, density and performance profile?
13. **Audio hook** — what semantic event/timing information ART-07 may consume?
14. **Validation evidence** — how is correctness demonstrated?

No effect is production-ready because it merely “looks cool.” It must resolve this ontology.

---

# 03. Leyforge VFX Identity

## 03.1 Effects are voxel-world-native

Leyforge VFX may use particles, shaders, volumes and transient meshes, but they must remain compatible with the visual logic of a voxel world.

Preferred qualities:

- clear stepped or faceted forms where appropriate;
- readable clusters rather than microscopic noise clouds;
- deliberate silhouettes;
- restrained soft blending;
- particles that feel authored rather than photographic stock footage;
- geometry and timing that acknowledge the world's block/voxel scale.

The result may be sophisticated. It should not look like realistic cinematic fire pasted into a stylised voxel scene.

## 03.2 Effects support, not conceal, geometry

A player should usually still be able to identify:

- the source object;
- the attacking creature;
- the relevant machine;
- the rune or portal frame;
- the floor/terrain under an effect;
- the direction of incoming danger.

Dense effects may temporarily obscure for intentional gameplay reasons only when gameplay authority owns that consequence.

---

# 04. Shape Before Colour

Critical effect identity must survive grayscale or colour-perception reduction wherever practical.

Use a hierarchy of cues:

1. source location;
2. silhouette/geometry;
3. direction and motion;
4. rhythm/timing;
5. scale/density;
6. value/brightness relationship;
7. colour;
8. secondary ornament.

A fire spell and a frost spell should not differ only because one is orange and one is blue.

A stable portal and an unstable portal should not differ only through hue.

A ready telegraph and a dangerous active phase should not depend only on colour.

---

# 05. VFX Detail Hierarchy

Effects inherit ART-01's macro → meso → micro hierarchy.

## 05.1 Macro

The player should first read:

- where the effect is;
- how large it is;
- where it is moving;
- whether it is approaching, leaving or occupying space;
- whether it is ambient or urgent.

## 05.2 Meso

Then read:

- effect family;
- source and target relationship;
- material/element behaviour;
- phase or stability;
- attachment to the world.

## 05.3 Micro

Only then use:

- sparks;
- tiny motes;
- surface ripples;
- small glyph fragments;
- fine embers;
- tiny debris;
- decorative wisps.

Micro-detail must never be the only carrier of gameplay-relevant information.

---

# 06. Effect Scale Hierarchy

ART-06 defines these presentation tiers:

| Tier | Typical use | Direction |
|---|---|---|
| Micro | tool contact, tiny sparks, droplets | brief, low-density, local |
| Object | furnace, rune, torch, machine port | source-attached and readable |
| Actor | spell cast, hurt, buff/debuff, creature aura | body-aware; must preserve silhouette |
| Local Area | explosion, ward activation, ritual sub-zone | clear boundary/direction without screen fill |
| Structure | portal, large machine, building fire, major ward | layered, multi-source, LOD-aware |
| Settlement | alarm, ritual network, weather front, city ward | distributed cues; not one giant particle dome |
| Regional | storm wall, boss territory, realm event | atmosphere + landmarks + selective focal effects |
| Realm | persistent atmosphere/law | mostly environmental language, not constant full-screen VFX |

Scale increases **composition and coordination**, not merely particle count.

---

# 07. Effect Intensity Hierarchy

Every reusable effect family should support bounded intensity bands such as:

- dormant;
- trace;
- low;
- normal;
- strong;
- critical;
- catastrophic/signature where canon requires it.

Intensity may control:

- emitter count;
- particle rate;
- spawn radius;
- motion speed;
- emission strength;
- dynamic light contribution;
- debris size;
- distortion amplitude;
- sound hooks;
- lifetime.

It must not silently change gameplay magnitude unless the authoritative state already contains that magnitude.

---

# 08. Source and Anchor Law

Effects must originate from understandable sources.

Preferred anchors include stable semantic sockets such as:

- `effect.flame.*`;
- `effect.smoke.*`;
- `effect.spark.*`;
- `effect.steam.*`;
- `effect.dust.*`;
- `effect.mana.*`;
- `effect.rune.*`;
- `effect.portal.*`;
- `effect.ward.*`;
- `effect.corruption.*`;
- `effect.impact.*`;
- `effect.projectile.*`;
- `effect.footfall.*`;
- `light.*`;
- `telegraph.*`.

ART-04/05 own source geometry and sockets. ART-06 owns the effect behaviour attached to approved anchors.

Floating effects with no plausible source are reserved for phenomena whose canon explicitly permits spatially distributed fields or manifestations.

---

# 09. Temporal Grammar

A strong Leyforge effect normally has a readable temporal structure:

**Preparation/Build → Onset → Active/Sustain → Release/Peak → Decay → Residual/Aftermath**

Not every effect requires all stages.

Examples:

- hammer hit: anticipation exists in ART-05 motion; ART-06 supplies contact burst and brief decay;
- rune activation: line/glyph wake-up → completion pulse → stable sustain;
- portal: dormant frame → charging → coherent surface → stable sustain → shutdown/collapse;
- lightning: environmental buildup → path/flash → impact → residual sparks/steam/fire if authoritative;
- machine overheat: gradual emission/steam/smoke rise rather than instant random explosion visuals.

Effects should expose phase rather than hiding it beneath constant motion.

---

# 10. Particle Shape Language

## 10.1 Preferred particle families

Depending on the phenomenon:

- voxel chips;
- faceted shards;
- short strips/ribbons;
- flakes;
- droplets;
- sparks;
- embers;
- motes;
- dust puffs;
- smoke billows built from restrained stylised forms;
- glyph fragments;
- leaf/petal/pollen particles;
- crystalline fragments;
- ash;
- foam flecks;
- spirit/memory fragments;
- dream-symbol fragments where canon supports them.

## 10.2 Avoid default particle mush

Avoid using hundreds of tiny alpha sprites as the default solution.

Prefer fewer particles with stronger authored shape, rhythm and source behaviour.

---

# 11. Motion Grammar

Effect motion should derive from phenomenon.

Examples:

- smoke rises, curls and disperses;
- dust expands, loses momentum and settles;
- sparks eject quickly, arc and extinguish;
- steam jets from pressure and diffuses;
- mana flow follows network direction;
- rune activation travels through inscription paths;
- ward effects expand from anchors or trace boundaries;
- gravity-sensitive debris falls according to local physical rules;
- dream effects may repeat, echo or fold where Somnolent canon allows;
- spirit effects may drift or phase without inheriting generic smoke motion;
- portal surfaces imply cross-space displacement rather than liquid water unless the portal design specifically uses that metaphor.

“Orbiting glowing particles” is not a universal magical motion profile.

---

# 12. Distortion Law

Distortion is reserved for phenomena that meaningfully bend, refract, displace or destabilise perceived space/air.

Suitable uses include:

- heat haze;
- Space magic;
- portal surfaces;
- strong pressure/air effects;
- certain dream-state phenomena;
- high-energy magical instability;
- underwater refraction where appropriate.

Avoid:

- universal magic distortion;
- excessive screen wobble;
- distortion strong enough to hide combat information;
- using chromatic aberration as generic “power.”

Reduced-motion/reduced-effect profiles must be able to reduce or disable distortion while preserving state cues.

---

# 13. Ordinary Physical Contact Effects

Ordinary contacts should preserve material truth established by ART-02.

Examples:

- soil → clod/dust fragments;
- stone → angular chips/powder;
- wood → splinters/dust;
- metal → small sparks only where impact/heat conditions support them, plus chips or deformation evidence;
- glass → sharp transparent fragments/glint, constrained for readability;
- crystal → faceted shards and material-family light response;
- snow → powder/flakes;
- mud → dark wet clumps/splatter;
- water → droplets/splash;
- leaves → leaf fragments/pollen/organic movement where appropriate.

No universal grey puff should represent every impact.

---

# 14. Mining, Building and Crafting Effects

## 14.1 Mining

Mining effects should communicate:

- exact target material;
- contact point;
- progress/intensity where presentation authority receives it;
- break event;
- resulting debris without obscuring the drop.

## 14.2 Placement/construction

Placement should favour:

- precise contact snap;
- small material-correct settling particles if suitable;
- construction dust/debris for NPC/project work where the actual construction action occurs;
- no magical poof for ordinary mundane building.

## 14.3 Crafting

Crafting effects should come from actual process:

- sawdust from cutting;
- hammer sparks only from suitable hot/metal work;
- steam from boiling;
- flour/dust from milling;
- runic light from magical inscription;
- alchemical vapour from reactions.

---

# 15. Dust and Debris Standard

Dust/debris should answer:

- what material was disturbed?
- how energetic was the event?
- where did it move?
- how quickly should it settle?

Large destructive events may use layered debris:

1. immediate chunks;
2. medium particulate burst;
3. lingering dust/haze;
4. optional persistent world damage owned by gameplay/world state.

Transient debris must not masquerade as persistent loot or blocks.

---

# 16. Fire Standard

Fire is a physical phenomenon first and a magical motif only when the magic actually manifests flame/heat.

Leyforge fire should use:

- a clear luminous core/body;
- stylised stepped/faceted flame shapes or controlled frame animation;
- upward directional motion;
- ember/spark support proportional to fuel/intensity;
- smoke appropriate to material and combustion state;
- local emission/light where needed;
- char/heat material states owned by ART-02 and authoritative state.

Avoid:

- photo-real flipbook flames;
- giant opaque orange sprites;
- constant bloom halos;
- identical fire for torch, forge, wildfire, infernal vent and magical projectile.

---

# 17. Smoke Standard

Smoke communicates combustion/process state and should vary by source.

Important axes:

- hot vs cooling;
- clean vs sooty burn;
- wood/organic vs industrial vs magical contamination;
- dense local plume vs diffuse atmosphere;
- chimney-controlled vs leaking fault state.

Smoke must not automatically imply toxic gameplay.

At settlement/industrial scale, individual smoke emitters may be aggregated by distance rather than rendering every source at full quality.

---

# 18. Steam, Vapour and Gas Standard

Steam should communicate pressure, heat and condensation:

- directional jets at valves/vents;
- expanding white/low-chroma vapour;
- rapid dissipation in open conditions;
- more persistent clouding in cold/confined conditions where world rules support it.

Other gases require their own semantic identity and must not simply recolour steam.

Hazardous gases need shape/value/motion cues in addition to colour.

---

# 19. Sparks, Electricity and Lightning

## 19.1 Mechanical/electrical sparks

Use short-lived, directional, high-energy fragments tied to a source/fault/contact.

## 19.2 Lightning

Lightning presentation should separate:

- atmospheric buildup;
- path formation;
- primary discharge;
- impact;
- residual state.

Lightning is extremely bright by nature, but accessibility profiles must reduce peak flash and repeated flicker while preserving the path, strike location and danger timing.

## 19.3 Magical electricity

Magical lightning should still respect the visual logic of electrical discharge while carrying additional school/source/tradition signatures.

It should not become smooth neon ribbon motion unless canon supports a different phenomenon.

---

# 20. Water Contact, Splash, Foam and Wake Effects

ART-02 owns water's material surface. ART-06 owns transient interaction effects.

Use:

- splash crowns/clusters;
- droplets;
- wake lines;
- foam at energetic contacts;
- spray;
- drip/rain interaction;
- waterfall mist;
- underwater bubble trails where appropriate.

Intensity derives from displacement/energy information when available.

Vessels should use scalable wake and bow/stern effects driven by authoritative movement rather than a fixed decorative loop.

---

# 21. Underwater Effects

Underwater presentation may use:

- restrained suspended particulate;
- depth-dependent light attenuation;
- caustic-like light only where compatible with the stylised art direction and performance profile;
- bubbles from relevant sources;
- muffled visual contrast through atmosphere rather than a heavy full-screen blue filter;
- deep-water darkness/bioluminescent accents where realm/biome canon supports them.

Do not make all water globally cyan or all deep water globally black.

---

# 22. Rain and Drizzle

Rain should be spatially directional and wind-aware when authoritative wind information is available.

Profiles may include:

- light drizzle;
- steady rain;
- heavy rain;
- storm rain;
- freezing rain where canon supports it.

Rain presentation layers may include:

- falling streaks/droplets;
- surface impacts;
- roof/leaf runoff;
- puddle/wet-surface response through ART-02 state;
- mist/spray at high intensity.

Distance and screen density should control effect count.

---

# 23. Snow, Hail and Frozen Weather

Snow should distinguish:

- gentle flakes;
- windblown snow;
- heavy snowfall;
- blizzard/snow-drift atmosphere;
- shedding from actors/objects where appropriate.

Accumulation and snow layers are world/material state, not particle truth.

Hail uses higher-speed compact impacts and should not look like snow recoloured grey.

Frost formation belongs primarily to ART-02 material state, while ART-06 may present transient crystal growth/condensation where the state transition is visible.

---

# 24. Wind Presentation

Wind itself is mostly invisible. ART-06 reveals wind through affected media:

- leaves/vegetation motion;
- dust/sand/ash;
- snow;
- rain angle;
- cloud/fog movement;
- banners/sails/cloth through ART-05/04 animation systems;
- debris;
- magical/sky-route particles where canon supports them.

Avoid filling ordinary air with constant “wind streak” particles.

Ascendant Reach Windways may use explicit atmospheric route indicators because they are a canonical spatial phenomenon, not because generic wind is visible everywhere.

---

# 25. Fog, Mist and Haze

Fog/mist/haze are spatial atmosphere, not universal colour filters.

They should support:

- depth;
- humidity;
- temperature contrast;
- geography;
- danger/mystery where canon supports it;
- realm identity.

Critical silhouettes, paths and interaction ranges must remain readable under intended conditions unless reduced visibility is itself authoritative gameplay.

Use layered distance/height/volume behaviour rather than simply reducing global contrast.

---

# 26. Sand, Dust and Ash Storms

Sand/dust/ash events should differ through material, particle shape, density, behaviour and lighting response.

- desert dust/sand: earthy granular motion, near-ground sheets and airborne grains;
- industrial dust: source-specific particulate;
- ash: lighter, drifting flakes mixed with dense gusts and local fallout;
- magical contamination: may modify a physical storm only when canon says so.

Ashen Lower Realms must not render every location as a permanent dense ash storm.

---

# 27. Storm Composition

A storm is a coordinated environmental state, not “rain + more particles.”

Possible layers:

- cloud/sky change;
- wind behaviour;
- precipitation;
- fog/haze;
- lightning;
- wave/water response;
- vegetation/cloth motion;
- light-level shift;
- debris;
- ambience/audio hooks;
- aftermath states such as wetness/snow/damage when authoritative.

Storms should build and clear through readable transitions.

---

# 28. Environmental Ambient Particles

Ambient particles may communicate ecology and atmosphere:

- pollen;
- insects;
- leaves;
- spores;
- dust motes;
- ash;
- embers near heat;
- snow grains;
- sea spray;
- spirit-active fragments;
- dream fragments;
- mana motes only in genuinely mana-active areas.

Ambient particles must be sparse enough that their presence remains meaningful.

“Fantasy” does not justify glowing motes everywhere.

---

# 29. Lighting Philosophy

Leyforge lighting must preserve:

1. world form;
2. material identity;
3. route/interaction readability;
4. time/weather/realm atmosphere;
5. focal hierarchy;
6. danger/safety communication;
7. performance scalability.

Lighting should make the voxel world feel dimensional and alive without chasing photoreal rendering.

---

# 30. Ambient and Directional Light

The primary world light establishes broad form and time-of-day readability.

Rules:

- avoid crushing ordinary shaded faces into unreadable black;
- preserve meaningful day/night difference;
- retain enough local contrast to read voxel planes;
- do not use global realm colour tinting strong enough to destroy ART-02 material families;
- weather may alter ambient light without recolouring every material into the weather's accent colour;
- interiors and underground spaces require deliberate light hierarchy rather than arbitrary uniform brightness.

---

# 31. Local Light Hierarchy

Local light sources should have understandable function.

Examples:

- torch/fire → warm local practical light;
- work lamp → task visibility;
- ward lantern → practical light plus bounded magical identity where canon supports it;
- mana device → emission may communicate state, but not every mana component must cast a dynamic light;
- portal → local light may reveal activation strength;
- warning beacon → status emphasis;
- bioluminescence → ecological source.

Dynamic lights are added when they materially improve readability or atmosphere, not automatically for every emissive asset.

---

# 32. Emission and Bloom

ART-02 owns material emission roles. ART-06 governs emission in motion and scene composition.

Rules:

- emission identifies active energy, heat, magic or light-bearing material;
- bloom is an optional perceptual enhancer, never the effect itself;
- critical information must survive bloom disabled;
- intense emission should retain readable source shape;
- large areas of constant high emission should be rare;
- glow does not automatically mean rare, magical or powerful.

---

# 33. Flicker and Pulsing

Flicker/pulse communicates unstable energy, flame, damaged systems or specific magical rhythms.

Avoid high-frequency contrast oscillation.

Use alternatives such as:

- slow intensity breathing;
- shape change;
- moving pattern;
- controlled intermittent sparks;
- sequential activation;
- directional flow;
- stable warning icon/geometry supplied elsewhere.

Reduced-flash mode must replace unsafe patterns rather than merely lowering brightness.

---

# 34. Shadow and Darkness Presentation

Darkness is a world condition, not a generic evil shader.

Rules:

- Shadow magic is not equivalent to global darkness;
- Void corruption is not equivalent to black fog;
- night is not equivalent to desaturation;
- caves retain material/local-light identity;
- intentional visibility difficulty must come from owning gameplay/environment rules.

Shadow effects should use occlusion, silhouette, absorption, edge loss, directional darkening or spatial discontinuity as appropriate—not only black smoke particles.

---

# 35. Screen-Space Effects

Screen-space effects may support major states, but should be restrained.

Possible uses:

- brief directional impact emphasis;
- underwater lens behaviour;
- intense heat/pressure distortion;
- dream-law transition;
- portal crossing;
- severe magical instability;
- status feedback where no less intrusive world-space cue works.

Avoid as defaults:

- constant vignette;
- lens dirt;
- heavy chromatic aberration;
- repeated full-screen white flashes;
- permanent colour washes;
- camera-covering magical overlays.

Screen-space effects must never be the sole critical cue and must have reduced-effect alternatives.

---

# 36. Magic Presentation Architecture

Leyforge magic uses the following visual composition:

> **Magic presentation = authoritative effect behaviour + medium + source + school/tradition + tags + realm/culture context + material interaction + phase/state.**

No single layer is sufficient alone.

The visual language should answer:

- what is being manipulated?
- where does the power come from?
- how is it shaped or controlled?
- is it personal, infrastructural, runic, ritual, summoned or environmental?
- is it stable, strained, corrupted or failing?
- what is its direction/target?

---

# 37. No Universal School Colour Map

The thirteen major magic schools are **not assigned one mandatory RGB colour each**.

Colour may help reinforce a family, tradition, element, material or state, but behaviour and geometry carry the primary identity.

Reasons:

- Elemental contains very different phenomena;
- cultural traditions may interpret the same school differently;
- one hue cannot safely distinguish all states/accessibility conditions;
- a fixed rainbow taxonomy encourages generic MMO presentation;
- schools organise magical practice while tags and actual effect behaviour define what happens.

ART-02 palette roles and ART-03 realm/cultural rules still constrain colour use.

---

# 38. Elemental Magic VFX

Elemental magic should amplify the actual element/physical phenomenon rather than replacing it with abstract coloured energy.

Examples:

- fire/heat → flame, ember, heat distortion, smoke where relevant;
- frost/ice → crystal growth, vapour, brittle fragments, frost traces;
- water → droplets, flow, pressure, mist, ice transition where authorised;
- earth/stone → fragments, dust, fracture, uplift, compression;
- wind/air → affected media, pressure rings, mist/dust/leaf motion, bounded visible flow only when needed;
- lightning → discharge paths, branching, impact sparks;
- other elemental tags follow their material/energy behaviour.

School signature may add controlled magical structure, but the element remains visually truthful.

---

# 39. Nature Magic VFX

Nature magic should feel **biological/ecological**, not simply green.

Possible grammar:

- root/vine growth paths;
- leaf/petal/pollen motion;
- sap-like light where canon supports it;
- seed/germination bursts;
- fungal/spore structures;
- bark/wood/soil response;
- animal/ecosystem-linked marks;
- seasonal motifs;
- healing/growth communicated through restoration and living motion rather than generic sparkles.

Nature magic must remain distinct from Verdant Covenant's ambient ecology: not every living phenomenon is a spell.

---

# 40. Arcane Magic VFX

Arcane presentation favours **controlled abstract magical structure** where no more specific school/phenomenon dominates.

Possible grammar:

- geometric lattices;
- compact energy nodes;
- controlled line/plane relationships;
- stable mana-field shapes;
- structured motes;
- measured pulses;
- clean phase transitions.

Arcane must not become “default purple magic.”

When a spell has a more concrete effect tag, that effect should carry most of the visual identity.

---

# 41. Light Magic VFX

Light magic manipulates illumination/radiance-related phenomena.

Possible grammar:

- directional rays;
- concentrated luminous planes;
- soft radiance;
- sharp exposure-like edges;
- clean reveal/cleansing patterns where authoritative;
- refraction or scattering where suitable.

Light magic is not automatically holy, benevolent or divine.

Accessibility must prevent blinding full-screen flash from becoming its defining feature.

---

# 42. Shadow Magic VFX

Shadow magic should emphasise **occlusion, concealment, absorption, silhouette and light displacement**.

Possible grammar:

- local light suppression;
- moving occlusion planes;
- silhouette fragments;
- low-luminance trails;
- edge dissolution;
- controlled dark-field boundaries.

It must remain visually distinct from:

- ordinary darkness;
- Ancestral Veil spirit presentation;
- nightmare ecology;
- Void corruption;
- smoke.

---

# 43. Blood Magic VFX

Blood magic may use biological fluid/pulse/thread motifs where appropriate, but should avoid gratuitous gore as the default identity.

Possible grammar:

- pulse rhythms;
- branching vessel-like lines;
- droplets/threads;
- coagulation/crystallisation motifs;
- body-source anchoring;
- controlled exchange/transfer flow.

Its visuals must not invent injury, blood loss or biological consequences not owned by gameplay/health systems.

---

# 44. Time Magic VFX

Time magic should communicate temporal relationship rather than defaulting to clocks.

Possible grammar:

- motion echoes;
- delayed/advanced silhouettes;
- stepped phase offsets;
- repeated fragments;
- local temporal rings/grids;
- reverse/restore traces where the authoritative effect supports them;
- acceleration/deceleration shown through controlled temporal density.

Clock faces, hourglasses and gears are cultural/device motifs, not universal physics symbols.

Time effects must be especially careful with motion sickness and visual clutter.

---

# 45. Space Magic VFX

Space magic should communicate **distance, adjacency, displacement or geometry relationship**.

Possible grammar:

- lensing;
- seams;
- parallax discontinuity;
- folding planes;
- aperture geometry;
- displacement traces;
- spatial anchors;
- path/connection lines when appropriate.

Space magic is a primary user of restrained distortion but must preserve target/portal boundaries.

---

# 46. Rune Magic VFX

Rune magic is **substrate-bound declarative magical logic**.

Its strongest visual grammar is:

- inscription;
- line/path activation;
- sequential glyph illumination;
- node-to-node propagation;
- rule/connection structure;
- stable state indicators integrated into the rune surface;
- brief activation/rejection pulses.

Runes should appear to do something because their pattern activates, not because random particles spawn nearby.

The rune itself remains readable when inactive.

---

# 47. Alchemy VFX

Alchemy is process/reaction-driven.

Possible grammar:

- bubbles;
- vapours;
- precipitates;
- phase separation;
- liquid colour/value change;
- crystal formation;
- reaction flashes;
- fumes;
- controlled vessel pressure;
- residue.

Alchemy presentation should be anchored to ingredients, vessels, heat and actual reaction stage.

It must not become universal magic smoke.

---

# 48. Enchanting VFX

Enchanting binds persistent magical properties to objects/materials.

Preferred grammar:

- material-following edge/engraving accents;
- embedded patterns;
- socket/gem/core response;
- subtle surface motion;
- activation state layered onto the object's existing ART-02 material identity;
- restrained aura only when functionally meaningful.

An enchanted iron sword should still look like an iron sword.

---

# 49. Summoning VFX

Summoning presentation should communicate:

- source/anchor;
- boundary or permitted arrival region;
- connection/transfer;
- formation/materialisation;
- completion or failure.

Possible grammar:

- anchor marks;
- spatial apertures;
- layered silhouette formation;
- particles assembling toward anatomy;
- material phase-in;
- binding traces where authoritative.

Not every summon requires a circular floor glyph.

Creature/person identity should become readable as early as practical during materialisation.

---

# 50. Ritual VFX

Rituals are staged, spatial and often collaborative.

Their visual language should reveal:

- anchors;
- participants/roles where relevant;
- phase progression;
- links between sites/components;
- resource/mana flow;
- instability/interruption;
- completion.

Ritual scale comes from **distributed structured activation**, not simply a larger particle emitter.

Ritual VFX must remain subordinate to the actual ritual state machine.

---

# 51. Mana Presentation

Mana is an energy/resource concept, not a universal purple substance.

Visual rules:

- raw/refined mana materials retain ART-02 material identity;
- personal casting mana may be visible only when a spell/effect needs it;
- external mana infrastructure should reveal stored/flowing/unstable states through controlled channels;
- conduit flow follows authoritative direction/strength where available;
- purity/stability may alter regularity, clarity, contamination, pulse or leak behaviour;
- mana visuals should not appear everywhere simply because the world contains magic.

Personal mana and external mana should not be visually conflated when the distinction matters.

---

# 52. Wards

Wards are persistent protective magical systems.

ART-06 should communicate:

- active/inactive state;
- local anchors;
- activation/deactivation;
- stress/instability;
- boundary interaction when relevant;
- power loss/failure.

Do **not** render every ward as a permanent opaque or particle-filled dome.

Better tools include:

- anchor emission;
- sparse boundary markers;
- activation wave;
- impact ripple where something interacts with the ward;
- optional inspection overlay owned by ART-08/UI.

Ward coverage truth remains authoritative gameplay state, not visual geometry.

---

# 53. Portals

A portal is a structured space transition, not merely a glowing rectangle.

Production layers may include:

1. inactive frame/anchor identity;
2. charging runes/anchors;
3. aperture/surface formation;
4. stable destination/transition surface;
5. boundary/edge behaviour;
6. traversal response;
7. shutdown/collapse;
8. unstable/damaged alternatives.

Portal presentation should distinguish:

- stable vs unstable;
- powered vs inactive;
- ordinary realm gate vs damaged/broken portal;
- destination/route type where canonical presentation allows it;
- Void-related failure from ordinary instability.

Space distortion and layered rune behaviour are preferred over generic swirling purple liquid.

---

# 54. Magical Projectiles and Beams

Projectile/beam presentation must communicate:

- origin;
- direction;
- travel speed class;
- body/width;
- collision/impact point;
- lifetime/decay;
- school/phenomenon identity.

Fast projectiles need readable leading shape/trail without becoming giant screen-filling streaks.

Beams must retain a clear source and target/path.

A continuous beam should not look like repeated bullets.

---

# 55. Area Effects and Fields

Area effects need readable spatial extent without permanent particle walls.

Possible cues:

- ground/substrate changes;
- sparse perimeter markers;
- directional inward/outward motion;
- local atmospheric change;
- periodic pulses;
- anchor structures;
- ART-08 optional overlay for exact mechanics.

The artistic boundary should not imply a more precise gameplay boundary than actually exists.

---

# 56. Combat Telegraphs

ART-05 owns body-motion telegraphs. ART-06 supplements them.

Good telegraph VFX:

- emerge from the attacker/source;
- clarify direction/area;
- strengthen timing stages;
- remain visible against common environments;
- survive colour reduction;
- scale with encounter importance;
- remain readable under reduced-effects settings.

Bad telegraph VFX:

- appear detached from the attacker;
- cover the attacker entirely;
- use only red/green colour difference;
- flash full screen;
- add fake danger areas not matching authoritative attack geometry.

---

# 57. Impacts, Hits and Damage Feedback

Impacts should combine the **attacking effect/material** with the **target material/body**.

Examples:

- sword on armour differs from sword on wood;
- fire on wet stone differs from fire on cloth;
- lightning on metal may spark differently from lightning on soil;
- magic projectile impact may retain school geometry while producing target-material debris.

VFX does not own blood quantity, dismemberment or persistent damage.

Persistent cracks, scorch, corrosion or repair are ART-02/04 states driven by authoritative systems.

---

# 58. Status Effects, Enchantments and Auras

Persistent status presentation must be economical.

Use priority order:

1. body/material state change where appropriate;
2. small stable emblem/anchor cue;
3. restrained periodic effect;
4. full aura only when identity truly requires it.

Avoid stacking multiple opaque auras around one actor.

When several states coexist, critical/dangerous state readability outranks decorative buffs.

ART-08 may carry exact state labels/icons when world-space VFX cannot communicate safely.

---

# 59. Corruption and Cleansing

Corruption is a layered foreign/altering state, not one universal purple-black shader.

Presentation may include:

- surface mask/path changes from ART-02;
- leak/mote behaviour;
- irregular pulse;
- local geometry disturbance;
- altered emission hierarchy;
- affected ecology/atmosphere where authoritative;
- restrained spatial distortion for compatible corruption types.

Void corruption must remain distinct from:

- Shadow magic;
- natural decay;
- nightmare ecology;
- infernal heat/ash;
- ordinary damage.

Cleansing/restoration should visually remove/reorder/repair the corruption language rather than simply exploding in bright white particles.

---

# 60. Machine and Automation Effects

Machines should communicate state through **function-linked effects**.

Possible cues:

- dust at crushers;
- sawdust at sawmills;
- steam at pressure systems;
- smoke/heat at furnaces/engines;
- sparks at electrical/mechanical faults;
- item-flow markers at logistics devices;
- mana flow at magical automation;
- lubricant/drip/leak cues where canon supports them;
- warning emission at blocked/overheated states.

A machine should not be surrounded by arbitrary particles merely because it is advanced.

Machine effects bind to state/event sockets from 21C/25K and ART-04 model contracts.

---

# 61. Fault, Overload and Failure Effects

Failure language must remain diagnosable.

Different faults should prefer different cue combinations:

- blocked → stopped flow + restrained warning;
- overheating → heat emission + steam/smoke + warning;
- damaged → irregular motion/sparks/leaks based on construction;
- mana instability → disrupted flow/rune sequence/leak behaviour;
- power loss → emission/motion decay;
- corruption → separate corruption layer over operating/fault state.

Do not use “red flashing sparks” for every fault.

---

# 62. Realm Atmospheric Effects

ART-03 owns realm identity. ART-06 translates it into atmosphere without turning realms into full-screen filters.

## 62.1 Overworld

Baseline direction:

- meteorological/weather-driven atmosphere;
- biome-specific pollen, insects, leaves, sea spray, snow, dust, cave mist and similar local effects;
- magical atmosphere only around actual magical ecology/sites/events;
- ordinary day/night and weather remain visually valuable because other realms become more extraordinary by contrast.

## 62.2 Verdant Covenant

Possible signatures:

- living canopy movement;
- pollen/spore/leaf/petal drift;
- sap/bioluminescent traces where ecology supports them;
- root/growth pulses in active living structures;
- seasonal convergence effects;
- healthy decomposition particles distinct from blight/corruption.

No constant green fog or glowing motes everywhere.

## 62.3 Ancestral Veil

Possible signatures:

- subtle memory traces;
- spirit-active dust/threads;
- reflective/echo phenomena;
- selective incorporeal phase effects;
- memorial light and processional atmosphere;
- low-anchor instability distinct from Void.

No universal translucent-blue ghost haze.

## 62.4 Somnolent Expanse

Possible signatures:

- symbolic local particles;
- controlled repetition/echo;
- dreamwater response;
- horizon/edge discontinuity;
- coherent-region vs mutable-region effect density differences;
- nightmare effects distinct from corruption.

No permanent purple psychedelic distortion.

## 62.5 Ascendant Reach

Possible signatures:

- visible Windway flow;
- cloud shedding;
- high-altitude particulate;
- storm charge/lightning;
- High Aether radiance/pressure effects;
- gravity-instability debris/flow;
- sacred/domain effects where actually present.

No constant god rays or white/gold bloom.

## 62.6 Impossible Deep

Possible signatures:

- mineral dust;
- condensation;
- geothermal steam;
- bioluminescent ecology;
- Blackwater/brine mist;
- seismic particle events;
- pressure/gravity visual phenomena;
- huge-cavern atmospheric depth.

No global blue-black darkness filter.

## 62.7 Ashen Lower Realms

Possible signatures:

- ash drift;
- heat haze;
- ember/spark zones;
- furnace/industrial smoke;
- cooling mist;
- Cinder-Sea spray;
- stratum-specific pressure/heat/industry effects;
- refuge zones with intentionally calmer atmosphere.

No permanent red firestorm.

---

# 63. Realm Transition and Cross-Realm Effects

Cross-realm transitions should communicate **boundary crossing**, not merely swap colour grading.

Possible elements:

- portal/threshold mechanics;
- atmosphere changing near the boundary;
- gravity/pressure/wind changes where authoritative;
- local material/environment response;
- sound hooks for ART-07;
- short screen-space transition only when necessary.

The player should retain orientation and understand that they crossed a realm boundary.

---

# 64. Environmental Hazards

Hazards require readable world-space identity.

Examples:

- lava/magma → heat, emission, smoke/steam, ejecta where active;
- poison sludge → material surface + local gas/bubble cues, not merely green colour;
- steam vent → pressure buildup + directional jet;
- cursed ground → substrate state + restrained magical activity;
- quicksand → subtle unstable surface movement and disturbance;
- thorn vines → physical shape + contact motion;
- lightning field → charge buildup + discharge paths;
- ash/sand storm → directional particulate + visibility changes;
- pressure/gravity hazards → environmental motion and distortion when compatible.

VFX must not imply hazard radius or severity more precisely than the gameplay truth supports.

---

# 65. Destruction, Collapse and Large Events

Large events should be composed hierarchically:

1. structural motion/destruction from the owning system;
2. large debris silhouettes;
3. dust/smoke/energy layers;
4. local lighting response;
5. aftermath reveal;
6. persistent world-state damage owned elsewhere.

Avoid solving scale by spawning thousands of particles.

For settlement or megastructure events, distributed emitters attached to meaningful structural points are preferred over one central effect cloud.

---

# 66. Boss and Signature Encounter Effects

Signature encounters may exceed ordinary effect complexity but remain governed.

Requirements:

- boss silhouette remains readable;
- phase transitions are distinct in motion + effect structure;
- arena hazards are understandable;
- telegraphs survive reduced effects;
- effect identity belongs to the boss/authority/realm rather than generic “boss red glow”;
- major attacks have clear source, direction and decay;
- ambient encounter atmosphere does not obscure navigation;
- post-phase/defeat aftermath is visually legible.

ART-10 should include at least one high-density boss reference scene for certification.

---

# 67. Determinism, Persistence and Reconnection

Transient particles do not generally need persistent save records.

Persistent presentation should reconstruct from authoritative state and timestamps where possible.

Synchronise or deterministically reconstruct when meaningful:

- portal/ritual phase;
- machine active/blocked/overheated state;
- ward active/stressed state;
- long-duration weather/environment state;
- persistent corruption/restoration state;
- major encounter phase;
- flowing network direction where visible.

Cosmetic particle positions, minor spark timing and ambient motes may remain local/deterministic.

Stable seeds should be used when variation must remain consistent between loads or clients.

---

# 68. Effect LOD and Importance Hierarchy

Effects must support scalable presentation.

## 68.1 Suggested tiers

| Tier | Presentation |
|---|---|
| Near / Critical | Full shape, particles, material animation, allowed lights/distortion and audio hooks |
| Near / Ambient | Full core, reduced secondary particles |
| Mid | Simplified emitter count, cheaper material motion, limited lights |
| Far | silhouette/emission/state cue only where useful |
| Very Far | no transient effect unless region/signature event requires it |
| Culled | no effect; authoritative state continues |

## 68.2 Importance order

When budgets tighten, preserve:

1. player-danger telegraphs;
2. player action feedback;
3. interactable/state-critical machine/portal/ward cues;
4. boss/signature event cues;
5. navigation/environment-critical cues;
6. nearby atmosphere;
7. decorative ambient effects.

Ambient decoration is the first thing to reduce.

---

# 69. Dense Settlements and Factories

Civilisation-scale scenes may contain hundreds or thousands of possible emitters.

Required strategies include:

- pooled reusable effects;
- screen-size/distance scaling;
- source aggregation;
- emitter activation caps;
- priority culling;
- local-light caps;
- simplified background smoke/steam;
- event cooldown/aggregation;
- no full-quality particle loop on every distant machine.

The city should look more alive because systems are coordinated, not because every object emits particles.

---

# 70. Reduced Motion

Reduced-motion mode should:

- reduce continuous orbiting/drifting decorative effects;
- reduce distortion amplitude;
- simplify large environmental motion;
- replace rapid pulsing with stable or stepped cues;
- reduce screen-space displacement;
- preserve source, direction, danger and state.

It must not remove critical attack telegraphs or make machinery unreadable.

---

# 71. Reduced Flash and Photosensitivity

Reduced-flash mode should:

- cap peak full-screen luminance changes;
- reduce repeated lightning flicker;
- replace rapid emissive strobe with stable/slow patterns;
- reduce spark density where safe;
- suppress nonessential impact flashes;
- preserve strike/path/impact geometry through non-flash cues;
- prevent stacked effects from producing accidental flashing.

The default art direction should already avoid unsafe flashing; accessibility mode is not a licence for the default to be reckless.

---

# 72. Colour-Independent Readability

Critical cues require at least one non-colour channel such as:

- shape;
- direction;
- line pattern;
- boundary geometry;
- pulse cadence;
- particle motion;
- icon/marker supplied through ART-08;
- sound/haptic equivalent supplied by downstream systems.

Examples:

- stable vs unstable portal uses surface coherence and motion, not only green/red;
- powered vs blocked conduit uses directional flow vs stopped/disrupted pattern;
- dangerous area telegraph uses boundary/shape, not only red ground tint.

---

# 73. Bloom-Off and Low-Effects Certification

Every critical effect must be tested with:

- bloom off;
- reduced particle density;
- reduced motion;
- reduced flash;
- high-contrast/accessibility presentation where applicable;
- representative low-end profile.

If the effect becomes unreadable, the source design is incomplete.

---

# 74. Event and State Binding Contract

ART-06 inherits 21C/25K's rule that effects attach to **stable semantic sockets and read-only state/event contracts**.

A VFX source record should resolve at minimum:

- effect family ID;
- source asset/actor/structure ID;
- semantic socket or spatial anchor;
- activation event/state;
- intensity parameter source;
- direction/vector source where needed;
- material/element/school tags;
- allowed light profile;
- accessibility alternatives;
- LOD profile;
- pooling category;
- deterministic seed policy;
- audio event hook;
- validation requirements.

No arbitrary scene-script effect logic should bypass the declared presentation contract.

---

# 75. Reusable Effect Families

The Forge should provide reusable parameterised families before bespoke one-offs.

Candidate families:

- material impact/debris;
- dust;
- smoke;
- steam;
- sparks;
- fire/embers;
- water splash/foam/wake;
- snow/frost shedding;
- rain impacts;
- windborne leaves/pollen/ash/sand;
- mana flow;
- rune activation;
- ward activation/impact;
- portal aperture;
- corruption leak/pulse;
- cleansing/restoration;
- elemental projectile/impact foundations;
- beam/channel foundations;
- telegraph boundary;
- machine fault;
- ritual link/phase;
- realm-atmosphere ambient family.

A bespoke signature effect may compose and extend these rather than rebuilding every primitive.

---

# 76. Effect Variant Law

Variation may change:

- particle seed;
- secondary shape mix;
- timing offsets;
- small scale ranges;
- approved material/culture/realm accents;
- intensity within authoritative bounds;
- decorative flourish.

Variation may not change:

- gameplay radius;
- attack timing;
- effect school/meaning;
- source direction;
- critical state read;
- portal stability meaning;
- ward coverage truth;
- hazard class.

Variant generation must remain deterministic where persistence/consistency matters.

---

# 77. VFX Naming and Registry Direction

Final naming/schema belongs to registry/engineering authority, but ART-06 expects searchable semantic naming.

Names should make it possible to resolve:

- domain/family;
- phenomenon;
- scale;
- phase/state;
- material/element where needed;
- variant/LOD/accessibility profile.

Avoid names such as:

- `CoolMagic01`;
- `BigFXNew`;
- `PurpleBurstFinal2`;
- `BossSmoke`.

The same semantic family should be discoverable across The Forge, runtime resources, validation scenes and ART-10 references.

---

# 78. Source-to-Runtime Production Contract

The preferred production flow is:

**Canonical request**  
→ resolve gameplay/environment/magic authority  
→ classify phenomenon/effect purpose  
→ choose ART-06 family  
→ resolve sockets/events/state parameters  
→ author editable Forge effect/light profile  
→ author accessibility/LOD variants  
→ preview against representative materials/environments  
→ validate state correctness/readability/flash/performance  
→ bake/runtime package  
→ registry/manifest update  
→ capture reference evidence/work log.

Runtime effects are derivatives. Editable Forge source and authority linkage remain the production truth.

---

# 79. Preview and Test-Laboratory Requirements

The Forge VFX/lighting laboratory should support:

- neutral daylight scene;
- dark/night scene;
- indoor scene;
- wet/weather scene;
- representative biome backdrops;
- each current realm backdrop;
- humanoid and creature silhouettes;
- machine/structure sources;
- portal/ward/rune fixtures;
- moving target and projectile test;
- colour-blind/contrast checks;
- bloom on/off;
- reduced-motion/reduced-flash toggles;
- effect-density stress test;
- near/mid/far LOD camera positions;
- capture of stills and short loops;
- state/event scrubbing.

Effects must be evaluated in context, not only against a black editor background.

---

# 80. VFX Validation Rules

Validation should catch at least:

- missing/invalid socket;
- missing state/event binding;
- effect without a known source;
- excessive emitter count;
- unsupported dynamic light count;
- unsafe flash pattern;
- absent reduced-flash profile for flagged effects;
- absent reduced-motion profile where required;
- critical colour-only cue;
- missing LOD;
- effect geometry that hides its source/telegraph;
- particle scale inconsistent with world scale;
- invalid material/shader dependency;
- portal/ward visual boundary claiming non-authoritative precision;
- effect that remains active after state exit;
- pooled effect that fails to reset;
- nondeterministic variation where stable seed is required;
- missing audio event hook where ART-07 depends on it;
- missing golden-reference comparison for certified families.

---

# 81. Codex VFX/Lighting Production Sequence

When asked to create or modify an ART-06 asset, Codex should follow this order:

1. Identify the canonical phenomenon/request.
2. Locate its owning gameplay/environment/magic authority.
3. Confirm the exact state/event/phase truth available to presentation.
4. Resolve realm, biome, culture and material context from ART-02/03.
5. Resolve source model/body/sockets from ART-04/05.
6. Classify effect purpose: ambience, feedback, telegraph, state, transition or signature event.
7. Select the closest reusable ART-06 effect family.
8. Define macro silhouette/direction/scale before micro particles.
9. Define temporal phase structure.
10. Define motion and geometry grammar from phenomenon.
11. Define value/emission/colour roles without relying on colour alone.
12. Define light contribution only if necessary.
13. Define material/surface interaction.
14. Define event/state bindings.
15. Define intensity parameters.
16. Define deterministic variation policy.
17. Define LOD/importance behaviour.
18. Define reduced-motion profile.
19. Define reduced-flash profile.
20. Define bloom-off/colour-independent equivalent cues.
21. Add ART-07 semantic audio hooks without authoring final audio.
22. Build editable Forge source.
23. Preview in neutral, dark and representative environment contexts.
24. Run socket/state/accessibility/performance validation.
25. Compare against ART-10 golden references when available.
26. Bake runtime products.
27. Update registry/manifest/work log.
28. Escalate any unresolved canon instead of inventing it.

---

# 82. Codex Stop-and-Escalate Conditions

Codex must stop and escalate when:

- the spell/effect's actual gameplay behaviour is undefined;
- a magic school's role is ambiguous and affects presentation meaning;
- the source/target/medium cannot be resolved;
- a requested VFX implies a new hazard, damage, radius or mechanic;
- a ward's exact coverage is being inferred from art rather than gameplay;
- a portal destination/stability rule is unknown;
- a weather effect would imply climate/wind truth that does not exist;
- a corruption effect would collapse distinct corruption types or realm states;
- a boss telegraph cannot be reconciled with authoritative attack timing/shape;
- an effect requires an unapproved socket/anchor that changes model/gameplay contracts;
- a requested full-screen flash/distortion conflicts with accessibility rules;
- a realm-specific effect contradicts ART-03 or current FCC canon;
- performance requires deleting a critical cue rather than degrading it safely.

Codex may autonomously choose ordinary aesthetic parameters **inside** the resolved effect family and constraints.

---

# 83. Golden VFX and Lighting Reference Programme

ART-10 should eventually certify at least these ART-06 references:

1. mundane stone/wood/metal impact trio;
2. torch/fire/smoke reference;
3. furnace cold → ignite → active → overheat → cool sequence;
4. rain + wet-surface reference;
5. snow/blizzard reference;
6. water splash/wake/underwater reference;
7. lightning storm with reduced-flash variant;
8. mana conduit flow/stability reference;
9. rune activation/failure reference;
10. ward activate/impact/failure reference;
11. stable vs unstable portal reference;
12. Elemental magic family comparison;
13. Nature + Arcane comparison proving non-colour identity;
14. Light + Shadow comparison proving non-flash/non-black-smoke identity;
15. Time + Space comparison;
16. Alchemy + Enchanting + Summoning + Ritual comparison;
17. corruption vs Shadow vs nightmare vs infernal comparison;
18. machine/factory density and LOD scene;
19. Overworld ordinary atmosphere reference;
20. seven-realm atmosphere comparison strip;
21. combat telegraph/impact reference under accessibility profiles;
22. boss/high-density signature encounter reference;
23. bloom-off/low-effects certification scene;
24. settlement/night-light hierarchy reference.

These are reference **families/scenes**, not necessarily individual one-off assets.

---

# 84. ART-06 Decision Register

| ID | Decision |
|---|---|
| ART06-D001 | Leyforge VFX must reveal cause, source, material/energy, direction, scale and state without replacing world geometry with spectacle. |
| ART06-D002 | Critical VFX identity must prioritise shape, source, direction, motion and rhythm before colour. |
| ART06-D003 | Effects inherit the ART-01 macro → meso → micro hierarchy; micro particles cannot carry the only critical information. |
| ART06-D004 | Effect scale increases coordination/composition rather than merely increasing particle count. |
| ART06-D005 | All effects must bind to authoritative gameplay/environment/magic state or declared presentation events; VFX cannot create mechanics. |
| ART06-D006 | Stable semantic sockets/anchors are the default source contract for localised effects. |
| ART06-D007 | Leyforge particles should favour authored voxel/faceted/stylised shapes over photographic alpha-noise clouds. |
| ART06-D008 | Motion grammar must derive from the actual phenomenon rather than default orbiting/glowing-particle behaviour. |
| ART06-D009 | Distortion is reserved for physically/magically appropriate phenomena and must have reduced-motion alternatives. |
| ART06-D010 | Ordinary impacts must preserve target material identity; there is no universal impact puff. |
| ART06-D011 | Fire, smoke, steam, sparks, dust and water each receive distinct physical/stylised production grammar rather than recoloured shared effects. |
| ART06-D012 | Weather presentation is layered spatial environment behaviour; precipitation particles do not own persistent wetness/snow/world state. |
| ART06-D013 | Wind is normally revealed through affected media; generic visible wind streaks are not a universal ambient effect. |
| ART06-D014 | Fog/mist/haze are spatial atmosphere, not global colour filters. |
| ART06-D015 | Lighting must preserve material identity, voxel form and route/interaction readability while supporting time/weather/realm atmosphere. |
| ART06-D016 | Dynamic lights are used only when they materially improve readability/atmosphere; emissive surfaces do not automatically generate dynamic lights. |
| ART06-D017 | Bloom is optional enhancement only; critical effects must remain readable with bloom disabled. |
| ART06-D018 | High-frequency flashing is prohibited as a critical-state language; reduced-flash alternatives are mandatory for relevant effects. |
| ART06-D019 | Darkness, Shadow magic, Void corruption, nightmare ecology and infernal environments are distinct presentation concepts. |
| ART06-D020 | Screen-space effects are restrained, optional support cues and never the sole carrier of critical information. |
| ART06-D021 | Magic presentation composes authoritative behaviour, medium, source, school/tradition, tags, realm/culture context, material interaction and phase/state. |
| ART06-D022 | The thirteen major magic schools do not receive one mandatory universal colour each. |
| ART06-D023 | Elemental magic remains grounded in the actual element/physical phenomenon. |
| ART06-D024 | Nature magic uses biological/ecological behaviour rather than generic green glow. |
| ART06-D025 | Arcane magic favours controlled abstract structure but is not universal purple magic. |
| ART06-D026 | Light magic is radiance/illumination presentation and is not automatically holy/divine; it must not depend on blinding flashes. |
| ART06-D027 | Shadow magic uses occlusion/absorption/silhouette/light displacement and is not generic black smoke. |
| ART06-D028 | Blood magic uses restrained biological pulse/flow grammar and may not invent biological damage. |
| ART06-D029 | Time magic uses temporal echo/phase relationships; clocks/hourglasses are optional cultural motifs, not universal physics symbols. |
| ART06-D030 | Space magic uses adjacency/displacement/lensing/seam/folding language and is a primary but restrained distortion family. |
| ART06-D031 | Rune magic is substrate-bound inscription/path activation; its pattern should visibly perform the logic. |
| ART06-D032 | Alchemy presentation is reaction/process/vessel driven rather than generic magical smoke. |
| ART06-D033 | Enchanting should preserve the underlying object's material identity and prefer integrated surface/edge/core cues over generic auras. |
| ART06-D034 | Summoning must communicate anchor, boundary/connection and materialisation; a floor circle is not mandatory. |
| ART06-D035 | Ritual scale is communicated through staged distributed structure, not merely larger emitters. |
| ART06-D036 | Mana is not a universal purple substance; personal and external/infrastructure mana remain visually distinguishable when relevant. |
| ART06-D037 | Wards must not default to permanent dense domes; anchors, boundary interaction and optional inspection overlays are preferred. |
| ART06-D038 | Portals use structured charging/aperture/stability/shutdown language and must not default to swirling purple liquid. |
| ART06-D039 | Combat telegraphs must preserve attacker/source, direction, timing and area readability under reduced effects and colour-independent conditions. |
| ART06-D040 | Corruption is a layered state and must remain distinguishable from Shadow, decay, nightmare ecology, infernal atmosphere and ordinary damage. |
| ART06-D041 | Machine VFX must derive from visible function/fault state; advanced machinery does not gain arbitrary particle spectacle. |
| ART06-D042 | Each current realm receives atmospheric effect grammar without a universal full-screen tint/filter. |
| ART06-D043 | Effect LOD preserves critical danger/action/state cues first and removes ambient decoration first. |
| ART06-D044 | Dense settlements/factories require pooling, aggregation, priority culling and local-light caps rather than one full emitter per distant object. |
| ART06-D045 | Critical effects require reduced-motion, reduced-flash, colour-independent, bloom-off and low-effects validation. |
| ART06-D046 | Editable Forge effect/light source, declared state/socket contracts and validation evidence are production truth; runtime effects are reproducible derivatives. |
| ART06-D047 | Reusable parameterised effect families are preferred before bespoke one-offs; signature effects may compose/extend them. |
| ART06-D048 | Codex must resolve authoritative phenomenon, source/medium, state/event and macro effect grammar before particles, colour polish or screen-space embellishment. |
| ART06-D049 | Codex may autonomously vary cosmetic parameters inside approved families but may not change gameplay radius, timing, hazard meaning, school identity or state truth. |
| ART06-D050 | Codex must stop and escalate unresolved mechanics, spell behaviour, portal/ward truth, realm conflicts, attack telegraph conflicts, unsafe flash/distortion or missing required anchors. |

---

# 85. Cross-Document Boundary Map

## ART-01

Owns global visual hierarchy, voxel-native stylisation, silhouette/readability, controlled detail and accessibility principles. ART-06 expresses those rules through transient effects and lighting.

## ART-02

Owns material/surface identity, emission masks, transparency and persistent material states. ART-06 animates/interacts with those states without redefining them.

## ART-03

Owns realm, biome, settlement, architecture and culture art direction. ART-06 derives weather/atmosphere/realm-effect language from it.

## ART-04

Owns block/item/machine/structure/vessel geometry, pivots and sockets. ART-06 attaches effects/lights to approved model anchors.

## ART-05

Owns characters, creatures, rigs, motion and body telegraphs. ART-06 supplies cast/impact/contact/aura/phase effects and consumes ART-05 event anchors.

## ART-07

Will own audio/music/sonic identity. ART-06 exposes semantic timing/source/intensity hooks but does not author final sound.

## ART-08

Will own UI/icons/cartography/2D presentation. Exact ward radii, hazard overlays, state icons and inspection graphics may be shown there when world-space VFX should remain approximate/restraint-based.

## ART-09

Will own the complete Codex/The Forge production execution contract and reporting workflow. ART-06 supplies its VFX/lighting sub-process.

## ART-10

Will own golden-reference certification, visual/audio QA thresholds and production acceptance evidence.

---

# 86. Source Crosswalk

| ART-06 area | Primary upstream source |
|---|---|
| Particle sockets, reusable effect profiles, state activation | Document 21C |
| Light/emission/flicker and photosensitivity | Document 21C + ART-02 |
| Runtime visual-state layering and determinism | Document 21C |
| Animation/audio/VFX socket/event manifest expectations | Document 25K |
| Major magic schools, personal/external mana, wards, runes, rituals, portals, corruption | Document 09 v1.0 |
| Material truth, emission, fluids, heat, wetness, corruption surface layers | ART-02 |
| Realm/biome atmosphere and anti-collapse rules | ART-03 |
| Model sources/sockets, machines, structures, vessels | ART-04 |
| Cast/combat/body event timing and creature/boss readability | ART-05 |
| Current POC effect/state evidence | POC Manual Testing Guide — prototype/migration evidence only |

---

# 87. Principal Source Basis

ART-06 was drafted from the current Leyforge authority state, especially:

- ART-00 through ART-05;
- Document 21C — Voxel Asset Forge — Animation, Effects and Runtime Visual States;
- Document 25K — Asset Budgets, Forge, Animation, Audio, VFX, Socket and Event Manifest Contract;
- Document 09 v1.0 — Magic, Mana, Spellcraft, Runes, Rituals and Civilisation Magic System;
- current FCC realm/environment/magic canon;
- current Overworld weather/environment/ecology canon;
- current settlement, machine, combat, damage, portal and world-state authority;
- current POC manual as implementation/migration evidence rather than final art authority.

Key inherited technical concepts preserved rather than redefined include:

- stable effect sockets;
- reusable effect profiles;
- one-shot/continuous/state-driven activation;
- read-only authoritative state binding;
- material/shader animation;
- light/emission profiles;
- layered states and conflict priority;
- damage/heat/wetness/burning/corruption presentation layers;
- machine/logistics/magic infrastructure presentation;
- deterministic local cosmetic variation;
- reconnect/state reconstruction;
- VFX/animation LOD;
- pooling/culling/aggregation requirements;
- accessibility and reduced-flash settings;
- editable source to baked runtime flow;
- event/socket/manifest registration.

---

# 88. ART-06 Acceptance Gate

ART-06 is ready for owner lock when the owner agrees with this statement:

> **Leyforge effects reveal world state rather than replacing world readability. Shape, source, direction, behaviour and rhythm come before colour; particles remain stylised and voxel-compatible; physical effects retain material truth; weather is layered environmental behaviour; lighting preserves material, form and routes; bloom and flashing are restrained; and critical cues survive bloom-off, reduced-motion, reduced-flash, low-effects and colour-independent conditions. Magic presentation derives from authoritative behaviour, medium, source, school/tradition, tags and context rather than a one-colour-per-school taxonomy. Elemental, Nature, Arcane, Light, Shadow, Blood, Time, Space, Rune, Alchemy, Enchanting, Summoning and Ritual magic each have behaviour-led visual grammar; mana, wards and portals are readable without universal purple glow/domes/swirl; machine effects derive from actual function/fault state; corruption remains distinct from Shadow/nightmare/infernal/ordinary decay; each current realm receives restrained atmospheric signatures; critical effects outrank ambience under LOD; and Codex must resolve authority, source, state/event and macro grammar before visual polish, escalating rather than inventing unresolved mechanics or unsafe presentation.**

If accepted, ART06-D001 through ART06-D050 become the locked global VFX/lighting/weather/magic/environmental-effects art baseline unless superseded through ART-00 governance.

---

# 89. Next Document

After ART-06 lock, continue to:

## ART-07 — Audio, Music & Sonic Identity Bible

ART-07 should establish final production direction for:

- sonic style and mix hierarchy;
- material impacts and footsteps;
- tools, weapons and crafting;
- machines, automation and infrastructure;
- environmental ambience and weather audio;
- water, vessels and maritime sound;
- creature and character voices/calls;
- magic-school/source audio identities;
- runes, wards, portals and corruption audio;
- settlement/civilisation soundscapes;
- realm sonic identities;
- UI/non-diegetic sonic language;
- repetition and deterministic variation;
- music identity, instrumentation and adaptive principles;
- silence and dynamic-range rules;
- captions/equivalent cues/hearing accessibility;
- spatial audio and distance LOD;
- Codex audio production rules;
- golden sonic references and certification targets.

---

# 90. End Statement

ART-06 closes the final visual-effects and lighting gap between Leyforge's static/material/world/entity art language and the audio/UI/execution/certification layers that follow.

The intended production result is:

> **Codex should be able to receive requests such as “author the complete Basic Mana Conduit flow/fault VFX family,” “create a stormfront and reduced-flash lightning profile for the Overworld,” “build the stable and unstable portal effect family,” “produce a Verdant Covenant seasonal convergence atmosphere,” “author an Impossible Deep geothermal vent and pressure-haze profile,” “create an Ashen Lower Realms industrial heat/ash/cooling scene,” “produce a Rune activation and rejection sequence,” or “build a boss attack telegraph that survives low-effects settings,” then resolve the correct canon and state contracts, choose the correct behaviour-led VFX grammar, attach it to stable anchors, preserve material/realm identity, create accessibility and LOD variants, validate it in context and bake reproducible runtime effects without inventing mechanics, school law, hazard truth or portal behaviour.**

---

**End of ART-06 v0.1**
