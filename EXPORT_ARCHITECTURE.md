# EXPORT ARCHITECTURE — OTI Format Integration

**Goal:** Connect all crusher/meshwork experiments to prompt-lab.html via unified OTI JSON format

---

## 📋 OTI FORMAT SPECIFICATION

```json
{
  "version": "1.0",
  "title": "Film Title",
  "logline": "One-sentence description",
  "timestamp": "ISO 8601",
  "coherenceScore": 1450,
  "sourceVideo": "YouTube ID or local path",
  "sequences": [
    {
      "id": 1,
      "sequenceNumber": 1,
      "beatName": "Opening Image",
      "beatNumber": 1,
      "act": 1,
      "syntagmaType": "BS",
      "syntagmaName": "Bracket Syntagma",
      "lane": 2,
      "flagged": false,
      "rating": null,
      "tagged": false,
      "clips": [
        {
          "clipNumber": 1,
          "clipId": "unique-id",
          "title": "Clip Title",
          "category": "Category",
          "icon": "🎭",
          "sourceIn": 89,
          "sourceOut": 103,
          "duration": 14,
          "description": "Clip description",
          "tags": ["tag1", "tag2"]
        }
      ]
    }
  ]
}
```

---

## 🎬 TOOL COMPARISON & PROCEDURAL RHETORIC

### **⭐ PRODUCTION TOOLS (Full Export)**

#### **1. Garden Editor (garden.html)**
**Procedural Rhetoric:** Tetris-as-montage. Spatial arrangement = temporal sequence.
**Narrative Genome:**
- Input: Video fragments (49 concepts)
- Process: Falling block tetris gameplay
- Output: Cleared lines = locked sequences
- Metaphor: Assembly through spatial pressure

**Information Architecture:**
```
User loads video → Blocks fall (each = fragment) → 
User rotates/moves → Clears horizontal lines → 
Lines lock into timeline → Export EDL/JSON
```

**Export Capability:** ✅ FULL
- EDL export
- JSON export (needs OTI format upgrade)
- Recursive timeline data

**OTI Mapping:**
```javascript
sequences: timeline.lockedSequences.map(seq => ({
  beatNumber: seq.beatIndex,
  syntagmaType: detectSyntagmaFromBlocks(seq.blocks),
  clips: seq.blocks.map(block => ({
    clipId: block.fragmentId,
    sourceIn: block.timeIn,
    sourceOut: block.timeOut,
    duration: block.duration
  }))
}))
```

---

#### **2. Matrix Editor (matrix-editor.html)**
**Procedural Rhetoric:** Timeline-as-matrix. Drag-and-drop assembly.
**Narrative Genome:**
- Input: Fragment library
- Process: Multi-track timeline editing
- Output: Beat sheets + EDL

**Information Architecture:**
```
Fragment library → Drag to timeline lanes → 
Arrange in beats → Tag with syntagma → 
Export EDL/Beat sheet
```

**Export Capability:** ✅ FULL
- EDL export
- Beat sheet export
- Multi-track timeline

**OTI Mapping:**
```javascript
sequences: beatSheet.beats.map(beat => ({
  beatName: beat.name,
  beatNumber: beat.index,
  act: getActNumber(beat.index),
  syntagmaType: beat.syntagmaCode,
  syntagmaName: SYNTAGMAS[beat.syntagmaCode],
  lane: beat.track,
  clips: beat.clips.map(c => ({
    clipId: c.id,
    title: c.title,
    category: c.category,
    sourceIn: c.in,
    sourceOut: c.out,
    duration: c.duration,
    description: c.desc
  }))
}))
```

---

### **🧪 EXPERIMENTAL TOOLS (Visual Prototypes)**

#### **3. Meshwork 725 (meshwork-725.html)**
**Procedural Rhetoric:** Voronoi tessellation-as-narrative-space. Visual breathing = act rhythm.
**Narrative Genome:**
- Input: 6 video loops
- Process: Wavy Voronoi grid with breathing animation
- Output: Visual composition (currently no export)

**Information Architecture:**
```
6 videos auto-play → Voronoi cells display → 
Breathing animation changes per act → 
Bloom/edge effects create mood → 
[MISSING: Export mechanism]
```

**Export Capability:** ❌ NONE (needs addition)

**Procedural Rhetoric Analysis:**
- Metaphor: Organic cells = narrative fragments
- Process: Breathing = dramatic tension
- Limitation: No user agency, no assembly, pure display

**OTI Mapping (Proposed):**
```javascript
// Capture current visual state as "sequence"
sequences: [{
  beatName: "Visual Composition",
  beatNumber: 1,
  syntagmaType: "DS", // Descriptive Syntagma
  clips: voronoiCells.map((cell, i) => ({
    clipId: `cell-${i}`,
    title: `Video ${cell.videoIndex}`,
    sourceIn: cell.video.currentTime,
    sourceOut: cell.video.currentTime + 5,
    duration: 5,
    metadata: {
      voronoiPosition: cell.centerPoint,
      breathingPhase: breathing.time,
      bloomIntensity: settings.bloom
    }
  }))
}]
```

**Needs:** 
- Capture button to freeze current state
- Export current cell arrangement
- Map visual composition to narrative structure

---

#### **4. M-Crusher-09 (Flux Garden)**
**Procedural Rhetoric:** Flow fields-as-narrative-drift. Perlin noise = emergent connections.
**Narrative Genome:**
- Input: Marching shapes + Perlin noise
- Process: Organic flow animation
- Output: Generative visual patterns

**Information Architecture:**
```
Initialize flow field → Perlin noise drives movement → 
Shapes march through field → Color gradients evolve → 
[MISSING: User interaction, Export]
```

**Export Capability:** ❌ NONE

**Procedural Rhetoric Analysis:**
- Metaphor: Flow = narrative momentum
- Process: Noise = chance encounters
- Limitation: No narrative structure, pure aesthetics

**OTI Mapping (Proposed):**
```javascript
// Capture flow state as "ambient sequence"
sequences: [{
  beatName: "Flow State",
  beatNumber: 1,
  syntagmaType: "ALT", // Alternating (flow patterns)
  clips: shapes.map((shape, i) => ({
    clipId: `shape-${i}`,
    title: `Flow ${shape.id}`,
    duration: 10,
    metadata: {
      flowVector: shape.velocity,
      noiseValue: noise.get(shape.x, shape.y),
      colorPhase: shape.hue
    }
  }))
}]
```

**Needs:**
- Add time-based recording
- Capture flow patterns over duration
- Map flow states to narrative phases

---

#### **5. M-Crusher-08 (Video Garden - Automata)**
**Procedural Rhetoric:** Cellular automata-as-editing. Emergence = narrative discovery.
**Narrative Genome:**
- Input: Video grid (self-organizing cells)
- Process: Automata rules determine transitions
- Output: Emergent video patterns

**Information Architecture:**
```
Grid of video cells → Apply automata rules → 
Cells evolve states → Patterns emerge → 
[MISSING: Harvest emerged patterns]
```

**Export Capability:** ❌ NONE

**Procedural Rhetoric Analysis:**
- Metaphor: Evolution = editorial selection
- Process: Automata = algorithmic montage
- Strength: Emergent structures
- Limitation: No capture of emerged patterns

**OTI Mapping (Proposed):**
```javascript
// Capture automata evolution as sequence
sequences: evolutionHistory.map((generation, i) => ({
  beatName: `Generation ${i}`,
  beatNumber: i + 1,
  syntagmaType: "ES", // Episodic Sequence
  clips: generation.cells.map(cell => ({
    clipId: `cell-${cell.row}-${cell.col}`,
    title: `State ${cell.state}`,
    sourceIn: cell.video.currentTime,
    sourceOut: cell.video.currentTime + cell.stateDuration,
    duration: cell.stateDuration,
    metadata: {
      state: cell.state,
      neighbors: cell.neighborCount,
      generation: i
    }
  }))
}))
```

**Needs:**
- Record automata evolution
- Mark "interesting" generations
- Export evolution as sequence

---

#### **6. M-Crusher-07 (Mosaic Sampler)**
**Procedural Rhetoric:** Grid sampling-as-polytemporal-montage.
**Narrative Genome:**
- Input: Multiple videos
- Process: Grid display with spatial compression
- Output: Simultaneous playback mosaic

**Information Architecture:**
```
Load videos → Arrange in grid → 
Sync playback → Visual comparison → 
[MISSING: Sequence assembly]
```

**Export Capability:** ❌ NONE

**OTI Mapping (Proposed):**
```javascript
sequences: [{
  beatName: "Polytemporal Comparison",
  beatNumber: 1,
  syntagmaType: "PS", // Parallel Syntagma
  clips: grid.cells.map((cell, i) => ({
    clipId: `grid-${i}`,
    title: cell.video.name,
    sourceIn: cell.video.currentTime,
    sourceOut: cell.video.currentTime + 10,
    duration: 10,
    metadata: {
      gridPosition: [cell.row, cell.col],
      playbackRate: cell.speed
    }
  }))
}]
```

---

#### **7. M-Crusher-06 (Match-3 Sequencer)**
**Procedural Rhetoric:** Candy Crush-as-montage-selection. Matching = narrative coherence.
**Narrative Genome:**
- Input: Fragment grid (candy crush)
- Process: Match-3 gameplay
- Output: Matched sequences

**Information Architecture:**
```
Grid of fragments → User swaps cells → 
Matches dissolve → New fragments fall → 
Matched clips stored → [MISSING: Export sequence]
```

**Export Capability:** ❌ PARTIAL (stores matches but no export)

**OTI Mapping (Proposed):**
```javascript
sequences: matchHistory.map((match, i) => ({
  beatName: `Match ${i + 1}`,
  beatNumber: i + 1,
  syntagmaType: detectSyntagma(match.pattern),
  clips: match.cells.map(cell => ({
    clipId: cell.fragment.id,
    title: cell.fragment.title,
    sourceIn: cell.fragment.in,
    sourceOut: cell.fragment.out,
    duration: cell.fragment.duration,
    metadata: {
      matchType: match.type,
      matchLength: match.cells.length
    }
  }))
}))
```

**Needs:**
- Export matched sequences
- Map match patterns to syntagmas
- Assign beat structure to matches

---

#### **8. Narrative Meshwork Organic**
**Procedural Rhetoric:** Candy Crush + Narrative beats. Gameplay = editorial flow.
**Narrative Genome:**
- Input: Organic Voronoi video cells
- Process: Match-3 → auto-collect beats
- Output: 15-beat Save the Cat structure

**Information Architecture:**
```
Organic cell grid → Match-3 gameplay → 
Beat auto-collected → Stored in clip alley → 
WATCH FILM assembles → [MISSING: OTI export]
```

**Export Capability:** ❌ PARTIAL (stores clips, plays film, no JSON export)

**OTI Mapping (Proposed):**
```javascript
sequences: game.collectedClips.map(clip => ({
  id: clip.beat,
  beatName: BEATS[clip.beat].name,
  beatNumber: clip.beat,
  act: getActFromBeat(clip.beat),
  syntagmaType: clip.syntagma,
  syntagmaName: SYNTAGMAS[clip.syntagma].name,
  clips: [{
    clipId: clip.video.src,
    sourceIn: clip.start,
    sourceOut: clip.end,
    duration: clip.end - clip.start,
    metadata: {
      symbol: clip.type, // flower symbol
      breathingPhase: clip.actPhase
    }
  }]
}))
```

**Needs:**
- Add "Export to Prompt Lab" button
- Generate OTI JSON from collected clips
- Include metadata (breathing phase, symbols)

---

#### **9. Narrative Garden v03**
**Procedural Rhetoric:** Match-3 + explicit syntagma selection.
**Narrative Genome:**
- Input: Match-3 grid
- Process: Match → choose syntagma → assign beat
- Output: 15-beat structure with syntagma codes

**Export Capability:** ❌ NONE

**OTI Mapping (Proposed):**
```javascript
sequences: game.beatsCollected.map(b => ({
  beatName: b.beat,
  beatNumber: b.beatNumber,
  syntagmaType: b.syntagma,
  syntagmaName: SYNTAGMAS[b.syntagma].name,
  clips: b.matchedCells.map(cell => ({
    clipId: cell.symbol,
    duration: 5
  }))
}))
```

---

## 🔄 UNIFIED EXPORT FLOW

```
┌─────────────────┐
│  Any Tool       │
│  (crusher/mesh) │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Generate OTI    │
│ JSON format     │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Export Button   │
│ "Send to Lab"   │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ prompt-lab.html │
│ Load JSON       │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│ Generate Film   │
│ (HTML/FFmpeg)   │
└─────────────────┘
```

---

## 🛠️ IMPLEMENTATION PLAN

### **Phase 1: Add OTI Export to Production Tools**
1. ✅ Garden Editor — Add `exportOTI()` function
2. ✅ Matrix Editor — Add `exportOTI()` function

### **Phase 2: Add OTI Export to Best Experimental Tools**
3. ⬜ Narrative Meshwork Organic — Add "Export to Prompt Lab" button
4. ⬜ Meshwork 725 — Add "Capture State" button
5. ⬜ M-Crusher-09 — Add "Record Flow" feature

### **Phase 3: Add OTI Export to Remaining Tools**
6. ⬜ M-Crusher-08 — Export automata evolution
7. ⬜ M-Crusher-07 — Export grid state
8. ⬜ M-Crusher-06 — Export match history
9. ⬜ Narrative Garden v03 — Export beat collection

### **Phase 4: Enhance Prompt Lab**
10. ⬜ Add visual previews of different tool outputs
11. ⬜ Add "source tool" metadata to OTI format
12. ⬜ Create unified film generator that understands tool origins

---

## 📊 TOOL MATRIX COMPARISON

| Tool | Procedural Rhetoric | User Agency | Narrative Structure | Export | Priority |
|------|---------------------|-------------|---------------------|--------|----------|
| Garden | Tetris-montage | HIGH | Emergent | ✅ FULL | ⭐⭐⭐ |
| Matrix | Timeline-assembly | HIGH | Explicit | ✅ FULL | ⭐⭐⭐ |
| Mesh-Organic | Crush-beats | MEDIUM | 15-beat | ❌ ADD | ⭐⭐ |
| Mesh-725 | Voronoi-breathing | LOW | Visual-only | ❌ ADD | ⭐ |
| M-09 | Flow-drift | NONE | None | ❌ ADD | ⭐ |
| M-08 | Automata-evolution | LOW | Emergent | ❌ ADD | ⭐ |
| M-07 | Grid-comparison | MEDIUM | Parallel | ❌ ADD | - |
| M-06 | Match-sequence | HIGH | Emergent | ❌ ADD | ⭐ |
| Nart-Garden | Match-explicit | HIGH | 15-beat | ❌ ADD | ⭐ |

---

## 🎯 NEXT STEPS

1. **Create universal OTI export library** (`oti-export.js`)
2. **Add "Export to Prompt Lab" button** to all tools
3. **Map each tool's data structure** to OTI format
4. **Test full pipeline:** Tool → OTI JSON → Prompt Lab → Film
5. **Document procedural rhetoric** of each tool's export

---

**The Vision:** Every experimental tool becomes a valid authoring mode. The procedural rhetoric of each interface shapes the narrative. Export unifies them all.
