# TIME ALLEY — Zoom System Redesign

## New Media-First Hierarchy

### Core Principle
**Top alley ALWAYS fits all loaded media.** Then you zoom in by consistent divisions.

---

## Time Scale Hierarchy

### 6 Levels with Consistent Zoom Factor

```
Level 1: COLLECTION  (all media, auto-fit)
   ↓ divide by 6
Level 2: SEQUENCE    (1/6 of collection)
   ↓ divide by 6
Level 3: SECTION     (1/36 of collection)
   ↓ divide by 6
Level 4: MOMENT      (1/216 of collection)
   ↓ divide by 6
Level 5: SECONDS     (1/1296 of collection)
   ↓ divide by 48
Level 6: FRAMES      (1/48 second = ~21ms)
```

### Zoom Math

```javascript
ZOOM_FACTOR = 6    // Each level is 6x more detailed
FRAME_RATE = 48    // Frames per second at deepest level

// Example with 1000s collection:
Collection: 0-1000s        (all media)
Sequence:   450-617s       (167s span, 1/6 of 1000)
Section:    500-528s       (28s span, 1/6 of 167)
Moment:     510-515s       (4.7s span, 1/6 of 28)
Seconds:    512-513s       (0.78s span, 1/6 of 4.7)
Frames:     512.3-512.4s   (0.016s span, 1/48 of 0.78)
```

---

## Auto-Fit Collection

### Always Shows All Media

**Before:** Fixed 3600s (1 hour) collection
**After:** Dynamic, based on loaded media

```javascript
// After each media import
state.totalDuration = Math.max(state.totalDuration, clip.end)

// Top alley auto-expands
state.stack[0].domain = [0, state.totalDuration]
```

**Examples:**
- Load 30s of media → Collection shows 0-30s
- Load 5 minutes → Collection shows 0-300s
- Load 2 hours → Collection shows 0-7200s

---

## Zoom Behavior

### Dive In (↓)

**Action:** Zooms to center portion of current view
**Math:** `new_span = old_span / divider`

```javascript
// Example: Collection 0-1000s
center = 500s
new_span = 1000 / 6 = 167s
new_range = [500 - 83.5, 500 + 83.5] = [417, 583]
```

**Result:** Shows middle 1/6 of current view in next alley

### Zoom Out (↑)

**Action:** Removes deepest alley, returns to parent
**Result:** See broader context again

### Fit All (F)

**Action:** Reset to top level
**Result:** See entire collection

---

## Unit Definitions

### New Structure

```javascript
const unitDefs = {
  collection: { 
    name: 'Collection',
    divider: 6,              // Next level is 1/6 of this
    next: 'sequence',
    secondsPerUnit: 1
  },
  sequence: { 
    name: 'Sequence',
    divider: 6,
    next: 'section',
    secondsPerUnit: 1
  },
  section: { 
    name: 'Section',
    divider: 6,
    next: 'moment',
    secondsPerUnit: 1
  },
  moment: { 
    name: 'Moment',
    divider: 6,
    next: 'seconds',
    secondsPerUnit: 1
  },
  seconds: { 
    name: 'Seconds',
    divider: 48,             // Frame subdivision
    next: 'frames',
    secondsPerUnit: 1
  },
  frames: { 
    name: 'Frames',
    divider: 1,              // Deepest level
    next: null,
    secondsPerUnit: 1/48     // ~21ms per frame
  }
}
```

---

## Visual Changes

### Tick Marks

**Before:** Fixed major intervals (years/months/days)
**After:** Dynamic, always 10 ticks per view

```javascript
// Always 10 ticks regardless of scale
const span = domain[1] - domain[0]
const tickInterval = span / 10

// Draw 10 evenly-spaced ticks
for(let i=0; i<=10; i++){
  const value = domain[0] + i * tickInterval
  drawTick(value)
}
```

### Labels

**Before:** Calendar labels (Jan, Feb, 1963, etc.)
**After:** Time labels (HH:MM:SS.S or frame numbers)

```
Collection: 00:00:00.0
Sequence:   00:05:30.0
Section:    00:08:45.0
Moment:     00:08:52.3
Seconds:    08.52s
Frames:     f410
```

---

## Transclusion with Zoom

### Ghost Clips Appear at Each Level

**When you dive:**
1. Calculate which clips overlap the zoom region
2. Create ghost copies in child layer
3. Render ghosts with dashed borders

```javascript
// Find parent clips that overlap zoom region
const parentClips = state.clips.filter(c=>
  c.layerIndex === currentLayer && 
  !c.isGhost &&
  overlaps(zoomRange, [c.start, c.end])
)

// Create ghosts in child
parentClips.forEach(pc => {
  const ghost = {
    ...pc,
    id: 'g' + randomId,
    layerIndex: childLayer,
    isGhost: true,
    parentClipId: pc.id
  }
  state.clips.push(ghost)
})
```

**Visual:**
- Solid clips = Native to this scale
- Dashed clips = Ghosts from parent
- See full context while zoomed

---

## Example Zoom Session

### Start: Collection View
```
COLLECTION (0-1000s)
├─ [■■■■■ Video A ■■■■■] 0-50s
├─ [■■■■ Video B ■■■■] 50-100s
├─ [■■■■■■ Video C ■■■■■■] 100-180s
└─ ... 54 videos total
```

### Dive #1: Sequence
```
SEQUENCE (417-583s)
├─ [▫▫ Video K ▫▫] (ghost from collection)
└─ [▫▫▫ Video L ▫▫▫] (ghost from collection)
```

### Dive #2: Section
```
SECTION (483-511s)
└─ [▫▫ Video L ▫▫] (ghost from sequence)
```

### Dive #3: Moment
```
MOMENT (495-500s)
└─ [▫▫ Video L ▫▫] (ghost from section)
```

### Dive #4: Seconds
```
SECONDS (497.3-498.1s)
└─ [▫▫ Video L ▫▫] (ghost from moment)
```

### Dive #5: Frames
```
FRAMES (497.65-497.67s)
└─ [▫▫ Video L ▫▫] (ghost from seconds)
Frame-level precision: f23887 to f23888
```

---

## Benefits

### 1. **Always Fits Your Media**
- No wasted space
- No arbitrary boundaries
- Collection grows with content

### 2. **Consistent Zoom Factor**
- Each level is 6x more detailed
- Predictable navigation
- Easy to understand depth

### 3. **Frame-Level Precision**
- 48 frames per second
- ~21ms resolution
- Edit individual frames

### 4. **Context Preservation**
- Ghost clips show parent context
- Never lose orientation
- See relationships across scales

### 5. **Infinite Zoom**
- Start from hours of footage
- Zoom to individual frames
- 6 levels of detail

---

## Math Examples

### Example 1: Small Collection (100s)
```
Level    | Span        | Description
---------|-------------|-------------
1. Col   | 0-100s      | Full collection
2. Seq   | 42-58s      | 16.7s (1/6)
3. Sec   | 47-50s      | 2.8s (1/36)
4. Mom   | 48-49s      | 0.46s (1/216)
5. Sec   | 48.3-48.4s  | 0.08s (1/1296)
6. Fra   | 48.35s      | 0.0016s frames (1/48)
```

### Example 2: Large Collection (3600s = 1 hour)
```
Level    | Span          | Description
---------|---------------|-------------
1. Col   | 0-3600s       | Full hour
2. Seq   | 1500-2100s    | 10 min (1/6)
3. Sec   | 1750-1850s    | 100s (1/36)
4. Mom   | 1783-1800s    | 17s (1/216)
5. Sec   | 1790-1793s    | 2.8s (1/1296)
6. Fra   | 1791.3-1791.4s| 0.06s frames (1/48)
```

---

## User Flow

### Loading Media
1. Page loads → Collection shows 0-100s (default)
2. 54 videos import → Total: 458s
3. **Collection auto-expands** → Now shows 0-458s
4. All videos visible at once

### Zooming In
1. Click "↓ Dive In" → Zooms to 153-305s (Sequence)
2. Click "↓ Dive In" → Zooms to 203-229s (Section)
3. Click "↓ Dive In" → Zooms to 212-216s (Moment)
4. Click "↓ Dive In" → Zooms to 213.3-214s (Seconds)
5. Click "↓ Dive In" → Zooms to frames (Frames)

### Zooming Out
1. Click "↑ Zoom Out" → Back to Seconds
2. Click "↑ Zoom Out" → Back to Moment
3. Click "F" (Fit All) → Back to Collection (0-458s)

---

## Implementation Details

### Auto-Fit on Import

```javascript
// Every time media is added
state.clips.push(clip)
state.totalDuration = Math.max(state.totalDuration, clip.end)

// Update top alley
state.stack[0].domain = [0, state.totalDuration]
state.stack[0].sel = [0, state.totalDuration]
```

### Zoom Calculation

```javascript
function diveCenter(){
  const current = getCurrentLayer()
  const def = unitDefs[current.unit]
  
  // Calculate center and new span
  const span = current.domain[1] - current.domain[0]
  const center = (current.domain[0] + current.domain[1]) / 2
  const newSpan = span / def.divider
  
  // Create child layer
  const child = {
    unit: def.next,
    domain: [center - newSpan/2, center + newSpan/2]
  }
  
  state.stack.push(child)
}
```

---

## Summary

### Old System
- ❌ Fixed calendar units (years/months/days)
- ❌ Collection was 1963-1968 (arbitrary)
- ❌ Didn't fit actual media
- ❌ Calendar-centric thinking

### New System
- ✅ **Media-first**: Collection fits all content
- ✅ **Consistent zoom**: Divide by 6 each level
- ✅ **Frame precision**: 48fps at deepest
- ✅ **Auto-expand**: Grows with your media
- ✅ **6 levels**: Collection → Frames
- ✅ **Ghosts**: Context at every scale

**The timeline IS your media. No more fitting media into arbitrary calendar dates!**

---

*Redesigned: 2025-10-13 05:09*
*Media-first. Zoom-consistent. Frame-precise.*
