# BEAT COLLECTION SYSTEM — Universal Integration Guide

**Created:** 2025-10-14  
**Purpose:** Integrate visual beat collection feedback across all Sense Ritual games

---

## 🎯 OVERVIEW

The Beat Collection System provides:
- ✅ **Visual flash notifications** when beats are collected
- ✅ **Progress tracker** showing X/15 beats at top of screen
- ✅ **"Assemble Final Cut" button** appears when all 15 beats collected
- ✅ **Final screen** opens in new window with score, beat list, export options
- ✅ **Audio feedback** for each collection + completion chord

**Files:**
- `beat-collection-system.js` — Universal JavaScript library
- `final-screen.html` — Completion screen with export options

---

## 📦 INTEGRATION STEPS

### **Step 1: Add Script to HTML**

Add to `<head>` or before `</body>`:

```html
<script src="beat-collection-system.js"></script>
```

### **Step 2: Initialize System**

In your game's init function:

```javascript
// Initialize beat collection system
BeatCollectionSystem.init({
  totalBeats: 15,
  flashColor: game.color || '#00ffff',
  completionSound: true
});
```

### **Step 3: Call on Beat Collection**

Whenever a beat is collected (line cleared, chain formed, match made):

```javascript
BeatCollectionSystem.collect({
  beatNumber: 1,
  beatName: 'Opening Image',
  syntagma: 'DS',
  clips: [...],  // Array of clips/fragments
  metadata: {
    // Any tool-specific data
    lane: 0,
    duration: 45,
    categories: ['Technology']
  }
});
```

### **Step 4: Test**

1. Play game
2. Collect a beat → Flash should appear
3. Progress bar should update
4. Collect all 15 → "Assemble Final Cut" button appears
5. Click button → New window opens with final screen

---

## 🎮 GAME-SPECIFIC INTEGRATION

### **1. MATRIX EDITOR (Already Has System)**

Matrix Editor already has a similar system. To integrate universal system:

```javascript
// In claimChainWithAssignment() function, add:
BeatCollectionSystem.collect({
  beatNumber: chain.beatNumber,
  beatName: chain.beatName,
  syntagma: chain.syntagmaType,
  clips: chain.fragments,
  metadata: {
    lane: chain.lane,
    wall: chain.wall,
    flagged: chain.flagged,
    rating: chain.rating
  }
});
```

**Location:** Around line 2630 after `game.chains.push()`

---

### **2. GARDEN (Tetris)**

**Current State:** Clears lines but no beat assignment

**Integration Points:**

#### A. Add Beat Assignment on Line Clear

```javascript
// In checkLines() or equivalent function:
function onLineClear(lineY, fragments) {
  // Auto-assign next beat
  const nextBeat = SAVE_THE_CAT_BEATS[BeatCollectionSystem.collectedBeats.length];
  
  if (nextBeat) {
    BeatCollectionSystem.collect({
      beatNumber: nextBeat.number,
      beatName: nextBeat.name,
      syntagma: nextBeat.suggestedSyntagma,
      clips: fragments,
      metadata: {
        lineY: lineY,
        recursiveLevel: currentRecursiveLevel,
        blockTypes: fragments.map(f => f.type)
      }
    });
  }
}
```

#### B. Add to Existing Code

Find where lines are cleared (look for grid manipulation):

```javascript
// Existing line clear code
if (isLineComplete(y)) {
  const fragments = grid[y].filter(cell => cell);
  clearLine(y);
  lockedSequences.push({ fragments, level });
  
  // ADD THIS:
  const beatIndex = BeatCollectionSystem.collectedBeats.length;
  if (beatIndex < SAVE_THE_CAT_BEATS.length) {
    const beat = SAVE_THE_CAT_BEATS[beatIndex];
    BeatCollectionSystem.collect({
      beatNumber: beat.number,
      beatName: beat.name,
      syntagma: beat.suggestedSyntagma,
      clips: fragments,
      metadata: { line: y, level: level }
    });
  }
}
```

#### C. Add Beat Data

If Garden doesn't have `SAVE_THE_CAT_BEATS`, add:

```javascript
const SAVE_THE_CAT_BEATS = [
  {number: 1, name: 'Opening Image', suggestedSyntagma: 'DS'},
  {number: 2, name: 'Theme Stated', suggestedSyntagma: 'AS'},
  {number: 3, name: 'Set-Up', suggestedSyntagma: 'DS'},
  {number: 4, name: 'Catalyst', suggestedSyntagma: 'SC'},
  {number: 5, name: 'Debate', suggestedSyntagma: 'PS'},
  {number: 6, name: 'Break into Two', suggestedSyntagma: 'SC'},
  {number: 7, name: 'B Story', suggestedSyntagma: 'ALT'},
  {number: 8, name: 'Fun and Games', suggestedSyntagma: 'ES'},
  {number: 9, name: 'Midpoint', suggestedSyntagma: 'SC'},
  {number: 10, name: 'Bad Guys Close In', suggestedSyntagma: 'OS'},
  {number: 11, name: 'All Is Lost', suggestedSyntagma: 'AS'},
  {number: 12, name: 'Dark Night of the Soul', suggestedSyntagma: 'BS'},
  {number: 13, name: 'Break into Three', suggestedSyntagma: 'SC'},
  {number: 14, name: 'Finale', suggestedSyntagma: 'OS'},
  {number: 15, name: 'Final Image', suggestedSyntagma: 'AS'}
];
```

---

### **3. FLUX GARDEN (M-Crusher-09)**

**Current State:** Match-3 gameplay, no beat tracking

**Integration Points:**

#### A. Add Beat Assignment on Match

```javascript
// In processMatches() or equivalent:
function onMatchCollected(matches, type) {
  const beatIndex = BeatCollectionSystem.collectedBeats.length;
  
  if (beatIndex < SAVE_THE_CAT_BEATS.length) {
    const beat = SAVE_THE_CAT_BEATS[beatIndex];
    
    BeatCollectionSystem.collect({
      beatNumber: beat.number,
      beatName: beat.name,
      syntagma: beat.suggestedSyntagma,
      clips: [{
        type: type,
        count: matches.length,
        videoSegment: game.typeSegmentVideos[`${type}_0`]
      }],
      metadata: {
        matchType: type,
        matchCount: matches.length,
        flowTime: game.flowTime
      }
    });
  }
}
```

#### B. Modify Match Processing

Find where matches are cleared:

```javascript
// Existing match code
function clearMatches(matches) {
  matches.forEach(({r, c}) => {
    game.grid[r][c] = null;
  });
  
  // ADD THIS:
  if (matches.length >= 3) {
    const type = game.grid[matches[0].r][matches[0].c];
    onMatchCollected(matches, type);
  }
  
  dropCells();
  refillGrid();
}
```

---

### **4. NARRATIVE GARDEN V03**

**Current State:** Already has beat tracking with syntagma selector

**Integration:** Simplest! Already compatible structure.

```javascript
// In selectSyntagma() function, replace or add:
function selectSyntagma(code) {
  const beat = BEATS[game.pendingBeatId-1];
  const syntagma = SYNTAGMAS.find(s => s.code === code);
  
  game.beatsCollected.push({
    beatId: game.pendingBeatId,
    syntagma: code,
    act: beat.act
  });
  
  // ADD THIS:
  BeatCollectionSystem.collect({
    beatNumber: game.pendingBeatId,
    beatName: beat.name,
    syntagma: code,
    clips: [], // No actual clips in this version
    metadata: {
      act: beat.act,
      suggested: code === beat.suggestedSyntagma
    }
  });
  
  // Rest of existing code...
}
```

---

## 🎨 CUSTOMIZATION

### **Change Colors**

```javascript
BeatCollectionSystem.init({
  flashColor: '#ff00ff'  // Pink instead of cyan
});
```

### **Change Duration**

```javascript
BeatCollectionSystem.init({
  flashDuration: 3000  // 3 seconds instead of 2
});
```

### **Disable Sound**

```javascript
BeatCollectionSystem.init({
  completionSound: false
});
```

### **Custom Beat Count**

```javascript
BeatCollectionSystem.init({
  totalBeats: 20  // For extended structures
});
```

---

## 📊 ACCESSING STATUS

Get current collection status:

```javascript
const status = BeatCollectionSystem.getStatus();

console.log(status);
// {
//   collected: 5,
//   total: 15,
//   percentage: 33.33,
//   complete: false,
//   beats: [...]
// }
```

---

## 🔄 RESET SYSTEM

Reset for new game:

```javascript
BeatCollectionSystem.reset();
```

---

## 🎬 FINAL SCREEN INTEGRATION

### **Data Flow**

1. Game collects beats via `BeatCollectionSystem.collect()`
2. When 15 beats collected, "Assemble Final Cut" button appears
3. User clicks button
4. System saves data to `localStorage` as `final_cut_data`
5. Opens `final-screen.html` in new window
6. Final screen reads data from `localStorage` or `window.opener.game`

### **What Final Screen Shows**

- **Hero Section:**
  - Title: "FINAL CUT"
  - Score cards: Beats, Clips, Runtime, Coherence Score
  
- **Beat List:**
  - Organized by Act (1, 2A, 2B, 3)
  - Each beat shows: Number, Name, Syntagma, Clip count, Duration
  
- **Export Buttons:**
  - OTI JSON
  - EDL
  - Storymap
  - Shotlist
  - Chart.D3
  - FFmpeg Script
  - Export All
  - Send to Prompt Lab

### **Export Functions**

Final screen calls export functions from parent window:

```javascript
// In parent game
function exportOTI() {
  // Build OTI JSON
  const oti = buildOTI(game);
  downloadJSON(oti, 'film.oti.json');
}

// Final screen can call:
window.opener.exportOTI();
```

---

## 🛠️ COMPLETE EXAMPLE: Adding to New Game

```javascript
// 1. Add script to HTML
<script src="beat-collection-system.js"></script>

// 2. Define beats structure
const BEATS = [
  {number: 1, name: 'Opening Image', suggestedSyntagma: 'DS'},
  // ... all 15 beats
];

// 3. Initialize in game init
function initGame() {
  BeatCollectionSystem.init({
    flashColor: game.color
  });
  
  // Rest of init...
}

// 4. Collect on game event
function onGameEvent(clips) {
  const beatIndex = BeatCollectionSystem.collectedBeats.length;
  
  if (beatIndex < BEATS.length) {
    const beat = BEATS[beatIndex];
    
    BeatCollectionSystem.collect({
      beatNumber: beat.number,
      beatName: beat.name,
      syntagma: beat.suggestedSyntagma,
      clips: clips,
      metadata: {
        // Game-specific data
      }
    });
  }
}

// 5. Add export function (for final screen)
function exportOTI() {
  const oti = {
    version: "1.0",
    title: "My Film",
    sequences: BeatCollectionSystem.collectedBeats
  };
  
  const blob = new Blob([JSON.stringify(oti, null, 2)], {type: 'application/json'});
  const url = URL.createObjectURL(blob);
  const a = document.createElement('a');
  a.href = url;
  a.download = 'film.oti.json';
  a.click();
}
```

---

## 🎯 TESTING CHECKLIST

After integration, test:

- [ ] Beat collection triggers flash notification
- [ ] Flash shows: Beat number, beat name, progress (X/15)
- [ ] Progress bar updates at top of screen
- [ ] Audio plays on collection (optional)
- [ ] After 15 beats, "Assemble Final Cut" button appears
- [ ] Button is animated/glowing
- [ ] Clicking button opens `final-screen.html` in new window
- [ ] Final screen shows correct beat count
- [ ] Final screen displays all collected beats
- [ ] Export buttons work (or show appropriate message)
- [ ] Score calculations are accurate

---

## 🔧 TROUBLESHOOTING

### **Flash not appearing**

- Check if `beat-collection-system.js` is loaded
- Check browser console for errors
- Verify CSS is injected (check Elements panel for `#beatCollectionStyles`)

### **Button not appearing after 15 beats**

- Check `BeatCollectionSystem.collectedBeats.length` in console
- Verify `totalBeats` config matches your structure
- Check if button element exists: `document.getElementById('assembleFinalCutBtn')`

### **Final screen shows "No game data found"**

- Check `localStorage.getItem('final_cut_data')` in console
- Ensure `window.game` exists in parent window
- Try setting data manually before opening

### **Export buttons don't work**

- Final screen tries to call `window.opener.exportOTI()` etc.
- Ensure export functions exist in parent game
- Check popup blocker settings

---

## 📚 REFERENCE: Beat Structure

Standard 15-beat Save the Cat structure:

| # | Beat | Act | Suggested Syntagma |
|---|------|-----|-------------------|
| 1 | Opening Image | 1 | DS |
| 2 | Theme Stated | 1 | AS |
| 3 | Set-Up | 1 | DS |
| 4 | Catalyst | 1 | SC |
| 5 | Debate | 1 | PS |
| 6 | Break into Two | 2A | SC |
| 7 | B Story | 2A | ALT |
| 8 | Fun and Games | 2A | ES |
| 9 | Midpoint | 2A | SC |
| 10 | Bad Guys Close In | 2A | OS |
| 11 | All Is Lost | 2B | AS |
| 12 | Dark Night | 2B | BS |
| 13 | Break into Three | 3 | SC |
| 14 | Finale | 3 | OS |
| 15 | Final Image | 3 | AS |

**Syntagma Codes:**
- AS — Autonomous Shot
- PS — Parallel Syntagma
- BS — Bracket Syntagma
- DS — Descriptive Syntagma
- ALT — Alternating Syntagma
- SC — Scene
- ES — Episodic Sequence
- OS — Ordinary Sequence

---

## 🚀 NEXT STEPS

1. **Integrate into Garden** — Add beat assignment to line clears
2. **Integrate into Flux Garden** — Add beat assignment to matches
3. **Test full pipeline** — Game → Beat collection → Final screen → Export
4. **Enhance final screen** — Add visual previews, clip thumbnails
5. **Add cross-tool support** — Import OTI from other games into final screen

---

## 💡 DESIGN PHILOSOPHY

**Why this system?**

1. **Immediate Feedback** — Users know instantly when they've progressed
2. **Clear Goal** — X/15 progress makes objective concrete
3. **Satisfying Completion** — Final screen is reward for completing narrative
4. **Export Integration** — Seamless flow from gameplay to film generation
5. **Cross-Tool Unity** — Same experience across all Sense Ritual games

**The flash is not just UI—it's procedural rhetoric.** It reinforces that gameplay IS narrative assembly. Each match, line clear, or chain formed is a beat in your film.
