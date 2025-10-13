# NARRATIVE GARDEN — Candy Crush Meets Cinema

## Overview

**NARRATIVE GARDEN** transforms the Matrix-Editor's 15-beat narrative structure into a match-3 game. Build complete film structures through gameplay.

### Core Innovation

**Traditional editors:** Manually assemble clips on timeline  
**Narrative Garden:** Match-3 gameplay procedurally generates narrative structure

Every match = next beat collected. Complete all 15 beats = exportable film structure.

---

## The 5 Evolutionary Versions

### v0.1 — GENESIS (Beat Collection)

**Focus:** Simple beat collection through matching

**Mechanics:**
- Match 3+ fragments to unlock next beat
- Sequential beat collection (1→2→3...→15)
- Basic scoring: +100 per beat, +500 completion bonus

**Win Condition:**
- ✓ Collect all 15 beats
- ✓ Score: 2000+ points

**Goal:** Learn the 15-beat structure through play

---

### v0.2 — ENHANCED (Beat + Syntagma)

**Focus:** Add cinematic structure (Metz's 8 syntagma types)

**Mechanics:**
- Match 3+ → Select syntagma type for beat
- 8 syntagma options: AS, PS, BS, DS, ALT, SC, ES, OS
- Bonus points for suggested syntagmas (+50)
- Base syntagma bonus: +100-150 per type

**Win Condition:**
- ✓ 15 beats with syntagma assignments
- ✓ Score: 3000+ points
- ✓ +800 completion bonus

**Goal:** Understand cinematic language (syntagmatic theory)

---

### v0.3 — VISUAL UPGRADE (Act Structure)

**Focus:** 3-act structure with visual feedback

**Mechanics:**
- 4-color coded act sections (Act 1, 2A, 2B, 3)
- Progress bars per act
- Act completion bonuses:
  - Act 1 (5 beats): +200
  - Act 2A (5 beats): +300
  - Act 2B (2 beats): +200
  - Act 3 (3 beats): +400
- Suggested syntagmas highlighted
- Visual hierarchy shows narrative arc

**Win Condition:**
- ✓ Complete 3-act structure
- ✓ Score: 5000+ points
- ✓ +1000 full structure bonus

**Goal:** See narrative structure, not just collect beats

---

### v0.4 — INTELLIGENCE (Ring Buffer Clip Selection)

**Focus:** Smart clip management (no repeats)

**Mechanics:**
- 30 total clips in 5 categories
- Ring buffer system: clips marked "NEXT IN RING"
- Select 2-4 clips per beat
- Clip pool visualization
- Variety bonus for using diverse categories

**Scoring:**
- +100 per beat
- +50 per clip selected
- +100 variety bonus (3+ categories)
- +1500 completion bonus

**Win Condition:**
- ✓ 15 beats with 2-4 clips each
- ✓ Maximum clip variety
- ✓ Score: 7000+ points

**Goal:** Build sequences with intentional variety

---

### v0.5 — SYNTHESIS (Timeline Export)

**Focus:** Professional output formats

**Mechanics:**
- Visual timeline showing all beats
- Real-time beat/clip tracking
- 4 export formats:
  1. **Storymap.md** - Narrative structure markdown
  2. **EDL** - Edit Decision List (industry standard)
  3. **OTI.JSON** - Complete metadata
  4. **Shotlist.js** - AI generation prompts

**Timeline Features:**
- Horizontal beat visualization
- Height = completion status
- Click beats to review
- Export individual or all formats

**Win Condition:**
- ✓ 15 beats fully structured
- ✓ Exportable professional formats
- ✓ Score: 10000+ points

**Goal:** Bridge gameplay → production pipeline

---

## Scoring Philosophy

Each version increases scoring complexity to match added features:

| Version | Base Points | Max Bonus | Total Possible |
|---------|------------|-----------|----------------|
| v0.1 | 1500 | 500 | ~2000 |
| v0.2 | 1500 | 1500 | ~3000 |
| v0.3 | 1500 | 3500 | ~5000 |
| v0.4 | 3000 | 4000 | ~7000 |
| v0.5 | 3000 | 7000+ | ~10000+ |

**Progression:** More features = more ways to win = higher scores

---

## Win Psychology

### v0.1 — Discovery
**Feel:** "I collected all 15 beats!"  
**Learning:** Beat names and sequence

### v0.2 — Mastery
**Feel:** "I chose appropriate syntagmas!"  
**Learning:** Cinematic grammar

### v0.3 — Structure
**Feel:** "I built a 3-act story!"  
**Learning:** Narrative architecture

### v0.4 — Intelligence
**Feel:** "I created variety without repeats!"  
**Learning:** Editorial curation

### v0.5 — Synthesis
**Feel:** "I exported a professional sequence!"  
**Learning:** Production workflow

---

## The 15 Beats (Save the Cat)

### Act 1: Setup (5 beats)
1. **Opening Image** — First impression
2. **Theme Stated** — What it's about
3. **Set-Up** — Status quo
4. **Catalyst** — Inciting incident
5. **Debate** — Hesitation

### Act 2A: Confrontation (5 beats)
6. **Break into Two** — Commit to journey
7. **B Story** — Secondary storyline
8. **Fun and Games** — Promise of premise
9. **Midpoint** — False victory/defeat
10. **Bad Guys Close In** — Complications

### Act 2B: Crisis (2 beats)
11. **All Is Lost** — Lowest point
12. **Dark Night of the Soul** — Process loss

### Act 3: Resolution (3 beats)
13. **Break into Three** — Solution found
14. **Finale** — Climax
15. **Final Image** — Transformation

---

## The 8 Syntagmas (Metz)

1. **AS** - Autonomous Shot (single moment)
2. **PS** - Parallel Syntagma (comparison)
3. **BS** - Bracket Syntagma (montage)
4. **DS** - Descriptive Syntagma (setting)
5. **ALT** - Alternating Syntagma (simultaneous)
6. **SC** - Scene (real-time)
7. **ES** - Episodic Sequence (over time)
8. **OS** - Ordinary Sequence (condensed)

---

## Export Formats Explained

### 1. Storymap.md
```markdown
# NARRATIVE STRUCTURE

## Beat 1: Opening Image
**Act:** Act 1
**Syntagma:** DS
**Clips:** Landscape, Wide, Skyline
```

### 2. EDL (Edit Decision List)
```
001  001  V  C    00:00:00:00 00:00:05:00 00:00:00:00 00:00:05:00
* FROM CLIP NAME: Landscape
```

### 3. OTI.JSON
```json
{
  "title": "Narrative Garden Sequence",
  "totalBeats": 15,
  "structure": [...]
}
```

### 4. Shotlist.js
```javascript
const prompts = [
  "A cinematic shot of Landscape. DS style.",
  ...
];
```

---

## Use Cases

### 1. Film Students
Learn narrative structure through play. Export becomes study guide.

### 2. Indie Filmmakers
Quick structure generation. Export to editing software.

### 3. AI Video Generation
Shotlist.js → AI prompts → Generated footage.

### 4. Narrative Designers
Experiment with structure. See what emerges.

### 5. Game Design Research
Proof-of-concept: gameplay as editorial process.

---

## Technical Architecture

**Built with:**
- Pure HTML5 Canvas
- No frameworks
- ~20KB per version
- Mobile-responsive
- Offline-capable

**Match-3 Engine:**
- 8×8 grid
- 6 fragment types
- Horizontal + vertical matching
- Cascade system
- Smart refill

**Export System:**
- JSON serialization
- EDL timecode generation
- Markdown templating
- JavaScript prompt arrays

---

## Comparison to Matrix-Editor

| Feature | Matrix-Editor | Narrative Garden |
|---------|---------------|------------------|
| **Input** | Tower defense gameplay | Match-3 gameplay |
| **Collection** | Clips hit walls | Match fragments |
| **Structure** | Manual beat assignment | Sequential auto-advance |
| **Complexity** | Full editor features | Simplified for flow |
| **Output** | Same export formats | Same export formats |
| **Goal** | Assemble while defending | Build through matching |

**Narrative Garden = Matrix-Editor's accessible cousin**

---

## Future Versions

### v0.6 — Sensation (Haptics + Sound)
- Haptic feedback per beat type
- Procedural sound design
- Audio-reactive visuals

### v0.7 — Mosaic (Spatial Sampling)
- Video fragments in grid cells
- Visual mosaic as you build
- Real-time preview

### v0.8 — Emergence (Cellular Automata)
- Self-organizing narrative patterns
- Autonomous beat suggestions
- AI-assisted structure

### v0.9 — Flux (Organic Flow)
- Flowing visual field
- Smooth transitions
- Glassmorphic effects

### v1.0 — Multiplayer
- Collaborative structure building
- Shared narrative space
- Real-time co-editing

---

## Philosophy

> **"Every match is an editorial decision.**  
> **Every beat is a narrative moment.**  
> **Every sequence is a film."**

Narrative Garden proves that **procedural generation ≠ random chaos**.  

Structure + constraints + gameplay = **intentional emergence**.

---

## Credits

**Inspired by:**
- Save the Cat (Blake Snyder)
- Syntagmatic Theory (Christian Metz)
- Matrix-Editor (Sense Ritual Lab)
- Match-3 mechanics (Candy Crush)

**Philosophy:**
- Foraging, not farming
- Discovery, not assembly
- Anti-tools that create sovereignty

---

*Made with 🎬 by Sense Ritual Laboratory*  
*Gameplay as Editorial Process*
