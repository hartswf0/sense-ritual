# COMPATIBILITY ANALYSIS — synt.html, a3.html, a6b.html

**Date:** 2025-10-14  
**Question:** Can these tools integrate with the beat collection system and Prompt Lab pipeline?

---

## 🎯 SUMMARY

| Tool | Type | Compatible? | Integration Effort | Export Status |
|------|------|-------------|-------------------|---------------|
| **synt.html** | Concept Selector | ⚠️ **Partial** | Medium | Text export only |
| **a3.html** | Story Builder | ⚠️ **Partial** | Medium | JSON + Text export |
| **a6b.html** | Video Tetris | ✅ **YES** | Easy | EDL export (basic) |

---

## 📋 DETAILED ANALYSIS

### **1. SYNT.HTML — "SYNTEGRON: Extended Field of Vision"**

**What it is:**
- 3D icosahedron visualization of concepts
- Users select up to **12 concepts** (not 15)
- Grid/List/3D view modes
- Dock shows selected concepts
- Export as text list

**Current Architecture:**
```javascript
const selected = []; // Array of concept IDs
// Select up to 12 concepts
if (selected.length < 12) {
  selected.push(id);
}

// Export as text
exportBtn.addEventListener('click', () => {
  const story = selected.map((id, idx) => {
    const data = rawConcepts.find(c => c.id === id);
    return `${idx + 1}. ${data.title}\n   ${data.desc}`;
  }).join('\n\n');
  // Download as text file
});
```

**Compatibility Assessment:**

| Feature | Current | Needed for Integration |
|---------|---------|----------------------|
| **Collection Count** | 12 concepts | Change to 15 or map differently |
| **Beat Structure** | ❌ None | Add beat assignment |
| **Syntagma Codes** | ❌ None | Add syntagma selector |
| **Export Format** | Text only | Add OTI JSON |
| **Flash Notifications** | ❌ None | Add beat collection system |
| **Progress Tracking** | X/12 badge | Change to X/15 with progress bar |

**Integration Approach:**

**Option A: Adapt to 15 Beats**
```javascript
// Change max from 12 to 15
const MAX_CONCEPTS = 15;

// Add beat structure
const CONCEPT_TO_BEAT_MAP = {
  0: {beatNumber: 1, beatName: 'Opening Image', act: 'act1'},
  1: {beatNumber: 2, beatName: 'Theme Stated', act: 'act1'},
  // ... 15 total
};

// On selection
function toggleSelect(id, element) {
  const index = selected.indexOf(id);
  if (index === -1 && selected.length < MAX_CONCEPTS) {
    selected.push(id);
    
    // Collect beat
    const beatData = CONCEPT_TO_BEAT_MAP[selected.length - 1];
    BeatCollectionSystem.collect({
      beatNumber: beatData.beatNumber,
      beatName: beatData.beatName,
      syntagma: 'DS', // Default
      clips: [{ /* concept data */ }],
      metadata: { conceptId: id }
    });
  }
}
```

**Option B: Keep 12 Concepts, Map to Narrative Structure**
```javascript
// Map 12 concepts to key narrative beats
const CONCEPT_TO_BEAT_MAP = [
  {number: 1, name: 'Opening Image'},      // Concept 1
  {number: 3, name: 'Set-Up'},            // Concept 2
  {number: 4, name: 'Catalyst'},          // Concept 3
  {number: 6, name: 'Break into Two'},    // Concept 4
  {number: 8, name: 'Fun and Games'},     // Concept 5
  {number: 9, name: 'Midpoint'},          // Concept 6
  {number: 10, name: 'Bad Guys Close In'},// Concept 7
  {number: 11, name: 'All Is Lost'},      // Concept 8
  {number: 12, name: 'Dark Night'},       // Concept 9
  {number: 13, name: 'Break into Three'}, // Concept 10
  {number: 14, name: 'Finale'},           // Concept 11
  {number: 15, name: 'Final Image'}       // Concept 12
];
// Skip beats 2, 5, 7 (or auto-fill)
```

**Integration Difficulty:** ⭐⭐⭐ **MEDIUM**
- Need to change concept limit or mapping logic
- Add beat assignment system
- Add OTI export function
- Minimal gameplay changes needed

---

### **2. A3.HTML — "Can't Get You Out of My Head — Concept Explorer"**

**What it is:**
- Very similar to synt.html
- Concept selection (up to 12)
- Grid/List/3D view modes
- **Presentation mode** (slideshow of concepts)
- Export as JSON or text

**Current Architecture:**
```javascript
const selected = []; // Array of concept objects (not just IDs)
const MAX_CLIPS = 12;

// More sophisticated export
function exportStoryJSON() {
  const storyData = {
    title: $('dock-title-input')?.value || 'My Story',
    selected: selected.map(c => ({
      id: c.id,
      title: c.title,
      category: c.category,
      start: c.start,
      end: c.end,
      desc: c.desc,
      quote: c.quote,
      tags: c.tags
    })),
    timestamp: new Date().toISOString()
  };
  downloadJSON(storyData, 'story.json');
}
```

**Compatibility Assessment:**

| Feature | Current | Needed for Integration |
|---------|---------|----------------------|
| **Collection Count** | 12 concepts | Change to 15 or map |
| **Beat Structure** | ❌ None | Add beat assignment |
| **Syntagma Codes** | ❌ None | Add syntagma selector |
| **Export Format** | JSON (custom) | Convert to OTI JSON |
| **Presentation Mode** | ✅ Has slideshow | Compatible! |
| **Video Data** | ✅ Has start/end times | Compatible! |

**Integration Approach:**

**Better than synt.html because:**
- Already stores video timecodes (start/end)
- Already has JSON export structure
- Has presentation mode (could become beat previewer)

**Conversion to OTI:**
```javascript
function buildOTI() {
  return {
    version: "1.0",
    title: $('dock-title-input')?.value || 'My Story',
    timestamp: new Date().toISOString(),
    sourceTool: "Concept Explorer",
    sequences: selected.map((concept, idx) => ({
      beatNumber: CONCEPT_TO_BEAT_MAP[idx].number,
      beatName: CONCEPT_TO_BEAT_MAP[idx].name,
      syntagmaType: 'DS', // Default
      clips: [{
        title: concept.title,
        category: concept.category,
        sourceIn: concept.start,
        sourceOut: concept.end,
        duration: concept.end - concept.start,
        description: concept.desc,
        tags: concept.tags
      }]
    }))
  };
}
```

**Integration Difficulty:** ⭐⭐ **MEDIUM-EASY**
- Already has video metadata
- Just needs beat mapping + OTI export
- Presentation mode is bonus feature

---

### **3. A6B.HTML — "VIDEO TETRIS — Timeline Editor"**

**What it is:**
- Tetris gameplay (falling pieces)
- Fragment collection on line clear
- **Timeline collection panel** (Matrix-Editor style)
- EDL export
- Syntagma/Beat structure buttons (UI exists!)

**Current Architecture:**
```javascript
class TetrisGame {
  collectedFragments = [];
  
  onLineClear() {
    // Collect fragment
    this.collectedFragments.push({
      concept: videoConcept,
      matchCount: 3,
      timestamp: Date.now()
    });
    
    this.updateTimelineCollection();
  }
  
  updateTimelineCollection() {
    // Display collected fragments in timeline panel
    // Shows: title, category, time, match count
  }
  
  exportEDL() {
    // Generate EDL from collected fragments
  }
}
```

**Compatibility Assessment:**

| Feature | Current | Needed for Integration |
|---------|---------|----------------------|
| **Collection Mechanism** | ✅ On line clear | Perfect! |
| **Fragment Storage** | ✅ `collectedFragments[]` | Compatible! |
| **Beat Structure** | ⚠️ UI only (not functional) | Wire up existing buttons |
| **Syntagma Codes** | ⚠️ UI only (not functional) | Wire up existing buttons |
| **Export Format** | ⚠️ Basic EDL | Add OTI + full EDL |
| **Timeline Panel** | ✅ Already built | Perfect! |

**Integration Approach:**

**EASIEST INTEGRATION** — Almost everything is already there!

```javascript
// 1. Add beat-collection-system.js
<script src="beat-collection-system.js"></script>

// 2. Initialize in game setup
BeatCollectionSystem.init({
  flashColor: '#AED581',
  totalBeats: 15
});

// 3. Hook into existing line clear
onLineClear() {
  // ... existing code ...
  
  // Add beat collection
  const beatIndex = this.collectedFragments.length - 1;
  if (beatIndex < 15) {
    const beat = SAVE_THE_CAT_BEATS[beatIndex];
    BeatCollectionSystem.collect({
      beatNumber: beat.number,
      beatName: beat.name,
      syntagma: beat.suggestedSyntagma,
      clips: [fragment],
      metadata: { matchCount: fragment.matchCount }
    });
  }
}

// 4. Wire up existing buttons
document.getElementById('syntagmaBtn').addEventListener('click', () => {
  // Show syntagma selector modal
});

document.getElementById('beatStructureBtn').addEventListener('click', () => {
  // Show beat structure panel
});

document.getElementById('autoAssembleBtn').addEventListener('click', () => {
  // Open final-screen.html
  window.open('final-screen.html', '_blank');
});

// 5. Add OTI export
function exportOTI() {
  const oti = {
    version: "1.0",
    sourceTool: "Video Tetris",
    sequences: this.collectedFragments.map((frag, idx) => ({
      beatNumber: idx + 1,
      beatName: SAVE_THE_CAT_BEATS[idx].name,
      clips: [{
        title: frag.concept.title,
        category: frag.concept.category,
        sourceIn: frag.concept.start,
        sourceOut: frag.concept.end,
        duration: frag.concept.end - frag.concept.start
      }]
    }))
  };
  downloadJSON(oti, 'video-tetris.oti.json');
}
```

**Integration Difficulty:** ⭐ **EASY**
- Already has fragment collection
- Already has timeline panel UI
- Already has beat/syntagma buttons (just need wiring)
- Just needs beat collection system + OTI export

---

## 🎬 INTEGRATION PRIORITY

### **Recommended Order:**

**1. ✅ HIGHEST PRIORITY: a6b.html (Video Tetris)**
- **Why:** 90% already built, just needs wiring
- **Effort:** 1-2 hours
- **Impact:** Full beat collection + export pipeline
- **Benefits:** 
  - Existing timeline UI
  - Fragment collection working
  - EDL export foundation
  - Beat/Syntagma buttons already in UI

**2. ⭐ MEDIUM PRIORITY: a3.html (Concept Explorer)**
- **Why:** Has video metadata + JSON export
- **Effort:** 3-4 hours
- **Impact:** Curated concept → film pipeline
- **Benefits:**
  - Presentation mode → beat previewer
  - Already stores timecodes
  - JSON export structure exists

**3. ⚠️ LOWER PRIORITY: synt.html (Syntegron)**
- **Why:** Basic text export, no video metadata
- **Effort:** 4-5 hours
- **Impact:** Concept curation → narrative
- **Challenge:** Need to add video association logic

---

## 📊 COMPARISON TABLE

| Feature | garden-with-beats | m-crusher-09-with-beats | a6b.html | a3.html | synt.html |
|---------|------------------|-------------------------|----------|---------|-----------|
| **Type** | Tetris Game | Match-3 Game | Tetris Game | Curator | Curator |
| **Collection** | Line clear | Match 3+ | Line clear | Click select | Click select |
| **Max Items** | Unlimited | Unlimited | Unlimited | 12 | 12 |
| **Beat System** | ✅ Integrated | ✅ Integrated | ❌ Need | ❌ Need | ❌ Need |
| **Flash Notifications** | ✅ Yes | ✅ Yes | ❌ Need | ❌ Need | ❌ Need |
| **Timeline UI** | ✅ Yes | ❌ No | ✅ Yes | ❌ No | ❌ No |
| **Video Metadata** | ✅ Full | ✅ Full | ✅ Full | ✅ Full | ⚠️ Basic |
| **Export OTI** | ✅ Yes | ✅ Yes | ❌ Need | ⚠️ Partial | ❌ Need |
| **Export EDL** | ✅ Yes | ❌ No | ⚠️ Basic | ❌ No | ❌ No |
| **Prompt Lab** | ✅ Push | ✅ Push | ❌ Need | ❌ Need | ❌ Need |

---

## 🚀 IMPLEMENTATION GUIDE

### **For a6b.html (Video Tetris):**

**Step 1: Add Beat System**
```html
<script src="beat-collection-system.js"></script>
```

**Step 2: Add SAVE_THE_CAT_BEATS**
```javascript
const SAVE_THE_CAT_BEATS = [
  {number: 1, name: 'Opening Image', suggestedSyntagma: 'DS'},
  // ... 15 total
];
```

**Step 3: Initialize in Game**
```javascript
BeatCollectionSystem.init({ flashColor: '#AED581' });
```

**Step 4: Hook Line Clear**
```javascript
// In onLineClear() method:
const beatIndex = BeatCollectionSystem.collectedBeats.length;
if (beatIndex < 15) {
  const beat = SAVE_THE_CAT_BEATS[beatIndex];
  BeatCollectionSystem.collect({
    beatNumber: beat.number,
    beatName: beat.name,
    syntagma: beat.suggestedSyntagma,
    clips: [fragment]
  });
}
```

**Step 5: Wire Auto-Assemble Button**
```javascript
document.getElementById('autoAssembleBtn').addEventListener('click', () => {
  localStorage.setItem('final_cut_data', JSON.stringify({
    game: {
      sequences: this.collectedFragments,
      filmTitle: "Video Tetris Assembly"
    }
  }));
  window.open('final-screen.html', '_blank');
});
```

---

### **For a3.html (Concept Explorer):**

**Step 1: Change Max to 15**
```javascript
const MAX_CLIPS = 15; // Was 12
```

**Step 2: Add Beat Mapping**
```javascript
const BEAT_MAP = [
  {number: 1, name: 'Opening Image'},
  // ... map 15 concepts to 15 beats
];
```

**Step 3: Collect on Selection**
```javascript
function toggleSelect(id) {
  // ... existing code ...
  
  if (selected.length <= 15) {
    const beat = BEAT_MAP[selected.length - 1];
    BeatCollectionSystem.collect({
      beatNumber: beat.number,
      beatName: beat.name,
      syntagma: 'DS',
      clips: [concept]
    });
  }
}
```

**Step 4: Add OTI Export**
```javascript
function exportOTI() {
  const oti = buildOTI(selected);
  downloadJSON(oti, 'concept-assembly.oti.json');
}
```

---

## 💡 RECOMMENDATIONS

### **Quick Wins:**
1. **Integrate a6b.html first** — it's 90% done
2. Test full pipeline: Video Tetris → Final Screen → Prompt Lab
3. Use as template for other integrations

### **Medium-Term:**
1. Integrate a3.html for curated concept films
2. Add presentation mode → beat previewer
3. Consider merging a3 and synt (very similar)

### **Long-Term:**
1. Create "Curator Mode" for non-game tools
2. Support variable beat counts (12, 15, 20)
3. Cross-tool remixing (curate in a3, play in garden)

---

## 🎯 CONCLUSION

**Compatibility Status:**

| Tool | Status | Recommendation |
|------|--------|----------------|
| **a6b.html** | ✅ **Highly Compatible** | Integrate immediately |
| **a3.html** | ⚠️ **Moderately Compatible** | Integrate after a6b |
| **synt.html** | ⚠️ **Partially Compatible** | Consider merging with a3 |

**a6b.html (Video Tetris) is ready for immediate integration** — it already has the timeline UI, fragment collection, and export buttons. Just needs the beat collection system wired up!

Would take ~2 hours to fully integrate and test. 🎬✨
