# Leyforge Art Production Corpus

## ART-04 — Blocks, Items, Machines, Structures, Equipment & Vessel Modelling Standard

**Document ID:** ART-04  
**Title:** Leyforge Blocks, Items, Machines, Structures, Equipment & Vessel Modelling Standard  
**Version:** v0.1  
**Date:** 4 September 2026  
**Status:** **LOCKED MODEL-PRODUCTION BASELINE — OWNER APPROVED 4 SEPTEMBER 2026**  
**Project:** Leyforge  
**Product context:** Ley Realms / The Forge  
**Corpus:** ART — Final Art Direction, Asset Production & Codex/Forge Handoff  
**Direct parent:** ART-01 — Master Leyforge Visual Language & Style Bible  
**Material parent:** ART-02 — Materials, Colour, Texture, Surface & Shader Art Standard  
**Environment parent:** ART-03 — World, Realm, Biome, Architecture & Culture Art Direction  
**Constitutional parent:** ART-00 — Art Production Constitution & Authority Map  
**Primary upstream authorities:** FCC-12/13/14 physical-form, projection, stable-identity and semantic art-handoff canon; current block/object/item registries; settlement/structure/vessel canon; current realm and culture canon  
**Inherited production baselines:** Document 21B — Voxel Modelling, Texturing and Material Authoring; 21D — Asset Overrides, Variants and Registry Integration; 22I — Blueprint Forge; Document Set 26 maritime/vessel authority; applicable ENG-GOV and FORGE-ENG law  
**Primary downstream consumers:** ART-05 through ART-10, Codex/coding agents, The Forge, FORGE-ENG, runtime asset baking, registry validators, blueprint production, vessel production, visual QA, Project Brain  

---

# 00. Executive Modelling Statement

Leyforge models must feel **made from a coherent voxel world rather than imported into one**.

The modelling promise is:

> **Every asset must preserve readable voxel construction, material truth, functional logic and stable identity while using only as much geometric complexity as its silhouette, interaction, movement or state requires.**

The production promise is:

> **Codex should be able to receive a canonical asset identity, resolve the relevant registry/material/culture/realm/function authorities, choose the correct Forge authoring mode, construct all required presentation forms, prepare pivots/sockets/collision/state parts, validate the result and hand a reproducible source asset to the bake pipeline without inventing gameplay behaviour.**

The consistency promise is:

> **A family of related assets should look intentionally related because they inherit common material, shape, construction and functional grammar—not because they were copied from one generic template or recoloured after the fact.**

ART-04 converts ART-01 through ART-03 into physical model-production law. It does not redefine the existence, mechanics, registry identity, recipes, progression, simulation, vessel physics or animation choreography of the things being modelled.

---

# 01. Authority and Scope

## 01.1 ART-04 owns

ART-04 owns final global art-production rules for:

- ordinary world blocks;
- generated construction shapes;
- unique-shaped blocks;
- raw resources and processed materials;
- item models;
- tools and weapons;
- armour and wearable equipment;
- backpacks, shields and carried gear;
- furniture and workstations;
- functional machines;
- automation/logistics components;
- magical infrastructure;
- architectural modules;
- authored structures and blueprint-facing model composition;
- settlement buildings;
- ruins, dungeons and landmarks at the model-composition level;
- vehicles and vessels at the visual/model-production level;
- compound-part decomposition;
- source geometry density;
- silhouette, negative-space and contact design;
- presentation-view relationships;
- model origins, axes and pivots;
- art-facing sockets and anchors;
- art-facing collision and selection bounds;
- connection geometry;
- multi-cell footprints;
- state geometry preparation;
- damage/repair visual geometry preparation;
- LOD and geometric simplification principles;
- reusable sub-assets and modular families;
- model-specific Codex production and escalation rules;
- model-focused golden references and QA.

## 01.2 ART-04 does not own

ART-04 does not decide:

- whether an asset exists;
- stable gameplay IDs or registry semantics;
- harvest logic, recipes or stats;
- inventory capacity;
- machine throughput or simulation law;
- NPC AI;
- hit damage or combat timing;
- final skeleton/rig architecture reserved for ART-05 and Set 22;
- animation timing/choreography reserved for ART-05;
- detailed VFX/lighting reserved for ART-06;
- audio reserved for ART-07;
- final icon/UI graphic language reserved for ART-08;
- implementation architecture reserved for FORGE-ENG;
- runtime physics algorithms for vessels;
- blueprint gameplay logic;
- collision gameplay exceptions unless already defined upstream.

## 01.3 Gameplay truth wins

A visual model may explain gameplay truth. It may never silently replace it.

Examples:

- a decorative crank does not create mechanical power;
- a visible chest lid does not create inventory capacity;
- a propeller does not create thrust without an authoritative vessel component;
- a visible rune does not create a magical effect;
- a door-like shape does not become an interactable door unless the registry says it is one;
- a modelled blade does not change weapon reach or damage by itself;
- a visually sealed vessel does not override vessel structural/sealing validation.

---

# 02. Core Model Ontology

Every model production task must resolve five separate questions:

1. **What is the canonical thing?**  
   Registry/content identity and semantic function.

2. **What presentation class is required?**  
   Block, item, held, equipped, dropped, placed, machine, structure, vessel, icon source or other authorised projection.

3. **What source-construction method is appropriate?**  
   Painted full cube, generated shape, voxel volume, compound model, blueprint composition or vessel composition.

4. **Which visual families does it inherit?**  
   Material, culture, realm, technology/magic, condition and approved variant families.

5. **Which contracts must the model expose?**  
   Footprint, pivot, socket, direction, connection, interaction, state part, collision, animation anchor, LOD or other required production contract.

No single field is allowed to answer all five questions.

---

# 03. Stable Identity vs Presentation Identity

ART-04 inherits the FCC-13/registry separation between canonical gameplay identity and presentation.

## 03.1 One canonical thing may have multiple presentations

A single canonical identity may legitimately require:

- world/placed representation;
- held representation;
- equipped representation;
- dropped representation;
- inventory/icon capture representation;
- blueprint/preview representation;
- damaged or state presentation;
- LOD products.

These are **presentation products**, not automatic new gameplay items.

## 03.2 Single-definition rule remains upstream

ART-04 must not create duplicate gameplay definitions merely because an art workflow wants separate meshes.

If a block remains the same canonical object when broken and carried, the art pipeline may generate a carried/item presentation from the same identity without inventing a duplicate semantic object.

Where the registry deliberately distinguishes a block-form object from a materially related item or processed resource, ART-04 respects that distinction.

## 03.3 Visual-source sharing

Multiple presentation products may share:

- source voxel geometry;
- palette/material family;
- reusable sub-parts;
- normalised scale references;
- icon capture settings;
- animation-ready part definitions;
- state masks.

Sharing source does not merge registry identity.

---

# 04. Canonical Scale and Density

## 04.1 World scale

The standard world block remains a **one-metre spatial cell** unless an upstream system explicitly defines another unit relationship.

## 04.2 Base modelling density

The standard high-detail Forge authoring density remains:

> **32 authoring voxels across one one-metre world block.**

This aligns with ART-01/02's 32×32 base surface language and inherited Document 21B authoring capability.

## 04.3 Density is a ceiling, not a requirement

Not every one-metre object should contain 32×32×32 occupied microvoxels.

Prefer:

- painted faces for ordinary full blocks;
- generated geometry for common construction shapes;
- sparse voxel volumes for unique silhouettes;
- named compound parts where independent motion/state/attachment justifies them.

## 04.4 Density mixing

Within one asset family:

- silhouette scale must remain coherent;
- texture/pixel density should not jump arbitrarily;
- finer geometry may be used for focal functional detail;
- larger quiet surfaces should not be fragmented merely because the authoring grid allows it.

## 04.5 Oversized assets

Large machines, structures and vessel modules may span many world cells while preserving the same spatial grammar.

Their authoring bounds must declare:

- total footprint;
- occupied cells;
- passable/open cells;
- overhangs;
- interaction zones;
- moving-part clearance;
- visual bounds;
- selection bounds;
- collision bounds.

---

# 05. Authoring-Mode Selection

Codex and human authors must select the simplest source model capable of expressing the asset correctly.

| Asset need | Preferred source mode |
|---|---|
| Ordinary opaque cube | Painted block faces + generated cube |
| Standard slab/stair/wall/fence/pillar family | Generated construction shape |
| Unique block silhouette | Voxel volume |
| Tool/item/weapon | Voxel model |
| Furniture or station | Voxel or compound model |
| Machine with moving/toggled parts | Compound model |
| Connected transport/network component | Directional voxel/compound model with connection masks |
| Multi-cell functional object | Voxel/compound model + explicit footprint |
| Building/ruin/dungeon | Blueprint composition of approved blocks/assets |
| Large vessel | Vessel blueprint composition + approved compound assets/modules |
| Character/creature | Entity/body authoring pipeline governed further by ART-05 |

## 05.1 Escalation rule

If an asset cannot be represented cleanly in the expected mode, do not silently increase complexity. Record why and escalate to the appropriate Forge/engineering/art authority.

---

# 06. Silhouette-First Modelling Law

At normal gameplay distance, the player should identify the asset family before reading its texture.

The required priority order is:

1. overall silhouette;
2. mass distribution;
3. negative space;
4. functional front/working end;
5. major material separation;
6. state-bearing parts;
7. secondary construction detail;
8. micro surface detail.

If an object only becomes recognisable after zooming in on a texture, its model is under-resolved.

If an object is recognisable but its surface is broken into noisy unnecessary projections, its model is over-resolved.

---

# 07. Negative Space and Contact Design

## 07.1 Negative space

Openings, gaps, handles, tines, blades, forks, rails, arches and frame spaces should be geometrically present when they materially affect recognition.

Examples:

- a chute must read as an open trough;
- a ladder must have readable rung gaps;
- a chair must read as seat + back + support, not a decorated cube;
- a bow must have a clear curved/open silhouette;
- a portcullis/gate should preserve pass-through/open-state logic visually.

## 07.2 Contact points

Objects that stand, hang, mount, connect or rest must visibly contact their support.

Avoid:

- floating machine housings;
- table legs that do not touch the floor;
- hand grips offset from palms;
- pipes terminating before the socket;
- doors hovering above thresholds;
- vessel components that visually penetrate or float off foundations without intentional supports.

## 07.3 Exaggerated readability

Small but important functional details may be slightly exaggerated in thickness or separation when needed for voxel readability, provided this does not imply false capability.

---

# 08. Ordinary Full Blocks

Ordinary material blocks should generally remain ordinary blocks.

## 08.1 Full-cube priority

Use the full cube when the gameplay object is materially and spatially a full block.

Do not add unnecessary bevel meshes, trims or protrusions to every terrain/construction block.

## 08.2 Surface-led identity

Full-block identity should come primarily from:

- ART-02 material grammar;
- face-role differences where relevant;
- edge continuity;
- connected-texture relationships;
- sparse geometric exceptions such as inset mortar or crystals only where justified.

## 08.3 Terrain coherence

Terrain blocks should preserve continuous terrain readability when tiled in large fields.

A single grass, dirt, sand, stone or snow block should not be visually designed as a standalone prop at the expense of landscapes.

---

# 09. Generated Construction Shapes

Standard construction derivatives should use generated family geometry wherever possible.

Supported families may include, where registry/Forge capability permits:

- slab;
- stair;
- wall;
- fence;
- pillar/post;
- beam;
- arch;
- roof wedge/tile;
- trim;
- grate;
- hatch/trapdoor;
- frame;
- ramp/slope;
- other canonical reusable shape families.

## 09.1 Material continuity

Derived shapes inherit the parent material's visual identity.

An oak stair should look like shaped oak, not like an unrelated green/brown “stair material.”

A stone pillar should remain recognisably the selected stone family.

## 09.2 Shape completeness

If a material family supports a canonical generated construction set, family members should share:

- density;
- edge language;
- material orientation rules;
- attachment logic;
- texture continuity;
- wear/state response.

## 09.3 No decorative divergence by default

A generated derivative should not acquire elaborate unique ornament merely because it is a different shape.

Culture/quality variants may layer approved ornament later.

---

# 10. Unique-Shaped Blocks

Unique-shaped blocks are justified when their function or silhouette is not adequately represented by a standard construction primitive.

Typical categories include:

- furnace;
- workbench;
- rune table;
- chest/crate/barrel;
- chute;
- conveyor;
- pipe;
- pump;
- machine casing;
- lantern;
- ward device;
- ritual anchor;
- trap;
- furniture;
- vessel fixture.

## 10.1 Unique does not mean maximal

Unique blocks should use the minimum geometry needed to communicate:

- orientation;
- use surface;
- input/output;
- access point;
- moving part;
- internal opening;
- hazard;
- state.

## 10.2 World-block relationship

Even unusual silhouettes must still visually belong to the same one-metre voxel space.

They may occupy partial volume, extend slightly, inset, span multiple cells or leave passable space only where footprint/collision authority permits.

---

# 11. Compound Models and Named Parts

A compound model is not an excuse to preserve every modelling layer as a runtime object.

Separate a part only when at least one is true:

- it animates independently;
- it opens/closes/toggles;
- it changes visibility by state;
- it accepts an attachment;
- it needs a distinct rendering material/class;
- it needs separate collision/interaction;
- it is reused as a canonical sub-asset;
- it requires independent damage or replacement;
- it anchors an effect/audio/interaction contract.

Otherwise, merge it into the static body at bake time.

## 11.1 Part naming

Part names must describe production function rather than arbitrary author history.

Good examples:

- `body`
- `lid`
- `door`
- `handle`
- `wheel_drive`
- `jaw_left`
- `jaw_right`
- `crank`
- `rune_ring`
- `blade`
- `mast_main`
- `rudder`

Avoid names such as `Cube007`, `part_new2`, `thing_left`.

---

# 12. Raw Resources, Materials and Components

Resource/item models should communicate **substance + processing state + rough scale**.

## 12.1 Raw resources

Raw forms should normally be less regular than processed forms.

Examples:

- stone chunk: irregular fractured mass;
- raw ore: host material + ore-bearing structure or separated ore chunk according to canon;
- clay lump: compressed organic/earthen irregularity;
- raw crystal: asymmetrical natural growth/fracture;
- fibre: bundled strands rather than a generic cube.

## 12.2 Processed materials

Processing should produce visible order:

- ingot: standardised cast/forged form;
- plate: flattened regular stock;
- rod: linear stock;
- wire: coiled or bundled thin stock;
- beam: squared structural timber;
- plank: sawn flat stock;
- brick: regular fired/masonry unit;
- gear: recognisable toothed mechanical component.

## 12.3 Manufacturing hierarchy

A processed form should not look more magical or ornate solely because it required more crafting steps.

Craftsmanship is expressed through:

- regularity;
- fit;
- finish;
- join quality;
- controlled edge treatment;
- tolerances;
- purposeful assembly.

---

# 13. Tools

Tools should communicate their working principle from silhouette.

## 13.1 Shared anatomy

Most hand tools resolve into:

- grip/handle;
- shaft/neck;
- working head;
- optional binding/guard;
- material transitions.

## 13.2 Tool-family distinction

At minimum:

- pickaxe reads as opposing/transverse mining head;
- axe reads as chopping blade offset from handle;
- shovel reads as broad digging blade;
- hammer reads as striking head;
- wrench reads as gripping/adjustment tool;
- chisel reads as short directed cutting/engraving form;
- rune tuner reads as magical adjustment/instrument form without collapsing into a generic wand.

## 13.3 Tier progression

Higher tiers should primarily show:

- stronger or more suitable material;
- improved construction;
- better hafting/binding;
- cleaner geometry;
- specialist functional refinement.

Do not represent tool tier as “same model with more spikes/glow.”

---

# 14. Weapons

Weapons should remain readable as usable physical objects before fantasy ornament.

## 14.1 Functional silhouette

The player should distinguish sword, spear, axe, bow, staff, shield and other approved weapon families at gameplay distance.

## 14.2 Blade and head thickness

Voxel stylisation permits slightly exaggerated thickness for readability and production robustness, but:

- swords should not become paddles;
- spearheads should not become giant decorative crystals unless canon requires it;
- bow limbs must preserve an open tension-bearing silhouette;
- staff foci should not make every staff top-heavy and identical.

## 14.3 Culture and magic overlays

Culture changes construction tradition, guard shape, wrapping, ornament and material assembly.

Magic changes approved functional signs such as rune channels, foci, crystal mounts or energy interfaces.

Neither should erase weapon family recognition.

## 14.4 First-person readability

Held weapons must preserve:

- clear working direction;
- unobstructed crosshair/central play space;
- plausible hand contact;
- enough visible form to identify the weapon;
- compatible attachment sockets for ART-05 animation.

---

# 15. Armour, Clothing-Adjacent Equipment and Wearables

ART-04 owns the hard-surface/model-production side of wearables; ART-05 owns body fit, rigging and character presentation.

Wearables include:

- helmets;
- pauldrons/guards where canon supports them;
- cuirass/plates;
- belts;
- backpacks;
- shields;
- tool harnesses;
- quivers;
- jewellery/foci with geometric presence;
- rigid footwear/gauntlet components;
- carried containers.

## 15.1 Body remains primary

Equipment should read as attached to a body rather than replacing the body's silhouette with an unrelated shell.

## 15.2 Material construction

Leather, cloth, wood, metal, bone, crystal and magical materials must retain ART-02 truth even when worn.

## 15.3 Layer discipline

Avoid unrestricted stackable geometry that causes:

- shoulder clipping;
- doubled thickness;
- hidden hands;
- unreadable character silhouette;
- animation collisions.

ART-05 will define final fit envelopes and attachment behaviour.

---

# 16. Presentation Projection Standard

Every asset class must declare which presentation projections it requires.

## 16.1 Placed/world presentation

Used when the object exists as a world-scale placed object or block.

Priority:

- correct footprint;
- orientation;
- neighbour relationships;
- interaction point;
- state readability;
- environmental contact.

## 16.2 Held presentation

Used in first/third-person hands.

May use:

- the same mesh with a held transform;
- a simplified mesh;
- a presentation-specific crop/scale;

but must preserve canonical silhouette/material identity.

## 16.3 Equipped presentation

Used on a character body.

Requires appropriate attachment/skeleton contracts and may use equipment-specific fit geometry.

## 16.4 Dropped presentation

Should be readable on terrain without requiring full placed scale.

Dropped forms may be:

- scaled presentation of the item;
- bundled form for tiny objects;
- canonical pickup proxy;

provided quantity/state is not falsely implied.

## 16.5 Inventory/icon source presentation

ART-08 owns final 2D presentation, but ART-04 must provide an icon-capture-ready source with:

- strong silhouette;
- sensible canonical orientation;
- minimal self-occlusion;
- stable framing bounds.

## 16.6 Preview/blueprint presentation

Large assets/structures may require miniature/ghost/projection models generated from source composition rather than separately hand-modelled substitutes.

---

# 17. Orientation and Canonical Front

Every directional asset must declare a canonical local front and up axis consistent with Forge/engineering conventions.

ART-04 does not hard-code engine-axis values where FORGE-ENG may define implementation coordinates, but it requires the following semantic contract:

- **front** = primary operating/visual forward direction;
- **up** = vertical standing direction;
- **right/left** = derived consistently;
- all rotations resolve from one canonical source orientation.

Separate source models for north/east/south/west are prohibited unless geometry genuinely differs by orientation.

---

# 18. Origins and Pivots

## 18.1 Origin principles

Default origins should make placement, rotation and authoring predictable.

Common choices include:

- centre-bottom for standing props;
- cell centre for full blocks;
- hinge edge for door moving parts;
- axle centre for wheels;
- rotation centre for cranks/gears;
- grip reference for handheld presentation helpers;
- vessel local frame origin as defined by vessel authority.

## 18.2 Pivot must describe motion

A moving part pivot belongs where the part physically rotates/slides.

Do not use animation offsets to disguise a badly placed pivot.

## 18.3 Pivot validation

The Forge should allow visual pivot testing through full intended ranges before approval.

---

# 19. Socket and Anchor Contract

Sockets/anchors exist to connect art to other authorised systems.

Potential categories include:

- hand grip;
- off-hand grip;
- equipment attachment;
- projectile origin;
- effect origin;
- audio source;
- interaction point;
- item input/output;
- fluid input/output;
- power/mechanical input/output;
- mana input/output;
- exhaust;
- light source;
- camera/reference point;
- seat/occupant anchor;
- rope/chain/sail anchor;
- vessel mount;
- tool working-end marker;
- construction/repair point.

## 19.1 No decorative sockets

A socket must have a documented consumer or valid future contract.

## 19.2 Stable socket names

Once a socket is part of an approved production contract, renaming/removing it is a compatibility change and must follow governance.

---

# 20. Held-Item Grip Contract

Every held tool/weapon/item requiring hand use must declare:

- primary grip;
- optional secondary grip;
- working direction;
- hand-clearance envelope;
- held scale;
- first-person visibility target;
- third-person attachment compatibility.

The model should be authored so grip transforms are **family-consistent**.

Per-item emergency offsets are allowed only as explicit compatibility data, not as the normal solution for inconsistent modelling.

The current POC's uniform held-tool transform is prototype evidence of the value of this rule, not immutable final art orientation law.

---

# 21. Doors, Hatches, Gates and Other Articulated Architecture

Articulated architecture must visually explain its movement and obstruction.

## 21.1 Door model requirements

A door family should define:

- frame relationship;
- leaf geometry;
- hinge side/pivot;
- handle/latch position;
- closed/open silhouette;
- obstruction clearance;
- material continuity;
- damage/repair surfaces where supported.

## 21.2 Multi-cell doors

Multi-cell doors remain one logical object where upstream canon says so.

Visual source should preserve:

- continuous construction across cells;
- one coherent hinge/movement contract;
- correct break/drop projection behaviour;
- paired state consistency.

## 21.3 Gates and portcullises

Large gates must communicate:

- support/frame;
- moving mass;
- travel path;
- locking/control mechanism where visible;
- safe opening clearance.

---

# 22. Furniture and Workstations

Furniture must first read as usable furniture.

## 22.1 Furniture grammar

A bed, chair, table, shelf, bench, storage piece or workstation should show:

- support;
- usable surface/volume;
- access side;
- occupant/work clearance;
- material assembly.

## 22.2 Workstation grammar

Workstations should visually explain the type of work performed through:

- work surface;
- tools/fixtures;
- storage/access;
- heat/pressure/motion zones where relevant;
- state-bearing areas;
- interaction direction.

## 22.3 Decorative clutter

Built-in decorative objects may support recognition, but should not falsely imply independent inventory/interactions.

---

# 23. Machines

Machines must read as **systems of functional masses**, not fantasy cubes with random gears.

A machine model should resolve:

1. structural body/frame;
2. input zone(s);
3. processing mechanism or believable housing;
4. output zone(s);
5. power/drive interface;
6. control/service access;
7. state-feedback area;
8. moving parts if required;
9. safety/guarding appropriate to culture/technology.

## 23.1 Visible mechanism rule

Not every internal mechanism must be exposed, but the exterior should provide enough logic that the machine's purpose and flow are believable.

## 23.2 Gear discipline

Gears are used when gear transmission makes sense. They are not a generic sign for “machine.”

## 23.3 Magical machines

Magical machinery still needs:

- structure;
- containment;
- energy path;
- control interface;
- service logic;
- material compatibility.

Magic can replace or alter a mechanical subsystem only where canon permits it.

---

# 24. Logistics and Network Components

Connected networks require stronger directional readability than ordinary props.

Covered families include:

- chute;
- conveyor;
- item pipe;
- fluid pipe;
- mana conduit;
- shafts/axles where implemented;
- splitters;
- mergers;
- filters;
- network junctions;
- hatches/endpoints.

## 24.1 Connection-mask modelling

Where the system supports automatic connections, use one source family resolved by connection masks rather than manually authoring unrelated north/east/T/cross assets.

## 24.2 Centre continuity

Straight, corner, T and cross states must share:

- aligned centreline;
- consistent channel width;
- rail/wall thickness;
- endpoint height;
- material family;
- readable flow direction where directional.

## 24.3 Closed-edge rule

Open transport surfaces should retain walls/guards on unconnected sides where function requires containment.

## 24.4 Endpoint handshake

Network geometry should visibly meet compatible machine/storage endpoints rather than stop short or overlap awkwardly.

---

# 25. Power and Motion Providers

Power devices such as cranks, wheels, wind systems, engines, rune engines or other approved providers must visually communicate:

- energy source;
- motion/energy direction;
- mounting/support;
- output interface;
- moving-part clearance;
- stopped/active state where relevant.

A water wheel without water contact, a windmill without blade clearance or an engine without a plausible output interface should fail art validation even if mechanically functional.

---

# 26. Magical Infrastructure

Magical objects should combine ordinary construction logic with supernatural function.

Examples include:

- rune tables;
- mana batteries;
- conduits;
- ward lanterns/obelisks;
- ritual anchors;
- enchanting stations;
- portal frames;
- spell turrets;
- arcane furnaces;
- magical storage/network devices.

## 26.1 Physical before emissive

The object must remain identifiable with emission reduced or disabled.

## 26.2 Containment and focus

Energy-bearing devices should show one or more of:

- containment frame;
- carved/assembled channel;
- focus crystal;
- rune surface;
- conduit path;
- aperture;
- ward boundary hardware;

as appropriate to canon.

## 26.3 Magic-family distinction

ART-06 will define exact effects, but ART-04 must provide geometry/support surfaces that allow magic families to remain distinct rather than using one universal glowing crystal socket.

---

# 27. Architecture Modules

Architecture modules must serve building composition, not fight it.

Typical modules include:

- wall segments;
- corners;
- pillars;
- arches;
- floors;
- ceilings;
- roofs;
- eaves;
- doors;
- windows;
- stairs;
- balconies;
- railings;
- supports;
- buttresses;
- bridges;
- platforms;
- docks;
- ladders;
- scaffolds;
- gates;
- decorative structural details.

## 27.1 Module join law

Module edges should support clean adjacency in the standard voxel grid.

Do not create decorative overhangs that routinely collide with neighbouring modules unless the family explicitly reserves that space.

## 27.2 Structural legibility

Even when gameplay does not fully simulate structural engineering, buildings should visually communicate:

- load path;
- support;
- span;
- opening reinforcement;
- foundation adaptation;
- material join logic.

## 27.3 Culture is a grammar overlay

Culture may alter:

- proportion;
- roofline;
- joinery;
- fenestration;
- ornament;
- support rhythm;
- civic symbols;
- preferred material combinations;

while preserving ART-04's common module usability and ART-03's culture rules.

---

# 28. Structure and Blueprint Composition

A building/structure should normally be a **composition of approved blocks, modules and compound assets**, not one monolithic sculpted mesh.

## 28.1 Composition-first rule

Use blueprint composition when the structure:

- participates in construction stages;
- can be damaged/repaired in parts;
- needs NPC traversal/use;
- supports material variants;
- may be upgraded;
- may be procedurally varied;
- needs world-grid interaction.

## 28.2 Monolithic exceptions

Large unique sculptural pieces may be compound assets when:

- their geometry cannot be meaningfully decomposed;
- they remain collision/interaction-safe;
- their performance is justified;
- they do not prevent required state/damage behaviour.

## 28.3 Blueprint semantics are upstream

ART-04 determines how placed visual components read. 22I/structure gameplay authority owns semantic blueprint layers, stages, routes, markers and construction logic.

---

# 29. Settlement Buildings

Settlement assets must support visible growth from ART-03 without requiring total asset replacement at each capability tier.

Prefer:

- reusable foundations;
- modular extensions;
- roof/material upgrades;
- attached service modules;
- expanded storage/work areas;
- walls/defences added around existing fabric;
- repaired/reused older structures;
- culture-appropriate incremental construction.

Avoid a progression model where every village becomes a set of increasingly ornate prefabs unrelated to earlier construction.

---

# 30. Ruins, Dungeons and Landmarks

Large authored sites should preserve evidence of original construction.

## 30.1 Ruin derivation

Where possible, a ruin should derive from:

- intact structural grammar;
- missing sections;
- collapsed pieces;
- exposed interior layers;
- weathering/state overlays;
- occupation additions;
- repair attempts;
- environmental intrusion.

Do not make “ruin” a separate generic cracked-stone model language.

## 30.2 Dungeon function

Doors, lifts, mechanisms, bridges, traps and architectural set pieces should remain spatially and mechanically legible.

## 30.3 Landmark silhouette

Major landmarks need recognisable long-range masses before local decoration.

---

# 31. Vehicles and Vessels — Global Model Rule

Vessels are **voxel-built functional structures that move**, not oversized props.

ART-04 inherits Set 26's separation between:

- vessel blueprint;
- resolved construction/material intake;
- construction project;
- commissioned vessel instance;
- runtime mutable state.

ART-04 owns how vessel components and assembled visual form should read; Set 26 owns vessel structural, buoyancy, propulsion, navigation, damage and commissioning law.

## 31.1 Vessel construction language

A vessel model should visibly resolve:

- hull/body;
- deck or operating surfaces;
- superstructure;
- openings/hatches;
- propulsion elements;
- steering elements;
- cargo/crew function where visible;
- mounts/fixtures;
- realm/culture/material construction;
- maintenance/repair access;
- damage/flood/fire response geometry where supported.

## 31.2 Block identity remains stable

A plank used in a ship remains that plank unless upstream canon defines a special vessel-specific object.

Vessel Forge should reference canonical blocks/components rather than duplicate them solely because they are mounted on a vessel.

---

# 32. Vessel Structural-Visual Roles

Where Set 26 defines structural roles, art should reinforce them without pretending the visual layer is the structural solver.

Visual differentiation may support recognition of:

- primary hull/shell;
- keel/frame/support;
- deck/bulkhead;
- superstructure;
- mast/rig foundation;
- propulsion mount;
- steering foundation;
- armour/reinforcement;
- critical service area;
- decorative/excluded element.

Do not rely on colour alone for critical structural distinction.

---

# 33. Masts, Sails, Ropes and Other Flexible Systems

Flexible vessel systems must be authored as controlled topology, not thousands of free physical micro-elements.

ART-04 source responsibilities may include:

- rigid mast/spar geometry;
- named sail surfaces;
- rope/line anchors;
- control groups;
- reef/furl visual groups;
- damage sections;
- LOD representations;
- clearance envelopes.

ART-05/06/engineering own final animation/cloth/wind implementation.

## 33.1 Readable rigging

Rigging should clarify how propulsion/control works, not become impenetrable visual spaghetti.

---

# 34. Modular Reuse and Sub-Asset Libraries

Reusable sub-assets are encouraged when they preserve identity and reduce drift.

Candidates include:

- handles;
- hinges;
- latches;
- knobs;
- standard fasteners;
- wheel families;
- gear families;
- pipe collars;
- machine feet;
- crates/barrels;
- lantern housings;
- generic rope/chain anchor hardware;
- architectural brackets;
- vessel cleats/bollards;
- approved rune-carrier plates.

## 34.1 No universal kitbash soup

A reusable sub-asset should have a documented family/context.

Do not place the same hinge, wheel or metal band on every culture, realm and technology tier when construction grammar should differ.

---

# 35. Directional and Connected Components

Directional models must declare:

- canonical front;
- legal rotations;
- connection faces;
- input/output semantics where visually relevant;
- mirrored-state rules;
- neighbour-driven geometry rules;
- default placement preview.

## 35.1 Rotation is data, not source duplication

Create one canonical source orientation and rotate at resolution/bake/runtime where possible.

## 35.2 Mirroring

Mirror only when the asset's construction, text/symbols, handedness, hinge or function remains valid.

A mirrored model that creates backwards runes, impossible locks or wrong-handed tools is invalid.

---

# 36. Multi-Cell Footprints

Every asset larger than one standard placement cell must have an explicit footprint.

The footprint may define:

- occupied cells;
- reserved empty cells;
- doorway/pass-through cells;
- interaction clearance;
- moving-part clearance;
- service clearance;
- visual-only overhang;
- support-required cells;
- placement anchor cell.

## 36.1 Visual footprint agreement

The visible model must agree with the actual footprint closely enough that players can understand placement and traversal.

Invisible blocked space should be exceptional and justified.

---

# 37. Collision, Selection and Occlusion

## 37.1 Collision simplification

Visual complexity and collision complexity are separate.

Default collision should use the simplest shapes that preserve expected movement and interaction.

Avoid per-authoring-voxel runtime collision for normal assets.

## 37.2 Collision must respect openings

Doors, arches, ladders, furniture, machine gaps and vessel passages should not use crude full-box collision when the opening is intended to be traversable/interactive.

## 37.3 Selection bounds

Selection/target bounds may be slightly more forgiving than exact geometry but must not create misleading targeting far outside the visible object.

## 37.4 Occlusion and culling

Hidden internal faces should be removed or merged where safe.

Transparent/cutout/special materials must follow their own culling rules without creating invisible collision or missing exterior surfaces.

---

# 38. State-Bearing Geometry

Runtime state should be represented by the least expensive correct mechanism.

Priority:

1. material/state channel;
2. visibility toggle;
3. transform of existing part;
4. bounded additional geometry;
5. full model variant only when necessary.

Examples:

- powered light: material/emission state;
- chest open: lid rotation;
- furnace burning: interior plane/VFX + state material;
- broken lever: part transform/visibility;
- damaged wall: bounded state geometry or blueprint damage delta;
- flooded vessel: runtime state/VFX, not a new “wet ship” source model.

---

# 39. Damage, Repair, Wear and Restoration Geometry

ART-02 owns surface-state language. ART-04 owns geometry preparation when geometry materially changes.

## 39.1 Damage should follow construction

Examples:

- timber: split, broken member, missing section;
- stone: chipped edge, fractured block, collapsed course;
- metal: bent panel, missing plate, warped mechanism;
- glass: broken pane/open frame;
- machine: detached guard, jammed/bent moving part;
- vessel: breached hull section, broken mast, damaged rudder.

## 39.2 Repair is not always pristine reset

Where canon supports visible history, repaired geometry may preserve:

- replacement boards;
- patches;
- braces;
- mismatched but compatible material;
- repaired masonry;
- weld/rivet/strap evidence;
- magical stabilisation hardware.

## 39.3 Damage groups

Large assets should expose meaningful damage groups rather than one global destroyed mesh when gameplay supports partial damage.

---

# 40. Animation Preparation Boundary

ART-04 prepares geometry for ART-05/21C animation.

Preparation includes:

- named moving parts;
- correct pivots;
- attachment sockets;
- clear transform ranges;
- no accidental geometry fusion across moving seams;
- material/state channels;
- stable origin;
- clearance envelopes;
- documented rest pose/orientation.

ART-04 does not define final timing, easing, locomotion, attack choreography or character performance.

---

# 41. Geometric Performance and LOD

The final runtime model should spend geometry where it changes perception or function.

## 41.1 Geometry budget principles

Prioritise geometry for:

- silhouette;
- major openings;
- moving parts;
- gameplay ports;
- hands/grips;
- focal magical/functional mechanisms;
- distinctive architectural profiles.

Prefer textures/material channels for:

- shallow seams;
- grain;
- scratches;
- small rivets;
- fine rune engraving unless it requires emission/depth silhouette;
- tiny decorative repetition.

## 41.2 Static merge

Static compound parts should be merged during bake where it does not break:

- state changes;
- material class;
- collision;
- attachment;
- reuse;
- damage groups.

## 41.3 LOD strategy

LOD should preserve in order:

1. overall mass;
2. functional orientation;
3. major negative space;
4. material grouping;
5. state readability;
6. secondary detail.

Do not simplify a machine into a generic cube if its functional silhouette can be retained cheaply.

## 41.4 Low-end profile

Low-end rendering may reduce:

- micro geometry;
- hidden internal detail;
- far moving-part complexity;
- decorative sub-parts;

but must preserve:

- identity;
- interaction affordance;
- critical state;
- hazard readability;
- route/traversal geometry.

---

# 42. Culture, Realm and Biome Variation at Model Level

Variation follows ART-03 and 21D inheritance rules.

## 42.1 Base form first

A canonical functional family should have a stable base logic before culture/realm variants are created.

## 42.2 What may vary

Approved variation may alter:

- proportion within functional bounds;
- support arrangement;
- joinery;
- guard/frame shape;
- ornament-bearing parts;
- material combination;
- roof/edge treatment;
- handle/fixture family;
- culture-specific sub-assets;
- realm-adaptation components;
- weather/condition geometry where justified.

## 42.3 What must remain stable

Variation must preserve:

- gameplay footprint unless variant authority says otherwise;
- required sockets;
- required ports;
- interaction zone;
- working direction;
- state contract;
- family recognisability;
- collision compatibility where an override promises compatibility.

---

# 43. Procedural Model Variation

Procedural variation must be deterministic and bounded.

Permitted examples:

- board arrangement;
- non-critical brace choice;
- small chipped corners;
- crate slat arrangement;
- barrel band variation;
- approved roof-edge variation;
- machine panel plate arrangement;
- sail patch pattern;
- culture-approved ornament slot selection.

Not permitted without explicit authority:

- changing functional port positions;
- changing weapon family;
- changing structural footprint;
- removing required controls;
- changing vessel propulsion type;
- randomising door hinge semantics where gameplay depends on them;
- randomising magic school identity;
- randomising material family.

---

# 44. Family Completeness

When an asset is part of a governed family, production should consider the whole family rather than approving one isolated hero asset.

Family completeness may include:

- block + slab + stair + wall + pillar derivatives;
- tool tier family;
- metal-processing family;
- machine frame/component family;
- chest/crate/barrel storage family;
- door/hatch/gate family;
- pipe/chute junction family;
- armour set family;
- vessel module family;
- culture architecture kit.

A family review checks both **consistency** and **necessary differentiation**.

---

# 45. Registry and Asset-Source Integration

Every approved source model must resolve to authoritative registry/presentation records.

The art source should carry or resolve references for:

- stable gameplay identity;
- presentation identity where separate;
- parent visual family;
- material roles;
- source revision;
- required projections;
- footprint;
- pivots;
- sockets;
- connection masks;
- collision profile;
- state channels/parts;
- LOD products;
- icon capture bounds;
- dependency records;
- override/variant provenance.

## 45.1 No filename identity

A filename/path is not the canonical identity.

Renaming/moving source files should not create a new gameplay object.

---

# 46. Source-to-Runtime Bake Contract

Editable Forge source is not the runtime product.

The bake pipeline should derive, as applicable:

- merged static mesh;
- retained moving-part meshes;
- material bindings;
- texture resources;
- simplified collision;
- occlusion/culling data;
- presentation transforms;
- icon/preview capture source;
- LODs;
- connection-state products;
- model/state metadata;
- validation report;
- reproducible source/product hashes.

## 46.1 Reproducibility

Given the same approved source revision, configuration and bake version, the output should be reproducible.

## 46.2 Runtime products are disposable

Baked products may be regenerated. The editable source, authority references and revision history are the production truth.

---

# 47. Model Validation Categories

Every production model should be checked against applicable categories.

## 47.1 Identity

- correct canonical ID/reference;
- correct family;
- correct presentation class;
- correct material/culture/realm inheritance.

## 47.2 Visual

- silhouette readable;
- material truth preserved;
- detail hierarchy controlled;
- no accidental floating/intersection;
- canonical front readable;
- family relationships coherent.

## 47.3 Spatial

- correct scale;
- footprint agreement;
- collision fit;
- passable openings remain passable;
- moving-part clearance;
- selection bounds reasonable.

## 47.4 Contract

- required pivots present;
- required sockets present;
- connection faces valid;
- animation parts separable;
- state parts/channels present;
- presentation projections available.

## 47.5 Performance

- static merge opportunities resolved;
- hidden/internal geometry bounded;
- LOD prepared where required;
- transparent/special surfaces justified;
- no accidental microvoxel runtime explosion.

## 47.6 Variant compatibility

- inherited variants do not break footprint;
- culture/realm variants retain function;
- deterministic variants reproduce;
- state geometry composes safely.

---

# 48. Forge Model Test Laboratory

The Forge should provide a repeatable model-review laboratory capable of showing an asset in representative contexts.

At minimum, the laboratory should support:

- neutral turntable/front-side-back review;
- one-metre grid overlay;
- neighbouring-block test;
- bright/neutral/dark lighting;
- held-hand preview;
- dropped-on-ground preview;
- icon camera preview;
- collision overlay;
- selection bounds;
- pivot visualisation;
- socket visualisation;
- directional rotation cycling;
- connection-mask cycling;
- state cycling;
- damage/repair preview;
- culture/material variant comparison;
- LOD distance preview;
- low-end rendering profile preview;
- blueprint/vessel context insertion where relevant.

## 48.1 POC Visual Test Room inheritance

The existing POC Visual Test Room proves the value of a consolidated catalogue review scene. ART-04 promotes that concept into a formal future Forge model-test workflow rather than preserving the POC's placeholder models as final style authority.

---

# 49. Codex Model-Production Procedure

For a new model task, Codex should follow this sequence.

1. Resolve the canonical gameplay/content identity.
2. Resolve required presentation projections.
3. Resolve parent visual family and material DNA.
4. Resolve realm/biome/culture overlays if applicable.
5. Resolve gameplay footprint, direction, connections, ports and state requirements.
6. Select Forge authoring mode.
7. Establish one-metre scale and source bounds.
8. Block out silhouette and negative space.
9. Validate front, use direction and major contact points.
10. Add material boundaries and construction logic.
11. Separate only necessary moving/state/attachment parts.
12. Place pivots and required sockets.
13. Prepare collision/selection/clearance guides.
14. Prepare held/dropped/equipped/icon projections where required.
15. Add bounded culture/realm/detail variation.
16. Prepare damage/state geometry where canon requires it.
17. Run model laboratory validation.
18. Run family comparison against golden references.
19. Bake test product.
20. Validate registry and source/product metadata.
21. Record decisions, deviations and any escalation in the work log.
22. Submit for ART-10 certification when the asset/family reaches the appropriate gate.

Codex must not begin with surface decoration before completing silhouette, scale and contract resolution.

---

# 50. Codex Escalation Rules

Codex must stop and raise an art/governance question rather than inventing a solution when:

- no canonical identity can be resolved;
- two upstream authorities disagree on physical form;
- required gameplay footprint is unknown;
- an asset would require changing gameplay IDs merely for presentation convenience;
- required socket/port semantics are unclear;
- culture/realm variation would alter function;
- a weapon/tool family lacks enough canon to determine working anatomy;
- a magical object would require inventing a new magic language;
- a vessel design would imply new structural/propulsion capability;
- a requested model cannot fit the approved authoring density/performance envelope;
- collision requirements conflict with visible geometry;
- an override would break a compatibility contract;
- damage/repair behaviour is undefined but required;
- the asset requires a new model class or source pipeline.

Codex may make bounded aesthetic decisions only inside already-approved visual and functional envelopes.

---

# 51. Golden Model Reference Programme

ART-10 should eventually certify a model reference set covering at least the following.

1. Ordinary full terrain/material block.
2. Complete generated construction family in one material.
3. Unique functional block.
4. Chest/crate storage object.
5. Open connected chute family: straight, corner, T and cross.
6. Ordinary furnace.
7. Magical furnace/device counterpart.
8. Raw resource → processed stock family.
9. Tool family across at least three capability/material tiers.
10. Melee weapon.
11. Bow/ranged weapon.
12. Shield/backpack/equipment attachment.
13. Furniture/workstation family.
14. Mechanical machine with moving parts.
15. Mana/network infrastructure family.
16. Door/hatch/gate articulated architecture.
17. Culture-specific architecture kit.
18. Settlement building with upgrade/damage/repair states.
19. Ruin derived from intact construction grammar.
20. Dungeon/landmark mechanism.
21. Small vessel/workboat.
22. Medium vessel with compartments, propulsion and steering visuals.
23. Magitech vessel adaptation.
24. Held/dropped/icon projection comparison board.
25. LOD/low-end comparison board.

Golden assets are not universal templates to copy blindly. They are validated examples of the rules.

---

# 52. Model Review Scorecard

A model/family may be scored across six dimensions:

| Dimension | Question |
|---|---|
| Identity | Is it recognisable as the canonical thing and its family? |
| Material | Does construction preserve ART-02 material truth? |
| Function | Can a player infer front/use/flow/opening/support where relevant? |
| World Fit | Does it belong to the Leyforge voxel scale and ART-01 style? |
| Contract | Are footprint, pivots, sockets, states and projections correct? |
| Efficiency | Is complexity spent where perception/function requires it? |

A beautiful model that fails function/contract is not production-ready.

A technically valid model that fails identity/world fit is not art-ready.

---

# 53. ART-04 Decision Register

The following decisions are proposed for owner lock.

| ID | Decision |
|---|---|
| ART04-D001 | Leyforge models must read as voxel-world-native assets rather than imported smooth-model assets. |
| ART04-D002 | One-metre world cells remain the default spatial block grammar. |
| ART04-D003 | 32 authoring voxels per one-metre block remains the standard high-detail modelling density, but is not a requirement to fill the volume. |
| ART04-D004 | Authors must choose the simplest Forge source mode capable of expressing the asset correctly. |
| ART04-D005 | Ordinary full blocks should remain surface-led generated cubes unless geometry is functionally justified. |
| ART04-D006 | Standard construction derivatives should use generated shape families and preserve parent material identity. |
| ART04-D007 | Unique voxel geometry is justified by silhouette/function, not by a desire to make every object special. |
| ART04-D008 | Compound parts remain separate only for motion, state, attachment, rendering, collision, damage or reuse needs. |
| ART04-D009 | Silhouette, mass, negative space and functional direction precede micro-detail. |
| ART04-D010 | Models must visibly contact their supports/attachments unless intentional suspension is canonical. |
| ART04-D011 | Gameplay identity and presentation identity remain separate; art projections do not create duplicate gameplay objects. |
| ART04-D012 | World, held, equipped, dropped, icon-source and preview forms are coordinated projections of canonical identity. |
| ART04-D013 | Raw materials should generally read less regular than processed stock; processing increases visible order and fit rather than arbitrary ornament. |
| ART04-D014 | Tool tiers communicate material and construction improvement rather than spikes, glow or decorative escalation. |
| ART04-D015 | Weapon family remains readable before cultural/magical ornament. |
| ART04-D016 | Equipment is authored as body-attached construction and must remain compatible with ART-05 fit/rig rules. |
| ART04-D017 | Directional assets use one canonical source orientation wherever possible rather than separate rotation models. |
| ART04-D018 | Moving-part pivots must correspond to physical motion centres; animation offsets are not a normal fix for bad pivots. |
| ART04-D019 | Sockets/anchors must represent documented production contracts and become compatibility-sensitive once approved. |
| ART04-D020 | Held assets require stable family-consistent grip, working direction and clearance contracts. |
| ART04-D021 | Machines must communicate structural body, flow, mechanism/housing, energy interface, controls/service access and state feedback. |
| ART04-D022 | Gears and magical crystals are functional elements, not generic visual shorthand for “machine” or “magic.” |
| ART04-D023 | Connected networks use connection-mask families and aligned centre/endpoint grammar rather than unrelated manually built junctions. |
| ART04-D024 | Architecture modules must compose cleanly on the voxel grid and communicate support before decoration. |
| ART04-D025 | Buildings/structures should normally be compositions of approved blocks/modules/assets when construction, damage, upgrade or traversal matters. |
| ART04-D026 | Ruins should derive from intact construction grammar rather than use a universal ruined style. |
| ART04-D027 | Vessels are voxel-built functional structures that move; ART-04 does not override Set 26 vessel simulation/structural authority. |
| ART04-D028 | Vessel construction reuses canonical blocks/components unless upstream authority explicitly defines vessel-specific identities. |
| ART04-D029 | Flexible rigging/sails/lines use controlled topology and anchors rather than unconstrained micro-physics geometry. |
| ART04-D030 | Multi-cell models require explicit occupied/reserved/passable/clearance footprint information. |
| ART04-D031 | Visual collision complexity and physics collision complexity are separate; use simplified collision that preserves expected openings and movement. |
| ART04-D032 | Runtime state should use material channels/toggles/transforms before full alternate models wherever practical. |
| ART04-D033 | Damage geometry must follow material/construction logic; repair may preserve visible history where canon supports it. |
| ART04-D034 | LOD and low-end simplification must preserve identity, functional orientation, critical state and traversal. |
| ART04-D035 | Procedural model variation must be deterministic and may not alter hidden function, required ports, footprint or canonical family. |
| ART04-D036 | Every approved model must resolve stable identity, visual family, source revision, required projections, spatial contracts and validation metadata. |
| ART04-D037 | Editable Forge source is production truth; baked runtime products are reproducible derivatives. |
| ART04-D038 | Model QA must test neutral view, world context, held/dropped/icon context, collision, pivots, sockets, directions, connections, states, LOD and relevant variants. |
| ART04-D039 | Codex must complete identity/scale/silhouette/contracts before surface decoration. |
| ART04-D040 | Codex must escalate when physical form, gameplay footprint, sockets/ports, magic language, vessel capability or compatibility rules cannot be resolved from authority. |

---

# 54. Cross-Document Boundary Map

## ART-01

Owns:

- global voxel/stylisation language;
- silhouette hierarchy;
- detail density philosophy;
- readability;
- final global visual identity.

ART-04 turns those rules into model-production constraints.

## ART-02

Owns:

- Material DNA;
- palettes;
- surface language;
- state/wear/material response;
- transparency/emission/shader art rules.

ART-04 determines where those materials exist physically on models and when geometry changes are required.

## ART-03

Owns:

- world/realm/biome/culture/architecture direction;
- settlement morphology;
- environment composition;
- culture construction grammar.

ART-04 produces the blocks, modules, structures, equipment, machines and vessel model families required to instantiate those environments.

## ART-05

Will own:

- character/creature body stylisation;
- skeleton/rig presentation law;
- character equipment fit;
- locomotion/action animation style;
- first/third-person character motion;
- creature motion language.

ART-04 hands ART-05 clean equipment/tool parts, grips, pivots and attachment contracts.

## ART-06

Will own:

- particles;
- magical VFX;
- environmental VFX;
- lighting/effect choreography;
- effect scale/timing.

ART-04 provides effect sockets and compatible geometry.

## ART-07

Will own:

- sound identity and production.

ART-04 provides audio/impact/mechanism anchor positions where required.

## ART-08

Will own:

- final inventory icons;
- 2D presentation;
- UI/map/codex visual language.

ART-04 provides stable icon-capture models/bounds and miniature sources.

## ART-09

Will own:

- full Codex/The Forge execution workflow;
- manifests;
- automation;
- generation/reporting contracts;
- source-to-bake orchestration.

## ART-10

Will own:

- golden reference certification;
- visual QA thresholds;
- production acceptance and audit evidence.

---

# 55. Source Crosswalk

| ART-04 area | Primary upstream source |
|---|---|
| Authoring modes, 32-per-metre density, voxel/compound modelling | 21B |
| Generated shapes, unique blocks, compound parts | 21B |
| Collision, placement, origins, pivots, sockets | 21B |
| Item/held/dropped/icon projections | 21B + 21D + current registry canon |
| Stable gameplay/presentation identity and variants | 21D + FCC-13 |
| Blueprint composition, stages, states, preview products | 22I |
| Material inheritance | ART-02 + 21B/21D |
| Realm/culture modelling overlays | ART-03 |
| Character/equipment integration boundary | Set 22 + ART-05 future authority |
| Vessel visual composition and structural role handoff | Set 26F/26I |
| Vessel construction/repair/damage handoff | Set 26H/26L |
| Final global visual hierarchy | ART-01 |
| POC test-room/held-model evidence | POC Manual Testing Guide, prototype evidence only |

---

# 56. Principal Source Basis

ART-04 was drafted from the current Leyforge authority state, especially:

- ART-00 — Art Production Constitution & Authority Map;
- ART-01 — Master Leyforge Visual Language & Style Bible;
- ART-02 — Materials, Colour, Texture, Surface & Shader Art Standard;
- ART-03 — World, Realm, Biome, Architecture & Culture Art Direction;
- Document 21B — Voxel Asset Forge: Voxel Modelling, Texturing and Material Authoring;
- Document 21D — Voxel Asset Forge: Asset Overrides, Variants and Registry Integration;
- Document 22I — Blueprint Forge: Building, Structure and World Blueprint Authoring;
- Document Set 26 vessel architecture, shipwright and Vessel Forge authority;
- current FCC-12/13/14 material/form/projection/stable-identity authority;
- current block/object/item registries;
- current POC Manual Testing Guide as prototype/migration evidence, not final style authority.

Key inherited production concepts preserved here include:

- one-metre default blocks;
- 32-authoring-voxels-per-metre standard density;
- painted-face ordinary blocks;
- generated construction geometry;
- voxel volumes for unique silhouettes;
- compound named parts only where justified;
- merged runtime geometry;
- simplified collision;
- placement footprints;
- stable pivots/sockets;
- multiple presentations from one source family;
- parent/inheritance/override resolution;
- blueprint definition/instance separation;
- deterministic variants;
- vessel blueprint/instance separation;
- vessel structural-role and component contracts.

---

# 57. ART-04 Acceptance Gate

ART-04 is ready for owner lock when the owner agrees with this statement:

> **Leyforge models are built as readable voxel-world-native objects whose geometry serves identity, material, function and interaction before decoration. One-metre world scale and 32-per-metre source density provide a shared production grammar without forcing microvoxel complexity. Ordinary blocks remain simple; generated families preserve material inheritance; unique and compound models exist only when silhouette, motion, state, attachment or function justify them. One canonical gameplay identity may generate coordinated placed, held, equipped, dropped, icon-source and preview products without creating duplicate gameplay definitions. Machines, networks, architecture and vessels visually explain how they work while remaining subordinate to gameplay and structural authority. Pivots, sockets, collision, footprints, connection masks, state parts, damage geometry and LOD are explicit production contracts. Codex must resolve identity, scale, silhouette and contracts before detail, use deterministic bounded variation, and escalate instead of inventing unresolved function or canon.**

If accepted, ART04-D001 through ART04-D040 become the locked global model-production baseline unless superseded through ART-00 governance.

---

# 58. Next Document

After ART-04 lock, continue to:

## ART-05 — Characters, Creatures, Rigging & Animation Style Handoff

ART-05 should convert ART-01–04 and Set 22's technical capability into final production direction for:

- humanoid body proportions and stylisation;
- ancestry/personhood-safe variation;
- faces and expression readability;
- hands/feet and equipment contact;
- creature anatomy and silhouette;
- skeleton selection and rig presentation;
- joints and deformation style;
- IK and contact expectations;
- first-person/third-person body relationship;
- idle/locomotion/work/combat/casting animation language;
- weight, timing and exaggeration;
- creature locomotion;
- boss motion hierarchy;
- hurt/death/condition animation;
- animation LOD;
- equipment attachment and grip behaviour;
- Codex animation-generation rules;
- golden character/creature animation references.

---

# 59. End Statement

ART-04 closes the global physical-model gap between Leyforge's final art language and its entity/animation/effect production pipeline.

The intended production result is:

> **Codex should be able to receive a request such as “produce the canonical Hearthland iron pickaxe,” “build a Moonroot Court oak storage chest variant,” “author the Basic Item Chute family,” “model an Ashen rune-powered pump,” “construct a Reefward coastal workboat blueprint presentation,” or “create the intact and damaged visual family for a stone watchtower,” then resolve the correct authority, build the geometry at the correct scale, preserve material and cultural inheritance, expose required pivots/sockets/footprints/states, generate all required presentation products, pass the Forge model laboratory and produce a reproducible runtime bake without inventing new gameplay behaviour.**

---

**End of ART-04 v0.1**
