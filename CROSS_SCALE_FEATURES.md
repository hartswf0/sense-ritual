# TIME ALLEY — Cross-Scale Features & Clip Operations

## New Multi-Scale View System

### See Media Across ALL Time Scales

**Before:** Only current layer showed clips  
**After:** **Same media visible across all layers simultaneously**

```
Collection Layer:    [████████ Video A ████████]  (full width)
    ↓ dive
Sequence Layer:      [██████ Video A ██████]      (slightly narrower)
    ↓ dive
Section Layer:       [████ Video A ████]          (narrower still)
    ↓ dive
Moment Layer:        [██ Video A ██]              (minimal width)
```

**Visual Hierarchy:**
- **Current layer** (rightmost): 75% width, 95% opacity
- **Parent layers**: 60% width, 70% opacity
- **Ghost clips**: Dashed borders, 40% opacity, gray

---

## Enhanced Video Preview

### Context-Aware Display

**Shows:**
1. **Current scale** (Collection/Sequence/Section/etc.)
2. **File name** (first 20 chars)
3. **Clip time range** (start → end)
4. **Clip duration**
5. **Playback progress** (when playing)

```
┌─────────────────────────────────┐
│ PREVIEW                         │
│                                 │
│   [Video Playing]               │
│                                 │
├─────────────────────────────────┤
│ Sequence | video_abc123.mp4    │
│ Clip: 00:05:30 → 00:05:40 (10s)│
│ Progress: 00:00:03              │
└─────────────────────────────────┘
```

**When active:**
- Playing → Shows live video + progress
- Stopped + selected → Shows frame at playhead
- Scale shown → Know which layer you're viewing

---

## Clip Context Menu (Right-Click)

### Right-click any clip to access:

```
┌───────────────────────┐
│ 🎨 Change Color       │
│ 🔗 Weld to Next       │
│ ✂️ Split at Playhead  │
├───────────────────────┤
│ 🗑️ Delete             │
└───────────────────────┘
```

---

## Color Coding System

### 8 Clip Colors Available

```javascript
Red:    #E24A4A  (default accent)
Orange: #FF8C42  (warm)
Yellow: #FFC107  (highlight)
Green:  #4CAF50  (success)
Blue:   #2196F3  (cool)
Purple: #9C27B0  (deep)
Pink:   #E91E63  (bright)
Gray:   #666     (neutral)
```

### How to Use:
1. **Right-click clip** → "🎨 Change Color"
2. **Cycles through colors** sequentially
3. **Visual organization** of related clips
4. **Persistent** across scales (ghosts maintain color)

### Use Cases:
- **Red**: Main action/focal clips
- **Yellow**: B-roll/secondary
- **Green**: Approved/final
- **Blue**: Audio-only clips
- **Purple**: Effects/transitions
- **Gray**: Unused/archived
- **Orange/Pink**: Custom categories

---

## Welding Clips

### Merge Adjacent Clips

**Action:** Right-click → "🔗 Weld to Next"

**Conditions:**
- Next clip must be **immediately adjacent** (no gap)
- Next clip must be **same media file**
- Next clip must be **same layer**

**Result:**
```
Before:  [██ Clip A ██] [██ Clip B ██]
         0-10s          10-20s

After:   [████████ Clip A ████████]
         0-20s
         (Clip B deleted, Clip A extended)
```

**Use Cases:**
- Merge accidentally split clips
- Combine sequential shots
- Simplify timeline
- Create longer sequences

---

## Splitting Clips

### Cut Clip at Playhead

**Action:** Right-click → "✂️ Split at Playhead"

**Requirements:**
- Playhead must be **inside clip bounds**
- Creates two clips from one

**Result:**
```
Before:  [████████████████]
         0-20s
         Playhead at 12s

After:   [████████] [██████]
         0-12s      12-20s
         (Same color, same media)
```

**Use Cases:**
- Cut out unwanted sections
- Create edit points
- Isolate specific moments
- Prepare for transitions

---

## Better Scrolling

### Smooth Vertical Navigation

```css
#vizWrap {
  overflow: auto;           /* Now scrollable! */
  scroll-behavior: smooth;  /* Smooth scrolling */
}
```

**Features:**
- **Vertical scroll** through timeline
- **Smooth easing** when jumping
- **Touch-friendly** on mobile
- **Keyboard support** (arrows, page up/down)

**Use Cases:**
- Navigate long collections
- Jump to specific times
- Review entire timeline
- Mobile browsing

---

## Complete Workflow Examples

### Example 1: Color-Code a Project

```
1. Import 54 videos
2. Right-click each clip
3. Choose colors:
   - Red: Interviews
   - Yellow: B-roll
   - Blue: Voiceovers
   - Green: Final approved
4. Instantly see categories
```

### Example 2: Edit a Long Interview

```
1. Import 30-minute interview
2. Press D to dive into Sequence
3. Find interesting moment
4. Press D again to Section
5. Position playhead at start
6. Right-click → Split
7. Move playhead to end
8. Right-click → Split
9. Delete unwanted sections
10. Right-click kept clips → Color green
11. Press U to zoom out
12. See highlighted section across all scales
```

### Example 3: Create Multi-Angle Sequence

```
1. Import 3 camera angles
2. Use colors:
   - Red: Camera 1
   - Blue: Camera 2
   - Green: Camera 3
3. Dive to Moment level
4. Split each at cut points
5. Delete unused angles
6. Remaining clips show which camera
7. Zoom out to see full sequence
8. All cameras visible across scales
```

### Example 4: Build Montage

```
1. Import multiple clips
2. Dive to Section level
3. Select best moments
4. Split to isolate
5. Delete surrounding content
6. Color code by theme
7. Zoom to Collection
8. See all highlights
9. Rearrange if needed
10. Weld adjacent clips
```

---

## Cross-Scale Visibility

### How It Works

**When you zoom:**
```
Collection (Layer 0):
├─ [█████ Clip A █████] 0-50s
└─ [████ Clip B ████] 50-100s

↓ Dive to 40-60s

Sequence (Layer 1):
├─ [▫▫ Clip A ▫▫]  (ghost from parent)
└─ [▫▫ Clip B ▫▫]  (ghost from parent)
```

**Visibility Rules:**
1. **Solid clips** = Native to current layer
2. **Dashed clips** = Ghosts from parent
3. **Width decreases** in parent layers
4. **Opacity decreases** in parent layers
5. **Color maintained** across all scales

**Benefits:**
- Never lose context
- See relationships
- Understand placement
- Navigate confidently

---

## Clip Operations Matrix

| Operation      | Shortcut        | Requires         | Result           |
|----------------|-----------------|------------------|------------------|
| Select         | Click           | -                | Shows info       |
| Preview        | Click/Play      | -                | Video display    |
| Color Change   | Right-click     | Real clip        | Cycles colors    |
| Weld           | Right-click     | Adjacent clip    | Merges clips     |
| Split          | Right-click     | Playhead inside  | Creates 2 clips  |
| Delete         | Right-click     | Real clip        | Removes clip     |
| Move           | Drag            | Real clip        | Repositions      |
| Resize         | Drag edge       | Real clip        | Changes duration |

---

## Technical Details

### Color Storage

```javascript
clip.color = '#FFC107'  // Stored per clip
// Inherited by ghost copies
// Persists across scales
// Saved in project file
```

### Welding Algorithm

```javascript
// Find adjacent clip
const nextClip = clips.find(c=>
  c.layerIndex === currentClip.layerIndex &&
  c.mediaId === currentClip.mediaId &&
  c.start === currentClip.end  // Must be adjacent
)

// Merge
currentClip.end = nextClip.end
currentClip.duration = currentClip.end - currentClip.start

// Remove next
clips = clips.filter(c=>c.id !== nextClip.id)
```

### Splitting Algorithm

```javascript
// Calculate split point
const splitPoint = playheadPosition

// Create right side
const rightClip = {
  ...originalClip,
  id: generateNewId(),
  start: splitPoint,
  end: originalClip.end,
  duration: originalClip.end - splitPoint
}

// Adjust left side
originalClip.end = splitPoint
originalClip.duration = splitPoint - originalClip.start

// Add new clip
clips.push(rightClip)
```

### Cross-Layer Rendering

```javascript
function drawClips(layer, layerIndex){
  const isCurrentLayer = layerIndex === stack.length - 1
  
  clips.forEach(clip => {
    // Width varies by layer
    const width = isCurrentLayer ? 
      rect.width * 0.75 :  // Wide in current
      rect.width * 0.60    // Narrower in parents
    
    // Opacity varies by type
    const opacity = clip.isGhost ? 
      0.40 :                // Faint ghosts
      isCurrentLayer ? 
        0.95 :              // Solid in current
        0.70                // Semi-transparent in parents
  })
}
```

---

## Keyboard Shortcuts Summary

```
Space     → Play/Pause
D / ↓     → Dive In (zoom)
U / ↑     → Zoom Out
F         → Fit All
Right-click → Clip Menu
  ├─ Color cycling
  ├─ Weld clips
  ├─ Split clip
  └─ Delete clip
```

---

## Visual Guide

### Clip States

```
Normal Clip (Current Layer):
┌────────────────────────┐
│ ████████████████████ │  Solid color, 95% opacity
└────────────────────────┘

Parent Layer Clip:
┌──────────────────┐
│ ████████████ │        Solid color, 70% opacity
└──────────────────┘

Ghost Clip:
┌────────────────┐
│ ▫▫▫▫▫▫▫▫▫▫ │          Dashed border, 40% opacity
└────────────────┘

Selected Clip:
╔════════════════════════╗
║ ████████████████████ ║  Yellow border, 3px
╚════════════════════════╝
```

---

## Benefits Summary

### 1. **Cross-Scale Context**
- See same clip across all zoom levels
- Never lose orientation
- Understand temporal relationships

### 2. **Visual Organization**
- 8 colors for categorization
- Instant visual parsing
- Project-wide consistency

### 3. **Non-Destructive Editing**
- Split without losing data
- Weld to recombine
- Original media untouched

### 4. **Professional Workflow**
- Right-click context menu
- Keyboard shortcuts
- Smooth scrolling
- Touch-optimized

### 5. **Intelligent Preview**
- Shows current scale
- Displays clip context
- Frame-accurate scrubbing
- Progress tracking

---

## Use Case: Documentary Edit

```
1. Import interview + B-roll (200 clips)
2. Color code:
   - Red: Interview
   - Yellow: B-roll nature
   - Blue: B-roll urban
   - Green: Music/sfx
3. Dive to Sequence level
4. Find key interview moments
5. Split at edit points
6. Delete unused sections
7. See remaining reds across all scales
8. Dive deeper to place B-roll
9. Add yellows/blues between reds
10. Weld adjacent same-color clips
11. Zoom out to Collection
12. See complete structure
```

**Result:** Color-coded, multi-scale edit with context preserved!

---

*Completed: 2025-10-13 05:19*
*Cross-scale visibility. Color coding. Non-destructive editing. Professional workflow.*
