# Fantasy Voxel Civilisation Sandbox - Document Set 28

## 28I - Voice, Localisation, Accessibility, UI and Presentation

**Version 0.1 - Social Presentation, Dialogue Voice, Localisation and Accessibility Design Bible Draft**

**Document Set:** 28 - Dialogue, Social Systems and Companions  
**Governing Contract:** Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0  
**Depends On:** 28A, 28B, 28C, 28D, 28E, 28F, 28G, 28H, Document 17, Presentation Forge 23F/23G and the current canonical Leyforge source set  
**Project Lead and Final Authority:** Ash

> **Social-Presentation Statement**  
> Leyforge's social systems must remain fully understandable whether the player hears every line, hears no dialogue audio at all, uses another product language, reads slowly, uses a controller, relies on captions or narration, plays split-screen, or disables optional generative features. Authoritative social meaning is resolved by Documents 28A-28H and the owning gameplay systems; 28I turns that meaning into readable, localisable, accessible audiovisual presentation without creating new social truth. Text completeness is mandatory. Voice is an enhancement, not a gameplay dependency. Product localisation is separate from in-world language simulation. Critical meaning is never communicated through one sensory channel alone.

# Revision History

| Version | Status | Summary |
| --- | --- | --- |
| 0.1 | Social Presentation Foundation Draft | Establishes dialogue presentation architecture, specialist UI contracts, voice-coverage strategy, casting/recording governance, subtitle and caption rules, lip-sync hooks, localisation workflow, dubbing, accessibility requirements, multiplayer/split-screen presentation, Godot/Summer implementation direction, validation, production staging and Cross-Set Interface Amendments. |

# Document Purpose

Document 28I defines **how authoritative social meaning becomes text, voice, subtitles, captions, conversation UI, audiovisual performance and accessible player feedback**.

Documents 28A-28H already own the social facts and decisions that presentation must respect:

- **28A** establishes Set 28 ownership, social state, interfaces and the rule that presentation does not become authority.
- **28B** owns active conversation sessions, participants, topics, intents, choices, interruption, resumption and semantic commit flow.
- **28C** owns knowledge, beliefs, rumours, lies, comprehension, languages and information propagation.
- **28D** owns relationships, social memory interpretation, friendship, rivalry, family, romance and interpersonal commitment.
- **28E** owns persuasion, negotiation, intimidation, etiquette and diplomacy resolution.
- **28F** owns companion membership, recruitment, social autonomy and standing permissions.
- **28G** owns orders, delegated assignments, reporting and off-screen social accountability.
- **28H** owns authored/systemic/procedural/AI-assisted dialogue governance and explicitly hands localisation, voice and final language presentation to 28I.

Document 17 already defines Leyforge's general UI/UX philosophy: world-first presentation, progressive disclosure, controller-ready interaction, accessible feedback, localisable text and trustworthy reason codes. Presentation Forge Documents 23F and 23G already own Sound Event authoring, audio source provenance, spatial sound, acoustics, buses, runtime mixing, captions for general sound events and voice budgets. Those documents explicitly defer **full dialogue recording, voice casting, performance management, lip-sync and voice localisation**. 28I fills that specialist social-presentation gap while continuing to consume Presentation Forge rather than replacing it.

The result is a social experience that can scale from a short worksite bark to a multilingual diplomatic council, from a fully authored story scene to systemic village dialogue, and from a single local player to split-screen or networked co-op without coupling game truth to a particular audio file, language, font, camera or input device.

# Design Sources and Responsibility Updates

| Source | Direction Preserved by 28I | 28I Relationship |
| --- | --- | --- |
| 00 - Master Game Design Bible | Living NPC civilisations, warm and dangerous fantasy tone, player freedom, meaningful relationships and polished presentation. | Social presentation must make named people emotionally readable without turning dialogue into a detached cinematic system. |
| 01 - Core Gameplay Loop | Talk, trade, learn, negotiate, recruit and react inside an uninterrupted sandbox world. | Conversation UI is responsive and contextual; presentation never hides the world-state consequences of interaction. |
| 02 - Player Progression | Social skills, knowledge, leadership and reputation affect interaction, but no classic Charisma attribute exists. | 28I displays eligible outcomes and feedback without creating a competing social-stat layer. |
| 07 - NPC Village System | Named persistent people have jobs, schedules, memories, households and world history. | Speaker identity, role and context are presented from authoritative NPC records; voice assets do not define identity. |
| 13 - Races, Peoples, Cultures and Factions | Culture, language, law, names, customs and political identity are separate world definitions. | 28I uses culturally appropriate terminology/performance while avoiding caricature and preserving localisation independence. |
| 15 - Quest and Event System | Dialogue carries discoveries, requests, warnings, negotiations and consequences tied to real world state. | Quest/event semantics supply content; 28I handles readable presentation, transcript/history and accessibility. |
| 17 - UI/UX System | World-first, knowledge-aware, localisable, controller-ready, accessible UI with progressive disclosure and captions. | Document 17 remains general UI authority; 28I defines specialist social/dialogue presentation patterns and required data. |
| 18 v0.2 / current Technical Direction | Godot/Summer, stable IDs, authoritative commands/events, view models, local player settings and low-end scalability. | 28I remains data-driven, presentation-only and compatible with local/client language rendering. |
| 22 Entity Forge | Characters expose rigs, sockets, animation capability and presentation attachments. | 28I specifies mouth/head/face/gesture contracts; Entity/Animation systems own the actual rig implementation. |
| 23F - Sound Forge | Sound sources, audio events, source provenance, variation, event lifecycle, mouth socket and caption metadata. | 28I supplies dialogue-specific speech assets/metadata into Sound Forge; 23F owns canonical audio-event authoring/bake. |
| 23G - Runtime Audio | Spatialisation, acoustics, bus hierarchy, mix snapshots, voice budgets, caption dispatch and sensory equivalents. | 28I requests speech categories/priorities and provides dialogue caption semantics; 23G owns final runtime audio rendering/mix. |
| 25 - Production Governance | Stable IDs, package admission, provenance, rights, review gates, localisation status and source integrity. | Voice/localisation content follows Set 25 provenance and review requirements. |
| 28B | Conversation runtime exposes semantic state, text/localisation references, participants, choices, reason codes and interruption state. | 28I renders those states; UI cannot commit a choice except through 28B's command path. |
| 28C | Product-language comprehension is distinct from in-world language ability. | 28I localises the player's product UI while visibly representing 28C comprehension, translation and uncertainty. |
| 28D | Relationship dimensions and hidden social states remain authoritative. | Presentation exposes only permitted summaries, milestones and visible cues; it never reveals secret exact values by accident. |
| 28E | Social resolution produces outcomes, blockers, conditions and reasons. | 28I explains those outcomes without recalculating them or turning wording quality into a hidden social check. |
| 28F | Companion membership, role, availability and permissions are authoritative. | Companion dialogue panels and callouts display only exposed companion state. |
| 28G | Assignment status, evidence and reports are authoritative. | Mission reports and companion messages use readable presentation over validated assignment data. |
| 28H | Meaning-first dialogue, deterministic fallback, language-neutral semantics, optional runtime generation. | 28I owns final product-language realisation policy, localisation QA, voice selection and audiovisual display. |
| Cross-Set Register | Set 27 owns economy; Set 29 owns survival/health; Set 30 owns movement/traversal. | 28I may display their read-only outputs in social UI but never computes prices, health, travel or capacity. |

# Static Table of Contents

1. Locked Social-Presentation Identity  
2. Ownership Boundaries and Anti-Duplication Rules  
3. Locked Decision Summary  
4. Social Presentation Pipeline  
5. Presentation Payload and View-Model Contract  
6. Conversation Presentation Modes  
7. Standard Conversation Layout  
8. Speaker Identity, Role and Knowledge-Aware Labels  
9. Dialogue Intent and Choice Presentation  
10. Consequence, Requirement and Reason Presentation  
11. Hidden, Redacted and Unavailable Choice Rules  
12. World-Continuous Dialogue and Camera Policy  
13. Interruption, Suspension, Resumption and Timeout Presentation  
14. Dialogue History, Transcript and Search  
15. Ambient Speech, Barks and Speech-Bubble Policy  
16. Multi-Person Conversations and Turn Readability  
17. Councils, Trials, Diplomacy and Group-Social Interfaces  
18. Voice Coverage Strategy  
19. Voice Source Classes, Provenance and Rights  
20. Character Voice Profiles and Casting  
21. Performance Direction and Emotional Delivery  
22. Recording, Editing and Asset Pipeline  
23. Synthetic Character Voice and Assistive TTS Policy  
24. Pronunciation, Canonical Names and Phonetic Resources  
25. Non-Verbal Vocalisations and Social Audio  
26. Lip-Sync, Visemes and Speech Timing  
27. Facial, Head and Body Performance Hooks  
28. Spatial Voice, Listener Relation and Audio Routing  
29. Dialogue Focus, Ducking and Mix Priorities  
30. Voice Concurrency, Crowds, LOD and Virtualisation  
31. Subtitle Architecture  
32. Closed Captions and Non-Speech Social Captions  
33. Direction, Distance, Urgency and Speaker Attribution  
34. Subtitle Timing, Reading Speed and Auto-Advance  
35. Speaker Names, Colour, Icons and Non-Colour Identity  
36. Product Localisation Architecture  
37. Localisation Keys, Structured Messages and Variables  
38. Canonical Terminology, Proper Nouns and Term Bases  
39. Grammar, Plurals, Gender, Case and Word-Order Safety  
40. In-World Languages Versus Product Languages  
41. Interpreter, Translation and Partial-Comprehension Presentation  
42. Translation Workflow, Review and Linguistic QA  
43. Voice Localisation, Dubbing and Language Fallback  
44. Machine Translation and AI-Assisted Localisation Governance  
45. Runtime-Generated Dialogue Language Support and Fallback  
46. Accessibility Foundation and Sensory Equivalence  
47. Deaf and Hard-of-Hearing Support  
48. Low-Vision and Blind-Player Support  
49. Motor and Input Accessibility  
50. Cognitive, Reading and Language Accessibility  
51. Sensory Comfort, Motion and Audio Sensitivity  
52. Social Presentation Settings and Presets  
53. Keyboard, Mouse, Controller and Touch Interaction  
54. Narration and Screen-Reader Readiness  
55. Multiplayer, Split-Screen and Per-Player Language  
56. Persistence, Profiles, History and Privacy  
57. Godot/Summer Engine Implementation Direction  
58. Registries, Schemas and Stable IDs  
59. Validation, Automated Tests and Human Review  
60. Performance, Memory and Hardware Scalability  
61. Core Example Scenarios  
62. POC and Production Scope  
63. Staged Delivery Plan  
64. 28I Acceptance Criteria  
65. Open Questions Assigned to 28J or Later Production  
66. Cross-Set Interface Amendments  
Appendix A. Social Presentation Payload Template  
Appendix B. Voice Profile and Voice Asset Templates  
Appendix C. Subtitle and Caption Templates  
Appendix D. Localisation Entry and Terminology Templates  
Appendix E. Accessibility Requirement Matrix  
Appendix F. Validation and Reason-Code Catalogue  
Appendix G. Cross-System Responsibility Matrix  
Appendix H. Glossary

# 1. Locked Social-Presentation Identity

Social presentation is the **player-facing interpretation layer** of Set 28. It does not decide what an NPC means, knows, feels, agrees to or does. It decides how those already-valid states are conveyed through readable text, voice, subtitles, captions, layout, camera, animation hooks, sound routing and accessible alternatives.

> **Locked Rule**  
> If voice, animation, a font, a translation, a speech generator, a camera treatment or a Presentation Forge component disappears, the authoritative social interaction must remain valid and completable through deterministic accessible text and normal input. Presentation may enrich meaning; it may never become the only owner of meaning.

| Identity Layer | Design Meaning | Player-Facing Result |
| --- | --- | --- |
| Text-complete social play | Every consequential interaction has readable approved text or semantic equivalent. | Players can complete the entire social game with dialogue audio disabled. |
| Voice as enhancement | Recorded or synthetic speech enriches characters but does not gate mechanics. | Selective voice coverage can scale without making unvoiced NPCs second-class mechanically. |
| Localisation independence | Product localisation translates what the player interface communicates; 28C separately simulates what characters understand in-world. | A Japanese-language player can play a character who does not know Dwarven without the two concepts conflicting. |
| Accessible equivalence | Critical social meaning has visual/text alternatives to audio and non-colour alternatives to colour. | Hearing, vision, motor or cognitive settings do not remove necessary decisions. |
| World continuity | Presentation coexists with the living simulation. | Conversations feel situated in villages, roads, caravans and danger rather than detached menus. |
| Presentation truthfulness | Names, claims, choices and consequences are drawn from authoritative records. | The interface does not spoil secrets or imply outcomes that have not occurred. |
| Scalable production | Voice/localisation tiers and fallback rules support thousands of NPCs. | Large civilisations can remain socially expressive within budget. |
| Per-player rendering | Language, subtitle, caption, narration and comfort settings are local presentation preferences. | Split-screen or online players can use different presentation settings over one shared social state. |

## 1.1 Design Promise

A player should be able to approach a villager, immediately identify who is speaking when that information is known, understand what choices are available, distinguish a request from a threat or a negotiation, tell when a statement is uncertain, read or hear the conversation in their chosen product language, and recover the important information later through a history view.

If the player cannot hear dialogue, the same scene remains complete through subtitles and captions. If they cannot comfortably read small fast text, dialogue can remain on screen longer and scale cleanly. If a dub is unavailable in their language, localised text still works. If runtime AI or synthetic voice is unavailable, the deterministic presentation remains complete.

## 1.2 What 28I Is Not

- It is not the owner of conversation semantics, relationship state or social outcomes.
- It is not the general UI/UX architecture for the entire game; Document 17 retains that role.
- It is not Sound Forge or the runtime acoustic/mix system; Presentation Forge retains audio authoring/rendering ownership.
- It is not the in-world language simulation; 28C owns language capability and comprehension.
- It is not a promise that every NPC line will be fully voiced.
- It is not a requirement to use runtime generative speech or online voice services.
- It is not a cinematic system that automatically pauses or takes control of the world.
- It is not permission to expose hidden numerical Trust/Affection/Fear values merely because UI could display them.

# 2. Ownership Boundaries and Anti-Duplication Rules

## 2.1 28I Owns

28I owns the specialist social-presentation rules for:

- dialogue/conversation screen composition;
- social presentation modes and hierarchy;
- subtitle policy for character speech;
- closed-caption policy for social/non-speech cues in conversation;
- speaker attribution and turn readability;
- conversation history/transcript presentation;
- social choice labels, requirements and reason presentation;
- social presentation accessibility;
- product-localisation workflow for Set 28 content;
- voice-coverage policy;
- character voice-profile metadata;
- casting/recording/dubbing governance;
- pronunciation resources;
- speech-specific lip-sync/viseme data contracts;
- speech/performance metadata sent to animation/presentation systems;
- speech-specific UI/audio integration;
- synthetic-character-voice policy;
- local player language/subtitle/voice settings for social content;
- presentation registries and QA requirements.

## 2.2 28I Consumes but Does Not Own

| External Owner | 28I Consumes | 28I Must Not Redefine |
| --- | --- | --- |
| 28B | Session, participants, valid choices, context, interruption/resume, command results. | Conversation state machine or choice commit. |
| 28C | Language capability, comprehension, claim confidence, translation/interpreter outcome. | Who knows what or whether characters understand. |
| 28D | Permitted relationship bands/milestones and visible social cues. | Relationship formulas or hidden values. |
| 28E | Social outcome, blockers, conditional terms and reason codes. | Persuasion/negotiation resolution. |
| 28F | Companion status/role/availability. | Recruitment or membership logic. |
| 28G | Assignment status/evidence/report semantics. | Delegation resolution. |
| 28H | Approved text source, semantic payload, exact-wording lock, generation provenance. | Dialogue-content authority/generation policy. |
| Document 17 | General screens, navigation, focus, style tokens, global accessibility architecture. | Whole-game UI architecture. |
| 22 / animation owners | Rig, face/head anchors, animation clips, gesture system. | Character rig or animation engine. |
| 23F | Sound assets/events, audio source provenance, source editing. | Sound Event authoring engine. |
| 23G | Spatialisation, acoustics, buses, mix, voice management, audio LOD. | Runtime mix/attenuation/acoustic algorithms. |
| Set 27 | Prices, contracts, wages, economic availability. | Economy. |
| Set 29 | Injury, illness, fatigue, recovery and voice-affecting biological facts. | Health/survival simulation. |
| Set 30 | Travel state, seating, mount/vehicle context, movement. | Movement/pathfinding. |

## 2.3 Presentation Cannot Commit Gameplay

A displayed button, spoken line, subtitle or animation is never the authoritative action. The UI submits a semantic command to 28B or the correct domain owner. Only a successful authoritative result changes the world.

Example:

1. 28I shows **"Accept 15-silver escort contract"** from a valid 28B/28E/Set 27 payload.
2. Player activates the choice.
3. 28B submits the semantic choice and Set 27 validates contract/economic state.
4. If the command succeeds, the social/economic state commits.
5. 28I then presents the confirmed result.

If the price changed before commit, the displayed stale choice must not silently force the old price.

# 3. Locked Decision Summary

| Area | Locked Direction |
| --- | --- |
| Text baseline | Every consequential social interaction is text-complete and localisable. |
| Voice dependency | Voice is optional presentation; no mechanic requires audio playback. |
| Recommended voice model | Selective recorded voice for high-value authored scenes, recurring characters, critical warnings and reusable barks/acknowledgements; systemic long-form dialogue remains text-first unless later production approves expanded or synthetic coverage. |
| Runtime synthetic voice | Optional future feature only; not Core Production dependency; requires explicit rights/provenance, accessibility parity, offline fallback and player controls. |
| Assistive TTS | Distinct from character synthetic voice. UI/screen-reader narration may speak localised text without pretending to be the character's performed voice. |
| Product localisation | Separate from in-world language simulation. The UI can be fully translated while characters remain unable to understand each other's fictional languages. |
| Message architecture | Stable localisation keys or structured localised resources with typed parameters; no gameplay logic parses displayed strings. |
| Translation quality | Human-reviewed shipping localisation. Machine/AI translation may assist drafts but cannot self-approve. |
| Proper nouns | Use canonical term/name records with localisation/transliteration policy and pronunciation data. |
| Subtitles | Available independently from dialogue audio; configurable size, background, attribution, timing and history. |
| Closed captions | Describe meaningful non-speech/social audio with source/direction/urgency where useful; avoid meaningless filename-like captions. |
| Accessibility | Critical meaning uses sensory equivalence; no colour-only, audio-only or time-pressure-only social requirement. |
| Dialogue choices | Use intent-first readable wording, optional consequence/requirement indicators and truthful unavailable reasons where knowledge permits. |
| Hidden information | Presentation cannot reveal hidden relationship numbers, secret motives, unknown facts or future outcomes. |
| Camera | World-first and player-controlled by default; optional authored framing may be used for major scenes under comfort settings. |
| Lip sync | Speech metadata may provide timing/visemes; Entity/Animation systems implement rigs. Fallback is simple talk animation, never broken gameplay. |
| Spatial voice | 23G owns rendering. 28I provides speaker/source and speech priority/focus intent. |
| Multiplayer | Shared semantic state, localised per client. Each local player may choose language, subtitle, caption and voice settings independently where platform allows. |
| Low-end profile | Text and simple talk animation remain complete when voice, lip sync, portraits or advanced effects are reduced. |
| POC | Prove named speaker, intent choices, subtitle/caption settings, interruption-safe dialogue, transcript, one voiced key line/bark family, localisation pseudo-test and accessibility scaling. |

# 4. Social Presentation Pipeline

The social-presentation pipeline keeps semantics, language and audiovisual output separate.

```text
Authoritative Social / External Systems
              |
              v
      28B Presentation Payload
   (meaning, choices, reasons, state)
              |
              v
      28H Content Resolution
 (approved text source / semantic line)
              |
              v
       28I Localisation Layer
 (product language, terms, variables)
              |
       +------+------+
       |             |
       v             v
   UI/Subtitles    Voice Selection
       |             |
       |             v
       |        23F Sound Event
       |             |
       |             v
       |        23G Runtime Audio
       |             |
       +------+------+
              v
     Local Player Presentation
              |
              v
    Input -> 28B/Domain Command
```

The same semantic event can therefore produce:

- English text + English recorded voice;
- French text + original-language voice;
- Japanese text + no voice;
- large subtitles + captions + assistive narration;
- split-screen English for Player 1 and Spanish for Player 2;
- a low-end profile with no facial lip sync;

without changing the social outcome.

# 5. Presentation Payload and View-Model Contract

28I consumes a local-player-filtered social presentation payload. The payload should already respect knowledge, permissions and authority.

## 5.1 Suggested Core Fields

| Field | Purpose |
| --- | --- |
| session_id | Stable active conversation/session reference. |
| presentation_revision | Detect stale UI relative to authoritative session. |
| speaker_entity_id | Current semantic speaker. |
| addressee_ids | Intended recipients. |
| listener_ids | Other active participants. |
| speaker_display_name_key/value | Knowledge-safe name presentation. |
| speaker_role_key | Optional known role/title. |
| speaker_portrait/profile_ref | Optional portrait/presentation profile. |
| semantic_line_id | Stable meaning/content reference. |
| localisation_key | Deterministic localised text source where applicable. |
| text_parameters | Typed message parameters. |
| exact_wording_lock | Whether wording must remain fixed. |
| tone/emotion_tags | Performance/presentation hints, not hidden truth. |
| emphasis_segments | Optional accessible emphasis metadata. |
| comprehension_result | 28C output controlling what is intelligible. |
| choice_entries | Current valid/visible choices. |
| interruption_state | Active/suspended/interrupted/resumable. |
| social_reason_codes | Readable reasons from 28E/other owners. |
| voice_profile_id | Character/presentation voice identity if assigned. |
| speech_asset_or_event_ref | Optional approved voice source/event. |
| subtitle_policy | Always/when-audio/never-for-ambient etc., constrained by accessibility settings. |
| transcript_policy | Whether the line is eligible for history. |
| privacy_class | Limits persistent/free-text storage. |

## 5.2 View-Model Rule

Widgets receive presentation-ready values or localisable semantic fields. They do not query arbitrary NPC internals and do not scrape world objects to infer social state.

# 6. Conversation Presentation Modes

One layout cannot serve every social interaction. 28I defines presentation modes that share the same 28B runtime.

| Mode | Typical Use | Presentation Character |
| --- | --- | --- |
| Context interaction | Quick greeting, question, service, handoff. | Small world-anchored panel or compact overlay. |
| Standard conversation | Most NPC dialogue and companion interaction. | Speaker panel + text + choices; world remains visible. |
| Negotiation | Contracts, bargaining, concessions. | Standard dialogue plus typed term summary from Set 27/28E. |
| Investigation/testimony | Witness questioning, rumours, evidence. | Dialogue plus claim/evidence references permitted by 28C. |
| Companion conversation | Personal talk, recruitment, status, assignment follow-up. | Relationship-safe context and companion actions. |
| Group conversation | Multiple speakers, party discussion, household/faction meeting. | Strong turn attribution and participant strip. |
| Council/trial/diplomacy | Multi-party formal social scene. | Structured participants, proposal/mandate summary and turn history. |
| Ambient bark | Short nearby line with no choice. | Subtitle/speech bubble/caption according to settings; no full screen. |
| Story focus | Important authored scene. | Optional enhanced framing while preserving skip/accessibility rules. |

Presentation mode is a **view choice**, not a separate gameplay system.

# 7. Standard Conversation Layout

The default layout follows Document 17's world-first, progressive-disclosure philosophy.

## 7.1 Required Regions

A standard conversation supports:

1. **Speaker identity region** - known name, role/title, optional portrait/relationship-safe icon.
2. **Dialogue text region** - localised line, readability controls, comprehension markers where relevant.
3. **Choice region** - semantic intent choices, requirements and optional known-consequence tags.
4. **Context action region** - inspect person, open relevant quest/contract, view known relationship history, where allowed.
5. **Status region** - interruption, waiting for other player, translation/interpreter state, unavailable reason.

## 7.2 Responsive Layout

- Wide PC display: identity and dialogue may share horizontal space; choices remain close to current line.
- Narrow/split-screen: identity collapses; portrait becomes optional; text/choices take priority.
- Large text: layout reflows vertically rather than clipping or shrinking fonts.
- Controller: focus enters current choices predictably and returns to the last safe element after a rejected/stale command.
- Touch/mobile evaluation: targets remain large and choices are not placed at unsafe screen edges.

# 8. Speaker Identity, Role and Knowledge-Aware Labels

Presentation must not expose identity information the local player does not know.

Possible speaker labels include:

- **Unknown Traveller**
- **Village Guard**
- **Mara**
- **Mara - Blacksmith**
- **Envoy Sereth of the Glass Court**

The progression between these labels comes from knowledge/discovery systems, not UI guessing.

## 8.1 Hidden Identity

If a masked, distant, disguised or unknown speaker is not identified, subtitles and transcript use the permitted descriptor. A voice actor's recognisable performance must not be treated as authoritative identity; gameplay knowledge remains separate.

## 8.2 Titles and Roles

Titles should be localised independently from names. Role changes update presentation from authoritative identity/job/faction records rather than permanently baking titles into dialogue files.

# 9. Dialogue Intent and Choice Presentation

28B choices represent semantic intents. 28I converts them into concise player-facing labels.

Examples:

| Intent | Possible Player-Facing Label |
| --- | --- |
| ask_information | "What happened at the mine?" |
| accept_request | "I'll help." |
| decline_request | "I can't take this on." |
| negotiate_term | "The payment needs to be higher." |
| reassure | "You're safe here." |
| intimidate | "Open the gate, or we do this the hard way." |
| apologise | "I was wrong. I'm sorry." |
| recruit | "Travel with me." |
| end_conversation | "I'll leave you to it." |

## 9.1 Intent Labels Are Not Hidden Outcomes

A choice label describes what the player is attempting. It does not promise success unless the owning system has already resolved the outcome and the design intentionally exposes that information.

## 9.2 Tone Variants

Where 28B/28E expose legal variants, one intent may offer polite, direct, humorous, formal or threatening phrasings. Tone variants may affect social resolution only when 28E explicitly models them; 28I cannot make a beautifully written line mechanically stronger by itself.

# 10. Consequence, Requirement and Reason Presentation

Social choices often depend on money, evidence, authority, language, reputation or relationship context. Presentation should explain relevant known requirements without exposing forbidden information.

Example indicators:

- **[15 silver]** Hire for one week.
- **[Requires interpreter]** Discuss the treaty terms.
- **[Evidence: torn ledger]** Challenge their account.
- **[Not authorised]** Sign the settlement agreement.
- **[Companion unavailable: recovering]** Ask Mara to join.

Reason text comes from stable reason codes and localised explanations supplied by the owner.

## 10.1 No False Certainty

Prefer:

> **Conditional - they may agree if safe passage is guaranteed.**

rather than:

> **87% success chance**

unless a world setting or specialist perk intentionally exposes exact probabilities.

# 11. Hidden, Redacted and Unavailable Choice Rules

Choices may be:

- **Visible and available** - normal selectable action.
- **Visible but unavailable** - player can learn why the option cannot currently be used when the reason is knowable.
- **Redacted/obscured** - the player knows an option category exists but lacks the necessary knowledge to understand it.
- **Hidden** - the player has no basis to know the option exists.

28I only presents the state given by 28B/knowledge owners.

A hidden diplomacy option must not become visible merely because the localisation file contains its string.

# 12. World-Continuous Dialogue and Camera Policy

Conversation does not automatically pause Leyforge's simulation. Presentation therefore needs to preserve environmental awareness.

## 12.1 Default Camera

The default social interaction keeps player camera control or uses only mild contextual framing. Major authored scenes may request stronger framing, but players can reduce or disable:

- automatic camera rotation;
- depth-of-field emphasis;
- dramatic FOV changes;
- head-bob or camera sway;
- forced close-ups;
- motion-heavy transitions.

## 12.2 Danger Awareness

If combat, fire, flood, raid, movement or another urgent event interrupts a scene, gameplay-critical warnings remain readable above decorative social framing.

# 13. Interruption, Suspension, Resumption and Timeout Presentation

28B owns interruption classes. 28I shows their state clearly.

| Runtime State | Presentation |
| --- | --- |
| Soft pressure | Small warning such as "Mara needs to return to work soon." |
| Soft suspension | Conversation panel reduces/holds and explains why interaction is paused. |
| Hard interruption | Close/fade social panel and show interruption reason. |
| Hard invalidation | Explain that the conversation can no longer continue; do not leave dead choices on screen. |
| Resumable | Offer a clear resume interaction when participants/context are valid again. |

## 13.1 No Invisible Timeout

If a timed social choice exists, the time limit must be visible and accessibility settings may extend or remove it where gameplay allows. A player should not lose a relationship decision because subtitles took longer to read.

# 14. Dialogue History, Transcript and Search

The social history is a player-aid layer over authoritative historical data.

## 14.1 Transcript Classes

| Class | Default History Behaviour |
| --- | --- |
| Major authored dialogue | Retain key lines/summary. |
| Quest/request dialogue | Retain actionable summary and relevant lines. |
| Negotiation | Retain agreed/rejected terms and important statements. |
| Companion report | Retain semantic report and source/evidence links where allowed. |
| Ordinary service chatter | Usually summarised or omitted. |
| Ambient bark | Off by default; optional recent-caption history only. |
| Player free text | Stored only under explicit privacy/history policy. |

## 14.2 Localisation and Historical Lines

For normal deterministic lines, the history may store semantic/localisation references and render in the current product language. If exact wording becomes evidence, a quote, a relationship milestone or a story-critical artefact, preserve the required presentation snapshot under 28H's rules.

# 15. Ambient Speech, Barks and Speech-Bubble Policy

Ambient speech should make settlements feel alive without creating a wall of text or implying false conversations.

## 15.1 Bark Rules

- Short and context-valid.
- No hidden critical information unless the subtitle/caption system guarantees visibility.
- Repetition-controlled.
- Lower display priority than active conversation or danger cues.
- May use overhead speech bubbles only as an optional presentation mode.
- Important semantic rumours or warnings enter proper knowledge/quest channels rather than vanishing as decorative bark.

## 15.2 Speech Bubbles

Optional world-space speech bubbles are suitable for:

- greetings;
- work acknowledgements;
- short companion banter;
- merchant calls;
- non-critical ambient remarks.

They are not the only channel for consequential dialogue.

# 16. Multi-Person Conversations and Turn Readability

Multiple speakers require strong attribution.

Presentation may use:

- participant strip/list;
- speaker highlight;
- portrait/identity focus;
- subtitle name prefixes;
- directional speaker indicator;
- turn-transition animation;
- transcript grouping by speaker.

Overlapping intelligible speech is limited where it harms comprehension. When two lines must overlap for dramatic reasons, subtitles either stack in distinct attributed rows or serialise according to accessibility settings.

# 17. Councils, Trials, Diplomacy and Group-Social Interfaces

Formal group scenes can expose structured information alongside dialogue without becoming strategy dashboards.

Possible secondary panels include:

- current proposal/terms;
- participating factions/representatives;
- mandate/authority status;
- known evidence/testimony;
- unresolved issues;
- speaker queue;
- vote/consensus state when 28J permits it.

The panel reflects 28E/28B authoritative state. It does not calculate political support or legal guilt.

# 18. Voice Coverage Strategy

Leyforge's scale makes **full recorded voice for every possible systemic sentence impractical as a baseline requirement**. The production model therefore prioritises complete text and selective high-value voice.

## 18.1 Recommended Coverage Tiers

| Tier | Content | Recommended Baseline |
| --- | --- | --- |
| V0 - Text complete | Every consequential dialogue path. | Mandatory. |
| V1 - Social identity | Greetings, farewells, acknowledgements, pain/fear/effort, work calls, combat/social barks. | Broad reusable coverage. |
| V2 - Key authored moments | Main/culture/faction arcs, major relationship milestones, critical reveals. | Recorded where production budget permits. |
| V3 - Recurring character library | Important companions, leaders, recurring specialists. | Expanded recorded line families and scene coverage. |
| V4 - Systemic spoken realisation | Long-tail dynamic dialogue through recorded modular systems or approved synthetic speech. | Optional future expansion only. |

## 18.2 Text-First Equality Rule

An unvoiced NPC is not mechanically less complete. The same interaction choices, knowledge, relationships and quests remain available.

# 19. Voice Source Classes, Provenance and Rights

Every audible character voice has explicit source provenance.

| Voice Source | Use | Requirements |
| --- | --- | --- |
| Recorded human performance | Authored scenes, companions, important NPCs, reusable barks. | Performer agreement, usage rights, language/character scope, source records. |
| Recorded reusable vocal family | Non-verbal exertion, generic crowd/creature-like vocal families where appropriate. | Clear rights and identity boundaries; avoid misrepresenting as bespoke performed dialogue. |
| Developer temporary scratch | Internal timing/iteration. | Must never ship accidentally; clearly flagged placeholder. |
| Licensed third-party voice asset | Limited generic use if stylistically appropriate. | Licence compatibility, provenance, allowed transformation and redistribution documented. |
| Approved synthetic character voice | Future optional spoken realisation. | Explicit lawful voice rights/consent, model/source provenance, product policy approval, deterministic text fallback. |
| Assistive TTS | UI narration/accessibility. | Platform/accessibility service; not presented as the character's canonical performed voice. |

## 19.1 No Unauthorised Voice Cloning

Leyforge must not create or ship a synthetic imitation of a real performer's identifiable voice without explicit rights/consent appropriate to that use. Voice rights are production metadata, not an assumption inferred from possession of recordings.

# 20. Character Voice Profiles and Casting

A **CharacterVoiceProfile** describes desired performance and technical compatibility without defining the NPC's social personality itself.

Suggested fields:

- voice_profile_id;
- character/entity/role binding policy;
- preferred language/dialect variants;
- vocal age impression band where creatively relevant;
- pitch/range notes;
- pace and rhythm;
- energy/intensity range;
- formality/register notes;
- culture/faction pronunciation notes;
- emotional range required;
- non-verbal vocal family references;
- casting/performance notes;
- accessibility-sensitive warnings where relevant;
- performer/rights record reference;
- dubbing equivalence notes;
- approval status/version.

## 20.1 Casting Does Not Create Canonical Social Traits

A performer may suggest warmth, severity or humour, but canonical personality remains in NPC/social definitions. Voice direction reflects that state rather than replacing it.

# 21. Performance Direction and Emotional Delivery

28I accepts performance hints from validated semantic content.

Useful tags include:

- calm;
- guarded;
- relieved;
- frightened;
- angry;
- grieving;
- formal;
- sarcastic;
- affectionate;
- hesitant;
- exhausted;
- urgent;
- confidential;
- public-address.

These are **presentation directions**, not hidden relationship values.

## 21.1 Avoid Caricature

Culture, ancestry, class, disability or fictional language identity should not be reduced to exaggerated accent spelling or comic vocal shorthand. Cultural performance direction focuses on vocabulary/register, social norms and approved accent/dialect direction where appropriate.

# 22. Recording, Editing and Asset Pipeline

A recorded social line follows a controlled production path.

```text
Approved Semantic/Dialogue Source
        -> Voice Script Export
        -> Pronunciation/Context Notes
        -> Casting and Session Plan
        -> Recording
        -> Editorial Select
        -> Clean/Edit/Process
        -> Timing/Marker Extraction
        -> Dialogue Sound Event Authoring (23F)
        -> Lip-Sync/Viseme Data
        -> In-Game Mix/Spatial Test (23G)
        -> Localisation/Subtitle Verification
        -> Review/Approval/Bake
```

## 22.1 Recording Script Context

Voice scripts should include enough context for performance without exposing unnecessary hidden data. Useful fields:

- speaker;
- addressee;
- scene/context summary;
- previous/next semantic beat;
- emotional stance;
- exact-wording lock;
- pronunciation notes;
- intensity;
- whether line may be interrupted;
- filename/asset ID convention.

# 23. Synthetic Character Voice and Assistive TTS Policy

Synthetic character voice and assistive TTS solve different problems and must remain separate.

## 23.1 Synthetic Character Voice

Optional future synthetic speech may be used only if:

- the underlying line has already passed 28H semantic/content validation;
- the selected voice model/voice identity has documented rights;
- output language is supported and reviewed;
- no mechanic depends on successful synthesis;
- text/subtitle fallback is immediate;
- player settings can disable synthetic character voice;
- latency does not block choice presentation;
- privacy/network policy is explicit for remote providers;
- 23F/23G integration meets loudness, routing and accessibility rules.

Core Production does **not** require this feature.

## 23.2 Assistive TTS

Assistive TTS may read:

- speaker name;
- dialogue text;
- choice labels;
- unavailable reasons;
- social status labels;
- transcript entries.

Assistive TTS should use the player's selected UI/narration voice and must not imply that the NPC canonically sounds like that narrator.

# 24. Pronunciation, Canonical Names and Phonetic Resources

Fantasy naming requires a shared pronunciation layer.

A **PronunciationEntry** may provide:

- canonical term ID;
- written form per product language;
- phonetic/IPA representation where useful;
- syllable/stress guide;
- alternate accepted pronunciation;
- language/culture context;
- audio reference pronunciation;
- dubbing notes;
- voice-synthesis lexicon form;
- revision/approval state.

## 24.1 Canonical Name Consistency

The same person/place/item should not receive contradictory pronunciations across recorded dialogue, TTS, trailers and accessibility narration unless the fiction intentionally supports dialect variation.

# 25. Non-Verbal Vocalisations and Social Audio

Social expression includes more than spoken sentences.

Approved classes include:

- greetings and acknowledgement sounds;
- laughter;
- sighs;
- sobbing/grief;
- pain/hurt sounds;
- exertion;
- fear/startle;
- celebration;
- anger/frustration;
- thinking/hesitation;
- crowd reactions;
- ritual/chant vocalisations where authored.

Non-verbal audio still needs captions when it carries meaningful information, e.g. **[Mara gasps]**, **[crowd murmurs uneasily]**.

# 26. Lip-Sync, Visemes and Speech Timing

28I defines speech timing contracts; Entity/Animation systems implement facial/head rigs.

## 26.1 Fidelity Ladder

| Fidelity | Use |
| --- | --- |
| L0 - No lip sync | Text-only, distant/very low quality, unvoiced line. |
| L1 - Talk motion | Simple jaw/head/body talk loop. |
| L2 - Energy envelopes | Mouth openness/intensity derived from audio. |
| L3 - Viseme sequence | Timed phoneme/viseme cues mapped to supported face rig. |
| L4 - Authored facial performance | Important scenes with bespoke facial/gesture timing. |

The runtime selects the highest available compatible level within budget.

## 26.2 Speech Timing Record

Suggested fields:

- speech_event_id;
- audio_duration;
- segment markers;
- phoneme/viseme cues;
- emphasis markers;
- breath/pause markers;
- interrupt-safe points;
- subtitle segment alignment;
- gesture marker references.

# 27. Facial, Head and Body Performance Hooks

Speech can request presentation hooks such as:

- look-at addressee;
- avert gaze;
- nod/shake head;
- hand gesture family;
- posture shift;
- emotional face state;
- turn toward speaker;
- group attention target.

These hooks are bounded presentation requests. They do not force movement through blocked geometry or override Set 30/pathfinding. If an animation cannot play, dialogue continues.

# 28. Spatial Voice, Listener Relation and Audio Routing

23G owns the final spatial audio rules. 28I supplies speech-specific metadata.

Possible speech source intents:

- world-spatial at mouth/head socket;
- close-conversation focus;
- radio/magic communication filter route;
- public address;
- private/party channel;
- UI/non-spatial assistive narration;
- memory/vision/story presentation where fiction explicitly supports it.

## 28.1 Mouth Socket

Character speech should normally bind to `socket.audio.mouth` with fallback through head/chest/entity origin as defined by Presentation Forge.

## 28.2 Dialogue Does Not Bypass Acoustics by Default

If two characters speak through a closed door or across distance, 23G may apply attenuation/occlusion. Accessibility settings can provide subtitles/captions even when speech is physically difficult to hear, subject to knowledge/perception rules.

# 29. Dialogue Focus, Ducking and Mix Priorities

Active conversation may request a **Dialogue Focus** presentation profile from 23G.

The focus profile can:

- moderately reduce competing ambience/music/machines;
- protect current speaker intelligibility;
- retain critical combat/raid warnings;
- preserve directional context;
- respect user dialogue-volume and dynamic-range settings.

It must not simply mute the living world or make voices unnaturally loud.

# 30. Voice Concurrency, Crowds, LOD and Virtualisation

Large settlements can contain hundreds of potential talkers. Speech rendering is therefore budgeted.

Priority order is generally:

1. active consequential conversation;
2. critical warnings/shouts;
3. companion/party speech;
4. nearby targeted NPC response;
5. important ambient dialogue;
6. ordinary ambient barks;
7. crowd texture/vocal beds.

Low-priority speech may be:

- suppressed;
- delayed;
- virtualised;
- replaced with a non-semantic crowd bed;
- captioned only when semantically required;
- reconstructed when promoted.

No LOD decision may drop a critical semantic line without an accessible text path.

# 31. Subtitle Architecture

Dialogue subtitles are the visual representation of spoken semantic content.

## 31.1 Default Subtitle Contents

A subtitle may contain:

- speaker name/descriptor;
- spoken line;
- optional tone/translation indicator only when useful;
- optional direction/source cue in accessibility mode.

## 31.2 Subtitle Settings

Players can configure:

- subtitles on/off for voiced dialogue;
- always show text even when voice plays;
- text size;
- line spacing;
- background panel opacity;
- speaker names;
- speaker colour accents;
- non-colour speaker markers;
- maximum lines/stacking mode;
- subtitle position/safe area;
- dialogue history access;
- subtitle duration/reading assistance.

Critical information remains available even if subtitles are disabled, through normal dialogue UI or other configured channels.

# 32. Closed Captions and Non-Speech Social Captions

Closed captions represent meaningful audible events beyond spoken words.

Examples:

- **[village bell rings urgently]**
- **[Mara laughs softly]**
- **[crowd murmurs]**
- **[door slams behind you]**
- **[goblin horn - north-east, distant]**
- **[interpreter whispers translation]**

Caption text describes **meaning**, not implementation such as `SND_GoblinHorn_03.wav`.

## 32.1 Caption Priority

During a conversation, caption priority protects:

- danger/warning cues;
- the current speaker;
- socially meaningful non-verbal reactions;
- required off-screen environmental cues.

Decorative ambience yields first.

# 33. Direction, Distance, Urgency and Speaker Attribution

For hearing accessibility and crowded social scenes, captions can expose source metadata.

Possible components:

- direction arrow/compass wedge;
- text direction label;
- near/mid/far band;
- urgency icon + text label;
- source name/descriptor;
- above/below cue where 3D location matters.

Colour may supplement but never replace these labels.

# 34. Subtitle Timing, Reading Speed and Auto-Advance

Subtitle timing must support reading rather than mechanically matching audio duration only.

## 34.1 Initial Timing Principles

- Minimum display duration for short lines.
- Longer lines scale by character/word count.
- Player reading-speed setting can extend duration.
- The line may remain visible after audio ends if needed.
- Manual advance is always available in standard conversations unless an authored real-time scene explicitly prevents it.
- Auto-advance waits for both the semantic line and configured readability threshold.
- Rapid barks may queue/replace using priority rather than filling the screen.

Exact characters-per-second values remain production tuning, not a locked v0.1 constant.

# 35. Speaker Names, Colour, Icons and Non-Colour Identity

Speaker differentiation may use:

- name labels;
- portrait/silhouette;
- faction/role icon where known;
- subtitle placement;
- speaker colour accent;
- line/pattern marker;
- directional indicator.

The player must not need colour vision to distinguish speakers.

# 36. Product Localisation Architecture

Product localisation means translating the game's UI and player-facing content into supported real-world languages. It is separate from the fictional language simulation of 28C.

## 36.1 Localisation Layers

| Layer | Examples |
| --- | --- |
| UI strings | Buttons, social labels, settings, reason codes. |
| Dialogue text | Authored/systemic lines and choices. |
| Dynamic semantic messages | "Mara needs 12 Oak Beams." |
| Proper nouns/terms | Settlement names, titles, items, factions, magic terms. |
| Captions | Sound meaning, direction, urgency. |
| Codex/social history | Relationship milestone summaries, known facts, reports. |
| Voice subtitles | Dub/original voice subtitle alignment. |
| Assistive narration labels | Screen-reader-friendly control descriptions. |

# 37. Localisation Keys, Structured Messages and Variables

All deterministic social text uses stable localisation keys or equivalent approved structured resources.

## 37.1 Typed Parameters

Avoid sentence construction through English-style string concatenation.

Bad:

```text
"Bring " + count + " " + item_name + " to " + npc_name
```

Preferred semantic message:

```text
social.request.delivery
parameters:
  count: 12
  item: item.material.oak_beam
  recipient: entity:<id>
```

The localisation layer can then choose correct grammar/order.

## 37.2 Parameters Do Not Contain Hidden Logic

Localisers receive meaning/context. They do not write conditions that change quest, social or economic state.

# 38. Canonical Terminology, Proper Nouns and Term Bases

A shared terminology database protects consistency across dialogue, UI, codex, dubbing and subtitles.

Each entry may define:

- canonical term ID;
- source-language term;
- approved translations;
- untranslated/protected status;
- grammatical notes;
- short/long UI forms;
- pronunciation;
- capitalisation;
- plural/declension metadata;
- context/definition;
- forbidden misleading translations;
- related terms;
- owner document/registry.

## 38.1 Generated Names

Seed-generated or player-generated names use stable display records. A localisation may transliterate, preserve or transform them only under explicit naming rules; it must not rename the underlying entity ID.

# 39. Grammar, Plurals, Gender, Case and Word-Order Safety

Localisation architecture must support languages that do not share English grammar.

Requirements include:

- plural categories beyond singular/plural;
- grammatical gender where the target language requires it;
- noun cases/declension where practical;
- adjective agreement;
- variable reordering;
- number/date/time formatting;
- respectful/formal address forms;
- punctuation and quotation conventions;
- right-to-left layout evaluation where supported;
- line breaking and font fallback.

NPC identity data should expose only the grammatical information localisation legitimately needs; localisation must not infer identity traits from voice or appearance.

# 40. In-World Languages Versus Product Languages

This distinction is mandatory.

**Product language:** what the real player selected in Settings.  
**In-world language:** what the player character/NPCs can understand under 28C.

Example:

- Product language: English.
- Player character does not know Old Aetheric.
- NPC speaks Old Aetheric.
- UI may show a localised representation such as **[unintelligible Old Aetheric]**, partial fragments, or an interpreter's English translation according to 28C.

Changing product language to Spanish does not suddenly grant the character Old Aetheric fluency.

# 41. Interpreter, Translation and Partial-Comprehension Presentation

28C supplies comprehension fidelity and interpreter paths. 28I displays them clearly.

Possible states:

- fully understood;
- mostly understood;
- partially understood;
- key term recognised;
- tone understood but content unclear;
- interpreter translation;
- written translation only;
- unintelligible.

## 41.1 Do Not Simulate Language Difficulty With Random Gibberish

Partial comprehension should preserve the semantic information 28C says is available. Presentation may omit/obscure uncertain segments but should not randomly scramble text and accidentally imply false facts.

# 42. Translation Workflow, Review and Linguistic QA

Shipping localisation follows a controlled workflow.

```text
Approved Source/Semantic Content
        -> String Extraction
        -> Context/Term Linkage
        -> Translation Draft
        -> Linguistic Review
        -> In-Game Integration
        -> Functional + Layout QA
        -> Narrative/Terminology Spot Check
        -> Accessibility/Subtitle QA
        -> Approval
```

## 42.1 Context Package

Translators should receive:

- speaker and addressee role;
- semantic intent;
- tone/register;
- character limit only where truly necessary;
- glossary/term links;
- variable meanings;
- screenshot/context preview where possible;
- knowledge/uncertainty notes;
- gender/number context needed by target grammar;
- whether text is spoken, choice label, caption or UI.

# 43. Voice Localisation, Dubbing and Language Fallback

Voice support can vary by product language without reducing gameplay completeness.

## 43.1 Per-Language Voice Modes

A language pack may provide:

- full approved dub for covered content;
- partial/key-scene dub;
- original voice + localised subtitles;
- text-only social presentation.

The game exposes actual coverage honestly rather than silently falling back to an unrelated language.

## 43.2 Dubbing Equivalence

Dubs preserve semantic meaning and performance intent, not exact mouth timing at the cost of meaning. Lip-sync data may be regenerated for each dub where supported.

# 44. Machine Translation and AI-Assisted Localisation Governance

AI/machine translation can accelerate drafting, glossary checks and consistency analysis, but shipping strings require the approval level appropriate to their risk.

Allowed assistance includes:

- first-pass translation;
- terminology suggestions;
- consistency checks;
- missing-string detection;
- placeholder validation;
- subtitle-length warnings;
- pseudo-localisation generation;
- back-translation for review assistance;
- QA test-case generation.

It may not:

- self-approve canonical localisation;
- alter semantic IDs or gameplay conditions;
- invent lore terminology;
- silently translate protected proper nouns;
- remove uncertainty/deception markers;
- expose hidden content to a localisation provider beyond policy.

# 45. Runtime-Generated Dialogue Language Support and Fallback

28H already locks runtime generation as optional. 28I adds language requirements.

If optional runtime generated text is enabled:

1. provider must declare supported product languages;
2. output must use canonical localised names/terms;
3. the same semantic validation applies in every language;
4. unsupported language falls back to deterministic localised content;
5. generated English is not displayed merely because the current language lacks generation support;
6. synthetic speech is not attempted when text itself is not validated/localised;
7. localised fallback must remain immediate.

# 46. Accessibility Foundation and Sensory Equivalence

Accessibility is a contract, not a cosmetic option.

> **Locked Accessibility Rule**  
> No critical social fact, choice, warning or failure reason may depend exclusively on hearing a line, distinguishing a colour, reading fast text, executing a timed precision input or tolerating forced camera motion.

Social accessibility uses multiple channels:

- text;
- icon + label;
- captions;
- voice;
- assistive narration;
- controller vibration where useful;
- directional markers;
- focus cues;
- replay/history;
- adjustable timing.

# 47. Deaf and Hard-of-Hearing Support

Required capabilities include:

- dialogue subtitles independent of audio volume;
- closed captions for meaningful non-speech sounds;
- speaker identity;
- direction/distance labels for relevant off-screen speech/cues;
- visual indication when someone calls to the player;
- conversation-history access;
- caption priority to prevent critical cues being crowded out;
- separate subtitle/caption controls;
- separate dialogue audio volume;
- non-audio equivalents for critical alarms/warnings.

No social clue should be audio-only by default.

# 48. Low-Vision and Blind-Player Support

Social interfaces should be compatible with:

- large text and UI scaling;
- high-contrast dialogue panels;
- clear focus indicators;
- logical focus order;
- narration-ready speaker names and choice labels;
- screen-reader semantic labels;
- non-visual indication of selected choice;
- optional audio cues for new speaker/choice availability;
- consistent controller navigation;
- transcript navigation by speaker/turn.

Advanced full screen-reader certification is a later production milestone, but data and focus architecture must not block it.

# 49. Motor and Input Accessibility

Social interaction should not require rapid or complex input sequences.

Support:

- remappable interaction/advance/back controls;
- hold/toggle alternatives where relevant;
- no mandatory double-click precision;
- large selectable targets;
- controller/D-pad/stick navigation;
- optional choice confirmation;
- extended/no-timer modes for timed dialogue where system rules permit;
- automatic focus on first safe choice, not destructive choices;
- speech-to-intent as future optional input, never required.

# 50. Cognitive, Reading and Language Accessibility

Social content can be dense. 28I supports:

- plain-language choice labels;
- optional concise consequence summaries;
- adjustable text speed;
- manual advance;
- transcript/history;
- highlighted key terms where accessible;
- glossary links for fantasy terminology;
- reduced simultaneous choice count where content supports paging/grouping;
- reduced ambient bark/caption density;
- repeat/replay of important lines;
- simplified presentation preset;
- clear distinction between fact, rumour and uncertainty where the character knows that distinction.

## 50.1 Dyslexia/Reading Comfort

Provide readable font choices or approved alternate font mode, line spacing, background opacity and text scale. Do not encode meaning through italic/bold styling alone.

# 51. Sensory Comfort, Motion and Audio Sensitivity

Social presentation respects global comfort settings:

- reduced camera motion;
- disable forced close-ups;
- reduced portrait/facial animation intensity;
- reduced flashes;
- reduced controller vibration;
- dialogue dynamic-range control through 23G;
- separate dialogue/crowd/ambient audio sliders;
- limit repetitive sharp vocalisations;
- optional reduced crowd chatter;
- mute voice while retaining subtitles.

# 52. Social Presentation Settings and Presets

Suggested social settings:

| Category | Settings |
| --- | --- |
| Text | Size, spacing, background, text speed, auto-advance, speaker names, history. |
| Subtitles | On/off, always-show, size, position, attribution, direction. |
| Captions | On/off, sound-caption detail, direction/distance, priority density. |
| Voice | Dialogue volume, character voice enable, synthetic voice enable if available, original/dub preference. |
| Accessibility | Narration, choice confirmations, timers, simplified layout, reduced motion. |
| Ambient social | Bark frequency, speech bubbles, crowd chatter density, caption ambient level. |
| Privacy/AI | Optional runtime AI status, network data notice, free-text history policy. |

## 52.1 Presets

Recommended presets can include:

- Standard;
- Subtitles First;
- Hearing Accessibility;
- Large Text / Reading Comfort;
- Low Motion;
- Minimal Social Noise;
- Screen-Reader Ready foundation.

Presets are editable starting points, not mutually exclusive modes.

# 53. Keyboard, Mouse, Controller and Touch Interaction

## 53.1 Keyboard/Mouse

- Mouse selection and scroll.
- Number keys may select visible choices when not conflicting with text entry.
- Enter/Space advance only when safe.
- Escape/back leaves or closes according to 28B state; it does not silently accept.

## 53.2 Controller

- D-pad/stick predictable vertical choice navigation.
- Confirm/back respect platform conventions.
- Bumpers/triggers may switch participant/context tabs in complex group scenes.
- Focus restores after stale/rejected command.
- Controller glyphs update dynamically.

## 53.3 Touch/Future Handheld

- Large touch targets.
- Scrollable text without accidental selection.
- Safe-area support.
- No hover-only information.

# 54. Narration and Screen-Reader Readiness

Every social UI control should expose semantic labels such as:

- speaker identity;
- dialogue line;
- current conversation state;
- choice index/count;
- choice intent;
- availability;
- requirement/reason;
- known consequence label;
- selected state;
- progress/timer if present.

Narration order follows the decision hierarchy rather than visual coordinates.

## 54.1 Repetition Control

Screen narration should avoid rereading the entire speaker panel whenever focus moves between choices. Changed information is announced succinctly.

# 55. Multiplayer, Split-Screen and Per-Player Language

28J owns final network authority. 28I locks presentation requirements.

## 55.1 Shared Semantic State, Local Presentation

One shared consequential conversation can be rendered differently for each player:

- Player 1 UI language: English.
- Player 2 UI language: Japanese.
- Host language: Spanish.

They still see choices tied to the same semantic IDs and authority state.

## 55.2 Split-Screen

Each local player can have independent:

- subtitles/captions;
- text scale within layout limits;
- language;
- narration;
- controller focus;
- conversation panel where the conversation is personal.

Shared world-critical captions must avoid duplicate clutter.

## 55.3 Dialogue Authority Presentation

When a conversation is party-leader, vote, consensus or personal-response scoped, UI clearly states who can commit the decision and who is waiting. 28I does not choose the policy.

# 56. Persistence, Profiles, History and Privacy

Presentation preferences belong primarily to the player profile rather than each world save.

Persist globally where appropriate:

- product language;
- subtitle/caption settings;
- voice volume/coverage preference;
- narration/reading preferences;
- social UI scale/layout preference;
- reduced motion;
- synthetic voice/AI presentation settings where applicable.

World save retains authoritative conversation/social history and only the presentation snapshots required by 28H/quest evidence.

## 56.1 Privacy

Free-text player input and transcripts may contain user-authored content. Store only when required and according to explicit history/privacy settings. Diagnostic logs should prefer semantic IDs/reason codes over raw player text.

# 57. Godot/Summer Engine Implementation Direction

28I is implementation-aware but not a code specification.

Recommended Godot-facing separation:

```text
SocialPresentationService
├── ConversationViewModelAdapter
├── LocalisationResolver
├── SubtitleCaptionService
├── SocialHistoryPresenter
├── VoicePresentationResolver
├── DialogueAudioAdapter -> Presentation Forge runtime
├── LipSyncPresentationAdapter -> Entity/Animation runtime
├── AccessibilityAdapter
└── LocalPlayerSocialPresentationProfile
```

## 57.1 Resource Direction

Definitions may use Godot Resources or equivalent validated data for:

- `SocialPresentationProfile`
- `VoiceProfile`
- `PronunciationEntry`
- `SubtitleStyleProfile`
- `CaptionDefinition`
- `LocalisationContextRecord`
- `DialogueAudioBinding`
- `SocialAccessibilityProfile`

Runtime state remains separate from immutable definitions.

## 57.2 Summer Engine

Summer Engine may assist with:

- string extraction;
- localisation-context generation;
- placeholder checks;
- pseudo-localisation;
- pronunciation coverage analysis;
- subtitle timing suggestions;
- recording-script exports;
- voice-asset coverage reports;
- accessibility checks;
- screenshot regression preparation;
- test-case generation.

It cannot approve translations, voice rights, casting or final accessibility compliance on its own.

# 58. Registries, Schemas and Stable IDs

28I introduces/uses the following registry families:

| Registry | Example ID |
| --- | --- |
| Social presentation profile | `social.presentation.standard_conversation` |
| Voice profile | `voice.profile.mara_blacksmith` |
| Dialogue audio binding | `voice.binding.mara.watchtower_warning_01` |
| Pronunciation | `pronunciation.faction.glass_court` |
| Subtitle style | `subtitle.style.standard` |
| Caption definition | `caption.social.crowd_uneasy` |
| Localisation context | `loc.context.social.negotiation_counteroffer` |
| Accessibility profile | `social.a11y.hearing_first` |
| Dubbing coverage record | `voice.coverage.en-US.core_v1` |

Every definition carries version/provenance/approval fields through Set 25 governance.

# 59. Validation, Automated Tests and Human Review

Validation must catch both data and presentation defects.

## 59.1 Automated Validation Families

| Validation | Example Failure |
| --- | --- |
| Localisation key coverage | Visible choice has no supported-language entry. |
| Placeholder integrity | Translation drops `{count}` or changes variable type. |
| Hidden-content leakage | Hidden choice string appears in rendered list. |
| Subtitle overflow | 150% text scale clips in split-screen. |
| Caption density | Raid + dialogue produces unreadable stack. |
| Voice binding | Voice asset bound to wrong speaker/line revision. |
| Pronunciation | Key proper noun lacks approved pronunciation for recording package. |
| Rights/provenance | Shipping voice asset has incomplete performer/licence record. |
| Lip sync | Viseme track duration mismatches approved audio beyond tolerance. |
| Accessibility | Critical speech lacks text/caption equivalent. |
| Controller | Focus trap or unavailable choice receives default confirm. |
| Narration | Control has no semantic label. |
| Multiplayer | Different localisations commit different semantic choice IDs. |
| Low-end fallback | Disabling voice/face animation breaks progression. |

## 59.2 Human Review

Human review remains necessary for:

- acting quality;
- translation nuance;
- pronunciation;
- cultural tone;
- subtitle readability;
- caption usefulness;
- accessibility usability;
- lip-sync quality;
- mix intelligibility;
- narrative intent.

# 60. Performance, Memory and Hardware Scalability

Social presentation scales by capability tier.

## 60.1 Low-End Social Profile

May disable/reduce:

- high-resolution portraits;
- facial visemes beyond simple talk motion;
- background character speech;
- expensive voice spatialisation details;
- animated UI flourishes;
- synthetic voice/runtime AI;
- large transcript caches.

Must retain:

- complete localised text;
- valid choices;
- subtitles/captions;
- speaker identity;
- reason codes;
- core audio if enabled;
- accessible input;
- conversation persistence.

## 60.2 Voice Asset Streaming

Long recorded dialogue should support streaming and language-pack separation where practical. Unused dubbing languages should not need to occupy active memory.

# 61. Core Example Scenarios

## 61.1 Village Request

Mara asks for Oak Beams for a watchtower.

- 28B supplies speaker, intent and choices.
- 28H supplies approved line content.
- 28I localises the text and displays **Mara - Builder/Blacksmith** only if known.
- If a recorded line exists, 23F/23G play it from the mouth/head source.
- Subtitle remains available independently.
- Choice **"I'll bring the beams."** submits a semantic accept command.
- The UI does not create the request or reserve resources by itself.

## 61.2 Partial Language Comprehension

An Elven envoy speaks a language the player partly understands.

- 28C reports 45% semantic fidelity and recognised treaty terms.
- 28I renders only the meaning the character understood and marks uncertain segments.
- Product localisation remains fully in the player's selected language.
- An interpreter joins; later lines show **Interpreter translation** attribution.

## 61.3 Companion Personal Scene

A close companion discusses a past betrayal.

- 28D supplies relationship-safe context and relevant social memory.
- 28H uses authored-lock content.
- 28I plays the approved recorded voice if available, displays subtitles and optional relationship-context link.
- Exact hidden Trust/Grievance values are not exposed.
- Reduced-motion mode avoids forced camera close-up.

## 61.4 Goblin Raid Warning During Conversation

A villager is speaking when the watchtower bell and distant horn sound.

- 23G raises critical warning audio/captions.
- 28B issues a hard/soft interruption according to event state.
- 28I closes/suspends conversation with a clear reason.
- Caption reads **[raid bell - urgent]** and directional horn cue where available.
- Conversation can later resume if valid.

## 61.5 Split-Screen Negotiation

Two local players participate in a merchant contract discussion.

- Shared semantic terms come from Set 27/28E.
- Player 1 sees English; Player 2 sees Japanese.
- One player has decision authority; the other's panel clearly shows **Waiting for party leader**.
- Both can use independent subtitle sizes.
- Semantic choice ID remains identical across languages.

## 61.6 Optional Synthetic Voice Failure

A future optional synthetic voice provider times out.

- 28H deterministic localised line remains valid.
- 28I immediately displays text/subtitle.
- No gameplay state waits for speech.
- A generic talk animation may play or remain idle.
- Provider error is logged diagnostically, not spoken by the NPC.

# 62. POC and Production Scope

## 62.1 POC Required

The POC should prove:

- standard named-NPC conversation panel;
- localised text via keys/typed parameters;
- speaker identity and role;
- intent-based choices;
- visible unavailable reason;
- subtitle display for at least one voiced line/bark;
- one meaningful closed caption with direction/urgency;
- manual advance + auto-advance setting;
- dialogue transcript/recent history;
- interruption and resume flow;
- UI/text scale at 100%, 125% and 150%;
- controller focus navigation;
- pseudo-localisation stress pass;
- separate dialogue volume and captions;
- reduced-motion conversation camera;
- one voice profile + pronunciation entry;
- basic mouth/head audio socket playback;
- low-end text-only fallback.

## 62.2 Production Expansion

Production adds:

- full terminology database;
- multiple product languages;
- dubbing coverage as budgeted;
- key character voice libraries;
- viseme/lip-sync pipeline;
- group/council presentation;
- interpreter/partial-language UI;
- richer transcript/history;
- social narration/screen-reader support;
- split-screen local language independence;
- optional approved runtime synthetic voice only after separate gate.

# 63. Staged Delivery Plan

| Stage | Deliverable |
| --- | --- |
| 28I-1 | Presentation payload, standard conversation layout, choice/reason rendering. |
| 28I-2 | Subtitle/caption system integration with 23F/23G. |
| 28I-3 | Localisation keys, typed messages, glossary and pseudo-localisation. |
| 28I-4 | Voice profile, one recorded workflow, mouth source and audio focus integration. |
| 28I-5 | Accessibility settings, large text, reduced motion, narration-ready labels. |
| 28I-6 | Transcript/history and multi-person/group presentation. |
| 28I-7 | Voice localisation/dubbing pipeline and pronunciation library. |
| 28I-8 | Viseme/lip-sync pipeline and performance hooks. |
| 28I-9 | Multiplayer/split-screen presentation reconciliation with 28J. |
| 28I-10 | Full regression, low-end, localisation and accessibility acceptance pass. |

# 64. 28I Acceptance Criteria

28I is complete when the design and implementation path can demonstrate all of the following:

- every consequential social interaction has a text-complete path;
- voice can be disabled without losing mechanics;
- product language and in-world language are unambiguously separate;
- choices use semantic IDs and cannot be committed by parsing displayed text;
- hidden/unknown information does not leak through labels, subtitles or voice;
- important dialogue remains readable at large text sizes;
- controller focus never traps the player;
- subtitles and captions can operate independently;
- critical audio has non-audio equivalents;
- captions identify meaningful source/direction without relying on colour;
- social history preserves actionable information without storing unnecessary ambient clutter;
- voice assets have provenance/rights metadata;
- important proper nouns have pronunciation support;
- runtime audio uses Presentation Forge instead of bypassing it;
- lip sync degrades cleanly when unsupported;
- localised grammar does not rely on English word order;
- pseudo-localisation finds clipping/placeholder faults;
- AI/machine translation cannot self-approve shipping localisation;
- optional synthetic voice is never required for gameplay;
- split-screen players can maintain independent presentation preferences;
- low-end profile preserves full social functionality;
- no Set 27/29/30 gameplay ownership is duplicated.

# 65. Open Questions Assigned to 28J or Later Production

The following questions remain intentionally deferred:

1. Exact network replication format for social presentation payloads.
2. Final party-leader/vote/consensus UI policy in multiplayer.
3. Whether each local split-screen player may choose a fully independent product language on all supported platforms.
4. Final supported-language launch list.
5. Final dubbing coverage by language and character class.
6. Whether optional runtime synthetic character voice is approved at all for production.
7. Exact performer-contract and synthetic-voice rights language; legal review owns final contractual terms.
8. Final subtitle characters-per-second/readability values by language.
9. Final screen-reader platform certification target.
10. Final font family/fallback set for all supported writing systems.
11. Whether right-to-left languages are launch requirements or post-launch scope.
12. Final audio loudness/mastering certification values, owned with Presentation Forge/audio production.
13. Exact lip-sync technology and rig fidelity selected after Entity/Animation profiling.
14. Whether player-character dialogue choices receive recorded voice in any production profile.
15. Cloud/local speech-to-text or voice-control features, if any, and their privacy policy.

# 66. Cross-Set Interface Amendments

**No new ownership transfer is required by 28I v0.1.**

The governing Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0 remains intact.

28I records only the following **presentation-oriented interface clarifications** for final reconciliation:

| Proposed Interface | Owner -> Consumer | Purpose | Ownership Note |
| --- | --- | --- | --- |
| `LocalisedEconomicTermSummary()` | Set 27 -> 28I | Read-only typed economic term IDs/amounts suitable for localised social UI. | Set 27 still calculates prices/contracts. |
| `SociallyRelevantConditionSummary()` | Set 29 -> 28I | Read-only localisable condition category/reason where a social UI is allowed to disclose it. | Set 29 owns health/condition truth; privacy/disclosure remains governed. |
| `TravelContextPresentationSummary()` | Set 30 -> 28I | Read-only travel/mount/vehicle context for social prompts such as "No passenger seat available." | Set 30 owns movement/capacity. |

These are interface proposals only. They do not add gameplay logic to Set 28.

# Appendix A. Social Presentation Payload Template

```yaml
SocialPresentationPayload:
  session_id: social_session:<id>
  presentation_revision: 42
  mode: standard_conversation
  speaker:
    entity_id: entity:<id>
    display_name_key: npc.name.mara
    known_role_key: job.blacksmith
    portrait_ref: portrait.mara.default
    voice_profile_id: voice.profile.mara_blacksmith
  line:
    semantic_line_id: dialogue.line.watchtower_need_01
    localisation_key: dialogue.watchtower.need_intro
    parameters:
      settlement: settlement:<id>
      resource: item.material.oak_beam
      count: 12
    exact_wording_lock: false
    tone_tags: [concerned, practical]
    comprehension_state: full
    transcript_policy: consequential
  choices:
    - choice_id: dialogue.choice.accept_watchtower
      intent_id: social.intent.accept_request
      label_key: dialogue.choice.accept_help
      state: available
    - choice_id: dialogue.choice.ask_payment
      intent_id: social.intent.negotiate
      label_key: dialogue.choice.ask_payment
      state: available
  interruption_state: active
  audio:
    speech_binding_id: voice.binding.mara.watchtower_need_01
    subtitle_required: true
    focus_intent: dialogue_focus
  privacy_class: ordinary_gameplay
```

# Appendix B. Voice Profile and Voice Asset Templates

## B.1 CharacterVoiceProfile

```yaml
CharacterVoiceProfile:
  voice_profile_id: voice.profile.mara_blacksmith
  bound_character_or_role: entity_definition.mara
  performance:
    pace: measured
    energy_range: medium_to_high
    register: practical_informal
    emotional_range: [warm, stern, worried, relieved, angry]
  languages:
    source_language: en
    supported_recorded: [en]
  pronunciation_sets:
    - pronunciation.riverward.core
    - pronunciation.magic.core
  nonverbal_family: voice.family.mara_nonverbal
  performer_rights_record: rights.voice.<id>
  approval_state: approved
  version: 1
```

## B.2 VoiceAssetBinding

| Field | Description |
| --- | --- |
| binding_id | Stable speech binding ID. |
| semantic_line_id | Meaning/content source. |
| voice_profile_id | Speaker voice profile. |
| product_language | Recorded/dub language. |
| sound_event_id | 23F Sound Event reference. |
| duration_ms | Approved audio duration. |
| lip_sync_track_id | Optional viseme/marker resource. |
| subtitle_segment_ids | Timed subtitle mapping. |
| exact_wording_hash | Detect stale asset relative to script. |
| rights_record | Performer/licence provenance. |
| approval_state | Draft/review/approved/deprecated. |

# Appendix C. Subtitle and Caption Templates

## C.1 Subtitle Definition

```yaml
SubtitlePresentation:
  semantic_line_id: dialogue.line.example
  speaker_attribution: known_name
  text_source: localisation_key
  display_policy: always_when_spoken
  min_read_policy: reading_speed_profile
  allow_manual_hold: true
  history_eligible: true
  direction_indicator: optional
```

## C.2 Caption Definition

```yaml
CaptionDefinition:
  caption_id: caption.social.raid_horn
  text_key: caption.raid_horn
  category: warning
  criticality: urgent
  source_attribution: optional
  direction: true
  distance_band: true
  repeat_cooldown: 4s
  non_audio_equivalent: ui.notice.raid_warning
```

# Appendix D. Localisation Entry and Terminology Templates

## D.1 Localisation Entry

```yaml
LocalisationEntry:
  key: dialogue.watchtower.need_intro
  source_text: "We're short on beams for the watchtower. We still need {count}."
  semantic_context: request_resource_shortage
  parameters:
    count: integer
  speaker_context: practical_villager
  register: informal
  max_length: null
  exact_wording_lock: false
  term_refs:
    - building.watchtower
  status:
    en: source_approved
    fr: translated_reviewed
    ja: translated_reviewed
```

## D.2 Terminology Entry

```yaml
TerminologyEntry:
  term_id: term.magic.leyline
  owner: document.09_magic
  source_form: "leyline"
  definition: "Persistent world-scale magical energy route."
  localisation_policy: translate_if_natural
  pronunciation_ref: pronunciation.magic.leyline
  short_form_allowed: true
  protected_meaning: true
```

# Appendix E. Accessibility Requirement Matrix

| Social Feature | Hearing | Vision | Motor | Cognitive/Reading | Comfort |
| --- | --- | --- | --- | --- | --- |
| Spoken line | Subtitle + speaker | Narration-ready label | Manual advance | Adjustable duration/history | Dialogue volume control |
| Off-screen warning | Caption + direction | Audio/haptic alternative | No precision input | Plain urgency label | Reduced sharpness/dynamic range option |
| Dialogue choices | Text complete | Focus/narration | Remap + large targets | Intent-first labels | No forced camera motion |
| Timed choice | Visible timer | Narrated timer state | Extended/no timer option | Reading-time assistance | Avoid panic effects |
| Group conversation | Speaker attribution | Focused speaker announcement | Stable navigation | Turn history | Reduce overlapping speech |
| Relationship cue | Text/icon label | Narration | No rapid input | No hidden-number requirement | Reduce animation intensity |
| Interpreter state | Localised label | Narration | Standard choice controls | Clear comprehension level | No extra motion |
| Transcript | Search/filter text | Screen-reader ordering | Controller navigation | Key-term highlights | Static presentation |

# Appendix F. Validation and Reason-Code Catalogue

| Code | Severity | Meaning |
| --- | --- | --- |
| SOC-PRES-001 | Blocker | Consequential dialogue has no text-complete fallback. |
| SOC-PRES-002 | Error | Visible choice references missing localisation. |
| SOC-PRES-003 | Error | Translation drops/duplicates typed placeholder. |
| SOC-PRES-004 | Error | Hidden/unknown content is exposed by presentation. |
| SOC-PRES-005 | Warning | Subtitle exceeds target reading/layout budget. |
| SOC-PRES-006 | Error | Critical spoken cue lacks subtitle/caption/text equivalent. |
| SOC-PRES-007 | Error | Voice asset has unresolved rights/provenance. |
| SOC-PRES-008 | Error | Voice binding semantic-line revision mismatch. |
| SOC-PRES-009 | Warning | Proper noun lacks pronunciation guidance for required recording. |
| SOC-PRES-010 | Error | Speaker attribution reveals unknown identity. |
| SOC-PRES-011 | Error | Colour is sole speaker/choice distinction. |
| SOC-PRES-012 | Error | Large-text layout clips/overlaps. |
| SOC-PRES-013 | Error | Controller focus trap in social screen. |
| SOC-PRES-014 | Warning | Ambient caption density exceeds configured budget. |
| SOC-PRES-015 | Error | Synthetic voice has no deterministic text fallback. |
| SOC-PRES-016 | Error | Product localisation alters semantic choice ID or gameplay value. |
| SOC-PRES-017 | Error | In-world language comprehension is inferred from product language. |
| SOC-PRES-018 | Warning | Lip-sync/voice timing mismatch beyond target tolerance. |
| SOC-PRES-019 | Error | Split-screen local language changes shared semantic outcome. |
| SOC-PRES-020 | Blocker | Low-end/text-only profile cannot complete required social flow. |

# Appendix G. Cross-System Responsibility Matrix

| System | Supplies to 28I | 28I Returns/Requests | 28I Must Never Do |
| --- | --- | --- | --- |
| 28B Dialogue Runtime | Session, speaker, choices, reasons, interruption. | UI input command intent / presentation events. | Commit choices directly. |
| 28C Knowledge/Language | Identity knowledge, comprehension, interpreter result. | Local presentation of understood content. | Grant comprehension or reveal hidden facts. |
| 28D Relationships | Visible bands/milestones/cues. | Relationship-safe labels/history presentation. | Change or expose hidden raw values. |
| 28E Social Resolution | Outcome/reason/conditions. | Localised explanation. | Recalculate persuasion/negotiation. |
| 28F Companions | Role/status/availability. | Companion UI/presentation. | Recruit/dismiss. |
| 28G Delegation | Assignment/report semantics. | Localised report/history view. | Complete assignments. |
| 28H Dialogue Governance | Approved semantic text payload, provenance, exact wording. | Language/voice/presentation result. | Invent semantic truth. |
| Document 17 | UI styles, navigation, global accessibility/settings. | Specialist social screen requirements. | Replace whole-game UI architecture. |
| Entity/Animation | Rig, face, sockets, gesture capability. | Speech timing/viseme/gesture requests. | Change NPC state or pathfinding. |
| 23F Sound Forge | Speech Sound Events/source content. | Dialogue audio bindings/metadata. | Edit runtime gameplay. |
| 23G Runtime Audio | Spatial/mix/caption dispatch. | Speech priority/focus/source intent. | Override mix/acoustics directly. |
| Set 27 Economy | Typed price/contract read models. | Localised term presentation. | Calculate prices/contracts. |
| Set 29 Survival | Disclosable condition/recovery summaries. | Social availability explanation. | Heal/injure/diagnose. |
| Set 30 Movement | Travel/seat/mount/route presentation summaries. | Travel-context social prompt. | Move/path/seat actors. |
| Set 25 / Technical | IDs, provenance, package/feature flags. | Validation/coverage diagnostics. | Bypass package/rights governance. |
| 28J | Authority/network/save policy. | Presentation replication requirements. | Define final networking policy. |

# Appendix H. Glossary

**Assistive TTS** - Accessibility narration that reads localised UI/dialogue text using a player-selected narrator voice. It is not the canonical performed voice of the character.

**Caption** - Text description of meaningful audible information other than, or in addition to, spoken dialogue; may include source, direction, distance and urgency.

**Character Voice Profile** - Presentation definition describing casting/performance/pronunciation and technical voice compatibility for a character or role without owning the character's social personality.

**Dialogue Focus** - Presentation request asking runtime audio to prioritise current speech while retaining critical world cues. Final mix behaviour remains owned by 23G.

**Dubbing** - Recorded or approved synthetic voice localisation that performs an already-approved semantic line in another product language.

**Exact-Worded Line** - Dialogue whose wording is locked by authorship/story requirements and must not be freely rewritten during localisation or generation beyond approved adaptation.

**In-World Language** - Fictional language ability/comprehension simulated by 28C.

**Localisation Key** - Stable identifier resolving to approved player-facing text in a product language.

**Product Language** - Real-world language chosen by the player for the game's UI/text/captions; independent of in-world language ability.

**Pronunciation Entry** - Canonical record for how a fantasy name/term should be pronounced across voice recording, dubbing, TTS and synthesis.

**Semantic Choice ID** - Stable gameplay identity of a dialogue choice; localised wording may differ while the semantic choice remains the same.

**Social Presentation Payload** - Knowledge/permission-filtered view model containing everything a local player needs to render a social interaction without granting UI direct access to authoritative internals.

**Speech Asset Binding** - Reference connecting a semantic dialogue line, voice profile and product language to an approved Presentation Forge Sound Event and optional lip-sync data.

**Subtitle** - Text representation of spoken dialogue, normally preserving speaker attribution and semantic content.

**Synthetic Character Voice** - Generated performed character speech using an approved synthetic voice identity. Optional and distinct from assistive narration.

**Text-Complete** - A design state in which every consequential social interaction can be understood and completed without dialogue audio.

**Viseme** - Visual mouth shape associated with one or more speech phonemes, used for lip-sync presentation.

---

**End of Document 28I - Voice, Localisation, Accessibility, UI and Presentation - Version 0.1**
