# Matrix-Editor: Narrative Assembly System

## Overview
Matrix-Editor is an enhanced version of Chain-Collector that implements the full **Save the Cat Beat Sheet** (15 beats) with **Metz's Syntagma Theory** for cinematic structure.

## Key Differences from Chain-Collector

### Chain-Collector (Original)
- **Goal:** Collect 12 clips minimum
- **Structure:** Flexible chains of 3+ clips
- **Output:** OTI.JSON with metadata

### Matrix-Editor (Enhanced)
- **Goal:** Assemble 15 beats (full narrative arc)
- **Structure:** Each chain = 1 Beat + 1 Syntagma + 3-5 Clips
- **Output:** OTI.JSON + Storymap.md + Shotlist.js + Chart.d3

---

## The 15-Beat Structure (Save the Cat)

### ACT 1: SETUP (5 beats)
1. **Opening Image** - First impression of the world
2. **Theme Stated** - What the story is about
3. **Set-Up** - Establish status quo
4. **Catalyst** - Inciting incident
5. **Debate** - Hesitation before commitment

### ACT 2A: CONFRONTATION (5 beats)
6. **Break into Two** - Commit to journey
7. **B Story** - Secondary storyline
8. **Fun and Games** - Promise of premise
9. **Midpoint** - False victory/defeat
10. **Bad Guys Close In** - Complications

### ACT 2B: CRISIS (2 beats)
11. **All Is Lost** - Lowest point
12. **Dark Night of the Soul** - Process the loss

### ACT 3: RESOLUTION (3 beats)
13. **Break into Three** - Solution found
14. **Finale** - Climax
15. **Final Image** - Transformation shown

---

## Syntagma Types (Metz)

1. **AS** - Autonomous Shot (single powerful moment)
2. **PS** - Parallel Syntagma (comparison/contrast)
3. **BS** - Bracket Syntagma (thematic montage)
4. **DS** - Descriptive Syntagma (establish setting)
5. **ALT** - Alternating Syntagma (simultaneous actions)
6. **SC** - Scene (continuous real-time action)
7. **ES** - Episodic Sequence (events over time)
8. **OS** - Ordinary Sequence (condensed progression)

---

## Workflow

### 1. Collect Clips (Gameplay)
- Play the tower defense game
- Collect video fragments as threats hit walls
- Build chains of 3-5 clips

### 2. Assign Beat + Syntagma (When Claiming)
```
Chain Ready (3 clips) → Select Beat → Select Syntagma → Claim
```

### 3. Assemble 15 Beats
- Each beat must be filled
- Bonuses for appropriate syntagma selection
- Scoring based on narrative coherence

### 4. Export Narrative
When all 15 beats collected:
- **Storymap.md** - Full narrative structure
- **Shotlist.js** - Cinematic prompts for each clip
- **Chart.d3** - Interactive visualization
- **OTI.JSON** - Complete metadata

---

## Scoring Bonuses

### Beat Completion
- **+100** per required beat filled
- **+50** per optional beat filled
- **+200** for complete 15-beat structure

### Syntagma Appropriateness
- **+100** for correct syntagma type
- **+50-150** for syntagma-specific rules:
  - **DS**: Needs 3+ clips (variety)
  - **AS**: Best with 1 clip (powerful moment)
  - **PS**: Needs contrasting categories
  - **SC**: Bonus for sequential timing
  - **OS**: Bonus per clip (condensed time)

### Narrative Coherence
- **+150** for complete 3-act structure
- **+100** for balanced act distribution
- **+200** for thematic consistency

---

## Export Formats

### 1. Storymap.md
```markdown
# Diegesis (D)
**Purpose:** [Auto-generated from film title/logline]

# Act 1 (A1): Setup
**Purpose:** [Auto-generated from beats 1-5]

### Beat 1: Opening Image
**Purpose:** [Beat-specific purpose]

#### Syntagma 1 (SY1)
**Type:** Descriptive Syntagma (DS)
**Purpose:** [Syntagma-specific purpose]

#### Shot 1 (SH1)
- **Content:** [Clip description]
- **Angle:** [Inferred from content]
- **Duration:** [Actual clip duration]
- **Movement:** [Inferred from syntagma]
```

### 2. Shotlist.js
```javascript
const prompts = [
  // Shot 1 (SH1)
  "A [angle] shot of [clip content]. The camera [movement], [cinematic detail].",
  
  // Shot 2 (SH2)
  "A [angle] shot of [clip content]. The camera [movement], [cinematic detail].",
  
  // ... all clips
];
```

### 3. Chart.d3
```javascript
const data = {
  "name": "Diegesis",
  "children": [
    {
      "name": "Act 1: Setup",
      "children": [
        {
          "name": "Beat 1: Opening Image",
          "children": [
            {
              "name": "Syntagma: DS",
              "children": [
                {
                  "name": "Shot 1 (SH1)",
                  "content": "[clip description]",
                  "duration": 12,
                  "image": "[video thumbnail]"
                }
              ]
            }
          ]
        }
      ]
    }
  ]
};
```

---

## Future Enhancements

1. **Prompt Lab** - Hidden panel for advanced prompt engineering
2. **Beat Suggestions** - AI suggests appropriate beats for collected clips
3. **Syntagma Validation** - Real-time feedback on structural choices
4. **Visual Timeline** - D3.js timeline showing narrative flow
5. **Export to Editing Software** - Direct EDL/XML export

---

## How to Use

1. Open `matrix-editor.html` in browser
2. Select faction (determines color/theme)
3. Play tower defense, collect clips
4. When chain forms, select Beat + Syntagma
5. Repeat until 15 beats collected
6. Export complete narrative structure

---

## Files Generated

- `[title]_storymap.md` - Narrative structure
- `[title]_shotlist.js` - Cinematic prompts
- `[title]_chart.d3.js` - Visualization data
- `[title]_[timestamp].oti.json` - Complete metadata

---

**Matrix-Editor transforms gameplay into structured narrative assembly!** 🎬
