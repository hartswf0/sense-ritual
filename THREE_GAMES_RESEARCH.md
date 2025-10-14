# THREE GAMES — Storage Systems & Procedural Rhetoric Research

**Date:** 2025-10-14  
**Purpose:** Deep analysis of three distinct game-to-film assembly systems

---

## 🎯 CORE QUESTION

**What is the difference that makes the difference?**

Three games. Three metaphors. One shared narrative structure. Each transforms gameplay into cinematic sequence through distinct storage systems and procedural rhetoric.

---

## 🎮 THE THREE SYSTEMS

### **1. MATRIX EDITOR — Plants vs Zombies**
**File:** `matrix-editor.html`  
**Metaphor:** Noosphere Under Attack

**Game Loop:**
```
Threats spawn → Deploy defenses → Threats advance in lanes → 
Hit walls → Form horizontal timelines → Collect 3+ clips → 
Assign beat + syntagma → Chain stored
```

**Storage Structure:**
```javascript
const game = {
  chains: [],        // Final collected sequences
  threats: [],       // Active incoming fragments
  systems: [],       // Deployed defensive structures
  pendingChain: {    // Awaiting beat assignment
    lane: 0,
    fragments: [...],
    threats: [...]
  }
};
```

**Fragment Unit:** Video clip as hostile "threat"
- Has timecode (start/end)
- Has category (Technology, Politics, Culture, Economics)
- Has threat type (basic, fast, tank, boss)
- Advances in lane until hitting wall

**Collection Trigger:** 3+ fragments in same lane
**Assembly Metaphor:** Lane-based horizontal timelines
**User Agency:** Deploy systems (defensive, reactive)
**Procedural Rhetoric:** Editorial as defense against information overload

**Storage Philosophy:**
- **Timeline-centric** — Lanes ARE timelines
- Fragments accumulate horizontally
- Wall system adds strategic layer
- Each chain preserves lane context

**Export Capability:** ✅ FULL
- OTI JSON
- EDL (CMX 3600)
- Storymap.md (with ekphrasis)
- Shotlist.js (AI prompts)
- Chart.d3.js (visualization data)

---

### **2. GARDEN — Tetris**
**File:** `garden.html`  
**Metaphor:** Spatial Arrangement = Temporal Sequence

**Game Loop:**
```
Piece spawns → Falls under gravity → User rotates/moves → 
Lands and locks → Check horizontal lines → 
Clear complete lines → Store sequence
```

**Storage Structure:**
```javascript
// 2D spatial grid
const grid = [];
for(let y=0; y<H; y++) {
  grid[y] = Array(W).fill(null);
}

// Falling pieces
const piece = {
  type: 'L',        // Tetromino shape
  x: 5,
  y: 0,
  rotation: 0,
  fragmentId: 'clip_001'
};

// Locked sequences (after line clear)
const lockedSequences = [
  {
    fragments: [...],
    level: 0,         // Recursive timeline level
    locked: true
  }
];
```

**Fragment Unit:** Tetromino block linked to video
- Shape determines arrangement possibility
- Position (x, y) is spatial memory
- Rotation state affects placement
- Part of larger piece (4 blocks)

**Collection Trigger:** Complete horizontal line
**Assembly Metaphor:** Vertical stacking + horizontal clearing
**User Agency:** Rotate/place blocks (active, spatial)
**Procedural Rhetoric:** Montage through spatial pressure

**Storage Philosophy:**
- **Spatial-centric** — Grid position matters
- Gravity simulates temporal pressure
- Clearing lines converts space → time
- Recursive timeline (6 zoom levels: 48→24→12→6→3→1)

**Visual System:** Three.js 3D isometric view
- Camera orbits around grid
- Ghost wall preview
- Recursive timeline layers
- Mobile touch controls

**Export Capability:** ⚠️ PARTIAL
- EDL export
- A4 format
- Needs: OTI JSON, Storymap, Shotlist, Chart

---

### **3. FLUX GARDEN (M-Crusher-09) — Flow Fields + Match-3**
**File:** `m-crusher-09.html`  
**Metaphor:** Pattern Emergence as Assembly

**Game Loop:**
```
Grid filled with colored shapes → User swaps cells → 
Match 3+ in line → Cells disappear → 
Video segment plays → New cells fall → 
Flow field animates → Repeat
```

**Storage Structure:**
```javascript
const game = {
  grid: [],              // 8x8 match-3 grid
  sequence: [],          // Collected matches
  flowField: [],         // Perlin noise vectors
  collectedTypes: new Set(),
  typeSegmentVideos: {}, // Video by type×segment
  flowTime: 0,
  autoClear: true
};

// Minimal sequence storage
game.sequence.push({
  type: cellType,      // 0-9 color type
  count: matches.length,
  timestamp: Date.now()
});
```

**Fragment Unit:** Colored cell/shape
- 10 types (0-9)
- Each type maps to video segment
- No explicit narrative metadata
- Pattern-based, not content-based

**Collection Trigger:** 3+ cells match (horizontal/vertical)
**Assembly Metaphor:** Flow field drift + matching
**User Agency:** Swap cells (matching, pattern)
**Procedural Rhetoric:** Emergence over authorship

**Storage Philosophy:**
- **Type-centric** — Collect by symbol type
- Minimal metadata (just type + count)
- Flow field provides ambient visualization
- Auto-progression, less editorial control

**Visual System:** 2D Canvas + Perlin noise flow
- Marching shapes through vector field
- Soft pastel colors
- Breathing/pulsing animation
- Video layer behind shapes

**Export Capability:** ❌ NONE
- No export currently
- No beat assignment
- No syntagma codes
- Needs: Full OTI integration

---

## 📊 COMPARATIVE ANALYSIS

### **Storage Model Comparison**

| Dimension | Matrix Editor | Garden | Flux Garden |
|-----------|---------------|--------|-------------|
| **Primary Structure** | Array of chains | 2D Grid [y][x] | Array of sequences |
| **Fragment Unit** | Threat object (video) | Block (tetromino) | Cell type (shape) |
| **Spatial Model** | 1D lanes | 2D grid | 2D grid |
| **Temporal Model** | Horizontal timelines | Vertical gravity | Auto-progression |
| **Memory Type** | Lane-based | Position-based | Type-based |
| **Metadata Density** | HIGH (timecodes, syntagma, beats) | MEDIUM (position, rotation) | LOW (type count only) |

### **Collection Trigger Comparison**

| System | Trigger | Threshold | Result |
|--------|---------|-----------|--------|
| Matrix | Lane accumulation | 3+ clips | Chain formed |
| Garden | Line completion | Full horizontal | Sequence locked |
| Flux | Pattern matching | 3+ same type | Video plays |

### **Procedural Rhetoric Comparison**

| System | Core Metaphor | Time Model | User Role |
|--------|---------------|------------|-----------|
| Matrix | Defense | Waves advancing (threat) | Defender |
| Garden | Construction | Gravity falling (pressure) | Builder |
| Flux | Emergence | Flow drifting (organic) | Observer |

### **Agency & Authorship**

| System | Agency Level | Authorship Type | Control |
|--------|--------------|-----------------|---------|
| Matrix | **HIGH** | Editorial (defensive) | Deploy + assign |
| Garden | **MEDIUM** | Spatial (constructive) | Rotate + place |
| Flux | **LOW** | Emergent (observational) | Swap + watch |

---

## 🧬 SHARED NARRATIVE STRUCTURE

All three systems target the same output structure defined in `narrative-garden-v03.html`:

### **15 Save the Cat Beats**

```javascript
const BEATS = [
  // ACT 1: SETUP (5 beats)
  {id:1, name:'Opening Image', act:'act1', suggestedSyntagma:'DS'},
  {id:2, name:'Theme Stated', act:'act1', suggestedSyntagma:'AS'},
  {id:3, name:'Set-Up', act:'act1', suggestedSyntagma:'DS'},
  {id:4, name:'Catalyst', act:'act1', suggestedSyntagma:'SC'},
  {id:5, name:'Debate', act:'act1', suggestedSyntagma:'PS'},
  
  // ACT 2A: CONFRONTATION (5 beats)
  {id:6, name:'Break into Two', act:'act2a', suggestedSyntagma:'SC'},
  {id:7, name:'B Story', act:'act2a', suggestedSyntagma:'ALT'},
  {id:8, name:'Fun and Games', act:'act2a', suggestedSyntagma:'ES'},
  {id:9, name:'Midpoint', act:'act2a', suggestedSyntagma:'SC'},
  {id:10, name:'Bad Guys Close In', act:'act2a', suggestedSyntagma:'OS'},
  
  // ACT 2B: CRISIS (2 beats)
  {id:11, name:'All Is Lost', act:'act2b', suggestedSyntagma:'AS'},
  {id:12, name:'Dark Night', act:'act2b', suggestedSyntagma:'BS'},
  
  // ACT 3: RESOLUTION (3 beats)
  {id:13, name:'Break into Three', act:'act3', suggestedSyntagma:'SC'},
  {id:14, name:'Finale', act:'act3', suggestedSyntagma:'OS'},
  {id:15, name:'Final Image', act:'act3', suggestedSyntagma:'AS'}
];
```

### **8 Syntagma Codes (Metz)**

```javascript
const SYNTAGMAS = [
  {code:'AS', name:'Autonomous Shot', bonus:100},
  {code:'PS', name:'Parallel Syntagma', bonus:100},
  {code:'BS', name:'Bracket Syntagma', bonus:100},
  {code:'DS', name:'Descriptive Syntagma', bonus:100},
  {code:'ALT', name:'Alternating Syntagma', bonus:150},
  {code:'SC', name:'Scene', bonus:100},
  {code:'ES', name:'Episodic Sequence', bonus:150},
  {code:'OS', name:'Ordinary Sequence', bonus:100}
];
```

### **Act Structure & Bonuses**

```javascript
const ACT_BONUSES = {
  act1: 200,      // Setup complete
  act2a: 300,     // Confrontation complete
  act2b: 200,     // Crisis complete
  act3: 400,      // Resolution complete
  complete: 1000  // All 15 beats
};
```

---

## 🔄 EXPORT UNIFICATION STRATEGY

### **Current State**
- ✅ Matrix Editor: **FULL** (5 formats)
- ⚠️ Garden: **PARTIAL** (EDL only)
- ❌ Flux Garden: **NONE**

### **Target: Universal OTI Export**

All three systems should export to unified OTI JSON format:

```javascript
// Matrix Editor
OTIExport.fromMatrixEditor(game.chains);

// Garden
OTIExport.fromGardenEditor({
  sequences: lockedSequences,
  levels: recursiveLevels
});

// Flux Garden
OTIExport.fromMatch3Sequencer({
  sequence: game.sequence,
  grid: game.grid
});
```

### **Mapping Strategy**

#### **Matrix → OTI**
```javascript
game.chains → oti.sequences
  chain.beatName → sequence.beatName
  chain.beatNumber → sequence.beatNumber
  chain.syntagmaType → sequence.syntagmaType
  chain.fragments[] → sequence.clips[]
    fragment.start → clip.sourceIn
    fragment.end → clip.sourceOut
    fragment.title → clip.title
    fragment.category → clip.category
```

#### **Garden → OTI**
```javascript
lockedSequences → oti.sequences
  sequence.level → sequence.metadata.recursiveLevel
  sequence.fragments[] → sequence.clips[]
    block.fragmentId → clip.clipId
    block.type → clip.metadata.shape
    block.rotation → clip.metadata.rotation
    block.position → clip.metadata.gridPosition
```

#### **Flux Garden → OTI**
```javascript
game.sequence → oti.sequences
  match.type → sequence.metadata.cellType
  match.count → sequence.metadata.matchLength
  // Need to add:
  - Beat assignment logic
  - Syntagma inference from match patterns
  - Clip metadata from video segments
```

---

## 💡 KEY INSIGHTS

### **1. Storage = Epistemology**

Each storage model embodies a different theory of narrative assembly:

- **Matrix (Chains):** Narrative as **defense against chaos**
  - Fragments are threats
  - Assembly is strategic deployment
  - Knowledge as noosphere protection

- **Garden (Grid):** Narrative as **spatial composition**
  - Fragments are building blocks
  - Assembly is architectural
  - Knowledge as constructed artifact

- **Flux (Types):** Narrative as **emergent pattern**
  - Fragments are symbols
  - Assembly is procedural
  - Knowledge as discovered structure

### **2. Time Metaphors**

- **Matrix:** Time = **Advancing threat** (military metaphor)
- **Garden:** Time = **Falling pressure** (gravitational metaphor)
- **Flux:** Time = **Organic flow** (natural metaphor)

### **3. Authorship Models**

- **Matrix:** **High agency** — You decide what to capture, when, and how to structure it
- **Garden:** **Medium agency** — You arrange pieces, but gravity constrains you
- **Flux:** **Low agency** — You trigger matches, but patterns emerge autonomously

### **4. The Difference That Makes The Difference**

**Storage structure determines:**
1. What can be remembered (metadata richness)
2. How it's accessed (query model)
3. What relationships are visible (connection types)
4. What can be exported (format capability)

**Matrix's advantage:** Rich metadata (timecodes, syntagmas, beats, ratings, notes)  
**Garden's advantage:** Spatial relationships preserved, recursive hierarchy  
**Flux's advantage:** Minimal complexity, pure pattern-based

---

## 🎯 IMPLEMENTATION ROADMAP

### **Phase 1: Export Parity**
1. ✅ Matrix Editor — Already complete (5 formats)
2. ⬜ Garden — Add OTI JSON + full format export
3. ⬜ Flux Garden — Add beat assignment + OTI export

### **Phase 2: Narrative Structure Integration**
1. ⬜ Add 15-beat tracker to Garden (like narrative-garden-v03)
2. ⬜ Add syntagma selector to Flux Garden
3. ⬜ Add act visualization to all three

### **Phase 3: Cross-Tool Features**
1. ⬜ Import OTI into any tool (remix capability)
2. ⬜ Merge sequences from multiple tools
3. ⬜ Visual diff between tool outputs

### **Phase 4: Unified Film Generator**
1. ⬜ Prompt-lab detects source tool from OTI metadata
2. ⬜ Tool-specific visualizations in film output
3. ⬜ Ekphrasis templates adapt to source tool

---

## 📚 REFERENCE FILES

### **Primary Systems**
- `matrix-editor.html` — Plants vs Zombies metaphor
- `garden.html` — Tetris metaphor  
- `m-crusher-09.html` — Flow fields + Match-3 metaphor

### **Narrative Structure Reference**
- `narrative-garden-v03.html` — Reference implementation
  - 15 Save the Cat beats
  - 4-act structure with progress tracking
  - Syntagma selector with suggestions
  - Act completion bonuses

### **Export Architecture**
- `oti-export.js` — Universal export library
- `EXPORT_ARCHITECTURE.md` — Tool comparison documentation
- `MATRIX_EXPORT_AUDIT.md` — Matrix editor audit
- `film-generator.js` — Film generation engine
- `prompt-lab.html` — Film generator UI

### **Documentation**
- `THREE_GAMES.html` — Bauhaus landing page (this document's web version)
- `THREE_GAMES_RESEARCH.md` — This research document
- `aaa.html` — Complete file manifest

---

## 🚀 NEXT STEPS

### **Immediate Actions:**
1. Test full export pipeline: Matrix → OTI → Prompt Lab → Film
2. Add OTI export button to Garden
3. Design beat assignment system for Flux Garden

### **Medium-Term:**
1. Standardize beat/syntagma assignment UI across all tools
2. Add act progress visualization to Garden and Flux
3. Create tool-specific ekphrasis templates

### **Long-Term:**
1. Build unified "Film Assembly OS" that can load any tool
2. Cross-tool sequence remixing
3. AI-enhanced syntagma suggestion based on actual video content

---

## 🎬 CONCLUSION

Three games. Three storage systems. Three procedural rhetorics.

**Matrix Editor** asks: *Can you defend the noosphere?*  
**Garden** asks: *Can you build a sequence under pressure?*  
**Flux Garden** asks: *Can you discover patterns in emergence?*

All three can export to the same narrative genome. All three paths lead to film. The difference is not in the output—it's in the **epistemic journey** of assembly itself.

The storage system is not just technical infrastructure. **It's procedural rhetoric. It's ontology. It's the difference that makes the difference.**
