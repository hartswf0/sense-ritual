# NARRATIVE GARDEN SYSTEM — Complete Overview

## What It Is

A **match-3 game** where you build a **3-act cinematic narrative** by collecting story beats and choosing **syntagmatic structures** (film editing patterns).

---

## The 3-Act Structure

### **ACT 1: SETUP** (5 beats)
```
1. Opening Image     (DS - Descriptive Syntagma)
2. Theme Stated      (AS - Autonomous Shot)
3. Set-Up            (DS - Descriptive Syntagma)
4. Catalyst          (SC - Scene)
5. Debate            (PS - Parallel Syntagma)

Complete Act 1 → +200 bonus points
```

### **ACT 2A: CONFRONTATION** (5 beats)
```
6. Break into Two         (SC - Scene)
7. B Story                (ALT - Alternating Syntagma)
8. Fun and Games          (ES - Episodic Sequence)
9. Midpoint               (SC - Scene)
10. Bad Guys Close In     (OS - Ordinary Sequence)

Complete Act 2A → +300 bonus points
```

### **ACT 2B: CRISIS** (2 beats)
```
11. All Is Lost           (AS - Autonomous Shot)
12. Dark Night            (BS - Bracket Syntagma)

Complete Act 2B → +200 bonus points
```

### **ACT 3: RESOLUTION** (3 beats)
```
13. Break into Three      (SC - Scene)
14. Finale                (OS - Ordinary Sequence)
15. Final Image           (AS - Autonomous Shot)

Complete Act 3 → +400 bonus points
```

### **COMPLETE STRUCTURE**
```
All 15 beats collected → +1000 completion bonus!
```

---

## Syntagmas (Film Editing Structures)

### Available Syntagmas

**AS - Autonomous Shot** (+100 pts)
- Single shot with complete meaning
- Used for: Theme, All Is Lost, Final Image

**PS - Parallel Syntagma** (+100 pts)
- Alternating between two or more storylines
- Used for: Debate

**BS - Bracket Syntagma** (+100 pts)
- Collection of brief shots
- Used for: Dark Night

**DS - Descriptive Syntagma** (+100 pts)
- Descriptive montage of a space
- Used for: Opening Image, Set-Up

**ALT - Alternating Syntagma** (+150 pts) ⭐
- Alternating shots between simultaneous actions
- Used for: B Story

**SC - Scene** (+100 pts)
- Continuous action in unified space/time
- Used for: Catalyst, Break into Two, Midpoint, Break into Three

**ES - Episodic Sequence** (+150 pts) ⭐
- Series of brief scenes over time
- Used for: Fun and Games

**OS - Ordinary Sequence** (+100 pts)
- Chronological shots of single action
- Used for: Bad Guys Close In, Finale

### Suggested Syntagma Bonus
- When you choose the **suggested syntagma** for a beat → **+50 bonus!**
- Suggested syntagmas appear **highlighted in yellow**

---

## Gameplay Loop

### 1. Match-3 Grid
```
8x8 grid of colored cells
Match 3+ in a row/column
Each match uses 1 move (50 total moves)
```

### 2. Collect Beat
```
Match triggers beat collection
Syntagma selector appears
Choose film editing structure
```

### 3. Build Narrative
```
Beat added to act tracker
Progress bar updates
Act completion bonuses awarded
```

### 4. Complete Structure
```
Collect all 15 beats
Total score calculated
Export storymap available
```

---

## Visual System

### Left Panel: Act Tracker

**Shows:**
- 4 act sections with color coding:
  - **Act 1** = Cyan (#4ECDC4)
  - **Act 2A** = Yellow (#FFE66D)
  - **Act 2B** = Coral (#F38181)
  - **Act 3** = Purple (#AA96DA)
- Progress bar per act
- Beat list with collection status
- Syntagma badges on collected beats

**Beat States:**
- **Uncollected**: Gray, faded
- **Collected**: Bright, shifted right, shows syntagma badge

### Right Panel: Instructions

**Shows:**
- How to play
- Bonus structure
- Win conditions

### Center: Match-3 Board

**8x8 grid with:**
- 6 colors (Bauhaus palette)
- Selected cell highlighted in green
- Smooth animations

### Syntagma Selector Modal

**Appears on match:**
- Beat title and act
- 8 syntagma options in 2x4 grid
- Suggested option highlighted
- Click to choose

---

## Scoring System

### Base Points
```
Beat collected:        +100 pts
Syntagma bonus:        +100-150 pts
Suggested syntagma:    +50 pts bonus
```

### Act Bonuses
```
Act 1 complete:        +200 pts
Act 2A complete:       +300 pts
Act 2B complete:       +200 pts
Act 3 complete:        +400 pts
All 15 beats:          +1000 pts

Maximum possible:      ~4350 points
```

---

## Technical Implementation

### Core Loop
```javascript
1. Match cells → Beat pending
2. Show syntagma selector
3. User chooses syntagma
4. Add to narrative structure
5. Update progress
6. Check act completion
7. Clear matches, drop cells
8. Check for cascades
9. Repeat
```

### Data Structures

**BEATS Array:**
```javascript
{
  id: 1,
  name: 'Opening Image',
  act: 'act1',
  actName: 'Act 1',
  suggestedSyntagma: 'DS'
}
```

**SYNTAGMAS Array:**
```javascript
{
  code: 'DS',
  name: 'Descriptive Syntagma',
  bonus: 100
}
```

**Game State:**
```javascript
{
  grid: [],                 // 8x8 array
  selected: null,           // {r, c}
  score: 0,
  actBonus: 0,
  moves: 50,
  beatsCollected: [],       // {beatId, syntagma, act}
  busy: false,
  pendingBeatId: null,
  actProgress: {            // Beats per act
    act1: 0,
    act2a: 0,
    act2b: 0,
    act3: 0
  }
}
```

---

## Win Condition

### Complete All Acts
```
✓ All 15 beats collected
✓ All 4 acts complete
✓ Modal shows final score
✓ Export storymap button appears
```

### Modal Breakdown
```
Beat Points:        +1500 (15 × 100)
Act 1 Bonus:        +200
Act 2A Bonus:       +300
Act 2B Bonus:       +200
Act 3 Bonus:        +400
Completion Bonus:   +1000
Syntagma Bonuses:   +varies
Total:              ~4350 points
```

---

## Design Philosophy

### Why This System?

**1. Film Theory Integration**
- Syntagmas are real film editing concepts (Christian Metz)
- 3-act structure is classic screenplay format (Save the Cat beats)
- Teaches narrative construction through play

**2. Progressive Disclosure**
- Start simple (match-3)
- Add layer (choose syntagma)
- Build understanding (see structure emerge)
- Complete narrative (export storymap)

**3. Visual Learning**
- Progress bars show act completion
- Color coding distinguishes acts
- Beat names teach screenplay terminology
- Syntagma badges show editing choices

**4. Replayability**
- Different syntagma choices
- Different final scores
- Learn optimal combinations
- Explore narrative variations

---

## Educational Value

### Film Concepts Taught

**Syntagmatic Analysis:**
- How shots create meaning
- Temporal vs spatial organization
- Editing patterns in cinema

**Narrative Structure:**
- 3-act screenplay format
- Save the Cat beat sheet
- Act transitions and pacing

**Game-Based Learning:**
- Learn by doing
- Immediate feedback
- Progressive complexity
- Satisfying completion

---

## Files in Series

### Narrative Garden Series

**v01** - Basic match-3 foundation
**v02** - Added beat collection
**v03** - Full act structure + syntagmas ⭐ **YOU ARE HERE**
**v04** - Additional features
**v05** - Final polish
**ultimate** - Definitive version
**complete** - Archive version

---

## Favicon Fix Applied

### Problem
```
favicon.ico:1 Failed to load resource: 404
```

### Cause
```html
<link rel="manifest" href="manifest.json">
```
- File doesn't exist
- Triggers additional requests
- Causes console errors

### Solution
```
✅ Removed manifest.json link from:
   - meshwork-725.html
   - meshwork-865.html
   - All other affected files
```

---

## Summary

**NARRATIVE GARDEN v0.3** is a complete educational game system that teaches:
- ✅ 3-act narrative structure
- ✅ Film syntagmatic analysis
- ✅ Screenplay beat construction
- ✅ Match-3 puzzle mechanics

**Play → Learn → Build → Export → Understand Cinema** 🎬📚🎮

---

*Completed: 2025-10-13 06:36*
*3-act structure. Film syntagmas. Match-3 mechanics. Cinematic learning through play.*
