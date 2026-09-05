# Leyforge Art Production Corpus

## ART-07 — Audio, Music & Sonic Identity Bible

**Document ID:** ART-07  
**Title:** Leyforge Audio, Music & Sonic Identity Bible  
**Version:** v0.1  
**Date:** 4 September 2026  
**Status:** **LOCKED ART-PRODUCTION BASELINE — OWNER ACCEPTED 4 SEPTEMBER 2026**
**Project:** Leyforge  
**Product context:** Ley Realms / The Forge  
**Corpus:** ART — Final Art Direction, Asset Production & Codex/Forge Handoff  
**Direct parent:** ART-01 — Master Leyforge Visual Language & Style Bible  
**Material parent:** ART-02 — Materials, Colour, Texture, Surface & Shader Art Standard  
**Environment parent:** ART-03 — World, Realm, Biome, Architecture & Culture Art Direction  
**Model parent:** ART-04 — Blocks, Items, Machines, Structures, Equipment & Vessel Modelling Standard  
**Entity/motion parent:** ART-05 — Characters, Creatures, Rigging & Animation Style Handoff  
**Effects parent:** ART-06 — VFX, Lighting, Weather, Magic & Environmental Effects Bible  
**Constitutional parent:** ART-00 — Art Production Constitution & Authority Map  
**Primary upstream authorities:** Document 21C animation/effects/runtime presentation architecture; Document 25K asset, audio, VFX, socket and event-manifest contract; Document 09 v1.0 magic/mana/spell/rune/ritual/ward/portal semantics; current FCC realm/environment/creature/civilisation canon; current combat, machine, weather, settlement and vessel authorities; applicable ENG-GOV and FORGE-ENG law  
**Inherited production baselines:** stable semantic sound sockets; one-shot/loop/state-driven audio cues; animation marker synchronisation; presentation-only state binding; audio voice aggregation/virtualisation; category controls; spatial anchors; accessibility equivalents; editable Forge source separated from baked runtime products; reusable presentation profiles; event/socket/manifest registration  
**Primary downstream consumers:** ART-08 through ART-10, Codex/coding agents, The Forge, audio production, music production, creature/character production, world/realm ambience production, accessibility validation, performance/voice-budget validation, Project Brain  

---

# 00. Executive Sonic Statement

Leyforge should sound like a **living, materially believable civilisation sandbox whose ordinary world is strong enough that magic, danger and other realms feel genuinely extraordinary**.

The sonic promise is:

> **Sound tells the truth about material, distance, motion, place, danger, labour, life and magic before it tries to impress the player.**

The ambience promise is:

> **Every place should possess a recognisable acoustic ecology without becoming a permanently noisy wall of loops.**

The music promise is:

> **Leyforge music supports exploration, survival, civilisation, mystery, wonder and consequence without narrating every second of play or flattening the world into constant heroic fantasy.**

The accessibility promise is:

> **No critical state may depend on hearing alone, and no required sonic cue may become unusable because music, ambience or presentation density masks it.**

The production promise is:

> **Codex should be able to receive a canonical block, material, item, machine, creature, spell, settlement, biome, realm, vessel, event or UI-state request; resolve its authoritative identity and event/state contracts; derive the correct sonic family; author reusable variations, loops and transitions; bind them to stable semantic anchors; create spatial/LOD/accessibility profiles; validate repetition, masking and runtime cost; and produce reproducible Forge source without inventing mechanics, creature behaviour, culture, magic law or narrative meaning.**

ART-07 defines the final Leyforge artistic law for sound, ambience, voice-like non-dialogue creature/character expression, music and sonic presentation. It does not replace gameplay systems, dialogue writing, narrative authority, simulation truth, animation timing authority or engineering runtime budgets.

---

# 01. Authority and Scope

## 01.1 ART-07 owns

ART-07 owns final global art direction and production rules for:

- overall sonic identity and mix philosophy;
- material contact and impact sound families;
- footsteps, movement contacts and traversal sounds;
- mining, chopping, digging, harvesting and construction sounds;
- crafting, processing and workstation sound language;
- weapons, shields, armour and combat presentation audio;
- machines, automation, logistics and power-system audio;
- magical infrastructure and spell sonic language;
- runes, wards, rituals, enchantments, portals and corruption audio;
- environmental ambience and acoustic ecology;
- weather, wind, fire, water and hazard sound presentation;
- underwater and maritime sound direction;
- vessels, rigging, sails, hulls and onboard machinery presentation;
- creature calls, exertion, threat, pain and movement sound art direction;
- non-verbal humanoid exertion and reaction sound direction;
- settlement, workplace, market, civic and civilisation soundscapes;
- realm sonic signatures;
- culture-facing instrumentation and sonic motifs where canon permits;
- UI and non-diegetic sonic language in coordination with ART-08;
- spatial sound art direction;
- distance, occlusion and environmental treatment direction;
- sound variation and anti-repetition rules;
- dynamic range and silence philosophy;
- music identity, instrumentation, motif architecture and adaptive principles;
- music transition and intensity logic at the presentation layer;
- audio accessibility and captioning intent;
- audio LOD, voice priority, aggregation and virtualisation art direction;
- Codex audio/music production procedure;
- ART-07 golden-reference candidates and sonic QA.

## 01.2 ART-07 does not own

ART-07 does not decide:

- whether an action succeeds;
- weapon damage or hit detection;
- creature AI or detection range;
- dialogue content or quest writing;
- whether an NPC speaks a given line;
- machine processing truth or power state;
- whether a spell exists, its school, cost, damage or target rules;
- whether a ward protects an area;
- weather simulation truth;
- ocean current, wave or buoyancy simulation;
- portal destination or traversal legality;
- stealth/detection mechanics unless explicitly defined elsewhere;
- authoritative rhythm/minigame timing unless owned by gameplay;
- final audio middleware implementation;
- final memory/voice-count budgets where engineering sets stricter limits;
- UI visual presentation owned by ART-08;
- narrative/cultural canon not already established upstream.

## 01.3 Audio cannot create gameplay state

Examples:

- a sword clang does not create a parry;
- a monster roar does not apply fear unless gameplay says so;
- a furnace loop does not prove a recipe is progressing unless the furnace state says so;
- a mana hum does not imply stored mana unless authoritative state provides it;
- a warning tone does not create danger;
- rain sound does not make the world wet;
- footsteps do not decide whether an actor is detected;
- a musical sting does not begin combat;
- a portal drone does not make a portal traversable;
- a settlement bell does not initiate a raid unless gameplay owns that event.

---

# 02. Core Sonic Production Ontology

Every ART-07 production task must resolve these layers:

1. **Authoritative source** — what actually creates the sound?
2. **Event/state** — what happened or what persistent condition exists?
3. **Material/body family** — what physical substance/anatomy is involved?
4. **Action/mechanism** — impact, scrape, flow, rotation, pulse, fracture, vocalisation, ambience, etc.?
5. **Scale/mass** — tiny, handheld, actor, machine, structure, settlement, regional?
6. **Energy/intensity** — gentle, working, stressed, violent, catastrophic?
7. **Acoustic environment** — open field, forest, cave, interior, underwater, storm, realm condition?
8. **Distance/spatial role** — local contact, near cue, landmark, distant ambience, global/non-diegetic?
9. **Temporal role** — one-shot, loop, intermittent, sequence, layered state, musical transition?
10. **Variation family** — what parameters may vary without changing identity?
11. **Priority** — critical, important, contextual, ambient, decorative?
12. **Accessibility equivalent** — what visual/text/haptic equivalent exists if the cue matters?
13. **LOD/virtualisation profile** — how does it simplify or aggregate?
14. **Mix category** — which controllable bus/category owns it?
15. **Validation evidence** — how do we prove it works in actual play context?

No sound is production-ready because it merely sounds impressive in isolation.

---

# 03. Leyforge Sonic Identity

Leyforge's baseline sound character is:

- tactile;
- materially grounded;
- readable;
- warm where ordinary life is safe;
- weighty where mass demands it;
- restrained in constant ambience;
- textural rather than overprocessed;
- capable of large dynamic contrast;
- magical when magic is actually present;
- ancient when age/history justifies it;
- culturally variable without caricature;
- spatially informative;
- layered enough for deep simulation without becoming noisy.

The target is not cinematic realism, arcade abstraction or generic medieval-fantasy ambience. It is a stylised but believable sonic world where the player can learn what things are made from, what machines are doing, where activity is happening and when supernatural rules have entered the scene.

---

# 04. Truth Before Spectacle

A production sound should first answer one or more useful questions:

- What material was struck?
- How hard was it struck?
- How large/heavy is the source?
- Where did it happen?
- Is the object working, blocked, damaged or failing?
- Is a creature near, far, calm, alarmed or attacking?
- Is this weather ambient or dangerous?
- Is a spell charging, released, travelling, impacting, channelled or ending?
- Is a portal stable or unstable?
- Is a settlement calm, busy, threatened or recovering?

Spectacle is added only after those truths remain legible.

---

# 05. Sonic Hierarchy and Mix Priority

Priority order is generally:

1. **Immediate player danger / mandatory response cues**
2. **Direct player action feedback**
3. **Nearby actor/combat state**
4. **Critical machine/structure/world warnings**
5. **Dialogue / required informational speech where applicable**
6. **Important interaction and task feedback**
7. **Local environmental identity**
8. **Settlement/workplace activity**
9. **Music**
10. **Decorative ambience**

This hierarchy is contextual rather than a single permanent volume order, but higher categories must remain intelligible when required.

Music and ambience may duck, simplify or yield spectral space for critical cues.

---

# 06. Silence Is an Authored Resource

Leyforge must not fill every moment with sound.

Useful silence or low-density acoustic space supports:

- wilderness scale;
- underground tension;
- nighttime calm;
- abandoned places;
- pre-raid anticipation;
- realm transitions;
- sacred or uncanny spaces;
- aftermath;
- discovery;
- musical contrast.

A quiet scene is not an unfinished scene if the absence of activity is intentional and contextually truthful.

---

# 07. Dynamic Range Philosophy

Leyforge should retain enough dynamic range that:

- a hand tool feels smaller than a forge hammer;
- a forge hammer feels smaller than a collapsing gate;
- a campfire feels smaller than a wildfire;
- a local spell feels smaller than a realm-scale event;
- a nearby whisper or footstep can matter in quiet spaces;
- distant thunder can establish scale without crushing all other sound.

Accessibility/night/limited-dynamic-range profiles may compress this range without destroying hierarchy.

---

# 08. Stylisation and Source Design

Audio may be recorded, synthesised, procedural, layered or hybrid.

The final sound should favour:

- clean material identity;
- strong transient shape;
- readable body/resonance;
- controlled low-frequency weight;
- restrained cinematic sweetening;
- limited synthetic gloss on mundane materials;
- deliberate supernatural processing where canon supports it.

Ordinary wood, stone, cloth, water and metal should not sound magical by default.

---

# 09. Material Response Families

ART-02 Material DNA should map to reusable sonic material families.

Each relevant material family may define:

- light contact;
- medium contact;
- heavy impact;
- scrape/drag;
- break/fracture;
- tool interaction;
- footstep/contact;
- placement/building contact;
- wet/frozen/burnt/corrupted variants where meaningful.

The same material identity should remain recognisable across blocks, items, structures and machines.

---

# 10. Stone Sonic Grammar

Stone should communicate:

- hardness;
- density;
- grain/porosity where relevant;
- mass;
- fracture character;
- cavity/resonance context.

Cobble, dressed stone, granite, limestone, brittle crystal-bearing stone and deep/realm stones may vary, but not through arbitrary pitch shifts alone.

Mining stone should combine tool contact with material response and meaningful debris/resonance without producing identical repeated clacks.

---

# 11. Wood Sonic Grammar

Wood should communicate:

- species/family where useful;
- dryness/moisture;
- thickness;
- hollow vs solid construction;
- flex;
- joinery/fastening;
- break/splinter behaviour.

Oak logs, planks, beams, doors, furniture, ship timbers and machine frames should share family identity while differing by construction and mass.

---

# 12. Metal Sonic Grammar

Metals should not collapse into one generic ringing clang.

Relevant variables include:

- metal family;
- thickness;
- shape;
- heat;
- tension;
- mass;
- whether impact is hard-on-hard, damped, mounted or loose;
- whether the object is forged, cast, plated or assembled.

Iron, copper and later canonical metal families should remain sonically distinguishable where gameplay or world identity benefits.

---

# 13. Glass, Crystal and Ceramic Grammar

Glass/crystal/ceramic families need distinct:

- taps;
- resonances;
- scrapes;
- fracture character;
- magical resonance overlays where applicable.

Mana crystal does not become “normal glass plus reverb.” Its supernatural character must be layered onto believable crystalline behaviour.

---

# 14. Soil, Sand, Gravel, Mud and Snow

Loose and soft materials should differ through:

- grain size;
- moisture;
- compaction;
- depth;
- foot pressure;
- tool action.

Sand should not sound like gravel; mud should not sound like wet stone; fresh snow should not sound like ice.

---

# 15. Cloth, Leather, Fibre and Organic Materials

These materials should provide subdued but useful movement identity:

- cloth rustle;
- leather creak;
- rope/fibre tension;
- woven/thatch brushing;
- hide/chitin contacts where applicable.

They are important for armour, backpacks, clothing, sails, tents, furniture, agriculture and creatures.

---

# 16. Footstep System Art Direction

Footsteps should be composed from:

**body/footwear + locomotion intensity + surface + condition + environment + carried/equipment contribution**.

The system should support:

- walk;
- run;
- sprint;
- crouch/sneak if gameplay owns it;
- jump takeoff;
- landing;
- wading;
- swimming entry/exit;
- ladder/climb contacts where applicable.

Footsteps should provide useful spatial presence without becoming a metronome.

---

# 17. Footstep Variation and Rhythm

Avoid obvious repetition through controlled variation of:

- sample selection;
- micro-timing;
- intensity;
- pitch within narrow family-safe ranges;
- left/right or contact differences;
- equipment layers;
- surface-state layers.

Variation must not make the same surface sound like a different material every step.

---

# 18. Player Movement Audio

Player movement should be slightly clearer than equivalent ambient NPC movement because it provides proprioceptive feedback.

Useful layers include:

- foot contacts;
- equipment/clothing motion;
- jump/landing exertion;
- water entry/exit;
- climbing/grabbing;
- heavy encumbrance layers if gameplay supports them.

The player should not sound like a constantly jangling bag of cutlery merely because equipment is worn.

---

# 19. NPC and Crowd Movement

Nearby NPCs should remain individually locatable where useful.

Large crowds should aggregate rather than instantiate full-volume footstep detail for every actor.

Distant settlement movement may collapse into controlled crowd-bed textures while nearby relevant individuals retain direct contacts.

---

# 20. Mining, Digging and Harvesting

Tool interaction audio should resolve:

- tool material/tier;
- target material;
- action intensity;
- progress/impact rhythm;
- break/completion event.

Pickaxe-on-stone, axe-on-wood and shovel-on-soil must be recognisable without looking at the screen.

However, audio must not imply harvest success before gameplay commits the result.

---

# 21. Construction and Repair

Construction sound should communicate process rather than generic hammer spam.

Possible families include:

- placement/set-down;
- timber fitting;
- hammering/fastening;
- stone setting;
- sawing/cutting;
- scraping/levelling;
- rope tension;
- scaffolding movement;
- repair patching;
- final completion accent.

NPC construction should use rate-limited and distance-aware variation.

---

# 22. Crafting and Workstations

Crafting stations should possess recognisable process rhythms:

- workbench: cutting, fitting, tapping;
- forge/anvil: heat, metal strikes, quench/handling;
- loom: shuttle/tension rhythm;
- alchemy: vessels, pours, restrained reactive sounds;
- rune table: substrate contact plus rune/mana behaviour;
- sawmill: mechanical cutting and timber resonance;
- food preparation: material/process-specific actions.

Crafting completion stings should remain brief and subordinate to actual process audio.

---

# 23. Weapon Audio

Weapon sound identity should derive from:

- weapon family;
- material;
- mass;
- motion speed;
- target material/body;
- block/parry/armour interaction;
- environment.

Avoid universal oversized movie whooshes for every attack.

Air movement should be proportional to real apparent mass and speed.

---

# 24. Armour and Shield Audio

Armour contributes:

- movement layers;
- impact damping/ringing;
- strap/plate motion;
- shield blocks;
- heavy landing resonance.

Armour audio should help communicate material/tier without making normal traversal exhausting to hear.

---

# 25. Combat Impact Grammar

A combat impact should be composed from:

**attacker/tool/weapon + target body/material/armour + force + result/state + environment**.

Hit confirmation may use subtle non-diegetic reinforcement if gameplay needs it, but physical impact remains the primary sonic truth.

Critical damage, blocked damage, glancing contact and armour impact should not all share the same hit sound.

---

# 26. Humanoid Non-Verbal Voice Direction

Non-dialogue humanoid sounds may include:

- exertion;
- pain;
- alarm;
- effort;
- work effort;
- combat reaction;
- breathing state where appropriate.

They should be:

- restrained in frequency;
- varied;
- culturally neutral unless upstream canon specifically defines otherwise;
- compatible with character identity;
- never used to invent personality or narrative facts.

Dialogue/voice acting remains separate narrative production authority.

---

# 27. Creature Sonic Identity

Creatures should be identifiable through a combination of:

- body size;
- anatomy;
- locomotion contacts;
- breathing/body noise;
- calls;
- threat displays;
- feeding/work/ecological behaviour;
- magical/elemental layers where canon supports them.

A creature call should feel physically plausible for the body plan unless the creature's supernatural ontology deliberately breaks ordinary biology.

---

# 28. Creature Calls and Behaviour States

Where upstream behaviour supports it, sound families may distinguish:

- idle/contact;
- social;
- territorial;
- alarm;
- search;
- chase;
- attack anticipation;
- attack;
- hurt;
- flee;
- death;
- special ability.

These sounds communicate existing states; they do not define AI state transitions.

---

# 29. Size, Mass and Creature Acoustics

Large creatures need mass through:

- low-frequency body resonance;
- heavier contacts;
- environmental reaction;
- slower structural creaks/shifts where anatomically appropriate;
- larger-distance propagation for suitable calls.

They should not simply be small-creature samples pitch-shifted downward.

Tiny creatures should not receive huge sub-bass merely to make them feel dangerous.

---

# 30. Spirits, Elementals, Constructs and Non-Ordinary Bodies

Non-organic beings should derive sound from actual ontology:

- spirit: displacement, resonance, breath-like or environmental interaction only if canon supports it;
- elemental: actual element/medium behaviour;
- construct: material joints, internal mechanisms, magical core where present;
- undead: body/material/state truth rather than universal whispering horror;
- plant/fungal beings: fibre, wood, leaf, root, spore and moisture behaviour;
- swarms: aggregate density and spatial spread rather than one enlarged insect loop.

---

# 31. Machine Sonic Grammar

Machine audio must expose function.

A machine sound family may include:

1. idle/at-rest character if physically justified;
2. startup;
3. active mechanism;
4. periodic operation markers;
5. input/output events;
6. load/intensity variation;
7. blocked/stalled state;
8. low-power/low-resource state where relevant;
9. damaged/unstable state;
10. shutdown/coast-down;
11. failure/overload warning.

The machine should not play a working loop merely because the model is visible.

---

# 32. Mechanical Power

Mechanical systems should communicate:

- rotation;
- gearing;
- belt/shaft tension where used;
- water/wind/fuel driving source;
- load;
- slipping/stalling;
- stored momentum.

Different power sources should remain recognisable without requiring UI.

---

# 33. Logistics Networks

Chutes, conveyors, pipes and transfer networks must avoid audio spam.

Rules:

- individual nearby meaningful transfers may sound;
- high-rate repeated transfers aggregate;
- long networks should produce localised zones of activity rather than a voice per segment;
- blockages/faults outrank normal motion;
- direction may be reinforced through moving/localised sound where practical;
- distant networks collapse into controlled industrial ambience.

---

# 34. Furnaces, Forges and Heat Systems

Furnace/forge audio should distinguish:

- ignition;
- stable burn;
- airflow/draft;
- fuel changes where useful;
- active processing;
- cooling;
- blocked/faulted/overheated states;
- magical enhancement where present.

A Mana Furnace should preserve furnace/processing identity while adding the correct mana/rune behaviour; it should not become a completely unrelated magical drone.

---

# 35. Magical Infrastructure

Mana batteries, conduits, rune engines, enchanting stations, ward lanterns and related infrastructure should use shared semantic layers where applicable:

- energy presence;
- flow;
- storage;
- regulation;
- activation;
- successful transfer;
- fault;
- overload;
- depletion;
- shutdown.

Sonic presentation must remain state-bound and avoid constant high-frequency hum fatigue in magical settlements.

---

# 36. Magic Sonic Composition Model

Magic audio should derive from:

**authoritative effect behaviour + medium + source + school/tradition + tags + realm/culture context + material/body interaction + phase/state**.

School identity alone is insufficient.

The same school may sound very different when expressed through stone, blood, water, a staff, a rune-carved door or a realm-scale ritual.

---

# 37. Magic Is Not One Synth Patch per School

The thirteen major schools must not be reduced to thirteen preset timbres.

Shared school grammar may influence:

- spectral character;
- rhythm;
- motion;
- resonance;
- harmonic/inharmonic structure;
- use of breath/noise/impact/tonal content;
- temporal envelope;
- spatial behaviour.

But actual phenomenon and medium remain primary.

---

# 38. Elemental Magic Audio

Elemental magic should preserve the actual element:

- fire: ignition, combustion, pressure, roar/crackle by scale;
- water: flow, pressure, splash, cavitation, resonance;
- air/wind: movement through space/media rather than generic swoosh;
- earth/stone: fracture, grind, mass, pressure;
- lightning: electrical snap/crack/charge and distance-appropriate report;
- frost/ice: crystallisation, brittle fracture, cold stress where applicable.

Magical energy may stylise these behaviours but should not erase them.

---

# 39. Nature Magic Audio

Nature magic should derive from living/ecological processes:

- growth tension;
- roots/fibre;
- leaves;
- spores/pollen;
- moisture;
- animal/ecosystem resonance where canon supports it.

Avoid generic “green sparkle chime” language.

---

# 40. Arcane Magic Audio

Arcane presentation may favour:

- controlled tonal structures;
- patterned pulses;
- geometric rhythm;
- harmonically organised energy;
- clean but not necessarily digital synthetic character.

Arcane is not universally purple and is not automatically electronic sci-fi.

---

# 41. Light Magic Audio

Light magic may emphasise:

- clarity;
- radiance;
- harmonic openness;
- focused excitation;
- clean transient release.

It is not automatically holy, angelic or choir-based.

---

# 42. Shadow Magic Audio

Shadow magic may emphasise:

- absorption;
- muffling;
- spectral subtraction;
- displaced ambience;
- low-detail negative space;
- moving occlusion-like behaviour.

It should not collapse into generic horror whispers.

---

# 43. Blood Magic Audio

Blood magic should remain restrained and body-linked:

- pulse;
- flow;
- pressure;
- wet biological resonance where appropriate;
- heartbeat-like rhythm only when context supports it.

Do not use gore sounds as decorative shorthand.

---

# 44. Time Magic Audio

Time magic may communicate temporal manipulation through:

- repeated/reversed fragments;
- phase displacement;
- deceleration/acceleration character;
- discontinuity;
- rhythmic offset;
- selectively altered environmental tails.

It should remain readable and avoid nausea-inducing or permanently disorienting processing.

---

# 45. Space Magic Audio

Space magic may use:

- spatial displacement;
- impossible source motion;
- doppler-like redirection where appropriate;
- sudden near/far contrast;
- focused pressure/void transitions;
- split or relocated reflections.

Spatial processing must not mislead the player about critical positional danger unless gameplay owns that deception.

---

# 46. Rune Magic Audio

Rune magic should sound bound to inscription/substrate and sequence.

Useful grammar:

- contact/etch activation;
- ordered node/line progression;
- resonance through the host material;
- completion lock;
- rejection/failure;
- sustained bound-state tone where appropriate.

Rune audio should make structure and sequence legible rather than becoming generic magical sparkle.

---

# 47. Alchemy Audio

Alchemy should retain process/material identity:

- pours;
- bubbles;
- reactions;
- pressure;
- grinding;
- vessel resonance;
- phase change;
- controlled magical reaction where canon supports it.

The audio must not imply a successful recipe before the authoritative transaction commits.

---

# 48. Enchanting Audio

Enchanting may emphasise:

- transfer;
- resonance between object and energy source;
- layer/inscription settling;
- harmonic locking;
- persistent object-state reveal.

It should preserve the sound identity of the enchanted object underneath the magical layer.

---

# 49. Summoning Audio

Summoning should communicate:

- boundary formation;
- call/connection;
- arrival/displacement;
- materialisation or gateway behaviour defined by canon;
- release/dismissal.

The summoned entity's own sonic identity should remain separate from the summoning process.

---

# 50. Ritual Audio

Rituals may be longer structured sonic sequences with:

- stages;
- participant contributions;
- environmental response;
- repeated motifs;
- escalating/de-escalating energy;
- success/failure/interrupt resolution.

Ritual audio must follow authoritative ritual state and cannot determine completion.

---

# 51. Mana Sonic Identity

Mana is a resource/energy substrate, not a fixed purple hum.

Mana audio should communicate context:

- raw crystal resonance;
- stored charge;
- flow;
- transfer;
- instability;
- depletion;
- environmental concentration;
- use through a particular magical system.

Its core family should be recognisable while allowing strong material, school and realm modulation.

---

# 52. Wards

Ward audio should generally be restrained in stable operation.

Possible cues:

- activation;
- successful coverage establishment;
- boundary interaction;
- strain;
- breach;
- recharge;
- collapse;
- restoration.

A permanent loud drone around every ward is prohibited unless a specific artifact or hazard justifies it.

---

# 53. Portals and Realm Gates

Portal audio should communicate:

- dormant frame;
- awakening;
- stabilisation;
- stable connection;
- traversal threshold;
- instability;
- collapse;
- destination/realm influence where appropriate.

Portal identity should not default to one universal swirling synth loop.

A portal may use subtle spatial discontinuity to imply connection beyond local geometry while preserving accessibility and positional clarity.

---

# 54. Corruption, Cleansing and Restoration

Corruption audio must remain distinct from:

- Shadow magic;
- infernal ambience;
- nightmare/dream phenomena;
- poison;
- ordinary decay.

It may alter:

- local ambience;
- material responses;
- creature layers;
- environmental tonal/noise structure;
- machine/magic-state sounds.

Cleansing/restoration should resolve or transform those layers rather than always playing a triumphant chime.

---

# 55. Environmental Ambience Architecture

Environment ambience should be layered from:

1. **world/realm bed**;
2. **biome/ecology bed**;
3. **weather layer**;
4. **time/season layer**;
5. **water/geology/local feature layer**;
6. **creature/insect/bird intermittent events**;
7. **settlement/civilisation layer**;
8. **special magical/historical overlay**;
9. **temporary event/state overlay**.

No single layer should carry the entire identity.

---

# 56. Acoustic Ecology

Ambient fauna should sound like populations occupying space, not a random playlist of animal clips.

Rules:

- calls should respect habitat/time/weather where upstream ecology provides it;
- density should vary;
- individual events should have plausible spatial sources;
- repeated signature calls require cooldown/variation;
- danger-sensitive wildlife ambience may reduce where gameplay/environment state supports it;
- absent ecology can be meaningful.

---

# 57. Wind and Weather Audio

Weather sound should derive from interactions:

- wind through vegetation;
- wind around structures;
- rain on soil/wood/stone/roof/water;
- snow and sleet where audible;
- storm gusts;
- thunder distance;
- hail contact;
- enclosed/interior filtering.

Avoid one universal rain loop regardless of shelter, roof or surface.

---

# 58. Thunder and Lightning

Lightning presentation should support:

- near electrical crack;
- distance-dependent thunder delay if gameplay/world simulation supports it;
- scale and terrain/acoustic context;
- reduced-startle/reduced-dynamic options where required.

Thunder must not mask mandatory combat or warning cues.

---

# 59. Fire, Smoke and Heat Audio

Fire sound varies by:

- fuel;
- scale;
- airflow;
- enclosure;
- moisture;
- intensity;
- collapse/structural involvement.

Small flames should remain small.

Smoke itself may not always require a separate sound; audible cues derive from combustion, airflow, pressure and material response.

---

# 60. Water Audio

Water should communicate:

- stillness;
- flow;
- current where simulated;
- depth;
- shoreline;
- waterfall/drop;
- rain impact;
- object/actor entry;
- wake/splash;
- enclosed cave water;
- realm-specific alterations.

Water audio should spatially anchor to actual water features rather than follow the camera as a generic loop.

---

# 61. Underwater Audio

Underwater presentation may include:

- filtering of above-water sources;
- body movement;
- bubbles;
- pressure/low-frequency environment where appropriate;
- nearby creature/object activity;
- vessel hull or machinery transmission.

It must preserve important danger/navigation cues through alternate treatment rather than simply muffling everything into uselessness.

---

# 62. Maritime and Vessel Sonic Direction

Vessels should sound like structures under load.

Relevant layers include:

- hull water interaction;
- timber/metal structural creak;
- rigging tension;
- rope movement;
- sail cloth;
- mast motion;
- deck footsteps;
- steering gear;
- propulsion source;
- cargo movement;
- weather exposure;
- damage/flooding where authoritative state supports it;
- dock/mooring contacts.

Set 26 remains authoritative for vessel simulation; ART-07 expresses that state.

---

# 63. Settlement Sonic Architecture

Settlement sound should reveal actual civilisation activity.

Possible layers:

- footsteps and conversations as controlled beds/events;
- workstations;
- smithing;
- carpentry;
- livestock;
- carts/logistics;
- markets;
- doors/gates;
- bells;
- water systems;
- mills;
- guards/training;
- magical infrastructure;
- civic/sacred spaces where canon permits.

A settlement should not sound “busy” when authoritative population/activity is low.

---

# 64. Camp → Magical Metropolis Sonic Progression

Settlement scale should evolve through **density, diversity, range and coordination**, not simply louder ambience.

### Camp
- sparse human presence;
- campfire;
- cloth/rope/tent movement;
- simple tools;
- nearby natural environment dominates.

### Hamlet
- regular work rhythms;
- livestock/agriculture;
- small construction/storage activity;
- natural environment still prominent.

### Village
- more overlapping trades;
- routes/doors/carts;
- modest defensive/civic signals.

### Town
- distinct work districts;
- markets/logistics;
- denser mechanical/service activity;
- broader crowd beds.

### City
- layered district identities;
- sustained logistics;
- multiple craft/industrial zones;
- civic infrastructure;
- natural ambience more locally mediated.

### Capital
- governance/civic ceremony where canon supports it;
- major infrastructure;
- greater spatial scale and landmark cues.

### Magical Metropolis
- magic integrated into infrastructure and daily life;
- layered mana/rune/ward/transport sounds governed by restraint and aggregation;
- ordinary material/civilisation audio remains present beneath magical systems.

---

# 65. Workplaces and Districts

Districts should have readable acoustic identities:

- smithing/industry;
- market/trade;
- docks;
- agriculture;
- residential;
- magical/research;
- military;
- civic/religious where canon permits.

Identity must emerge from actual activities and infrastructure, not generic themed ambience pasted onto empty space.

---

# 66. Realm Sonic Identity — General Rule

Each current realm receives a recognisable sonic signature using multiple channels:

- acoustic space;
- ambience density;
- environmental motion;
- material resonance;
- characteristic silence;
- wildlife/being ecology;
- magical phenomena;
- weather;
- cultural/civilisation sound where present;
- music palette.

No realm is defined by a single filter, drone, instrument or pitch band.

---

# 67. Overworld Sonic Identity

The Overworld is the broadest and most materially grounded sonic baseline.

Core traits:

- strong natural ecology;
- familiar wind/water/weather/material behaviours;
- broad biome diversity;
- civilisation sound from humble camp to magical metropolis;
- magic as an integrated but not omnipresent layer;
- ordinary quiet spaces;
- readable contrast between settlement, wilderness, coast, underground and ancient/magical sites.

The Overworld establishes the reference against which stranger realms feel strange.

---

# 68. Verdant Covenant Sonic Identity

The Verdant Covenant should emphasise:

- dense living ecology;
- layered plant motion;
- moisture and biological activity;
- seasonal change;
- symbiotic/biotic magical phenomena;
- growth/blight/cleansing transformations;
- alive but not continuously noisy soundscapes.

Avoid turning it into a permanent fairy-chime forest.

---

# 69. Ancestral Veil Sonic Identity

The Ancestral Veil should use:

- controlled negative space;
- processional rhythm where canon supports it;
- distant/uncertain spatial sources;
- memory/ancestral resonance;
- grave-sea and necropolis-specific environmental sound;
- restrained spirit presence.

Avoid universal whisper tracks or constant horror stingers.

---

# 70. Somnolent Expanse Sonic Identity

The Somnolent Expanse may use:

- softened causality;
- dreamlike continuity/discontinuity;
- altered tails/resonances;
- lucid vs nightmare contrast;
- memory-thread/reverie material motifs where appropriate;
- silence and impossible spatial relationships.

Dream logic must remain authored and recognisable, not random audio corruption.

---

# 71. Ascendant Reach Sonic Identity

The Ascendant Reach should emphasise:

- altitude;
- open air;
- wind and turbulence;
- exposed structures;
- distant scale;
- lightning/storm energy;
- aerial movement;
- high-aether/sacred-law phenomena where authoritative.

Avoid drowning everything in continuous wind roar.

---

# 72. Impossible Deep Sonic Identity

The Impossible Deep should communicate:

- pressure;
- enclosure;
- depth;
- geological mass;
- fluid/geothermal systems;
- strange deep ecology;
- long-distance cavern resonance where appropriate;
- selective low-frequency scale.

Do not make it a constant sub-bass drone that masks play.

---

# 73. Ashen Lower Realms Sonic Identity

The Ashen Lower Realms should emphasise:

- heat;
- ash;
- furnace/industrial character;
- strata-specific environmental variation;
- infernal civilisation/labour where canon supports it;
- contracts/ritual systems where sonically appropriate;
- lava/slag/cooling/metal/stone behaviours.

Avoid generic “hell choir + fire loop” treatment.

---

# 74. Culture and Sonic Variation

Culture may influence:

- instrument families;
- work rhythms;
- civic signals;
- construction acoustics through architecture/materials;
- ceremony;
- market/craft sound;
- musical motifs;
- bell/drum/horn or equivalent communication systems where canon supports them.

Culture must not be inferred from ancestry alone.

Codex may not invent culturally loaded instruments, chants, accents or ceremonial practices merely to make a culture sound “exotic.”

---

# 75. Music Identity Statement

Leyforge music should support the feeling of:

- surviving;
- discovering;
- building;
- belonging;
- travelling;
- uncovering ancient systems;
- shaping civilisation;
- encountering magic;
- facing danger;
- entering places that exceed ordinary reality.

The score should not behave like a constant movie soundtrack.

Long stretches may contain only environmental sound.

---

# 76. Music Tonal and Textural Philosophy

The global score should favour a hybrid palette that can bridge:

- acoustic/tactile instruments;
- folk/early-instrument colours where appropriate;
- percussion tied to material/world identity;
- restrained orchestral breadth for major scale;
- vocal textures only when contextually justified;
- processed/synthetic layers for magic, realms and ancient systems;
- silence and environmental integration.

No single real-world historical culture is the universal musical template for Leyforge.

---

# 77. Leitmotif and Motif Architecture

Motifs may belong to:

- the player journey;
- civilisation/progress;
- major realms;
- major factions/cultures where canon supports it;
- major recurring threats;
- ancient systems;
- significant narrative authorities;
- major locations.

Motifs should be transformable across context rather than replaying identical melodies at every appearance.

---

# 78. Exploration Music

Exploration score should generally be:

- intermittent;
- spacious;
- biome/realm-sensitive;
- capable of ending cleanly into ambience;
- non-exhausting during long sessions;
- resistant to short-loop repetition.

Travel itself does not require continuous music.

---

# 79. Settlement Music

Settlement music should reflect:

- scale;
- safety;
- prosperity/strain;
- culture where authorised;
- time/day conditions;
- special events;
- player relationship where gameplay/narrative supports it.

Camp and metropolis should not share one theme with more instruments simply layered on top. Growth may transform motifs, orchestration, rhythm and harmonic confidence while preserving continuity.

---

# 80. Construction and Civilisation Music

Leyforge is partly about building civilisation; music should acknowledge major constructive milestones.

Use music for:

- first settlement breakthroughs;
- major project completion;
- district/city transformations;
- restored landmarks;
- meaningful technological/magical capability shifts.

Do not sting every routine crafting transaction.

---

# 81. Combat Music

Combat music should scale with:

- threat level;
- number/importance of enemies;
- player danger;
- encounter type;
- boss/raid state;
- realm/culture context where applicable.

Transitions should avoid obvious restarting every time an enemy enters/leaves detection.

Music must not mask attack telegraphs or critical positional audio.

---

# 82. Raid and Siege Music

Raids/sieges may use layered progression:

- warning/anticipation;
- approach;
- active assault;
- crisis/escalation;
- resolution;
- aftermath.

The music should react to authoritative event phases rather than estimate battle progress independently.

---

# 83. Boss Music

Boss music may carry stronger identity and structure but must remain gameplay-compatible.

It should support:

- phase transitions;
- danger escalation;
- vulnerability/recovery windows where gameplay already exposes them;
- arena identity;
- character/creature/realm motifs;
- aftermath/resolution.

Boss score does not replace combat telegraphs.

---

# 84. Realm Music

Each current realm may use a distinct music palette, but the score must remain recognisably part of Leyforge.

Realm music should derive from:

- realm ontology;
- environment;
- civilisation/culture where present;
- magic;
- emotional/experiential role;
- recurring global Leyforge motifs transformed through realm-specific instrumentation and harmony.

Avoid one gimmick instrument per realm.

---

# 85. Adaptive Music State Model

Music adaptation may read authoritative presentation-facing states such as:

- exploration intensity;
- biome/realm/location;
- safe settlement vs wilderness;
- threat/combat phase;
- raid phase;
- major discovery;
- major project/event state;
- time/weather when musically useful.

Adaptive layers may change:

- instrumentation;
- density;
- rhythm;
- harmony;
- motif variation;
- texture;
- mix.

Music may not create or predict gameplay state.

---

# 86. Music Transition Rules

Preferred transitions include:

- musically sensible phrase boundaries where latency permits;
- short crossfades;
- stem/layer addition/removal;
- cadence resolution;
- environmental handoff;
- stingers reserved for genuinely meaningful events.

Avoid hard cutting between unrelated tracks whenever possible.

Emergency gameplay-critical situations may override musical elegance.

---

# 87. Repetition Control

Leyforge is designed for long sessions. Audio fatigue must be actively managed.

For one-shots:

- use variation pools;
- vary micro-properties narrowly;
- avoid exact rapid repeats;
- aggregate dense event streams.

For loops:

- use long or internally varying beds where possible;
- support intermittent layers;
- avoid obvious loop points;
- expose state variants;
- fade in/out cleanly.

For music:

- avoid short continuously cycling tracks;
- allow silence;
- use multiple cues/variants where appropriate;
- use adaptive re-orchestration rather than constant restarting.

---

# 88. Deterministic vs Non-Deterministic Variation

Cosmetic audio variation may be locally random where replay exactness is not required.

However:

- networked/replay-relevant timing must follow engineering/gameplay authority;
- critical cue existence/timing cannot randomly disappear;
- state transitions must remain deterministic in semantic meaning;
- audio randomness must not alter gameplay outcomes;
- authored procedural systems should permit reproducible test modes.

---

# 89. Spatial Audio Direction

World-space sound should use meaningful spatial origins.

Preferred source locations:

- actual impact point;
- speaker/creature body;
- machine mechanism or semantic socket;
- chimney/output/gearbox where relevant;
- water feature;
- portal surface/frame;
- environmental region/volume;
- vessel component;
- world landmark.

Do not attach localised sounds to the camera merely for convenience.

---

# 90. Distance Presentation

Distance should change sound through more than volume alone where practical.

Possible treatments:

- high-frequency loss;
- transient softening;
- reverb/space shift;
- event aggregation;
- reduced detail layers;
- distant-tail emphasis;
- occlusion/environment effects.

A distant forge should sound like a distant working area, not a tiny full-detail forge loop played quietly.

---

# 91. Occlusion and Interior/Exterior Treatment

Walls, caves, doors, terrain and large structures should influence perceived sound when supported by the runtime.

Art direction favours:

- intelligible occlusion;
- room/interior character;
- door/opening transitions;
- cave resonance;
- shelter from rain/wind;
- underwater boundary treatment.

Occlusion must not erase critical warnings without an alternate readable cue.

---

# 92. Acoustic Zones and Reverb

Reverb/space treatment should describe actual place scale and material character rather than being applied as generic “cave,” “room” and “hall” presets with no tuning.

Useful factors:

- enclosure size;
- openness;
- dominant materials;
- clutter/damping;
- water;
- realm/magical anomaly where justified.

Effects should remain restrained enough to preserve speech and critical cue intelligibility.

---

# 93. Audio Categories and Player Control

At minimum, production planning should preserve independently controllable families for:

- master;
- music;
- dialogue/voice where applicable;
- world/ambience;
- weather/environment;
- creatures/characters;
- combat;
- machinery/automation;
- magic;
- UI/notifications.

Engineering may consolidate or subdivide these categories, but the user must retain meaningful control over common fatigue/accessibility sources such as music, machinery, magic and ambience.

---

# 94. Accessibility and Hearing Equivalents

Critical audio-only information requires an equivalent through one or more of:

- world-space visual cue;
- UI cue;
- caption/subtitle;
- directional indicator;
- controller haptic cue if supported.

Examples include:

- incoming danger;
- raid alarms;
- machine fault warnings;
- portal instability;
- critical creature alerts;
- important off-screen events.

Accessibility equivalents must preserve meaning, not merely say “[sound]”.

---

# 95. Sound Captions

Where captions are used for meaningful non-dialogue sound, they should favour concise semantic descriptions such as:

- `[Goblin horn — north]`
- `[Ward destabilising]`
- `[Heavy footsteps approaching]`
- `[Machine output blocked]`
- `[Thunder in the distance]`

Exact direction/distance display is subject to gameplay/UI authority and should not reveal information the player could not legitimately perceive.

---

# 96. Reduced Startle and Sensitive Audio

Settings should allow mitigation of unnecessarily startling presentation where feasible without removing critical meaning.

Potential controls include:

- reduced sudden-volume spikes;
- dynamic-range compression/night mode;
- reduced harsh high-frequency warning profiles;
- reduced creature scream intensity;
- separate music/ambience/machinery controls.

Do not use painful or excessively loud sounds as a gameplay mechanic.

---

# 97. UI Sonic Language

ART-07 owns sonic character; ART-08 owns visual UI presentation.

UI sound should be:

- brief;
- tactile;
- distinct by semantic family;
- low-fatigue;
- consistent across menus;
- capable of being reduced/muted;
- not overly magical unless the interface context is magical.

Core families may include:

- focus/navigation;
- confirm;
- back/cancel;
- error/blocked;
- notification;
- quest/objective update;
- inventory/crafting action;
- map/cartography action;
- skill/magic assignment;
- world/save lifecycle feedback.

---

# 98. Notification Restraint

Not every system event deserves a sound.

Repeated low-value notifications should:

- aggregate;
- use cooldowns;
- reduce priority;
- remain optional where appropriate.

The game should not constantly chirp at the player for routine simulation updates.

---

# 99. Haptic Coordination

Where controller haptics are used, audio may expose semantic timing markers for coordination, but:

- haptics remain a separate presentation channel;
- audio does not determine gameplay timing;
- accessibility settings may independently reduce/disable haptics;
- haptic/audio combinations should avoid excessive sensory stacking.

---

# 100. Animation and Audio Synchronisation

Use stable animation/event markers for events such as:

- foot contact;
- tool impact;
- weapon release/contact;
- crusher strike;
- piston hit;
- latch/door closure;
- creature footfall;
- wingbeat where appropriate;
- spell release;
- construction contact.

Presentation markers may synchronise sound but may not create gameplay transactions.

---

# 101. Audio Sockets

Use semantic sound sockets/anchors when source position matters.

Examples inherited from Forge architecture may include roles such as:

- machine body;
- gearbox;
- output;
- chimney;
- warning;
- mana core;
- hand/tool contact;
- mouth/head;
- foot contacts;
- portal centre/frame;
- vessel hull/rigging/engine/propulsion components.

Socket names must remain semantic and stable across model/LOD revisions.

---

# 102. One-Shot, Loop and State-Driven Audio

Use:

- **one-shots** for discrete events;
- **loops** for genuinely continuous processes;
- **intermittent layers** for non-continuous ambience;
- **state-driven layers** for persistent conditions;
- **sequences** for structured multi-phase events;
- **music systems** for adaptive score.

Do not use loops to approximate frequent discrete events when aggregation is more truthful, or one-shots every frame to fake a loop.

---

# 103. Loop Start/Stop Behaviour

Loops should:

- start from authoritative state;
- fade or transition cleanly where appropriate;
- reconstruct correctly after streaming/reload;
- stop when the source state stops;
- avoid phase chaos in large repeated systems;
- support aggregation/virtualisation;
- expose damaged/faulted/intensity variants where needed.

---

# 104. Voice Priority and Audio LOD

General priority order:

1. mandatory danger/response cues;
2. player action/contact;
3. nearby combat/actors;
4. relevant machine/world fault;
5. important interaction;
6. nearby environmental identity;
7. settlement/workplace detail;
8. music;
9. decorative ambience.

Far/low-priority systems should:

- aggregate;
- virtualise;
- use simpler beds;
- reduce high-frequency event count;
- omit inaudible detail.

---

# 105. Large Factory and City Audio Scaling

A large production area must not instantiate full-fidelity audio for every component.

Use:

- machine-group aggregation;
- near/important full-detail voices;
- mid-distance family beds;
- far industrial district beds;
- fault/event priority overrides;
- state-aware density;
- spectral space management.

The player should still be able to approach one machine and hear its individual state.

---

# 106. Realm/Weather/Settlement Layer Competition

When multiple large ambience systems overlap, priority should follow context rather than additive loudness.

Example:

A storm in a magical metropolis may contain:

- realm atmosphere;
- city bed;
- rain/wind;
- machinery;
- magical infrastructure;
- crowd;
- music;
- combat/warning cues.

The mix must dynamically preserve the most informative layers rather than simply summing them all.

---

# 107. Audio Memory and Streaming Direction

Art production should favour reusable families and streaming-friendly assets.

Guidelines:

- avoid unique long samples for every trivial variant;
- reuse material and mechanism families;
- separate core layer from optional sweeteners;
- allow low-memory variants where needed;
- music and long ambience should support streaming;
- short critical cues should be readily available;
- distant/LOD forms may use consolidated beds.

Engineering owns exact formats and budgets.

---

# 108. Procedural Audio Boundaries

Procedural or parameterised audio is encouraged where it improves variation and state truth, including:

- machine speed/load;
- wind intensity;
- water flow;
- fire intensity;
- mana flow;
- continuous vehicle/vessel mechanisms;
- layered ambience density.

Procedural systems must remain bounded, testable and art-directable.

Codex may not invent procedural physical behaviour that contradicts simulation.

---

# 109. External Recording and Library Use

Third-party recordings, sample libraries or generated source material may be used only when licensing/provenance and project policy permit.

All imported material should be transformed into a Leyforge-owned production asset with:

- source/provenance record;
- permitted-use evidence;
- editing notes;
- family/category mapping;
- integration metadata;
- validation evidence.

ART-07 does not relax ENG-GOV/third-party rules.

---

# 110. Generative Audio / AI-Assisted Production Boundaries

Codex or approved generative tools may assist with:

- sound-design exploration;
- layer generation;
- variation creation;
- procedural parameter design;
- temporary mockups;
- metadata and categorisation;
- mix/test automation;
- music ideation where project policy permits.

They may not:

- fabricate rights/provenance;
- imitate a living artist/performer as a production requirement without authorised policy;
- invent cultural canon;
- silently replace locked sonic identities;
- bypass human/owner certification for golden references;
- create gameplay semantics from sound alone.

---

# 111. Audio Naming and Asset Identity

Audio source assets should use stable production-facing names that communicate:

- domain;
- family;
- event/state;
- variant;
- intensity/context if relevant.

Example conceptual structure:

`AUD_<DOMAIN>_<FAMILY>_<EVENT>_<VARIANT>`

Exact naming syntax is subordinate to future FORGE-ENG/runtime naming authority if stricter rules exist.

---

# 112. Audio Metadata

A production audio record should be able to carry or reference:

- stable asset ID;
- category/bus;
- source family;
- material/body tags;
- event/state binding;
- socket/anchor role;
- loop/one-shot/intermittent type;
- variation pool;
- attenuation/spatial profile;
- priority;
- LOD/virtualisation profile;
- caption/accessibility text where relevant;
- realm/culture/biome applicability;
- source/provenance;
- licence/rights record;
- authoring notes;
- runtime/bake reference;
- validation status.

---

# 113. Music Metadata

Music cues/stems should record:

- cue ID;
- theme/motif family;
- realm/location applicability;
- event/state applicability;
- intensity tier;
- tempo/meter where relevant;
- key/harmonic relationship where useful for transitions;
- stem layout;
- intro/outro/loop/transition points;
- transition compatibility;
- dynamic-range profile;
- ownership/provenance;
- runtime/bake references.

---

# 114. Codex Audio Production Sequence

For a standard sound request, Codex should:

1. resolve the canonical source/object/entity/event;
2. identify owning gameplay/system authority;
3. determine event/state truth;
4. resolve material/body/mechanism family;
5. resolve environment/realm/culture context;
6. determine whether sound is critical, important, contextual or decorative;
7. identify semantic socket/anchor if spatial;
8. choose one-shot/loop/intermittent/state/sequence form;
9. resolve expected scale, mass and intensity;
10. select or create the correct reusable sonic family;
11. construct core dry/readable layers first;
12. add environment/magic/cultural processing only where authorised;
13. build a controlled variation pool;
14. define attenuation/spatial behaviour;
15. define mix category and priority;
16. define LOD/aggregation/virtualisation behaviour;
17. provide accessibility/caption equivalent where critical;
18. bind to approved event/state markers;
19. validate against animation/VFX timing where relevant;
20. test in actual gameplay context rather than solo playback;
21. test repeated-use fatigue;
22. test busy-scene masking;
23. test low-end/voice-limited profile;
24. record provenance/source metadata;
25. bake/export/register through the authorised Forge path;
26. generate production/validation report;
27. escalate unresolved canon, rights or gameplay conflicts rather than inventing.

---

# 115. Codex Music Production Sequence

For a music request, Codex should:

1. resolve the narrative/world/system context;
2. identify whether the cue is actually required;
3. resolve global Leyforge music identity;
4. resolve realm/culture/location/event motifs already authorised;
5. identify emotional/function role without inventing narrative canon;
6. choose instrumentation/textural palette;
7. define motif/harmonic/rhythmic relationship to existing score;
8. define adaptive states/stems if required;
9. define transition rules;
10. preserve space for gameplay-critical sound;
11. create long-session repetition strategy;
12. test loop/transition behaviour;
13. test under ambience/combat/dialogue conditions;
14. create compressed/night accessibility mix compatibility;
15. record provenance/rights;
16. export/register through authorised production tooling;
17. submit for ART-10 golden/reference review where applicable.

---

# 116. STOP AND ESCALATE Conditions

Codex must stop and escalate when:

- the canonical source/event/state is unclear;
- a sound implies gameplay behaviour not defined upstream;
- a creature's anatomy/behaviour does not support the proposed sound;
- cultural sonic direction would require inventing cultural canon;
- dialogue/voice content is being inferred rather than provided;
- a magic-school/source relationship is contradictory;
- a portal/ward/machine state is unclear;
- third-party/generative asset rights are uncertain;
- a critical audio cue lacks an accessible equivalent;
- busy-scene testing shows critical masking that cannot be solved within ART rules;
- a requested style explicitly contradicts locked Leyforge sonic identity;
- a music request needs narrative meaning not yet authorised;
- implementation limits require removing a critical cue rather than simplifying it.

Escalation is preferable to silent invention.

---

# 117. Golden Sonic Reference Programme

ART-10 should eventually certify a representative suite including at least:

1. oak material family — contact, chop, break, construction;
2. stone material family — footstep, mine, fracture, placement;
3. iron/copper comparison — tools, impacts, machine parts;
4. glass/mana-crystal comparison;
5. player locomotion across five surfaces;
6. mining/tool family comparison;
7. melee combat material/armour comparison;
8. furnace full state cycle;
9. mechanical machine full state cycle;
10. high-throughput logistics aggregation stress scene;
11. mana conduit/battery/rune-engine family;
12. Rune activation/rejection sequence;
13. ward stable/strain/breach sequence;
14. stable/unstable portal family;
15. creature-scale comparison — small, humanoid, large, colossal;
16. predator threat-state sequence;
17. settlement progression Camp → Magical Metropolis;
18. Overworld forest/day/night/weather scene;
19. ocean/coast/vessel scene;
20. all-seven-realm sonic comparison;
21. 13-school magic comparison matrix;
22. corruption vs Shadow vs nightmare vs infernal comparison;
23. raid warning → assault → aftermath sequence;
24. boss combat mix-stress scene;
25. low-end voice-limited factory/city scene;
26. accessibility captions/reduced-dynamic-range scene;
27. exploration music + ambience handoff;
28. settlement-growth motif transformation;
29. realm-music identity comparison;
30. combat/boss adaptive music transition suite.

Golden references must be judged in context, not only as isolated files.

---

# 118. Audio QA Matrix

Production QA should check:

| Area | Required question |
|---|---|
| Material truth | Does the sound still identify the material/action? |
| Scale | Does mass/size read correctly? |
| Event truth | Does the sound fire only from correct authoritative state/event? |
| Spatial source | Does it originate from a meaningful place? |
| Repetition | Does repeated use avoid obvious fatigue? |
| Mix | Can critical cues be heard in busy scenes? |
| LOD | Does distant/aggregated audio preserve useful identity? |
| Accessibility | Is critical meaning available without hearing? |
| Realm/culture | Is contextual identity present without stereotype or gimmick? |
| Magic | Does behaviour/medium matter more than a generic school preset? |
| Machine | Can state/function be inferred without false gameplay claims? |
| Creature | Does anatomy/behaviour support the sound? |
| Music | Does score support rather than smother play? |
| Rights | Is source/provenance/licensing documented? |
| Performance | Does the scene remain within engineering voice/memory limits? |

---

# 119. Anti-Patterns

Reject these by default:

- one universal footstep per terrain colour;
- one clang for all metals;
- constant whooshes on every melee swing;
- every spell covered in the same synth shimmer;
- every realm represented by one reverb/filter;
- permanent magical humming in every magical settlement;
- constant creature vocalisations;
- looping forest birds every few seconds regardless of ecology;
- generic “busy market” sample under every settlement;
- music playing continuously because silence feels unfinished;
- combat music restarting on every aggro toggle;
- boss music so loud telegraphs disappear;
- 100 conveyors each playing a full clank;
- every UI action making a bright chime;
- huge sub-bass on small impacts to make them “epic”;
- horror whispers as shorthand for spirits/shadow/corruption;
- choir as shorthand for Light/divinity;
- pitch-shifting one animal call to create every creature size;
- portal = swirling synth drone;
- rain = one camera-following loop;
- audio cues that leak hidden gameplay information;
- inaccessible critical off-screen sounds with no equivalent;
- untracked third-party samples;
- generative audio used without provenance or certification.

---

# 120. ART-07 Decision Register

| ID | Decision |
|---|---|
| ART07-D001 | Leyforge sound prioritises truth about material, source, distance, motion, danger and world state before spectacle. |
| ART07-D002 | Gameplay-critical cues outrank music, ambience and decorative presentation in the mix hierarchy. |
| ART07-D003 | Silence and low-density acoustic space are intentional production tools, not missing content. |
| ART07-D004 | Leyforge retains meaningful dynamic range; accessibility profiles may compress it without destroying hierarchy. |
| ART07-D005 | Material DNA maps to reusable sonic response families shared across blocks, items, structures and machines. |
| ART07-D006 | Stone, wood, metal, glass/crystal, soil/loose ground and organic/fibre families receive distinct physical sonic grammar. |
| ART07-D007 | Metals do not share one generic clang; construction, thickness, mass and metal family influence sound. |
| ART07-D008 | Footsteps compose body/footwear, locomotion, surface, condition, environment and equipment contribution. |
| ART07-D009 | Player movement may be slightly clearer than equivalent NPC movement for proprioceptive feedback. |
| ART07-D010 | Dense crowds aggregate movement audio rather than playing full-detail footsteps for every actor. |
| ART07-D011 | Tool interaction audio resolves tool family/tier, target material, intensity and completion state without implying gameplay success early. |
| ART07-D012 | Construction and workstation audio communicates actual process rather than generic hammer/crafting loops. |
| ART07-D013 | Weapon and combat audio derives from weapon, material, mass, target, force and result; universal oversized whooshes are rejected. |
| ART07-D014 | Non-dialogue humanoid vocalisation is restrained, varied and cannot invent personality/cultural/narrative facts. |
| ART07-D015 | Creature sonic identity derives from anatomy, scale, locomotion, ecology, behaviour state and supernatural ontology. |
| ART07-D016 | Large creatures gain mass through body/environment acoustics rather than simple downward pitch shifting. |
| ART07-D017 | Machine audio exposes authoritative function/state through startup, active mechanism, load, fault and shutdown families. |
| ART07-D018 | Logistics networks aggregate high-rate repeated transfers and prioritise blockages/faults over normal motion. |
| ART07-D019 | Magical infrastructure preserves mechanism identity and avoids permanent high-frequency hum fatigue. |
| ART07-D020 | Magic audio composes effect behaviour, medium, source, school/tradition, tags, context, interaction and phase/state. |
| ART07-D021 | The thirteen magic schools do not receive one fixed universal timbre/instrument/synth preset each. |
| ART07-D022 | Elemental magic preserves actual element behaviour beneath magical stylisation. |
| ART07-D023 | Nature magic derives from biological/ecological process rather than generic green-chime language. |
| ART07-D024 | Arcane may use controlled structured tonality but is neither universally electronic nor one fixed synth sound. |
| ART07-D025 | Light magic is not automatically holy/choir-based; Shadow is not generic horror whispering. |
| ART07-D026 | Blood, Time, Space, Rune, Alchemy, Enchanting, Summoning and Ritual each use behaviour-led sonic grammar. |
| ART07-D027 | Mana has a shared substrate identity but no universal purple-hum equivalent. |
| ART07-D028 | Stable wards are generally acoustically restrained; strain, breach and transition cues carry more emphasis. |
| ART07-D029 | Portals use state/source/realm-aware sonic grammar rather than a universal swirling synth loop. |
| ART07-D030 | Corruption remains sonically distinct from Shadow, nightmare, infernal and ordinary decay. |
| ART07-D031 | Environmental ambience is layered from realm, biome/ecology, weather, time/season, local feature, civilisation and state overlays. |
| ART07-D032 | Ambient fauna follows acoustic-ecology logic and controlled event density rather than random looping animal playlists. |
| ART07-D033 | Weather sound is generated through weather interaction with actual surfaces, structures and environment where practical. |
| ART07-D034 | Water sound spatially anchors to real water features and distinguishes still, flowing, falling, shoreline and underwater contexts. |
| ART07-D035 | Vessel audio treats vessels as structures under load and remains subordinate to Set 26 simulation truth. |
| ART07-D036 | Settlement sonic complexity grows through density/diversity/coordination, not volume inflation. |
| ART07-D037 | Culture may influence music, instruments, work/civic signals and ceremony only where canon authorises it; ancestry does not define culture. |
| ART07-D038 | Each of the seven current realms receives a multi-channel sonic identity rather than one filter, drone or gimmick instrument. |
| ART07-D039 | Leyforge music is intermittent and world-supportive rather than a constant cinematic soundtrack. |
| ART07-D040 | The score uses a hybrid tactile/acoustic/orchestral/processed palette without treating one real-world historical culture as the universal template. |
| ART07-D041 | Motifs may transform across realm, culture, threat and progression contexts rather than replay identically. |
| ART07-D042 | Combat/raid/boss music reads authoritative phase/intensity state and never replaces gameplay telegraphs. |
| ART07-D043 | Adaptive music may react to authoritative presentation-facing states but cannot create or predict gameplay state. |
| ART07-D044 | Long-session anti-repetition requires variation pools, intermittent layers, aggregation, long-form ambience and intentional silence. |
| ART07-D045 | World-space sound uses meaningful semantic origins/sockets and does not attach to the camera for convenience. |
| ART07-D046 | Distance/occlusion/space treatment may simplify sound while preserving critical meaning. |
| ART07-D047 | Meaningful user controls must exist for major fatigue/accessibility categories including music, machinery, magic and ambience. |
| ART07-D048 | Critical audio-only information requires visual/text/haptic equivalent; captions must describe semantic meaning where appropriate. |
| ART07-D049 | Large factories/cities use voice priority, aggregation and virtualisation while retaining full-detail nearby important sources. |
| ART07-D050 | Codex must resolve authority, event/state, source, material/body/mechanism, context, priority, spatial role and accessibility before final audio polish, escalating unresolved canon/rights conflicts. |

---

# 121. Downstream Handoff

## ART-08

Will own UI, icons, cartography and 2D visual presentation. ART-07 supplies sonic UI families, caption semantic requirements and notification-audio rules.

## ART-09

Will own the complete Codex/The Forge asset-production execution contract, including source acquisition, rights/provenance, authoring, validation, reports and batch production. ART-07 supplies the audio/music sub-process.

## ART-10

Will own golden-reference certification, visual/audio QA thresholds and final production acceptance evidence. ART-07 supplies sonic reference scenes, mix/accessibility tests and music certification targets.

---

# 122. Source Crosswalk

| ART-07 area | Primary upstream source |
|---|---|
| Audio cues, loops, sound sockets, state bindings and animation markers | Document 21C |
| Spatial/event/audio/VFX manifest, asset packages, accessibility and runtime envelope | Document 25K |
| Material response and state families | ART-02 + 25K Material DNA foundation |
| World/realm/biome/culture/settlement identity | ART-03 + current FCC canon |
| Model sockets, machines, structures, vessels | ART-04 |
| Body plans, locomotion, creature/character animation events | ART-05 |
| VFX timing, magic behaviour, weather/realm atmosphere and accessibility | ART-06 |
| Magic schools, mana, runes, rituals, wards, portals, corruption | Document 09 v1.0 + current FCC canon |
| Current POC audio/state evidence | POC Manual Testing Guide — prototype/migration evidence only |

---

# 123. Principal Source Basis

ART-07 was drafted from the current Leyforge authority state, especially:

- ART-00 through ART-06;
- Document 21C — Voxel Asset Forge — Animation, Effects and Runtime Visual States;
- Document 25K — Asset Budgets and Forge, Animation, Audio, VFX, Socket and Event Manifest Contract;
- Document 09 v1.0 — Magic, Mana, Spellcraft, Runes, Rituals and Civilisation Magic System;
- current FCC realm/environment/civilisation/creature canon;
- current settlement, automation, machine, combat, weather and maritime authority;
- current POC manual as implementation/migration evidence rather than final sonic authority.

Key inherited technical concepts preserved rather than redefined include:

- stable sound sockets;
- one-shot, loop and state-driven cues;
- animation marker/event synchronisation;
- presentation-only binding to gameplay truth;
- separate machinery/magic/ambient volume categories;
- fade/restart rules;
- warning priority;
- rapid-event cooldown/aggregation;
- near/mid/far audio LOD;
- voice reduction/virtualisation;
- socket/event manifests;
- reconnect/state reconstruction;
- accessibility equivalents;
- Forge source → baked runtime separation;
- event/context/anchor/audio/VFX presentation contracts;
- material-response footstep/impact families;
- core audio/VFX/ambience foundation package;
- environmental ambience packages;
- realm/portal/vessel presentation hooks.

---

# 124. ART-07 Acceptance Gate

ART-07 is ready for owner lock when the owner agrees with this statement:

> **Leyforge sound is materially grounded, spatially informative, dynamically restrained and built to tell the truth about sources, actions, danger, work, ecology and supernatural state before spectacle. Material DNA feeds reusable response families; tools, combat, creatures, machines and vessels derive sound from actual material/body/mechanism and scale; dense networks and cities aggregate rather than spam voices; ambience behaves as layered acoustic ecology; all seven current realms receive multi-channel sonic identities rather than one filter/drone; the thirteen magic schools use behaviour/medium/source-led audio rather than one preset timbre each; mana, wards, portals and corruption remain context-specific; silence is an authored resource; music is intermittent, adaptive and supportive of exploration/survival/civilisation/mystery rather than continuously cinematic; critical cues outrank score and ambience and always receive non-audio equivalents where required; spatial anchors, distance, occlusion, LOD, category controls and voice priority preserve clarity and performance; and Codex must resolve authoritative event/state, source, material/body/mechanism, context, priority, spatial role, rights and accessibility before production, escalating rather than inventing mechanics, culture, narrative or sonic canon.**

If accepted, ART07-D001 through ART07-D050 become the locked global audio/music/sonic-identity art baseline unless superseded through ART-00 governance.

---

# 125. Next Document

After ART-07 lock, continue to:

## ART-08 — UI, Icons, Cartography, Codex & 2D Presentation Standard

ART-08 should establish final production direction for:

- global UI visual language;
- HUD hierarchy and art treatment;
- inventory and crafting presentation;
- icons and item/block thumbnails;
- skills/spells/status-effect iconography;
- map/cartography visual language;
- the normal-to-advanced/magical map progression concept;
- 2D diagrams and information graphics;
- settlement, machine, magic, raid and realm interfaces;
- menus, world creation and settings presentation;
- Codex/encyclopaedia presentation;
- typography and text/icon balance;
- focus, controller and accessibility visual states;
- low-end/scalable UI presentation;
- Codex UI-art generation rules;
- golden 2D/UI reference and certification targets.

---

# 126. End Statement

ART-07 closes the major sonic gap between Leyforge's world/material/entity/effects presentation and the UI/execution/certification layers that follow.

The intended production result is:

> **Codex should be able to receive requests such as “author the complete oak contact/chop/build sonic family,” “create the Basic Mechanical Miner startup/active/blocked/fault/shutdown audio set,” “build a Camp-to-Magical-Metropolis settlement soundscape progression,” “produce a 13-school magic audio comparison that remains behaviour-led,” “create stable and unstable portal sonic profiles,” “author the full Overworld rain-on-material system,” “build an ocean storm and vessel-under-load sound scene,” “create an Impossible Deep pressure/geothermal ambience,” “produce a raid warning-to-aftermath adaptive music sequence,” or “build a large factory soundscape that survives a low-voice budget,” then resolve the correct canon, material/body/mechanism and state contracts, choose the authorised sonic grammar, bind to stable events/anchors, preserve realm/culture identity, provide variation/accessibility/LOD behaviour, validate repetition and masking in context, document provenance and bake reproducible runtime audio without inventing gameplay, narrative, culture, magic law or hidden information.**

---

**End of ART-07 v0.1**
