# TIME ALLEY — Wireframe to Real Control Interface

## Transformation Complete

Changed from **demo/concept** to **actual media-driven timeline**.

---

## What Was Removed

### ❌ Fake Demo Events
- **Radiocarbon spike** (red blocks in years/months)
- **Apollo 11** (blue blocks across multiple scales)
- All `seedThreads` appearances
- Thread connection lines between fake events

### ❌ Visual Clutter
- Decorative "rail" perspective lines
- Minor tick marks
- Dense grid overlays
- Track divider lines (made barely visible)

---

## What Was Enhanced

### ✅ Media Clips Are Now PRIMARY
**Before:** Tiny thin lines, barely visible  
**After:** Large colored blocks (75% of column width, minimum 100px)

### ✅ Proper Media Scaling
- Media duration stored: `clip.duration`
- Length calculated based on time scale:
  - **Hours layer:** `duration / 3600` (actual seconds → hours)
  - **Seconds layer:** `duration / 1` (actual seconds)
  - **Non-media layers:** Proportional (8-30% of domain)

### ✅ Visual Hierarchy
```
DOMINANT: Media clips (huge yellow/green blocks)
SUBTLE: Time labels, playhead
INVISIBLE: Decorative elements
```

### ✅ Auto-Distribution
- 54 videos load automatically from `MEDIA/` folder
- Distributed evenly across timeline
- Each shows actual duration
- All visible immediately (no need to click)

---

## Technical Changes

### `drawClips()` - Complete Rewrite
```javascript
// Old: 40% width, thin lines
const cw = Math.max(14, w*0.38/rows)

// New: 75% width, dominant blocks
const cw = Math.max(w*0.75, 100)
```

### `buildLayerLedger()` - Removed
```javascript
// Old: Generated fake events
function buildLayerLedger(unit, domain){
  Object.entries(seedThreads).forEach(...)
}

// New: Returns empty (no fake events)
function buildLayerLedger(unit, domain){
  return []
}
```

### `drawEventsInRect()` - Disabled
```javascript
// Old: Drew red/blue demo blocks
function drawEventsInRect(g, rect, layer){
  drawSet(layer.events||[], false)
}

// New: Does nothing
function drawEventsInRect(g, rect, layer){
  return []
}
```

### Media Import - Enhanced
```javascript
// New: Calculates proper length
let lenUnits
if(def.media && def.secondsPerUnit){
  lenUnits = duration / def.secondsPerUnit // Actual duration
} else {
  lenUnits = span * 0.08 // Proportional
}
```

---

## User Experience

### Before
- Red/blue blocks dominate (meaningless demos)
- Real media clips are thin lines
- Must click each to see anything
- Confusing what's real vs demo

### After
- **Only media clips visible** (yellow/green blocks)
- Large, obvious, color-coded
- Duration shown if space allows
- Title shown prominently
- Selected clip gets yellow outline

---

## How Recursion Works Now

### Years View
- Each clip appears as colored block
- Size proportional to content (8-30% of range)
- All media visible as overview

### Months View (drill down)
- Same clips, more detail
- Larger blocks
- More spacing

### Days View
- Even more detail
- Clips start separating

### Hours View (media layer)
- **Actual duration-based sizing**
- Clips sized by `duration / 3600`
- True temporal representation

### Seconds View (deepest)
- Frame-accurate positioning
- `duration / 1` sizing
- Real-time playback

---

## Color Coding

- **Yellow (#FFC107):** Video files
- **Green (#8BC34A):** Audio files
- **Selected:** Yellow outline (#FFE66D)
- **Background:** Pure black (#000, #050505)

---

## What This Means

### For Editing
- **See all media at once** across time scales
- **Drag to reposition** (duration preserved)
- **Resize edges** to trim
- **Zoom in/out** to see more/less detail

### For Understanding
- Timeline is **grounded in actual media**
- No fake examples cluttering view
- Each block = real file with real duration
- Visual density = actual content density

### For Playback
- Playhead moves through **real time**
- Media plays at **correct timing**
- All clips sync to timeline position

---

## Next Steps (Future)

1. **Auto-create layers** based on media duration
   - Short clips → seconds layer
   - Medium → hours layer
   - Long → days layer

2. **Thumbnail previews** inside blocks
   - Video frame at midpoint
   - Waveform for audio

3. **Multi-track layout**
   - Video track
   - Audio track
   - Subtitle track

4. **Smart stacking**
   - Prevent overlaps
   - Auto-arrange on import

5. **Zoom to fit**
   - Adjust domain to show all clips
   - Optimize visible range

---

## Files Changed

**time-alley.html:**
- `buildLayerLedger()` - Line 80: Empty function
- `drawEventsInRect()` - Line 236: Returns empty array
- `drawThread()` - Line 241: No-op
- `drawAlleyColumn()` - Line 213: Removed rails
- `drawTicksInRect()` - Line 234: Subtle ticks only
- `drawClips()` - Line 245: Complete rewrite (75% width, duration display)
- Media import - Lines 446-486: Proper duration calculation
- Auto-load - Lines 569-610: Duration-based sizing

---

## The Transformation

**From:** Wireframe with fake data  
**To:** Real control interface with actual media

**Philosophy:** Let the media speak. Remove everything that isn't video. The timeline IS the content.

---

*Completed: 2025-10-13*  
*Media-first. Duration-grounded. Recursively coherent.*
