# Leyforge Art Production Corpus

## ART-01 — Master Leyforge Visual Language & Style Bible

**Document ID:** ART-01  
**Title:** Leyforge Master Visual Language & Style Bible  
**Version:** v0.1  
**Date:** 4 September 2026  
**Status:** **LOCKED GLOBAL VISUAL-LANGUAGE BASELINE — OWNER APPROVED**  
**Project:** Leyforge  
**Product context:** Ley Realms / The Forge  
**Corpus:** ART — Final Art Direction, Asset Production & Codex/Forge Handoff  
**Direct parent:** ART-00 — Art Production Constitution & Authority Map  
**Primary upstream authority:** Master Game Design Bible; locked/current FCC canon; especially FCC-12, FCC-13 and FCC-14A–D semantic art handoff  
**Major inherited production baselines:** Document Set 21 — Voxel Asset Forge; Document Set 22 — Forge Entity & Blueprint Expansion; current Presentation Forge / sensory-production work where applicable  
**Primary downstream consumers:** ART-02 through ART-10, Codex/coding agents, The Forge, FORGE-ENG, runtime implementation, asset QA, Project Brain  

---

# 00. Executive Visual Statement

Leyforge uses a **stylised high-fidelity voxel fantasy** art direction built around one central promise:

> **Everything should feel physically made, materially grounded, readable as voxel space and capable of becoming wondrous without losing the world beneath the wonder.**

The visual identity is not “Minecraft with more detail,” not smooth low-poly fantasy placed on voxel terrain, not photoreal materials painted over cubes, and not a noisy micro-voxel showcase where every surface competes for attention.

Leyforge should be recognisable through the combination of:

- a strong one-metre voxel world grid;
- 32×32 base surface language;
- richer voxel-authored forms for important objects and entities;
- readable, slightly exaggerated silhouettes;
- grounded material behaviour;
- visible construction and craftsmanship;
- controlled detail hierarchy;
- practical, legible magic that grows from the physical world instead of replacing it;
- settlement, machine and environmental art that visibly records use, age, repair and consequence;
- cosy inhabitable spaces contrasted against real darkness, danger, ruin and high-fantasy scale;
- civilisation growth that becomes visually richer through organisation and capability rather than merely becoming shinier.

The intended screenshot test is:

> **A viewer should be able to recognise Leyforge from shape, material treatment, world construction, atmosphere and system-state readability before seeing a logo or UI label.**

ART-01 defines the global visual grammar inherited by every later ART document. It does not choose every material palette, realm motif, creature form, icon set or spell effect. It defines the common rules those specialist decisions must obey.

---

# 01. Authority and Scope

## 01.1 What ART-01 owns

ART-01 owns project-wide decisions for:

- overall visual identity;
- stylisation level;
- relationship between voxel geometry and pixel surfaces;
- proportion philosophy;
- shape-language hierarchy;
- silhouette rules;
- detail-density hierarchy;
- composition and visual-rest principles;
- readability at gameplay distance;
- ordinary-versus-extraordinary presentation hierarchy;
- treatment of craftsmanship, wear, history and consequence;
- visual relationship between survival, civilisation, automation and magic;
- coherence between Overworld and other realms;
- scalability and accessibility-facing visual requirements;
- global visual acceptance tests.

## 01.2 What ART-01 deliberately does not own

The following are deferred to later ART documents or upstream canon:

- exact final RGB/hex palette values;
- exact per-material texture pixels;
- exact Material DNA records;
- exact shader parameters;
- exact biome and realm palettes;
- exact cultural motifs;
- exact architecture libraries;
- exact model dimensions where gameplay canon owns dimensions;
- individual species anatomy beyond global readability rules;
- exact animation timings;
- exact VFX designs;
- exact audio/music designs;
- exact UI skin and icon drawings;
- engine implementation details;
- bake formats and asset schemas.

## 01.3 Relationship to FCC semantic art handoff

FCC content canon decides **what must remain meaningfully distinct**. ART-01 decides the global presentation grammar used to express those distinctions.

A semantic difference may be expressed through:

- silhouette;
- proportion;
- material family;
- surface pattern;
- edge treatment;
- construction method;
- motion;
- lighting/emission;
- VFX;
- sound;
- iconography;
- state overlays;
- combinations of the above.

Colour alone is never assumed sufficient for critical distinction.

---

# 02. The Leyforge Visual DNA

Leyforge's visual identity is built from **eight global DNA traits**.

## 02.1 Voxel truth

The world must visibly remain a voxel world.

Terrain, construction, excavation, building, damage and repair should all read as manipulation of a coherent block-based physical space. Important assets may use finer voxel-authored geometry, but they must not visually sever themselves from that world.

Rules:

- the one-metre block grid remains visible in terrain and construction logic;
- detailed assets must still feel assembled from deliberate voxel forms;
- smoothness may be implied through stepped forms, shading, material response and animation, but must not erase voxel authorship;
- rounded forms are acceptable when expressed through voxel stepping or deliberately faceted geometry;
- terrain editing must never appear as an unrelated smooth heightfield layered beneath block gameplay;
- structures should visually explain how they meet the world grid.

## 02.2 Material truth

Objects should look like they are made from things.

Wood should retain wood logic. Iron should retain iron logic. Stone should feel cut, broken, stacked, carved or weathered according to use. Magical alteration may transform appearance, but should usually leave enough substrate evidence to understand what was altered.

Leyforge avoids arbitrary colour coding where material, construction and state can do the explanatory work.

## 02.3 Crafted truth

Civilisation should look **made**, not spawned as generic set dressing.

A tool, house, machine, road, ship, ward or city should expose some understandable relationship between:

- material;
- process;
- structure;
- function;
- maintenance;
- culture;
- age.

This does not require literal engineering realism. It requires visual causality.

## 02.4 Silhouette truth

Recognition begins with mass and outline before small detail.

At normal gameplay distance, the player should be able to distinguish major categories from shape:

- axe versus pickaxe;
- chest versus furnace;
- villager versus goblin versus large creature;
- warehouse versus shrine versus watchtower;
- chute versus pipe versus conduit;
- ordinary ruin versus active portal site.

Surface detail is subordinate to silhouette when the two conflict.

## 02.5 State truth

Important gameplay state should leave visible evidence where physically plausible.

Examples include:

- open/closed;
- powered/unpowered;
- damaged/repaired;
- wet/dry;
- frozen/thawed;
- hot/cold;
- corrupted/cleansed;
- active/inactive;
- blocked/flowing;
- occupied/abandoned;
- new/aged;
- warded/unwarded.

The visual system should reinforce system causality rather than merely decorate it.

## 02.6 Layered wonder

Magic escalates from the physical world.

Early ordinary life should not already glow like endgame fantasy. A wooden cottage, iron tool, wheat field or cart gains value because extraordinary magic, strange realms and civilisation-scale wonders contrast against a believable mundane baseline.

The world may become spectacular, but spectacle is **earned through hierarchy**.

## 02.7 Lived history

Leyforge is a persistent world. Art should support persistence.

Repeated use, conflict, weather, growth, rebuilding and cultural occupation should be able to leave visual traces. A repaired wall may not look identical to a never-damaged wall. An ancient road may remain readable beneath later modifications. A conquered structure may carry its original construction under a new faction overlay.

## 02.8 Readable richness

Leyforge should feel rich without becoming visually exhausting.

The goal is not maximum detail everywhere. The goal is **high information density where it matters and deliberate visual rest where it does not**.

---

# 03. Recognisable Leyforge — The Screenshot Test

A representative Leyforge screenshot should tend to contain several of the following signatures simultaneously:

1. **Block-readable terrain** with believable environmental variation rather than a flat repeating cube field.
2. **Voxel-authored props/entities** whose silhouettes are richer than plain cubes but still belong to the same world.
3. **Material continuity** across raw resource, processed material, derived block, tool, machine and architecture.
4. **Functional construction** — visible supports, joints, ports, channels, roofs, doors, platforms, roads or work surfaces.
5. **A lived settlement or world-state cue** — use, repair, storage, work, vegetation, damage, occupation, transport, weather or maintenance.
6. **Controlled fantasy contrast** — a magical effect, rune, creature, ancient site, realm influence or unusual atmospheric event that is visually distinct from the mundane base.
7. **Atmospheric depth** without sacrificing interaction readability.
8. **Clear primary silhouettes** even when viewed at reduced resolution.

A screenshot that could be mistaken for any generic voxel fantasy game is not yet a successful Leyforge screenshot.

---

# 04. Stylisation Versus Realism

## 04.1 Locked global direction

Leyforge is **stylised, materially grounded and physically suggestive**, not photorealistic.

Real-world observation is used to improve:

- material plausibility;
- proportions;
- construction logic;
- ecology;
- lighting behaviour;
- movement weight;
- sound causality;
- environmental storytelling.

Realism is rejected when it harms:

- voxel readability;
- gameplay clarity;
- production scalability;
- modding/Forge reproducibility;
- performance scalability;
- stylistic cohesion.

## 04.2 The realism ladder

Leyforge uses the following preference order:

1. **Readable physical idea**
2. **Material plausibility**
3. **Functional credibility**
4. **Stylised character**
5. **Selective fine detail**
6. **Never detail for detail's sake**

## 04.3 Exaggeration rule

Exaggeration is encouraged where it improves recognition or personality.

Appropriate exaggeration includes:

- thicker tool heads;
- stronger roof profiles;
- larger handles, hinges or ports;
- broader creature feet or claws;
- clearer shoulder/hand/weapon separation;
- more readable machine moving parts;
- slightly enlarged rune channels or magical focal elements;
- deeper silhouette cuts between body parts.

Exaggeration must not create false gameplay meaning.

---

# 05. Voxel and Pixel Relationship

## 05.1 World scale

The standard world block remains the **one-metre spatial reference**.

This is not merely a technical unit. It is part of Leyforge's visual grammar.

## 05.2 Base surface language

The established base material language is **32×32 pixels per standard block face**.

This should be treated as the primary authored surface density for ordinary block materials and the comparison baseline for related assets.

## 05.3 Standard authored voxel density

The Forge baseline of **32 authoring voxels per metre** remains the canonical standard modelling density for detailed voxel assets unless an approved profile requires another density.

This does not mean every block becomes a 32³ microvoxel volume.

Use:

- painted surfaces for ordinary cubes;
- generated geometry for standard shape families;
- bounded voxel volumes for unique silhouettes;
- compound named parts for moving/stateful/attachable pieces.

## 05.4 Pixel-to-geometry discipline

Geometry should describe **shape**. Texture should describe **surface**.

Do not create geometry solely to imitate noise that belongs in a texture.

Do not paint a texture illusion when shape is critical to collision, grip, silhouette, connection or interaction.

## 05.5 Mixed-density rule

Higher or lower visual density may be used only when it has a clear reason, such as:

- very small held items;
- large creatures;
- large architectural modules;
- VFX source geometry;
- performance LOD;
- UI capture;
- deliberately coarse primitive forms.

Density changes must preserve apparent scale and family cohesion.

---

# 06. Shape Language

## 06.1 Global shape philosophy

Leyforge shape language is:

> **Chunky enough to read, structured enough to imply function, irregular enough to feel made and lived in, and restrained enough to preserve the voxel grid.**

## 06.2 Primary shape families

### Grounded / ordinary

Ordinary survival and settlement objects prefer:

- stable rectangles;
- wedges;
- beams;
- slabs;
- stepped curves;
- simple frames;
- clear load-bearing masses;
- practical handles and supports.

They should feel dependable, understandable and repairable.

### Mechanical / industrial

Automation and machinery prefer:

- directional axes;
- visible input/output orientation;
- frames;
- shafts;
- belts;
- chutes;
- rollers;
- housings;
- repeated modules;
- deliberate asymmetry where function requires it.

Mechanical complexity should be legible rather than ornamental spaghetti.

### Arcane / magical

Magic may introduce:

- suspended forms;
- impossible gaps;
- nested frames;
- rings;
- runic channels;
- crystalline growth;
- controlled symmetry;
- energy paths;
- levitating shards;
- forms that bend ordinary physical expectations.

However, magical forms still require a readable anchor or source unless canon explicitly defines otherwise.

### Ancient / monumental

Ancient powers, lost civilisations and realm-scale works may use:

- massive proportions;
- oversized thresholds;
- repeated monumental rhythm;
- severe cuts;
- long axes;
- buried layers;
- broken symmetry;
- impossible scale contrasts.

Age is communicated by structure and context, not only moss or cracks.

## 06.3 Avoid universal spikiness

Fantasy does not equal spikes.

Spikes, horns, blades and jagged protrusions should appear when they communicate:

- species anatomy;
- defence;
- corruption;
- crystalline growth;
- infernal or realm-specific identity;
- cultural design;
- damage;
- deliberate intimidation.

They must not become the default shorthand for “advanced” or “evil.”

---

# 07. Proportion Philosophy

## 07.1 General rule

Proportions prioritise gameplay readability and voxel character over strict realism.

## 07.2 Humanoids

Humanoid figures should remain recognisably articulated at gameplay distance.

Global requirements:

- head, torso, arms, hands/held object relationship and legs remain readable;
- shoulder and hip separation should survive silhouette testing;
- hands and feet may be proportionally larger than realistic anatomy where useful;
- equipment must not collapse into the body silhouette;
- faces use simple readable landmarks rather than miniature realism;
- body variation is welcome, but shared equipment/rig compatibility should not be destroyed casually.

Exact ancestry/body-family rules belong downstream.

## 07.3 Creatures

Creature proportions should emphasise the features that define locomotion, threat, ecology and identity.

Examples:

- a burrower reads through forelimbs and low centre of mass;
- a grazer reads through torso mass, neck and stance;
- a flying creature reads through wing mass and body-to-wing relationship;
- a predator reads through attack posture and directional body mass;
- an elemental may read through core, flow or unstable mass rather than anatomy.

## 07.4 Tools and equipment

Held assets may use slightly enlarged working heads, guards, grips and focal components so function survives first-person and third-person views.

Tiny realistic dimensions are not mandatory if they make the item unreadable.

## 07.5 Architecture

Buildings should respect human/creature use while allowing deliberate heroic exaggeration for civic, religious, magical, defensive or monumental functions.

A larger building must communicate more than scale. It should communicate organisation, purpose and construction hierarchy.

---

# 08. Silhouette Hierarchy

## 08.1 Three-distance test

Every important asset should be reviewed at three approximate levels:

### Near

The player can read:

- material;
- craftsmanship;
- wear;
- small function cues;
- surface pattern;
- attachment logic.

### Gameplay mid-distance

The player should still read:

- category;
- orientation;
- major state;
- role;
- threat/friendliness where appropriate;
- major interactive affordance.

### Far / reduced-detail

The player should retain:

- major silhouette;
- landmark identity;
- large motion;
- strong state cue where necessary.

## 08.2 Black-silhouette test

Key models and structures should be inspected as solid dark silhouettes.

If an asset family becomes indistinguishable without texture, either:

- silhouette needs improvement;
- distance expectations need revision;
- another non-colour cue must carry identity.

## 08.3 Silhouette priority order

When visual resources are limited, prioritise:

1. outer contour;
2. major negative spaces;
3. proportion;
4. orientation cue;
5. functional parts;
6. material masses;
7. surface detail.

---

# 09. Detail Density and Visual Rest

## 09.1 Detail is hierarchical

Leyforge should not fill every block face, object and background with equal detail.

Use three broad detail bands:

### Quiet

Large readable material areas, terrain, walls, floors, sky, water surfaces, simple cloth, broad machine housings.

Purpose: visual rest and context.

### Informative

Edges, joins, grain direction, masonry pattern, doors, machine ports, equipment, vegetation clusters, structural transitions.

Purpose: explain construction and use.

### Focal

Faces, active machine parts, magical cores, weapon heads, important runes, rare resources, quest/state focal points, boss anatomy, landmark details.

Purpose: direct attention.

## 09.2 No “detail inflation” progression

Higher-tier content does not automatically receive more tiny geometry.

Advancement may instead be shown through:

- better organisation;
- more precise construction;
- stronger materials;
- cleaner functional integration;
- richer silhouette;
- controlled ornament;
- improved state feedback;
- more sophisticated energy/magic behaviour.

## 09.3 Noise budget

Every scene has a finite noise budget.

If terrain is highly varied, architecture may need simpler surfaces. If a magical event dominates the scene, surrounding materials should not compete with it. If a market is dense with props and people, building façades may need stronger large forms.

---

# 10. Edge, Surface and Construction Rhythm

## 10.1 Edges matter

Because Leyforge is voxel-authored, edges and transitions are major style carriers.

Important edge classes include:

- natural broken edge;
- cut edge;
- carved edge;
- worn edge;
- fitted joint;
- forged edge;
- magical seam;
- corrupted fracture;
- repaired patch.

ART-02 will specify material treatment, but ART-01 requires edge logic to be intentional.

## 10.2 Construction rhythm

Structures should communicate assembly through repeated spacing and hierarchy:

- post-and-beam spacing;
- masonry courses;
- roof supports;
- window bays;
- defensive crenellation rhythm;
- machine frame modules;
- ship ribs/deck lines;
- conduit or pipe runs.

Random detail placement is not a substitute for construction grammar.

## 10.3 Imperfection

Ordinary handmade environments should avoid sterile procedural perfection.

Acceptable imperfection includes:

- slight variation in planks or stone faces;
- patch repairs;
- uneven wear;
- mismatched replacement pieces;
- sag or lean where physically plausible;
- vegetation intrusion;
- partial dirt and staining;
- culturally specific improvisation.

Imperfection must remain controlled and should not make placement, collision or navigation ambiguous.

---

# 11. Material and Colour Philosophy — Global Layer

Exact material and palette rules belong to ART-02. ART-01 locks only the global philosophy.

## 11.1 Material before colour

A player should identify many common materials through a combination of:

- value;
- pattern;
- grain;
- edge behaviour;
- reflectance cues;
- form;
- context;
- colour.

Colour is one signal, not the entire identity.

## 11.2 Grounded ordinary palette

The ordinary Overworld baseline should generally use coherent, believable material colour families with enough stylisation for readability.

Natural saturation should be controlled so that:

- food, flowers, heraldry and focal objects can stand out;
- magic has room to escalate;
- weather and time-of-day can meaningfully alter mood;
- realm transitions remain visually significant.

## 11.3 Rare does not mean neon

Rarity or power should not be represented by simply increasing saturation or glow.

Rare/advanced identity can use:

- material rarity;
- shape sophistication;
- craftsmanship;
- motion;
- aura behaviour;
- sound;
- inscription;
- provenance marks;
- unusual interaction with light.

## 11.4 Emissive restraint

Emission is valuable because ordinary materials are not constantly emissive.

Reserve strong emission for meaningful sources such as:

- fire;
- active mana;
- portals;
- enchanted inscriptions;
- certain organisms;
- hazardous states;
- powered magical infrastructure;
- realm-specific phenomena.

Inactive magical objects should often retain a readable non-emissive form.

---

# 12. Lighting and Atmospheric Philosophy — Global Layer

Exact lighting and VFX production belongs to ART-06 and ART-03.

ART-01 locks the following principles.

## 12.1 Light supports material and navigation

Lighting should reveal form and atmosphere while preserving interaction readability.

## 12.2 Darkness may be genuinely dark, not illegible

Dark caves, nights, ruins and hostile realms may feel threatening, but required interaction should not become arbitrary pixel hunting.

Use:

- silhouette;
- local light sources;
- material response;
- eye adaptation/exposure rules;
- diegetic navigation cues;
- accessible alternatives.

## 12.3 Atmosphere must not erase the voxel world

Fog, bloom, particles and post-processing should deepen space, not dissolve silhouettes and block edges at normal play distances.

## 12.4 Magic is not permanent bloom

Magical intensity should vary with state, scale and power. The presence of magic does not justify washing every scene in bloom or chromatic effects.

---

# 13. Ordinary, Exceptional and Magical Hierarchy

Leyforge uses a **presentation escalation ladder**.

## 13.1 Tier A — Mundane / ordinary

Examples:

- soil;
- stone;
- common timber;
- simple tools;
- camps;
- carts;
- farms;
- simple clothing;
- ordinary wildlife.

Presentation:

- grounded materials;
- practical construction;
- limited ornament;
- no unnecessary glow;
- strong tactile sound and wear.

## 13.2 Tier B — Skilled / civilised

Examples:

- forged tools;
- masonry;
- organised workshops;
- fortified settlements;
- crafted furniture;
- ships;
- civic infrastructure.

Presentation:

- cleaner construction rhythm;
- more deliberate shaping;
- stronger joinery;
- material refinement;
- cultural identity;
- improved state feedback.

## 13.3 Tier C — Rare / masterwork / arcane-enabled

Examples:

- precision machinery;
- advanced runes;
- enchanted equipment;
- magical infrastructure;
- rare cultural works.

Presentation:

- specialised silhouettes;
- controlled ornament;
- rare materials;
- active state cues;
- restrained emission or motion where appropriate.

## 13.4 Tier D — Realm / legendary / civilisation-scale wonder

Examples:

- major portals;
- great magical engines;
- monumental realm structures;
- legendary creatures;
- megaprojects;
- world-scale anomalies.

Presentation:

- scale contrast;
- unique spatial composition;
- stronger VFX/audio layers;
- memorable silhouette;
- environmental response;
- visible consequence beyond the object itself.

## 13.5 Escalation rule

A Tier D object should not look extraordinary only because it has more particles than a Tier A object. Each tier should escalate through multiple presentation channels.

---

# 14. Magic Visual Philosophy

## 14.1 Practical magic

Leyforge magic is integrated with work, transport, defence, crafting, ecology, history and civilisation.

Its visuals should therefore often communicate:

- source;
- flow;
- destination;
- charge;
- stability;
- state;
- consequence.

## 14.2 Magic should have structure

Avoid generic floating sparkles as the universal magic language.

Magical phenomena may use:

- runic paths;
- channels;
- crystalline reservoirs;
- field boundaries;
- orbiting components;
- directional particles;
- distortion;
- local material transformation;
- controlled emission;
- environmental reaction.

## 14.3 Distinct magical families

Different schools, realms, sources and states must be distinguishable through more than hue.

Later ART documents should vary:

- motion profile;
- geometry;
- edge quality;
- particle shape;
- temporal rhythm;
- spatial behaviour;
- sound;
- material interaction.

## 14.4 Corruption versus native magic

Corruption should look like a change, intrusion, deformation, infection, rewriting or instability unless canon defines a native corrupted material/being.

Do not collapse “magical,” “evil,” “corrupted” and “realm-specific” into one purple/black visual shortcut.

---

# 15. Civilisation Visual Progression

Leyforge civilisation growth must be visible without becoming a linear “wood → stone → gold → glowing city” ladder.

## 15.1 Growth through organisation

A growing settlement may show progress through:

- road continuity;
- drainage;
- storage organisation;
- public lighting;
- signage;
- workshops;
- defensive planning;
- civic spaces;
- larger construction coordination;
- specialist materials;
- repair quality;
- trade infrastructure;
- transport systems;
- magical or mechanical utilities.

## 15.2 Preserve local identity

A high-capability settlement should still visibly inherit:

- local materials;
- culture;
- terrain response;
- climate adaptation;
- historical layers;
- available technology/magic.

Advanced settlements should not converge into one global “endgame city” skin.

## 15.3 Expansion is additive, not replacement-only

Where plausible, settlement history should remain visible.

A city may contain:

- an old camp site;
- an original timber district;
- newer stone public works;
- repaired walls;
- repurposed ruins;
- later magical infrastructure;
- mixed construction generations.

This supports the persistent-history fantasy.

---

# 16. Survival, Cosy, Dark, Whimsical and Epic Tone Integration

Leyforge deliberately supports multiple emotional tones. They must coexist as one world.

## 16.1 Cosy fantasy

Cosiness comes from:

- enclosure;
- warm practical light;
- inhabited clutter;
- food and storage;
- textiles;
- gardens;
- visible work;
- familiar materials;
- weather shelter;
- people using spaces;
- quiet animation and sound.

Cosy does not require pastel everything.

## 16.2 Dark consequence

Darkness comes from:

- loss;
- absence;
- damage;
- abandoned function;
- dangerous scale;
- hostile weather;
- corruption;
- battlefield aftermath;
- poor maintenance;
- threatening silhouette;
- reduced safe light.

Dark does not require desaturating the entire game permanently.

## 16.3 Whimsy

Whimsy comes from unexpected but coherent ideas:

- charming creature behaviour;
- odd magical tools;
- culture-specific inventions;
- playful environmental interactions;
- unusual but functional shapes;
- small animation details.

Whimsy should not undermine stakes during serious scenes.

## 16.4 Epic / high fantasy

Epic scale comes from:

- size;
- rarity;
- environmental response;
- verticality;
- spatial composition;
- sound;
- weather/light interaction;
- historical context;
- consequence.

Epic does not require every object to be ornate.

## 16.5 Tone contrast is intentional

A warm inn feels warmer because a storm exists outside. A portal feels more impossible beside an ordinary stone road. A repaired village means more after visible raid damage.

Contrast is part of the art direction.

---

# 17. Environmental Composition Principles

Detailed realm/biome art belongs to ART-03. Globally:

## 17.1 Read the land before dressing it

Large environmental identity should begin with:

- landform;
- elevation;
- water;
- geology;
- vegetation mass;
- settlement/route placement;
- weather;
- light.

Small props should reinforce those structures rather than replace them.

## 17.2 Layered environment

A strong environment can be read in layers:

1. macro silhouette / skyline;
2. terrain mass;
3. vegetation or built mass;
4. routes and landmarks;
5. local props and surface variation;
6. temporary state such as weather, damage or activity.

## 17.3 Landmark discipline

Not every hill, tree or building should be a landmark.

Landmarks earn stronger silhouette, contrast or composition because navigation and memory benefit from them.

## 17.4 Roads and infrastructure belong visually

Roads, bridges, ports, mines, canals, walls, conveyors, mana networks and other infrastructure should visibly connect activities and places rather than appearing as isolated decorative assets.

---

# 18. Architecture — Global Grammar

ART-03 owns detailed culture and realm architecture. ART-01 locks shared principles.

## 18.1 Buildings are assemblies

A building should visually read through:

- foundation/contact with terrain;
- load-bearing mass;
- enclosure;
- openings;
- roof/upper termination;
- access;
- function-specific elements;
- material hierarchy.

## 18.2 Avoid cube-house syndrome

Voxel architecture should not default to plain rectangular boxes with decorative textures.

Use meaningful variation in:

- footprint;
- roofline;
- wall depth;
- supports;
- overhang;
- bay rhythm;
- vertical layering;
- attached functional volumes.

## 18.3 Avoid micro-detail architecture syndrome

The opposite failure is equally bad: buildings should not become unreadable sculptures made of tiny voxel protrusions.

Strong large forms come first.

## 18.4 Function should influence form

A warehouse, smithy, watchtower, shrine, harbour building and research station should be identifiable from structure and use, not only signage.

---

# 19. Machines, Logistics and Functional Objects — Global Grammar

## 19.1 Directionality

Where function has direction, art should expose it.

Inputs, outputs, flow direction, interaction side and movement axis should be readable where appropriate.

## 19.2 Function before ornament

A machine's first visual job is to explain what it is doing.

Examples:

- crusher mass converges toward crushing space;
- chute is visibly open/transport-oriented;
- pump communicates intake/output;
- furnace communicates processing chamber and heat source;
- mana conduit communicates connection/flow.

## 19.3 Mechanical motion has weight

Moving parts should feel connected to work:

- rotation;
- reciprocation;
- belt travel;
- valve movement;
- door/arm movement;
- material transfer.

Idle motion should not make everything look weightless or toy-like.

## 19.4 Magic-mechanical hybrids

A magical machine should show both:

- physical structure;
- magical process.

Magic must not become an excuse to hide all mechanism inside a glowing box.

---

# 20. Character and Creature Global Readability

Detailed body/animation direction belongs to ART-05.

## 20.1 Faces

Faces should use a stylised readable hierarchy:

- clear facing direction;
- clear eye placement;
- readable major expression states;
- ancestry/body-family traits where canon requires them;
- no dependence on tiny realistic facial detail.

## 20.2 Clothing and equipment

Outfits should communicate layers such as:

- environment;
- profession;
- culture;
- status;
- protection;
- wealth;
- faction;
- personal variation.

Do not collapse all identity into one costume category.

## 20.3 Creature readability

Threat, temperament and locomotion should not depend only on colour.

Body mass, posture, gait, head orientation, weapon/anatomy and movement pattern are primary.

## 20.4 Bosses and major beings

Major encounters should read through:

- scale or presence;
- silhouette;
- movement authority;
- environmental relationship;
- phase/state changes;
- sound and effect layering.

They should not become generic normal enemies scaled 300%.

---

# 21. Motion Style — Global Layer

Exact animation rules belong to ART-05.

## 21.1 Motion must preserve voxel mass

Animation may be expressive, but bodies and objects should feel like they have weight and joints.

Avoid:

- constant rubbery deformation;
- excessive squash-and-stretch that breaks voxel construction;
- floaty locomotion without contact;
- over-animated idle loops.

## 21.2 Readable action arcs

Important actions should have:

- preparation;
- action;
- consequence/recovery;

The balance varies by action speed, but players should understand what occurred.

## 21.3 Characterful restraint

Personality should come from stance, timing, gesture and small motion differences, not nonstop movement.

## 21.4 First-person consistency

First-person held tools/hands should be the same material and object language as third-person/world representations, not a separate hyper-detailed art style.

---

# 22. Wear, Damage, Repair and History

## 22.1 Wear is contextual

Wear should accumulate where use would plausibly occur:

- handles;
- floor paths;
- door edges;
- wheels;
- machine contact points;
- roof/weather edges;
- weapon working surfaces;
- ship decks;
- public infrastructure.

## 22.2 Damage communicates failure

Damage should expose:

- lost material;
- broken structure;
- scorch;
- deformation;
- cracks;
- debris;
- inactive components;
- compromised magical state.

## 22.3 Repair may leave evidence

Repair does not always restore a pristine factory-new appearance.

Where appropriate, repairs may create:

- patches;
- replacement materials;
- braces;
- new mortar;
- stitched cloth;
- reforged sections;
- renewed magical seals.

## 22.4 Ruin is more than “broken version”

A ruin should communicate:

- original function;
- age/process of decline;
- environmental occupation;
- later reuse;
- missing systems;
- history.

---

# 23. Realm Diversity Without Visual Fragmentation

ART-03 will define individual realm identities. ART-01 locks the shared cohesion layer.

Every realm may radically vary:

- palette;
- atmosphere;
- geology;
- flora;
- architecture;
- magical behaviour;
- creature morphology;
- environmental effects.

But all realms should retain common Leyforge grammar through:

- voxel authorship;
- consistent spatial scale logic;
- silhouette hierarchy;
- material causality;
- readable state;
- controlled detail density;
- physical interaction cues;
- shared quality bar;
- consistent relationship between source model and runtime representation.

A realm should feel like another place in Leyforge, not a guest art pack from another game.

---

# 24. Cultural Variety Without Costume-Park Stereotyping

Detailed cultural art belongs to ART-03.

Globally:

- culture should affect more than colour swaps;
- ancestry/personhood and culture are separate layers;
- one people may participate in multiple cultures;
- one culture may include multiple peoples;
- culture may influence architecture, clothing, tools, ornament, symbols, layout, maintenance, materials and public space;
- avoid reducing a culture to one exaggerated real-world stereotype;
- mixed, conquered, frontier, diaspora and trade settlements may visibly combine layers.

Visual inheritance should support history and exchange.

---

# 25. Composition and Player Attention

## 25.1 Gameplay-first focal hierarchy

Scene composition should help the player answer:

- Where can I go?
- What can I use?
- What is dangerous?
- What changed?
- What is important?

## 25.2 Diegetic guidance before arbitrary highlighting

Prefer guidance through:

- path shape;
- light;
- architecture;
- motion;
- silhouette;
- contrast;
- signage;
- environmental framing;
- VFX at the actual source.

UI highlights may supplement but should not compensate for unreadable art.

## 25.3 Avoid permanent focal competition

If everything glows, nothing glows.

If every object moves, motion stops being informative.

If every surface is high contrast, the player loses hierarchy.

---

# 26. First-Person, Third-Person and World Consistency

## 26.1 One asset identity

Held, dropped, placed, worn, world and inventory representations may be separately optimised, but must clearly represent the same canonical asset.

## 26.2 First-person priorities

First-person presentation should preserve:

- crosshair/interaction view;
- hand-to-item connection;
- item orientation;
- material identity;
- action readability;
- unobstructed landscape.

## 26.3 Third-person priorities

Third-person presentation should preserve:

- body silhouette;
- equipment silhouette;
- stance;
- action readability;
- facing direction.

## 26.4 Inventory/icon priorities

Small icons need stronger simplification and separation than world models. They may use controlled presentation lighting and framing, but must not invent colours or forms absent from the asset.

ART-08 owns final icon rules.

---

# 27. Scalability Is Part of the Art Direction

Leyforge must support scalable simulation and presentation, including lower-end hardware.

Visual identity must survive reduced settings.

## 27.1 Never make style dependent on one expensive effect

A material, creature, portal or machine should remain identifiable when:

- particles are reduced;
- shadows are simplified;
- post-processing is reduced;
- animation LOD is active;
- distant geometry is simplified;
- dynamic lights are limited.

## 27.2 LOD preserves semantic hierarchy

When simplifying:

Preserve first:

1. silhouette;
2. major material masses;
3. state-critical geometry;
4. large motion;
5. orientation;
6. landmark identity.

Remove first:

1. tiny decorative geometry;
2. subtle secondary surface variation;
3. minor particles;
4. redundant moving parts;
5. non-critical micro-animation.

## 27.3 Low-end is not “ugly mode”

Performance profiles should reduce cost without replacing Leyforge with generic flat placeholders during ordinary supported play.

---

# 28. Accessibility and Non-Colour Readability

## 28.1 Critical distinctions need redundant channels

Where a distinction affects gameplay, use at least one non-colour cue in addition to colour where feasible.

Possible channels:

- shape;
- icon;
- pattern;
- brightness/value;
- motion;
- position;
- label;
- sound;
- outline/edge form;
- state geometry.

## 28.2 Reduced motion

Reduced-motion mode should preserve state through:

- static pose changes;
- stronger form/state contrast;
- simplified movement;
- fewer orbiting/continuous effects;
- non-motion indicators.

## 28.3 Reduced flashes

Flash-heavy effects require alternatives using:

- persistent glow;
- slower pulse;
- shape change;
- particle direction;
- sound;
- screen-independent world cues.

## 28.4 High contrast

High-contrast accessibility should enhance existing hierarchy rather than completely restyle the game into a separate visual language.

---

# 29. Visual Anti-Patterns

The following are global warning signs.

## 29.1 Generic voxel fantasy syndrome

Symptoms:

- random bright materials;
- cubes plus generic medieval props;
- smooth characters pasted onto block terrain;
- purple magic everywhere;
- interchangeable biomes;
- no visible production/civilisation logic.

Reject.

## 29.2 Photoreal texture mismatch

High-frequency photo textures on low-resolution voxel geometry create incoherence and readability problems.

Reject unless deliberately transformed into the Leyforge pixel/material language.

## 29.3 Microvoxel maximalism

Using tiny geometry everywhere because The Forge can create it is not the target style.

Reject when it harms silhouette, performance, authoring speed or family consistency.

## 29.4 Flat cube minimalism

The opposite extreme—every special object as a coloured cube—is also rejected for final production assets where silhouette/function needs authored form.

## 29.5 Glow inflation

More advanced = more glow is not a valid global progression rule.

## 29.6 Ornament inflation

More advanced = more trim, spikes and filigree is not a valid global progression rule.

## 29.7 Culture-as-palette-swap

Culture cannot be represented only by recolouring otherwise identical content when stronger identity is canonically needed.

## 29.8 Damage decal only

Major physical damage cannot always be represented by a flat dark mark if structure/state has materially changed.

## 29.9 Effect soup

Particles, bloom, screen shake, distortion and lights should not all be stacked automatically for every magical action.

## 29.10 Unmotivated asymmetry

Asymmetry can create life and character, but random asymmetry without structural or stylistic logic becomes noise.

---

# 30. Category-Level Visual Priorities

| Category | First Read | Second Read | Fine Read |
|---|---|---|---|
| Terrain | biome/landform, traversability | material/geology | variation, weathering |
| Building | function, mass, entrance | culture/material/construction | wear, props, decoration |
| Tool | tool family, working end | material/tier | wear, craft detail |
| Weapon | attack type, reach | material/culture | ornament, damage |
| Machine | purpose/orientation | ports/state/material | internal detail, wear |
| Creature | body family/threat/locomotion | ecology/faction/state | markings, surface detail |
| NPC | person/body/facing | clothing/role/culture | personal detail |
| Magic device | anchor/function/state | magic family/flow | inscription, fine VFX |
| Portal | boundary/destination class/state | realm identity/stability | surface/effect detail |
| Vehicle/vessel | transport class/direction | propulsion/cargo/culture | fittings, wear |
| Resource | category/material | quality/state | inclusions, weathering |

---

# 31. The Leyforge Visual Restraint Rules

To keep the project coherent at production scale, the following restraint rules are mandatory defaults.

1. **One focal idea per asset before secondary ideas.**
2. **One dominant material mass before accents.**
3. **Silhouette before ornament.**
4. **Function before decoration on interactive objects.**
5. **Magic before VFX quantity — define behaviour, then effects.**
6. **Culture before palette swap — define construction/motif, then colour.**
7. **History before dirt noise — define what happened, then weather it.**
8. **Large forms before tiny voxels.**
9. **State change before UI rescue — world art should communicate when possible.**
10. **Performance profile before uncontrolled complexity.**

---

# 32. Golden Reference Strategy for ART-01

ART-10 owns the final golden-reference library, but ART-01 defines the initial visual-language reference set that should eventually be produced.

## 32.1 Golden mundane family

Recommended first family:

- oak log;
- oak plank;
- oak beam;
- oak stair/slab;
- door;
- chest/crate;
- simple table/chair;
- wooden tool component.

Purpose:

- prove material inheritance;
- prove generated versus custom shapes;
- prove quiet/informative/focal detail hierarchy.

## 32.2 Golden stone/metal family

Recommended:

- natural stone;
- cobblestone;
- stone brick;
- furnace;
- iron ingot;
- iron tool;
- iron gate/structural component.

Purpose:

- prove raw/processed/crafted material progression without arbitrary recolour.

## 32.3 Golden machine family

Recommended:

- manual crank;
- basic miner;
- chute;
- splitter or sorter;
- furnace interface.

Purpose:

- prove function, directionality, motion and ports.

## 32.4 Golden magic family

Recommended:

- mana crystal;
- rune component;
- mana battery;
- conduit;
- ward lantern;
- portal fragment.

Purpose:

- prove escalation from physical substrate into magic without glow inflation.

## 32.5 Golden humanoid

Recommended:

- base player/NPC body;
- one ordinary villager;
- one equipped worker;
- one guard;
- one mage.

Purpose:

- prove proportions, equipment separation, material language and animation readability.

## 32.6 Golden creature

Recommended:

- one ordinary animal;
- one predator;
- one magical fauna example.

Purpose:

- prove shared voxel authorship across very different body types.

## 32.7 Golden environment slice

Recommended first environment:

- Overworld forest/settlement edge;
- road;
- small water feature;
- simple cottage/workshop;
- storage/work props;
- one magical element;
- weather/day-night variation.

Purpose:

- prove screenshot-level Leyforge identity.

---

# 33. Codex / Agent Visual Decision Envelope

ART-09 will define the full execution contract. ART-01 establishes the visual decision envelope.

A Codex/agent may autonomously choose lower-level presentation details when all of the following are true:

- upstream canon is unambiguous;
- ART-01 global rules are satisfied;
- relevant specialist ART rules are satisfied;
- a valid family/golden reference exists or the choice is low-risk;
- the choice does not create a new semantic distinction;
- the choice does not erase an existing semantic distinction;
- performance/accessibility constraints are respected;
- the decision is recorded in the production provenance where required.

A Codex/agent must escalate when:

- multiple conflicting canon interpretations exist;
- a new material/culture/realm identity would be invented;
- a visual choice implies gameplay capability;
- a critical distinction cannot be made readable inside current rules;
- the asset would require breaking the established voxel/pixel language;
- no acceptable solution meets performance/accessibility constraints;
- a new recurring style rule appears necessary.

Recurring discoveries should be captured as candidate ART guidance or a reusable production skill rather than rediscovered asset by asset.

---

# 34. ART-01 Production Review Checklist

A representative asset or scene passes the global style review only if applicable checks succeed.

## 34.1 Identity

- [ ] Does it visibly belong to Leyforge?
- [ ] Does it remain voxel-authored/readable?
- [ ] Does it avoid generic fantasy shorthand where stronger identity is required?

## 34.2 Scale and density

- [ ] Does it respect the one-metre world reference?
- [ ] Does its authored density feel compatible with the 32×32 / 32-voxels-per-metre baseline?
- [ ] Is fine geometry used only where it improves form/function?

## 34.3 Silhouette

- [ ] Is the category readable as a silhouette?
- [ ] Is orientation readable where required?
- [ ] Are major parts separated clearly?

## 34.4 Material and craft

- [ ] Can the player understand what it is made from?
- [ ] Does construction/function visually make sense?
- [ ] Does magic preserve or intentionally transform substrate identity?

## 34.5 Detail hierarchy

- [ ] Are large forms clear before small detail?
- [ ] Does the asset have visual rest?
- [ ] Are focal details actually important?

## 34.6 State

- [ ] Are relevant gameplay states visible?
- [ ] Are critical states distinguishable without relying only on hue?

## 34.7 Tone

- [ ] Does it support the intended cosy/dangerous/whimsical/epic tone without violating the global style?
- [ ] Is extraordinary presentation proportionate to actual extraordinary meaning?

## 34.8 Context

- [ ] Does it work at near, gameplay-mid and far/reduced detail where applicable?
- [ ] Does it work in first-person/third-person/icon contexts where applicable?

## 34.9 Scalability and accessibility

- [ ] Does identity survive reduced effects/LOD?
- [ ] Are reduced-motion/flash/high-contrast needs supported where relevant?

## 34.10 History

- [ ] If damaged, repaired, aged, occupied or transformed, does the art communicate the correct history/state?

---

# 35. Scene-Level Art Review Checklist

A representative scene should answer:

- [ ] What is the dominant landform/space?
- [ ] Where is the navigable route?
- [ ] What is the main focal element?
- [ ] Which areas provide visual rest?
- [ ] Are foreground, midground and background separable?
- [ ] Are materials coherent?
- [ ] Are important interactables readable?
- [ ] Are magic/effects subordinate to scene hierarchy unless they are the focal event?
- [ ] Does lighting preserve function and mood?
- [ ] Can the scene still read under a lower visual profile?
- [ ] Can the scene be identified as Leyforge without UI/logo?

---

# 36. Style Severity Levels

To help production review, visual defects may be classified as follows.

## ART-S0 — Style blocker

Examples:

- smooth unrelated art style;
- photoreal asset inserted unchanged;
- semantic identity lost;
- inaccessible critical state;
- silhouette prevents gameplay recognition;
- asset contradicts canon.

Must be fixed before production acceptance.

## ART-S1 — Major style failure

Examples:

- wrong detail density;
- material family incoherent;
- advanced content relies entirely on glow;
- architecture has no functional read;
- creature body cannot be understood in motion;
- realm asset looks like unrelated game content.

Normally blocks final acceptance.

## ART-S2 — Significant polish/consistency issue

Examples:

- weak edge treatment;
- over-noisy surface;
- inconsistent wear;
- small proportion mismatch;
- secondary silhouette confusion.

May be batched but must be tracked.

## ART-S3 — Minor polish

Examples:

- small ornament adjustment;
- subtle composition refinement;
- non-critical variation tuning.

May be deferred according to production priority.

---

# 37. Global Decision Register — ART-01 v0.1

The following decisions are owner-locked as the ART-01 baseline.

| ID | Decision | Proposed status |
|---|---|---|
| ART01-D001 | Leyforge uses a stylised high-fidelity voxel fantasy direction. | LOCKED |
| ART01-D002 | The one-metre block grid remains a visible spatial language. | LOCKED |
| ART01-D003 | 32×32 pixels per standard block face remains the base surface language. | LOCKED |
| ART01-D004 | 32 authoring voxels per metre remains the standard detailed-model density baseline. | LOCKED |
| ART01-D005 | Ordinary cubes use surfaces/generated geometry; unique silhouettes use bounded voxel models; compound parts require functional justification. | LOCKED |
| ART01-D006 | Silhouette and major proportion outrank fine surface detail. | LOCKED |
| ART01-D007 | Materials must remain materially legible; colour is not the sole identity channel. | LOCKED |
| ART01-D008 | Magic escalates from a grounded mundane baseline and does not default to glow/sparkle saturation. | LOCKED |
| ART01-D009 | Advanced content progresses through organisation, craftsmanship, function and controlled wonder rather than universal ornament/detail inflation. | LOCKED |
| ART01-D010 | Wear, damage, repair and historical layering are first-class visual concepts. | LOCKED |
| ART01-D011 | Realm diversity must retain shared Leyforge voxel, scale, silhouette, material and readability grammar. | LOCKED |
| ART01-D012 | Culture is a layered visual system, not merely a palette swap or ancestry skin. | LOCKED |
| ART01-D013 | Scene detail uses quiet, informative and focal bands to preserve visual rest. | LOCKED |
| ART01-D014 | Critical state/readability may not depend on hue alone. | LOCKED |
| ART01-D015 | Visual identity must survive supported low-end profiles and reduced-effect accessibility modes. | LOCKED |
| ART01-D016 | First-person, third-person, world and icon representations remain recognisably one asset identity. | LOCKED |
| ART01-D017 | Functional objects expose direction, state and purpose through art where practical. | LOCKED |
| ART01-D018 | Cosy, dark, whimsical and epic tones coexist through contrast rather than one permanent global mood filter. | LOCKED |
| ART01-D019 | Photoreal texture mismatch, microvoxel maximalism, glow inflation, ornament inflation and generic smooth-model insertion are global anti-patterns. | LOCKED |
| ART01-D020 | Golden references are required before broad family-scale autonomous asset generation. | LOCKED |

---

# 38. Deferred Decisions Routed Forward

ART-01 intentionally leaves the following for downstream specialist documents.

## ART-02

- exact colour-role system;
- final Material DNA visual fields;
- palette architecture;
- pixel texture rules;
- per-material value/saturation ranges;
- weather/wear overlays;
- transparency/emission rules;
- shader-facing requirements.

## ART-03

- exact realm identities;
- biome composition;
- Overworld regional art direction;
- culture/faction motifs;
- architecture libraries;
- settlement visual grammar;
- dungeon/site environmental storytelling.

## ART-04

- exact modelling rules by asset class;
- model bounds and component conventions;
- held/drop/placed representation rules;
- machines, vessels, equipment and structure modelling standards.

## ART-05

- exact humanoid/creature proportion families;
- rig-facing art rules;
- locomotion and animation timing language;
- combat/casting/work motion style.

## ART-06

- exact VFX geometry and motion;
- lighting profiles;
- weather visual systems;
- magic-family effect grammar;
- performance effect tiers.

## ART-07

- exact audio family language;
- sonic material identity;
- creature/magic/machine sound direction;
- music identity and adaptive principles.

## ART-08

- UI skin;
- iconography;
- cartography visual language;
- Codex presentation;
- 2D art and preview framing.

## ART-09

- Codex production steps;
- authority retrieval;
- asset manifest procedure;
- Forge execution;
- validation/escalation/work-log contract.

## ART-10

- golden reference library;
- formal art QA scenarios;
- certification records;
- screenshot/audio reference packs;
- production acceptance gates.

---

# 39. Relationship to Existing POC Visuals

Current POC visuals are **evidence and functional reference**, not final style authority.

They remain valuable for:

- proportions that already work in first person;
- held-item orientation;
- functional silhouettes;
- machine connection behaviour;
- player/NPC/goblin rig requirements;
- animation hooks;
- state-readability lessons;
- visual test-room workflows;
- regression scenes.

However, POC colours, placeholder materials, crude silhouettes and temporary geometry must not be promoted to final ART canon solely because they exist in code or registries.

The existing Visual Test Room concept should survive into production as one of the key ART-10 review environments.

---

# 40. Relationship to The Forge

The Forge must make the ART-01 direction practical rather than merely aspirational.

The authoring environment should support, directly or through downstream implementation:

- 32×32 surface authoring;
- standard detailed voxel density;
- generated construction shapes;
- custom voxel silhouettes;
- named compound parts;
- family inheritance;
- Material DNA;
- visual state variants;
- silhouette preview;
- neutral studio preview;
- first/third-person preview;
- distance/LOD preview;
- low-end/reduced-effect preview;
- icon capture;
- golden-reference comparison;
- source-to-bake provenance;
- visual QA reports.

ART defines the desired result; FORGE-ENG defines how these capabilities are technically delivered.

---

# 41. Implementation Order After ART-01

The recommended next sequence is:

1. Lock ART-01 global visual language.
2. Draft **ART-02 — Materials, Colour, Texture, Surface & Shader Art Standard**.
3. Draft **ART-03 — World, Realm, Biome, Architecture & Culture Art Direction**.
4. Use ART-01–03 to produce the first material/environment golden references.
5. Draft ART-04 and ART-05 for physical assets/entities.
6. Draft ART-06–08 for effects, sound and 2D presentation.
7. Draft ART-09 Codex/The Forge execution contract.
8. Draft ART-10 golden-reference and certification system.
9. Run a representative multi-category art pilot before mass asset production.

---

# 42. ART-01 Acceptance Gate

ART-01 is ready for owner lock when the owner agrees that the following statement accurately captures Leyforge's global visual identity:

> **Leyforge is a stylised high-fidelity voxel fantasy world built on readable one-metre voxel space and a 32×32 base surface language. Important objects and entities use richer voxel-authored silhouettes without abandoning the block world. Materials, craftsmanship, function, state and history remain visually legible. Ordinary life is grounded enough that magic, realms and civilisation-scale wonders can escalate meaningfully. Silhouette outranks micro-detail, visual richness is controlled through hierarchy and rest, and the same identity must survive first-person play, distance, accessibility modes and scalable performance profiles.**

This statement is owner-accepted. ART01-D001 through ART01-D020 are therefore the global visual-language baseline unless later superseded through the ART governance process established by ART-00.

---

# 43. Principal Source Basis

ART-01 was drafted from the current Leyforge project authority state, especially:

- ART-00 — Art Production Constitution & Authority Map;
- Foundation Document 00 — Master Game Design Bible v1.0;
- Document 21B — Voxel Asset Forge: Voxel Modelling, Texturing and Material Authoring;
- Document 21G — Visual Overhaul and Asset Migration Plan;
- Document 22L — Entity and Blueprint Visual Production and Migration Plan;
- FCC-01J — Overworld Final Canon Registry, Global Reconciliation Handoff and Art Readiness;
- FCC-12/FCC-13/FCC-14 semantic identity and art-readiness decisions as represented in the current project authority chain;
- the current Leyforge POC Manual Testing Guide and Visual Test Room acceptance philosophy.

Where historical implementation assets contain temporary colours, model shapes or presentation values not promoted by current canon, they were treated as prototype evidence only.

---

# 44. Next Document

Upon ART-01 approval, proceed to:

> **ART-02 — Materials, Colour, Texture, Surface & Shader Art Standard**

ART-02 should resolve the next highest-leverage production decisions:

- the global colour-role architecture;
- palette construction and inheritance;
- Material DNA presentation fields;
- raw versus processed versus crafted material appearance;
- 32×32 pixel-texture grammar;
- surface pattern and edge-language rules;
- metal, stone, wood, soil, clay, glass, crystal, fibre, organic, fluid and magical material families;
- wear, damage, wetness, frost, heat, corruption and other overlays;
- transparency, emission and shader-facing art direction;
- material variation without identity drift;
- accessibility and low-end material fallbacks;
- Codex rules for deriving one material family across blocks, items, machines, structures and equipment.

---

**End of ART-01 v0.1**
