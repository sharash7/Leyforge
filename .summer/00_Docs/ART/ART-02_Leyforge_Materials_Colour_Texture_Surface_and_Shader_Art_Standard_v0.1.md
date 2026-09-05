# Leyforge Art Production Corpus

## ART-02 — Materials, Colour, Texture, Surface & Shader Art Standard

**Document ID:** ART-02  
**Title:** Leyforge Materials, Colour, Texture, Surface & Shader Art Standard  
**Version:** v0.1  
**Date:** 4 September 2026  
**Status:** **LOCKED GLOBAL MATERIAL-PRESENTATION BASELINE — OWNER APPROVED 4 SEPTEMBER 2026**  
**Project:** Leyforge  
**Product context:** Ley Realms / The Forge  
**Corpus:** ART — Final Art Direction, Asset Production & Codex/Forge Handoff  
**Direct parent:** ART-01 — Master Leyforge Visual Language & Style Bible  
**Constitutional parent:** ART-00 — Art Production Constitution & Authority Map  
**Primary upstream authorities:** current locked FCC material/form/state/provenance canon; FCC-14 semantic art handoff; Master Game Design Bible  
**Inherited Forge production baselines:** Document 21B — Voxel Modelling, Texturing and Material Authoring; Document 21C — Animation, Effects and Runtime Visual States  
**Primary downstream consumers:** ART-03 through ART-10, Codex/coding agents, The Forge, FORGE-ENG, runtime materials/shaders, asset QA, Project Brain  

---

# 00. Executive Material Statement

Leyforge materials must be **recognisable as substances before they are recognisable as rarity tiers, cultures, magical states or shader effects**.

The project therefore uses a **Material DNA + named palette-role** system rather than one-off colour picking and unrestricted asset-local shaders.

The core material promise is:

> **If two things are canonically made from the same material, the player should be able to recognise that relationship across raw resources, processed forms, construction pieces, tools, machines, equipment and world structures without needing a label.**

Conversely:

> **If two materials are canonically distinct, production may not collapse them into the same appearance merely because they are both “wood,” “stone,” “metal,” “crystal” or “magic.”**

ART-02 turns the capabilities established by Forge Document 21B into final Leyforge art-direction law. It does not redefine material identity, crafting recipes or gameplay state. It decides how those truths are presented.

The standard is designed so that Codex can derive an entire visual family from canonical material identity without independently inventing colours, surface logic or shader behaviour for every asset.

---

# 01. Authority and Scope

## 01.1 ART-02 owns

ART-02 owns project-wide presentation rules for:

- material-family visual identity;
- colour-role architecture;
- palette construction and inheritance;
- value, saturation and hue discipline;
- Material DNA visual fields;
- 32×32 surface-texture grammar;
- surface pattern and edge language;
- deterministic material variation;
- raw, processed, refined, crafted and aged presentation;
- wood, stone, soils, clays, metals, glass, crystals, fibres, organics and fluids;
- magical and hybrid material presentation;
- paint, stain, coatings, trim and culturally applied surface treatment;
- wear, damage, repair and environmental overlays;
- wetness, frost, snow, dust, mud, soot, heat, oxidation and patina;
- corruption, blessing and other supernatural state overlays where canon permits them;
- transparency, cut-outs and emission;
- restrained normal/height/roughness/metallic/AO treatment;
- shader-facing art requirements;
- surface-state layering and priority;
- material accessibility and scalable-performance fallbacks;
- material-specific Codex generation rules;
- art-facing material validation.

## 01.2 ART-02 does not own

ART-02 does not decide:

- whether a canonical material exists;
- whether a form is a material, derived form, item or state;
- recipe inputs or outputs;
- physical simulation values;
- combat statistics;
- mining tiers;
- exact realm or culture palette libraries reserved for ART-03;
- exact object geometry reserved for ART-04;
- final VFX choreography reserved for ART-06;
- final audio identity reserved for ART-07;
- final UI colour skin reserved for ART-08;
- shader implementation code reserved for FORGE-ENG/runtime engineering.

## 01.3 Upstream identity wins

When a visual treatment would contradict canonical material/form/state/provenance identity, the visual treatment is wrong.

Examples:

- a plank is not a new wood species;
- rust is not a separate iron material unless canon explicitly defines a separate substance;
- wet stone remains stone;
- enchanted iron remains iron plus an enchantment state unless canon says transformation occurred;
- a cultural paint treatment does not create a new base material;
- a magical corruption overlay does not silently overwrite the identity of the substrate.

---

# 02. Global Material Principles

All material art follows nine global principles.

## 02.1 Substance before decoration

The substrate must remain understandable before ornament, paint, runes, weathering or magical effects are considered.

## 02.2 Family before asset

Material identity is defined at family level and inherited into assets. Asset-local colours are exceptions, not the default.

## 02.3 Value before hue

Major readability and functional separation must survive grayscale viewing. Hue supports identity; it does not carry critical meaning alone.

## 02.4 Pattern before noise

A material should have a deliberate surface grammar—grain, chips, pores, layers, bands, weave, bubbles, veins—not generic procedural noise pasted across everything.

## 02.5 Geometry before fake depth

Silhouette, openings, structural seams and major relief use geometry where practical. Normal/height detail supports surfaces rather than pretending a flat face contains high-resolution sculpture.

## 02.6 State layers preserve base identity

Wetness, frost, damage, soot, corruption and similar states modify an asset. They should not erase its material family unless the state canonically transforms it.

## 02.7 Rarity is not a rainbow

Higher quality or rarity does not automatically mean stronger saturation, more glow or more colours. Refinement may appear through finish, craftsmanship, precision, material purity, edge quality, trim or controlled special response.

## 02.8 Magic is controlled contrast

Emission and supernatural colour are reserved for actual magical energy, magical substances or magical state—not as generic decoration for anything “fantasy.”

## 02.9 Derived forms remain relatives

A player should visually connect log → plank → beam → furniture → machine frame when they share the same canonical wood, and ore → refined metal → plate → gear → tool → gate when they share a canonical metal.

---

# 03. Colour Architecture

## 03.1 Named roles, not arbitrary swatches

The standard palette model inherits the Forge role architecture.

A surface or model should normally reference roles such as:

```text
wood.oak.base_mid
wood.oak.base_dark
wood.oak.highlight
wood.oak.cut_end
wood.oak.weathered
metal.iron.base
metal.iron.edge
metal.iron.oxidation
metal.iron.heat_hot
stone.granite.base
stone.granite.inclusion
magic.mana.core
magic.mana.glow
state.damage.dark
state.soot
state.frost
```

The exact implementation may resolve these roles through palette resources, Material DNA resources or another governed data layer, but assets should not embed unrestricted one-off colour logic when an inherited role exists.

## 03.2 Palette hierarchy

Leyforge uses five palette levels:

1. **Global visual ranges** — project-wide value/saturation safety and readability bands.
2. **Material-family palette** — oak, iron, granite, mana crystal, leather and equivalent canonical families.
3. **Context overlay palette** — culture, biome, realm or historical treatment where authorised.
4. **State palette** — wetness, heat, damage, corruption, warning and other temporary/persistent state roles.
5. **Asset-local exception** — only when the asset contains a genuinely unique visual requirement that cannot be expressed by the above.

## 03.3 No monolithic fixed master palette

Leyforge is too broad in realm, culture, ecology and magic scope for a tiny globally fixed colour table.

The project therefore does **not** lock every asset to one finite retro palette.

Instead, it locks:

- role naming;
- value hierarchy;
- saturation discipline;
- family inheritance;
- contextual overlay limits;
- accessibility rules;
- repeatable palette-generation and review procedures.

This preserves coherence without forcing every realm to use the same handful of colours.

---

# 04. Value, Saturation and Hue Discipline

## 04.1 Value hierarchy

Material families require distinct readable value ranges appropriate to their use.

Rules:

- silhouettes must remain readable under representative daylight, dusk, interior and cave lighting;
- important edges must not vanish because base and trim share nearly identical value;
- holes, recesses and openings should be readable without being permanently painted black;
- emissive regions must retain internal value structure;
- inventory/held/world representations must preserve the same dominant value identity.

## 04.2 Saturation hierarchy

The ordinary Overworld baseline should generally reserve the strongest saturation for:

- flowers and selected biology;
- banners/paint where culture intentionally uses it;
- magic;
- warning states;
- rare natural materials where canon supports vivid colour;
- focal UI/2D use under ART-08.

Common dirt, stone, wood, iron and construction materials should not compete with magical or exceptional content through constant high saturation.

## 04.3 Hue variation

Hue variation within one material is controlled by its DNA.

Random hue shifting may not:

- turn iron into rainbow metal;
- turn oak into unrelated green/purple wood;
- make stone variants look like different canonical rocks;
- alter magical-school identity;
- hide culture/state indicators.

## 04.4 Warm/cool is contextual, not identity alone

Warm versus cool bias may help communicate environment, age, finish or realm influence, but base material identity must remain stronger than a scene-wide colour grade.

---

# 05. Material DNA — Final Art-Facing Schema

The Forge’s Material DNA concept becomes mandatory ART production structure.

Each approved material family should eventually provide, at minimum:

| Field | Art requirement |
|---|---|
| Stable material ID | Canonical material reference. |
| Family | Wood, stone, metal, soil, clay, glass, crystal, fibre, leather, organic, fluid, magical, hybrid or approved extension. |
| Parent DNA | Inheritance source where applicable. |
| Identity summary | One-sentence visual read. |
| Core palette roles | Base, dark, light, edge, interior/cut, inclusion and other required roles. |
| Value envelope | Approved relative value range. |
| Saturation envelope | Approved relative saturation range. |
| Surface grammar | Grain, chips, weave, veins, pores, layers, bubbles, plates, scales, etc. |
| Directionality | Whether grain/brush/veins must align to geometry. |
| Roughness class | Matte/rough/satin/smooth/polished with permitted state changes. |
| Metallic class | Non-metallic, metallic or hybrid/coated rule. |
| Opacity class | Opaque, cut-out, transparent, liquid/special. |
| Emission class | None, conditional, inherent-controlled, energy-bearing. |
| Normal/height allowance | None/subtle/moderate within voxel limits. |
| Damage grammar | Crack, chip, dent, bend, split, rot, fray, scorch, fracture, leak, etc. |
| Wear grammar | Edge polish, grain wear, scratching, patina, fading, compression, etc. |
| Weather grammar | Wet, frost, snow, dust, moss, mud, oxidation and permitted intensities. |
| Heat response | Darken, brighten, redden, emit, char, deform, none. |
| Magic response | Rune acceptance, glow channels, mana veins, ward response or none. |
| Corruption response | Permitted supernatural overlay and base-preservation rule. |
| Culture overlay zones | Paint, carving, trim, binding or ornament regions. |
| Deterministic variation | Seed scope and permitted variation ranges. |
| Derived-form rules | How raw, processed and crafted forms inherit identity. |
| Performance fallbacks | Low-end shader/material simplifications. |
| Golden references | Required approved examples when available. |

Material DNA is presentation data. Gameplay properties may be linked by ID but are not authored here.

---

# 06. Raw → Processed → Crafted Material Continuity

## 06.1 Raw material

Raw material should communicate natural origin or extraction state.

Examples:

- irregular fracture in ore chunks;
- bark and cut-end distinction on logs;
- natural cleavage or weathering on surface stone;
- dirt, inclusions or matrix around crystals where appropriate.

## 06.2 Processed material

Processing should increase regularity without erasing material identity.

Examples:

- sawn wood shows straighter surfaces and exposed grain;
- refined metal loses ore matrix and gains coherent metallic response;
- cut stone gains intentional faces while retaining mineral pattern;
- woven fibre becomes organised texture rather than becoming generic cloth colour.

## 06.3 Crafted material

Crafting adds structural purpose and craftsmanship.

A crafted object can introduce:

- joints;
- seams;
- rivets;
- bindings;
- sharpening;
- polish;
- paint;
- carving;
- rune channels;
- fittings.

It should still be obvious what the object is made from.

## 06.4 Quality and mastery

Better craftsmanship may appear through:

- cleaner alignment;
- finer edge control;
- less waste/roughness;
- selective polish;
- more deliberate joinery;
- balanced ornament;
- higher-quality material selection;
- controlled inlays.

It should not automatically become brighter, more saturated or more emissive.

---

# 07. 32×32 Base Surface Grammar

## 07.1 Canonical base surface

The standard one-metre block face uses a **32×32 base surface language**.

This is not permission to fill all 1024 pixels with unique noise.

A successful 32×32 texture should usually have:

- large readable material masses;
- medium pattern structures;
- sparse small accents;
- edge/face logic when applicable;
- deliberate visual-rest regions.

## 07.2 Three-scale rule

Where appropriate, textures use three scales:

1. **Macro read** — the dominant material/value structure visible from distance.
2. **Meso pattern** — grain, strata, brick, fibre, crystal veins or similar identity pattern.
3. **Micro accent** — sparse chips, specks, pores, scratches or small inclusions.

Micro accents may never overwhelm macro/meso identity.

## 07.3 Pixel integrity

- nearest-neighbour is the source-authoring default;
- source pixels remain crisp at close normal gameplay range;
- mip/filter strategy may reduce shimmer at distance;
- accidental blur, texture bleeding and resampling mush are defects;
- subpixel-looking antialiasing painted into source textures is normally avoided unless a specialist approved case requires it.

---

# 08. Surface Edges, Corners and Face Relationships

## 08.1 Edge truth

Edges should communicate whether a material is:

- cut;
- broken;
- worn;
- joined;
- capped;
- polished;
- coated;
- naturally continuous.

## 08.2 Face-specific treatment

Materials may require different visual roles by orientation:

- log bark versus cut end;
- layered rock side versus split face;
- roof tile top versus underside;
- forged plate front versus edge;
- soil top organic layer versus subsoil side.

Generated shapes must preserve these relationships.

## 08.3 No fake universal bevel

Do not put the same bright outline around every block/material as a generic “voxel style” trick.

Edge response derives from:

- material;
- finish;
- wear;
- lighting;
- construction form.

---

# 09. Pattern, Tiling and Repetition

## 09.1 Material-specific pattern

Pattern must reflect the substance:

- wood: directional grain, knots, cut rings where applicable;
- sedimentary stone: layering/bands;
- granite-like stone: mineral inclusions;
- metal: forged variation, hammering, brushing or polish by finish;
- cloth: weave or fibre direction;
- leather: irregular pores/folds/wear;
- crystal: facets, inclusions, growth direction;
- soil: aggregate, roots/organic matter, stones where appropriate.

## 09.2 Tiling test

Every repeatable world material should be reviewed on:

- 1×1 face;
- 3×3 wall;
- large floor/wall;
- stair/slab/generated forms;
- inside/outside corners;
- mixed lighting;
- deterministic variant set.

Obvious checkerboarding or repeated “hero pixels” is a defect.

## 09.3 Connected textures

Connected-texture logic may reduce repetition or improve structural continuity but must not falsify gameplay connectivity.

---

# 10. Deterministic Variation

## 10.1 Purpose

Variation exists to keep large voxel worlds from looking stamped, not to create uncontrolled art drift.

## 10.2 Permitted sources

- block-position seed;
- structure seed;
- region/biome;
- culture;
- age;
- weather;
- state;
- magic;
- corruption;
- quality/rarity where canon supports it.

## 10.3 Stable results

The same canonical inputs should produce the same visual result unless saved state explicitly changes it.

## 10.4 Variation intensity

Every Material DNA family should declare a bounded variation envelope.

Codex may not invent extra variation outside that envelope simply to make assets “more interesting.”

---

# 11. Wood Material Standard

Wood is one of Leyforge’s most common continuity tests.

## 11.1 Visual identity

Wood families use:

- directional fibre/grain;
- bark versus exposed/cut surfaces where applicable;
- non-metallic response;
- generally moderate-to-high roughness unless polished/waxed;
- warmer or cooler family-specific palettes without abandoning natural material read;
- species-specific grain density, knot character, bark character and cut-end tone.

## 11.2 Derived forms

A canonical wood species should remain recognisable through:

```text
living tree/log
→ stripped/cut log where applicable
→ plank
→ beam
→ stair/slab/fence/door
→ furniture
→ tool handle
→ machine frame
→ architectural trim
```

Derived forms may use different face patterns but inherit family palette and grain logic.

## 11.3 State behaviour

Wood may support:

- wet darkening;
- worn smoothing;
- faded/sun-aged treatment;
- moss/lichen where context supports it;
- rot;
- splitting;
- scorch/char;
- paint/stain;
- carvings/runes where allowed.

Damage uses splits, chips, missing fibres and broken members rather than stone cracks or metal dents.

---

# 12. Stone and Mineral Aggregate Standard

## 12.1 Stone is not grey noise

Stone families must communicate geological character through controlled features such as:

- grain size;
- layering;
- speck/inclusion scale;
- fracture style;
- pore density;
- vein structure;
- weathering colour;
- cut/polished response.

## 12.2 Derived forms

Natural rock, cobble, cut block, brick, pillar, arch and carved ornament may share one material family while differing in processing pattern.

## 12.3 Damage

Stone damage uses:

- chips;
- cracks;
- spalls;
- broken corners;
- missing masonry;
- dust;
- fracture planes.

Stone does not dent like metal or fray like cloth.

## 12.4 Polished stone

Polish may reduce roughness and increase value clarity, but does not automatically make stone metallic or mirror-like.

---

# 13. Soil, Sand, Gravel, Mud and Clay Standard

## 13.1 Loose materials

Loose materials use granular, clumped or aggregate patterns rather than hard carved edges.

## 13.2 Soil

Soil identity may communicate:

- organic richness;
- moisture;
- clay/sand content;
- small stone/organic inclusions;
- fertility treatment where canon defines meaningful presentation.

## 13.3 Sand

Sand should read primarily through:

- light granular texture;
- wind/water patterning where context allows;
- soft value variation;
- material-specific mineral colour.

It should not look like polished stone simply because both use similar hues.

## 13.4 Gravel

Gravel uses discrete aggregate structure and neutral/regionally plausible stone-family relationships.

POC placeholder colours are not authority. In particular, historical registry colours that made gravel read like teal water are prototype data only.

## 13.5 Mud

Mud is a soil/water state or material as defined by canon. Presentation may include darker values, smoother/wetter response, clumps and pooled sheen without becoming generic slime.

## 13.6 Clay

Clay uses smoother, finer-grained mass than ordinary soil. Fired clay/brick introduces processed colour, harder edges and firing variation while retaining clay-family inheritance.

---

# 14. Metal Standard

## 14.1 Metal identity

Metals use:

- canonical family colour/undertone;
- controlled metallic response;
- finish-dependent roughness;
- edge wear appropriate to handling;
- forging/casting/machining marks where relevant;
- oxidation/patina specific to the metal.

## 14.2 No “silver metal” collapse

Iron, copper, bronze-like alloys, precious metals and fantasy metals may not all resolve to generic grey with a tint.

Each family needs a distinct combination of:

- base hue/value;
- edge/highlight behaviour;
- oxidation/patina;
- finish range;
- processing marks;
- cultural/magical compatibility.

## 14.3 Forged versus polished

Forged metal may be rougher and show hammer/scale variation. Polished metal may be smoother and cleaner. Both remain recognisably the same metal family.

## 14.4 Damage

Metal uses:

- scratches;
- dents;
- bends;
- edge rolls/chips where plausible;
- oxidation;
- missing fasteners or plates;
- heat tint;
- fracture only where the material/form supports brittle failure.

## 14.5 Metal in machines

Machine art should expose which parts are structural metal, moving metal, bearing surfaces, heat surfaces, pipes, trim or magical additions where useful to function/readability.

---

# 15. Glass and Transparent Solid Standard

## 15.1 Glass must remain visible

Transparent glass requires readable borders, reflections/value cues, tint or surface marks sufficient to avoid invisible collision hazards.

## 15.2 Transparency restraint

- stacked blended layers are minimised;
- cut-out is preferred when it gives the intended result;
- transparency should not destroy voxel-edge readability;
- low-end fallbacks may simplify refraction/distortion before removing material identity.

## 15.3 Glass variants

Clear, coloured, frosted, stained, magical or damaged glass should inherit a common structural language while remaining distinct through approved DNA fields.

## 15.4 Damage

Glass uses cracks, chips, missing shards, frosting and break patterns—not generic stone cracks painted over transparency.

---

# 16. Crystal and Gem Standard

## 16.1 Crystal identity

Crystals use a combination of:

- faceted or growth-directed structure;
- controlled internal inclusions/veins;
- translucency or cut-out approximation where suitable;
- family-specific value/hue;
- selective emission only where the substance canonically emits or carries energy.

## 16.2 Purity and quality

Quality may affect:

- clarity;
- inclusions;
- fracture;
- cut precision;
- internal light behaviour;
- saturation control.

It should not automatically turn every higher-quality gem into a glowing object.

## 16.3 Mana crystal example

Mana crystal may use a luminous internal core and clearer magical veins while preserving a readable crystal body. Corruption may destabilise the glow and introduce dark inclusions without turning every corrupted crystal into an unrelated substance.

---

# 17. Fibre, Cloth, Leather and Soft Material Standard

## 17.1 Fibre and cloth

Cloth should communicate:

- weave/fibre direction;
- softness through shape and folds rather than high-resolution fabric scans;
- dye/paint as surface treatment;
- fraying/tearing at damage;
- dirt/wetness where appropriate.

## 17.2 Leather and hide

Leather/hide uses:

- warm/cool family-specific organic values;
- pores/folds/scars in restrained form;
- edge wear;
- stitching/bindings;
- oil/wax/polish finish where relevant.

## 17.3 Armour/clothing continuity

Material identity should remain clear even when culture introduces patterns, dyes or ornament.

---

# 18. Organic Hard Materials

Bone, horn, shell, chitin, scale, bark-like biological armour and similar materials require distinct DNA rather than being recoloured stone.

Possible distinguishing traits include:

- layered growth;
- pores;
- striation;
- glossy/matte biological finish;
- segmented plates;
- curvature/growth direction;
- fracture behaviour.

ART-05 owns organism anatomy; ART-02 owns the material treatment applied to the resulting forms.

---

# 19. Fluid Material Standard

## 19.1 Fluids are not transparent glass blocks

Water, lava/magma, poison sludge, magical fluid and other fluid families require fluid-specific surface behaviour.

## 19.2 Water

Water should use:

- readable surface plane/depth cues;
- controlled transparency;
- environment-reflective response where affordable;
- depth/value change without becoming opaque paint;
- motion appropriate to gameplay system;
- distinct appearance from glass.

## 19.3 Hazard fluids

Hazard identity must survive reduced-effects mode through shape, opacity/value pattern, surface motion and non-colour cues where feasible.

## 19.4 Magical fluids

Magical fluids may use emission, unusual motion or internal patterns only where canon supports them. They remain fluids first.

---

# 20. Magical Material and Hybrid-Surface Standard

## 20.1 Magic is not one purple shader

Leyforge must not collapse all supernatural materials into a generic purple/blue glowing treatment.

Magic identity should derive from canonical family and later ART-06 effect language.

## 20.2 Magical substrate hierarchy

A magical asset may be:

1. ordinary material carrying magic;
2. ordinary material transformed by magic;
3. inherently magical material;
4. energy/field surface rather than ordinary matter.

These categories should look different.

## 20.3 Rune-bearing ordinary material

A rune-carved iron plate remains iron with carved/filled channels. The rune is a magical presentation layer; the whole plate does not need to become luminous.

## 20.4 Inherently magical material

An inherently magical substance may have controlled emission, impossible internal structure or unusual optical response as part of its base DNA.

---

# 21. Paint, Stain, Coatings and Cultural Surface Treatment

Culture usually modifies the substrate rather than replacing it.

Permitted overlays include:

- paint;
- stain;
- limewash;
- lacquer;
- cloth wrap;
- metal trim;
- carving;
- mosaic/inlay;
- banners/markings;
- ritual markings;
- maintenance polish.

Rules:

- coating wear should reveal substrate where appropriate;
- paint over metal is non-metallic at painted regions while exposed metal remains metallic;
- cultural overlays must not hide critical functional openings or state indicators;
- ART-03 owns which cultures use which motifs and palette families.

---

# 22. Wear and Age

## 22.1 Wear follows use

Wear should tend to accumulate on plausible interaction zones:

- handles;
- stair centres;
- door edges;
- machine contact surfaces;
- floor routes;
- weapon edges;
- armour joints;
- frequently touched trim.

Uniform random scratch overlays are discouraged.

## 22.2 Age is not damage

Old may mean:

- faded;
- patinated;
- polished by use;
- mossed;
- soot-stained;
- repaired;
- weather-softened.

It does not automatically mean structurally broken.

## 22.3 Historical layering

Persistent structures may show multiple ages or repair materials where the simulation/content records them.

---

# 23. Damage and Repair

## 23.1 Damage bands

Visual damage should normally use bands rather than one unique texture per hit point.

Representative bands:

- pristine/new where useful;
- normal;
- worn;
- damaged;
- heavily damaged;
- ruined/broken.

## 23.2 Material-specific damage

Damage grammar comes from Material DNA.

A universal crack decal pasted onto wood, metal, cloth and crystal is prohibited.

## 23.3 Repair is visible where useful

Repair may restore the original appearance or retain visible history depending on asset/canon.

Possible repair language:

- replacement plank;
- patch plate;
- new mortar;
- stitched cloth;
- reforged edge;
- magical seal;
- rebuilt masonry.

The repair system may later decide whether appearance returns fully to pristine; ART-02 ensures both outcomes have coherent treatment.

---

# 24. Wetness, Snow, Frost, Dust and Mud

## 24.1 Wetness

Wetness may:

- darken absorptive materials;
- lower roughness/smooth surface response;
- add controlled highlight/sheens;
- form droplets/runoff in higher tiers;
- affect only exposed zones where practical.

Wetness does not automatically imply gameplay conductivity or failure.

## 24.2 Snow

Snow is a deposited surface layer, not a global whitening filter.

It should favour upward-facing/exposed surfaces according to runtime capability.

## 24.3 Frost

Frost may:

- lighten edges/surfaces;
- increase roughness;
- reduce transparency/clarity;
- accumulate in patterns appropriate to exposure.

## 24.4 Dust and ash

Dust/ash tend to desaturate and raise roughness. They should accumulate according to orientation/context rather than simply tinting the entire asset.

## 24.5 Mud

Mud is heavier, darker and more localised than generic wetness, often collecting low on objects, feet, wheels and route surfaces.

---

# 25. Heat, Burning, Soot, Oxidation and Patina

## 25.1 Heat

Heat may drive:

- material darkening/brightening;
- red/orange emissive transition where physically/stylistically appropriate;
- heat tint on metal;
- steam/smoke through ART-06 systems;
- roughness changes;
- cooling transition.

## 25.2 Burning

Burning presentation may combine char, glow, soot and attached VFX. ART-02 owns surface response; ART-06 owns flame/smoke effect language.

## 25.3 Soot

Soot favours exhausts, fireboxes, ceilings, vents and other plausible deposition areas.

## 25.4 Oxidation/patina

Oxidation belongs to specific metals and environments.

Do not apply one orange “rust” layer to every metal.

---

# 26. Corruption, Blessing and Supernatural Overlays

## 26.1 Overlay, not recolour

Corruption and blessing should usually use a combination of:

- state masks;
- altered local pattern;
- veins/growths;
- emission changes;
- selective value/hue shifts;
- material breakup;
- optional geometry additions/removals.

A full-asset colour tint is insufficient for important supernatural states.

## 26.2 Base preservation

The substrate should remain recognisable unless canon explicitly defines complete transformation.

## 26.3 Critical warnings outrank cosmetic overlays

Operational danger states must remain visible even when culture, weather, rarity and corruption layers are active.

---

# 27. Surface-State Stack and Priority

The inherited Forge state-stack concept becomes the default ART order:

```text
canonical base material
→ deterministic base variation
→ processed/crafted finish
→ culture/biome/realm overlay
→ age and long-term weathering
→ current environment: wet/snow/frost/dust/mud
→ physical condition: wear/damage/repair/heat/burning
→ magic/power state
→ corruption/blessing/anomaly state
→ critical gameplay warning/readability override
```

Individual families may adjust order, but the order must be declared and tested.

No two uncontrolled layers may silently overwrite the same critical region.

---

# 28. Transparency and Cut-Out Rules

## 28.1 Default preference

Opaque is the default. Alpha cut-out is preferred over blended transparency when the visual result permits it.

## 28.2 Transparent-material requirements

Transparent materials must preserve:

- silhouette;
- edge visibility;
- selection/readability;
- collision understanding;
- performance fallbacks.

## 28.3 No transparency for “premium feel”

Transparency is not a rarity effect. It is a material/property effect.

---

# 29. Emission and Bloom Rules

## 29.1 Emission has meaning

Emission communicates one or more of:

- inherent luminous material;
- active magical energy;
- heat;
- powered machine indicator;
- warning;
- portal/field activity;
- supernatural state.

## 29.2 Underlying form remains visible

At normal exposure, glow may not erase the pixel pattern, rune shape, machine housing or crystal body.

## 29.3 Bloom restraint

Bloom is post-processing support, not identity.

A material must remain readable when bloom is reduced or disabled.

## 29.4 Rhythm and shape

Critical indicators use pattern, icon/shape, motion or timing in addition to colour so reduced-colour and accessibility contexts remain usable.

---

# 30. Roughness, Metallic, Normal, Height and AO

## 30.1 Material-first defaults

Roughness and metallic should come primarily from Material DNA rather than arbitrary pixel painting.

## 30.2 Metallic discipline

- bare metal: metallic;
- paint on metal: non-metallic coating with metallic substrate revealed where exposed;
- stone/wood/cloth: non-metallic even if glossy;
- magical shine does not automatically mean metallic.

## 30.3 Normal/height restraint

Normals/height may enrich meso-scale surface response but cannot make 32×32 textures appear like unrelated high-resolution sculpted materials.

## 30.4 AO restraint

AO emphasises cavities/contact but must not bake permanent darkness that fights dynamic lighting.

---

# 31. Shader-Facing Art Requirements

ART-02 does not dictate shader code. It dictates what shared shader capabilities must be able to express.

The material/shader system should support, where relevant:

- palette-role resolution;
- roughness/metallic defaults;
- cut-out/transparent classes;
- emission mask and intensity;
- wetness;
- frost/snow/dust/mud overlays;
- heat ratio;
- damage state masks;
- corruption/blessing masks;
- deterministic variation parameters;
- directional flow for approved materials;
- controlled UV/texture animation;
- low-end feature reduction;
- accessibility/reduced-flash alternatives.

Unrestricted unique custom shaders are exceptional and require review because they weaken consistency, modding reproducibility and scalable performance.

---

# 32. Connected and Adaptive Materials

Connected materials may adapt at adjacency boundaries when it improves readability or repetition control.

Representative uses:

- grass/dirt edges;
- glass joins;
- brick/tile continuation;
- bookshelves;
- pipes/chutes/conduits;
- corruption/moss spread;
- snow caps.

The visual connection layer may not claim a gameplay connection that does not exist.

---

# 33. Construction Family Inheritance

Generated construction forms—slabs, stairs, walls, pillars, arches, roofs, fences and similar families—must inherit their canonical material rather than receiving unrelated asset-local textures.

Example:

```text
material.wood.oak
    → oak planks
    → oak slab
    → oak stair
    → oak beam
    → oak fence
    → oak door
```

Face mapping may change to preserve grain direction and construction logic.

The same principle applies to stone, brick, metal and other generated construction families.

---

# 34. Machine and Functional Asset Material Rules

Machines may combine multiple materials, but each material remains legible.

A functional asset should usually distinguish:

- structural frame;
- working surface;
- moving parts;
- input/output ports;
- heat zones;
- fluid channels;
- magical channels;
- maintenance/wear zones;
- warning indicators.

Do not solve machine readability by giving every component a random bright colour.

Colour coding may support ports/flows if also backed by shape, label/icon or geometry where critical.

---

# 35. Tools, Weapons, Armour and Equipment Material Rules

Equipment must preserve material continuity across:

- world drop;
- inventory icon;
- held first-person view;
- third-person equipped view;
- NPC use;
- damaged/worn state.

A wooden handle should read as its wood family. An iron head should read as its metal family. Leather bindings should not inherit the metal shader simply because they share one model.

Higher-tier equipment progresses through material quality, construction, proportion, finish and controlled ornament—not mandatory glow.

---

# 36. Material Identity Across Representation Products

A canonical material may appear in:

- terrain block;
- construction block;
- item resource;
- processed item;
- machine component;
- tool/weapon;
- armour;
- furniture;
- structure;
- icon/thumbnail;
- world VFX interaction.

These are presentation products, not separate material identities.

ART-09 will require Codex to resolve all relevant products from the same Material DNA record.

---

# 37. Lighting Independence Test

A material is not approved only because it looks good under one studio light.

Representative materials must be reviewed under:

- neutral daylight;
- warm interior/fire light;
- cool moon/night light;
- low cave light;
- high-emission/magic nearby;
- fog/weather where applicable;
- low-end lighting profile.

The material may adapt to lighting, but must not become unrecognisable.

---

# 38. Accessibility Rules

Critical distinctions must survive:

- grayscale inspection;
- common colour-vision deficiencies where applicable;
- reduced bloom;
- reduced flashes;
- reduced motion;
- lower material quality;
- low display brightness within reasonable range.

When two gameplay-critical states are similar in hue, add one or more of:

- pattern;
- brightness/value difference;
- shape/icon;
- animation rhythm;
- geometry state;
- text/tooltip support.

---

# 39. Performance and Scalability

Material identity must survive scalable rendering.

## 39.1 Full presentation

May include:

- full approved shader response;
- animated material parameters;
- transparent effects;
- fine normals/height;
- local reflection/refraction approximations;
- richer state overlays.

## 39.2 Reduced presentation

May simplify:

- distortion/refraction;
- normal strength;
- layered transparency;
- animated noise;
- secondary overlay sampling;
- dynamic lights linked to material.

## 39.3 Minimum identity floor

Low-end mode must retain:

- canonical base palette roles;
- primary surface pattern;
- major state distinction;
- transparency/cut-out class where mechanically/readability necessary;
- key emission indicator in simplified form;
- material-family differentiation.

Performance settings may reduce flourish, not semantic identity.

---

# 40. The Forge Authoring Contract for Materials

The Forge should expose material authoring in a way that makes ART compliance natural.

A material workspace should eventually show:

- stable material ID;
- parent DNA;
- palette roles;
- inherited versus local values;
- surface grammar/pattern library;
- channel defaults;
- directionality;
- state masks;
- deterministic variation;
- cultural overlay slots;
- damage/weather/magic responses;
- rendering class;
- performance fallback;
- preview contexts;
- golden-reference links;
- validation status;
- provenance/change history.

The editor should warn when a user/agent bypasses inheritance without an approved reason.

---

# 41. Codex Material-Generation Rules

When Codex creates or revises a material-bearing asset, it must follow this order:

1. Resolve canonical material identity and stable ID.
2. Determine whether the requested thing is a base material, derived form, state or overlay.
3. Load the applicable Material DNA and parent DNA.
4. Load applicable ART-03 realm/culture/biome overlays when available.
5. Identify representation product: terrain, item, block, machine, equipment, structure, etc.
6. Reuse existing palette roles before creating new roles.
7. Apply required surface directionality and pattern grammar.
8. Apply derived-form processing rules.
9. Add only authorised state/context overlays.
10. Check value and silhouette readability without emission/bloom.
11. Check low-end and accessibility fallback.
12. Compare against family golden references.
13. Run automated material validators.
14. Produce preview renders in required contexts.
15. Record any new approved role/pattern/DNA decision in the appropriate registry/work log.

Codex must escalate rather than invent when:

- material identity is ambiguous;
- no parent/family exists where one is expected;
- canon and existing Material DNA conflict;
- a new magical surface would require defining new lore/gameplay meaning;
- an asset requires a new rendering class or unique shader outside approved capabilities;
- two protected distinctions cannot be made readable under current rules.

---

# 42. Material Validation Gates

A final candidate material/asset should pass applicable checks for:

## 42.1 Identity

- correct canonical material ID;
- correct parent family;
- no accidental new identity;
- derived-form inheritance intact.

## 42.2 Palette

- only approved/newly governed roles;
- value hierarchy readable;
- saturation within family envelope;
- no hue-only critical distinction.

## 42.3 Surface

- correct pattern grammar;
- directionality correct;
- acceptable tiling;
- pixel integrity preserved;
- no accidental texture bleed.

## 42.4 Channels

- metallic appropriate;
- roughness appropriate;
- normals/height restrained;
- AO non-destructive;
- emission meaningful;
- transparency justified.

## 42.5 States

- damage material-specific;
- weather overlays preserve identity;
- state priority explicit;
- warning remains readable;
- corruption/blessing does not erase base without canon authority.

## 42.6 Context

- daylight/night/interior/cave review;
- first-person/world/icon consistency where applicable;
- low-end profile;
- accessibility review;
- deterministic reload/variation check.

---

# 43. Material QA Severity

## ART-M0 — Canon/identity blocker

Examples:

- wrong material;
- material/form/state confusion;
- derived family no longer recognisable;
- culture overlay silently replaces canon identity;
- corrupted state presented as unrelated base material.

Blocks acceptance.

## ART-M1 — Major production/readability blocker

Examples:

- critical state only distinguishable by hue;
- transparent collision surface effectively invisible;
- emissive bloom erases form;
- material becomes unrecognisable on low-end;
- severe tiling/repetition;
- wrong metallic/opacity class;
- unique shader breaks shared pipeline without approval.

Blocks final acceptance.

## ART-M2 — Significant consistency/polish issue

Examples:

- family palette drift;
- excessive noise;
- inconsistent wear;
- weak directionality;
- roughness/normal overstatement;
- minor state-mask conflict.

Track and resolve before family-scale mass production.

## ART-M3 — Minor polish

Examples:

- isolated pixel cleanup;
- small variation-weight adjustment;
- subtle patina balance;
- non-critical trim refinement.

May be deferred by production priority.

---

# 44. Global Material Anti-Patterns

The following are explicitly rejected as default production approaches:

- random registry colours treated as final art;
- “one shader per asset” with no family inheritance;
- generic noise used as the identity of every material;
- all metals becoming grey plus a hue tint;
- all stone becoming grey noise;
- all magic becoming purple/blue emission;
- rarity represented primarily by rainbow recolours;
- high tier represented primarily by stronger bloom;
- universal crack decals across every material;
- wetness as a full-screen tint on objects;
- snow/frost as uniform whitening;
- culture as palette swap only;
- corruption as simple purple tint only;
- photoreal PBR scans pasted into 32×32 voxel surfaces;
- high-strength smooth normals that erase pixel/voxel style;
- invisible glass collisions;
- arbitrary metallic values on non-metals;
- uncontrolled procedural hue shifting;
- nondeterministic surface variants that change every load;
- performance modes that remove critical state identity.

---

# 45. Golden Material Reference Families

Before broad autonomous asset generation, ART-10 should certify a minimum representative material set.

Recommended first golden families:

1. **Oak wood family** — log, plank, beam, stair/slab, door, furniture/tool handle.
2. **Ordinary stone family** — natural stone, cobble, cut block, brick, wall/pillar.
3. **Iron family** — ore/processed metal, ingot, plate, tool head, gate/machine part, damaged/rusted states.
4. **Copper family** — ingot, plate/wire/gear, machine part and patina state.
5. **Glass family** — clean, connected pane, damaged/frosted and low-end fallback.
6. **Water family** — shallow/deep/readable fluid surface and low-end fallback.
7. **Mana crystal family** — raw crystal, shard, processed component, block/infrastructure use, charged/corrupted state.
8. **Leather/cloth family** — clothing/equipment with dye, wear and damage.
9. **Clay/brick family** — clay, fired brick and roof tile.
10. **Corruption overlay reference** — applied to at least wood, stone, metal and magical material without erasing substrate identity.

These references should become visual regression anchors for Codex and The Forge.

---

# 46. ART-02 Decision Register — v0.1

The following decisions are owner-approved and locked under ART-00 governance.

| ID | Decision | Proposed status |
|---|---|---|
| ART02-D001 | Leyforge materials use Material DNA plus named palette roles as the primary visual inheritance system. | LOCKED |
| ART02-D002 | Material identity must remain recognisable across raw, processed, crafted and derived forms. | LOCKED |
| ART02-D003 | Critical distinction may not depend on hue alone. | LOCKED |
| ART02-D004 | Leyforge does not use one tiny monolithic fixed master palette; it uses governed family/context/state palettes within global ranges. | LOCKED |
| ART02-D005 | 32×32 remains the standard base surface grammar for one-metre block faces. | LOCKED |
| ART02-D006 | Surface detail follows macro/meso/micro hierarchy rather than maximum per-pixel noise. | LOCKED |
| ART02-D007 | Geometry owns major form; normals/height only enrich restrained surface depth. | LOCKED |
| ART02-D008 | Material-specific pattern and damage grammar replace generic universal noise/crack treatment. | LOCKED |
| ART02-D009 | Deterministic visual variation is required for repeatable world/material results. | LOCKED |
| ART02-D010 | Wood derived forms inherit species palette/grain identity. | LOCKED |
| ART02-D011 | Stone families are differentiated by geological surface grammar, not grey-noise recolours. | LOCKED |
| ART02-D012 | Metals require family-specific colour, finish, wear and oxidation/patina behaviour. | LOCKED |
| ART02-D013 | Metallic response is material-driven; shininess alone does not make a surface metallic. | LOCKED |
| ART02-D014 | Glass/transparent solids must remain visibly bounded and understandable as collision surfaces. | LOCKED |
| ART02-D015 | Fluids use fluid-specific presentation and are not rendered as glass blocks. | LOCKED |
| ART02-D016 | Magic is not represented by one universal glowing colour/shader. | LOCKED |
| ART02-D017 | Rarity/quality progression does not default to saturation, rainbow recolour or glow inflation. | LOCKED |
| ART02-D018 | Culture normally overlays substrate through paint, trim, carving, construction treatment or similar governed methods rather than replacing material identity. | LOCKED |
| ART02-D019 | Wear follows plausible use and is distinct from structural damage. | LOCKED |
| ART02-D020 | Damage presentation is material-specific and normally banded rather than unique per hit point. | LOCKED |
| ART02-D021 | Wetness, snow, frost, dust, mud, soot and oxidation are controlled overlays that preserve base identity. | LOCKED |
| ART02-D022 | Corruption/blessing normally layer over substrate and may not erase critical warnings. | LOCKED |
| ART02-D023 | Emission communicates actual energy/heat/magic/warning and must remain readable with bloom reduced or disabled. | LOCKED |
| ART02-D024 | Transparency is property-driven, not a rarity/premium effect. | LOCKED |
| ART02-D025 | Shared shader/material capabilities are preferred over unrestricted unique shaders. | LOCKED |
| ART02-D026 | State layering uses an explicit priority stack ending with critical gameplay readability. | LOCKED |
| ART02-D027 | Low-end material modes may reduce flourish but must retain canonical material and state identity. | LOCKED |
| ART02-D028 | Codex must resolve canonical identity and inherited Material DNA before authoring local palette/surface decisions. | LOCKED |
| ART02-D029 | Codex must escalate new rendering classes, unresolved material identity and canon/DNA conflicts rather than inventing around them. | LOCKED |
| ART02-D030 | Golden material families are required before broad autonomous family-scale production. | LOCKED |

---

# 47. Deferred Decisions Routed Forward

## ART-03

- final Overworld and realm palette families;
- biome-specific environmental colour relationships;
- cultural dyes, paints, trim and ornament palettes;
- architecture material combinations;
- geology distribution and environmental composition.

## ART-04

- exact block/item/machine/structure/equipment geometry;
- material slot conventions by asset type;
- edge geometry and structural seams;
- model-level state geometry.

## ART-05

- skin/hair/feather/fur/species-specific anatomical surface treatment where not already canonical;
- clothing construction presentation on bodies;
- animation interaction with soft materials.

## ART-06

- flames, smoke, sparks, weather VFX;
- spell effects;
- portal surfaces/effects;
- material-linked particles;
- final light/emission choreography.

## ART-07

- sound-family mapping for wood, stone, metal, glass, fluid, cloth, crystal and magical materials.

## ART-08

- exact UI palette/skin;
- icon background and rarity treatment;
- map material/terrain abstraction.

## ART-09

- exact Codex authority-retrieval and Forge execution workflow;
- production manifests;
- provenance/work-log output;
- automated agent escalation format.

## ART-10

- final golden reference selections;
- screenshot/reference packs;
- formal material certification procedures;
- visual regression thresholds.

---

# 48. Relationship to Existing POC Registry Colours

Historical POC registry colour values are not promoted to final art authority merely because they exist.

The current registry contains obvious placeholder/testing colours across many materials. The POC Manual Testing Guide itself already records visual corrections such as neutralising gravel so it cannot be mistaken for water and explicitly states that current low-poly POC visuals do not lock the final style.

ART-02 therefore treats POC colours as:

- implementation evidence;
- stable-ID reference;
- regression context;
- migration input;

but **not** final palettes unless a later ART material record explicitly adopts them.

---

# 49. Relationship to The Forge

Document 21B already established the essential authoring capability model used here:

- palette-role levels;
- Material DNA;
- 32×32 source surfaces;
- colour/alpha/emission/roughness/metallic/height/AO/state channels;
- connected textures;
- deterministic variants;
- state layers;
- transparent/emissive rendering classes;
- restrained stylised normals;
- bake/runtime separation.

ART-02 does not replace those capabilities. It converts them into final production constraints.

Document 21C similarly owns the runtime presentation binding model for wetness, frost, heat, damage, corruption, emission and other active states. ART-02 defines what those states should look like; 21C/FORGE-ENG define how they are driven.

---

# 50. ART-02 Acceptance Gate

ART-02 is owner-approved and locked on the following statement:

> **Leyforge materials are governed families rather than per-asset colour choices. A material keeps recognisable identity from raw resource through processed and crafted forms, using named palette roles, Material DNA, a 32×32 base surface grammar, controlled deterministic variation and material-specific pattern, wear, damage and environmental response. Colour supports identity but does not carry critical meaning alone. Magic, rarity and culture layer onto material truth rather than replacing it. Transparency, emission and shader effects are controlled functional properties, and every material must remain readable under representative lighting, accessibility settings and low-end rendering profiles.**

ART02-D001 through ART02-D030 are the locked global material-presentation baseline unless superseded through ART-00 governance.

---

# 51. Principal Source Basis

ART-02 was drafted from the current Leyforge authority state, especially:

- ART-00 — Art Production Constitution & Authority Map;
- ART-01 — Master Leyforge Visual Language & Style Bible;
- Document 21B — Voxel Asset Forge: Voxel Modelling, Texturing and Material Authoring;
- Document 21C — Voxel Asset Forge: Animation, Effects and Runtime Visual States;
- current FCC material/form/state/provenance and semantic art-handoff authority as represented in the project corpus;
- the current Leyforge POC Manual Testing Guide and registry as prototype/migration evidence only.

Key inherited 21B concepts preserved here include:

- project/material/asset/variant palette hierarchy;
- named colour roles;
- Material DNA inheritance;
- channel simplicity;
- crisp pixel sampling;
- connected-texture testing;
- deterministic variation;
- base-preserving state layers;
- explicit state priority;
- controlled transparency and emission;
- stylised depth through restrained normals/height;
- material-driven roughness and metallic behaviour.

Where historical POC visual data conflicts with these rules or current canon, it remains prototype evidence rather than final art authority.

---

# 52. Next Document

Upon ART-02 approval, proceed to:

> **ART-03 — World, Realm, Biome, Architecture & Culture Art Direction**

ART-03 will take the common language established by ART-01 and the material law established by ART-02 and finally define how Leyforge’s worlds become visually distinct while still belonging to the same game, including:

- Overworld global environmental identity;
- realm-level palette/shape/atmosphere signatures;
- biome composition and transitions;
- geology and terrain presentation;
- flora/fungi/environmental dressing;
- settlement and architecture grammar;
- culture/faction motifs;
- roads, farms, industrial/magical districts and civic growth;
- ruins, dungeons and environmental history;
- day/night/weather atmospheric composition;
- rules preventing realm/culture variation from collapsing into simple recolours.

---

**End of ART-02 v0.1**
