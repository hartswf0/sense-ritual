# Matrix Editor → a3.html Export Strategy

## Problem Analysis

### Critical Issues Identified
1. **Browser Crashes**: Attempting to generate video/HTML files in-browser causes crashes
2. **Format Incompatibility**: Matrix editor outputs `beats[]` structure, a3.html expects `selected[]` array
3. **Missing Rich Data**: Not leveraging `desc`, `quote`, `tags`, `color`, `category`, `id` fields
4. **No Shareable Visual**: Need screenshotable artifact, not just data export
5. **Export UX**: Too many redundant options, unclear what works

## Strategic Solution: Multi-Modal Export

### 1. NO VIDEO GENERATION (Critical)

**Why video export crashes:**
- FFmpeg in browser = massive memory overhead
- Encoding 10+ video clips = GB of buffer data
- Mobile browsers can't handle video rendering

**Alternative Solution:**
- Export **data only** (JSON)
- Let external tools handle video (DaVinci Resolve, Premiere, ffmpeg CLI)
- Provide **visual artifact** via screenshot-friendly layouts

---

## 2. Backwards-Compatible Data Format

### Output Format (a3.html compatible)

```json
{
  "title": "Fragments of Control",
  "selected": [
    {
      "id": "family-of-man",
      "title": "Family of Man",
      "category": "Core Concept",
      "desc": "Herbert Bayer's modernist vision...",
      "quote": "The individual would make their own story...",
      "tags": ["Bayer", "Agency", "Self-determination"],
      "start": 27,
      "end": 53,
      "color": "#4A90E2"
    }
  ],
  "timestamp": "2025-10-10T16:42:41.299Z",
  "author": "Matrix Editor Player",
  "version": "1.0",
  "gameplay": {
    "score": 1450,
    "stats": { /* coherence breakdown */ },
    "beats": [ /* beat structure for reimport */ ]
  }
}
```

### Conversion Logic

```javascript
function convertToA3Format() {
  const selected = [];
  
  filmData.beats.forEach((beat, beatIdx) => {
    beat.clips.forEach((clip, clipIdx) => {
      selected.push({
        id: clip.id || generateId(beat.name, clip.title),
        title: clip.title,
        category: clip.category || 'Core Concept',
        desc: clip.desc || '',
        quote: clip.quote || clip.desc || '',
        tags: clip.tags || [beat.name, beat.syntagma],
        start: clip.start,
        end: clip.end,
        color: clip.color || filmData.color || '#fff'
      });
    });
  });
  
  return {
    title: filmData.title,
    selected: selected,
    timestamp: new Date().toISOString(),
    author: 'Matrix Editor Player',
    version: '1.0',
    gameplay: {
      score: filmData.score,
      stats: filmData.stats,
      beats: filmData.beats.map(b => ({
        name: b.name,
        syntagma: b.syntagma,
        clipCount: b.clips.length
      }))
    }
  };
}
```

---

## 3. Visual Shareable Artifact

### Title Sequence View

**Design Goals:**
- Screenshot-friendly layout
- Shows all rich data (desc, category, tags)
- Grouped by beat with visual hierarchy
- Color-coded by clip/faction
- Mobile-optimized grid

**Layout Structure:**
```
┌─────────────────────────────────────────────┐
│ BEAT 1: OPENING IMAGE [DS]                 │
├─────────────────────────────────────────────┤
│ ┌────────────┐ ┌────────────┐ ┌──────────┐ │
│ │ SHOT 1     │ │ SHOT 2     │ │ SHOT 3   │ │
│ │ ◯          │ │ ◐          │ │ ◑        │ │
│ │ Family of  │ │ Individual │ │ Unreal   │ │
│ │ Man        │ │ Self       │ │ Fairyland│ │
│ │            │ │            │ │          │ │
│ │ Bayer's... │ │ At center..│ │ World... │ │
│ │            │ │            │ │          │ │
│ │ 26s        │ │ 11s        │ │ 7s       │ │
│ │ [Core]     │ │ [Core]     │ │ [Critique│ │
│ └────────────┘ └────────────┘ └──────────┘ │
└─────────────────────────────────────────────┘
```

**Features:**
- Beat grouping with syntagma labels
- Shot numbers (sequential 1, 2, 3...)
- Icon display
- Full title
- Description text (logline)
- Duration + Category badge
- Individual clip colors
- Click to play

**Use Case:**
- Screenshot for social media
- Print as poster
- Share as visual summary
- Portfolio artifact

---

## 4. Export Options (Simplified)

### Before (Too Many)
- ❌ Download OTI.JSON (proprietary)
- ❌ Download Storymap.MD (redundant)
- ❌ Download Shotlist.JS (developer-only)
- ❌ Download EDL (niche format)
- ❌ Copy JSON (developer-only)
- ❌ Share Link (doesn't work reliably)

### After (Essential 3)

#### 1. **Copy Shot List** ✓
**Format:** Plain text with all metadata
```
BEAT 1: OPENING IMAGE
Syntagma: DS
------------------------------------------------------------

Shot 1: Family of Man
  Icon: ◯
  Duration: 26s
  Timecode: 00:00:00:27 → 00:00:00:53
  Category: Core Concept
  Description: Herbert Bayer's modernist vision...
  Quote: "The individual would make their own story..."
  Tags: Bayer, Agency, Self-determination
```

**Use Case:**
- Paste into AI prompt
- Email to collaborators
- Document structure

#### 2. **Download Script** ✓
**Format:** Markdown screenplay
```markdown
# Fragments of Control

An exploration of systemic power...

Coherence Score: 1450
Runtime: 3:42 (12 shots)

## BEAT 1: Opening Image

**Syntagma:** DS
**Duration:** 44s
**Shots:** 3

### Shot 1: Family of Man
- Icon: ◯
- Duration: 26s
- Timecode: 00:00:00:27 → 00:00:00:53
- Category: Core Concept
- Description: Herbert Bayer's modernist vision...
```

**Use Case:**
- Readable documentation
- Version control
- Printing

#### 3. **Download Story (a3 Format)** ✓
**Format:** JSON compatible with a3.html
```json
{
  "title": "...",
  "selected": [...],
  "gameplay": {...}
}
```

**Use Case:**
- Load in a3.html viewer
- Programmatic reuse
- Data archiving
- Reimport later

---

## 5. Mosaic View

### Current Implementation
```
┌─────┬─────┬─────┬─────┐
│ 1   │ 2   │ 3   │ 4   │
│[vid]│[vid]│[vid]│[vid]│
├─────┼─────┼─────┼─────┤
│ 5   │ 6   │ 7   │ 8   │
│[vid]│[vid]│[vid]│[vid]│
└─────┴─────┴─────┴─────┘
```

**Features:**
- Responsive grid (auto-fill minmax 250px)
- Muted autoplay previews
- Hover for title/duration
- Click to play in linear view
- Sequential numbering

### Future: Voronoi Pattern (Experimental)

**Concept:**
```
     ╱╲    ╱╲
    ╱1 ╲  ╱2 ╲
   ╱────╲╱────╲
  ╱   3   ╲  4 ╲
 ╱─────────╲────╲
╱     5     ╲  6 ╲
```

**Implementation Strategy:**
- Use D3.js voronoi tessellation
- Clip videos to polygon masks (CSS clip-path)
- Size cells by duration
- Group by beat with color zones

**Technical Challenge:**
- CSS clip-path + iframe = performance hit
- Better: Canvas-based rendering
- Or: Pre-generate voronoi as SVG overlay

**Decision:** Keep grid for now, voronoi as V2 feature

---

## 6. Data Flow Architecture

```
┌──────────────────┐
│ Matrix Editor    │
│ (Gameplay)       │
└────────┬─────────┘
         │
         │ Collects fragments + beats
         │ Scores coherence
         │
         ▼
┌──────────────────┐
│ showFinalCut()   │
│ - Auto-title     │
│ - Pack rich data │
│ - Save localStorage
└────────┬─────────┘
         │
         │ Opens new window
         │
         ▼
┌──────────────────────────────────┐
│ matrix-final-screen.html         │
│                                  │
│ ┌──────────────────────────────┐│
│ │ Hero: Score + Breakdown      ││
│ └──────────────────────────────┘│
│                                  │
│ ┌──────────────────────────────┐│
│ │ View Modes:                  ││
│ │ [Linear] [Mosaic] [Title]    ││
│ └──────────────────────────────┘│
│                                  │
│ ┌──────────────────────────────┐│
│ │ Export:                      ││
│ │ - Copy Shot List             ││
│ │ - Download Script            ││
│ │ - Download Story (a3)        ││
│ └──────────────────────────────┘│
└──────────────────────────────────┘
         │
         │ Downloads JSON
         │
         ▼
┌──────────────────┐
│ story.json       │
│ (a3 compatible)  │
└────────┬─────────┘
         │
         │ Load in...
         │
         ▼
┌──────────────────┐
│ a3.html          │
│ (Story viewer)   │
└──────────────────┘
```

---

## 7. Rich Data Enhancement

### Matrix Editor Fragment Structure (Before)
```javascript
{
  icon: '◯',
  title: 'Family of Man',
  start: 27,
  end: 53,
  category: 'Core Concept'  // if present
}
```

### Enhanced Structure (After)
```javascript
{
  id: 'family-of-man',
  icon: '◯',
  title: 'Family of Man',
  start: 27,
  end: 53,
  category: 'Core Concept',
  desc: 'Herbert Bayer\'s modernist vision...',
  quote: '"The individual would make their own story..."',
  tags: ['Bayer', 'Agency', 'Self-determination'],
  color: '#4A90E2'
}
```

### Where Rich Data Shows Up

1. **Title Sequence Cards:**
   - Full description displayed
   - Category badge
   - Individual colors

2. **Copy Shot List:**
   - All fields included
   - Formatted for readability

3. **Export JSON:**
   - Complete metadata preserved
   - a3.html can display quotes

4. **Mosaic Hover:**
   - Description in overlay
   - Tags visible

---

## 8. Gameplay → Export Message

### User Journey

**Step 1: Play the game**
```
"I'm playing through Matrix Editor,
collecting clips and forming narrative chains..."
```

**Step 2: Reach 12+ clips**
```
"ASSEMBLE FINAL CUT button appears"
```

**Step 3: Click button**
```
→ New window opens
→ Shows my film with score at top
→ Three viewing modes available
```

**Step 4: Share visually**
```
→ Switch to "Title Sequence" tab
→ See beautiful card layout grouped by beat
→ Screenshot it
→ Share on social: "I played my way into making a film"
```

**Step 5: Export data**
```
→ Click "Download Story (a3 Format)"
→ Get JSON file
→ Can load in a3.html viewer
→ Or share with collaborators
```

### Messaging in UI

Added hint box:
```
┌─────────────────────────────────────────┐
│ SHAREABLE ARTIFACT                      │
│                                         │
│ Switch to Title Sequence view above for │
│ a visual poster-style layout. Screenshot│
│ or print that view to share your film   │
│ visually. The downloaded Story JSON is  │
│ compatible with a3.html viewer.         │
└─────────────────────────────────────────┘
```

---

## 9. Technical Decisions

### ✅ What We're Doing

1. **Pure Data Export** (JSON only, no video encoding)
2. **Visual Artifact** (screenshot-friendly Title Sequence)
3. **a3.html Compatibility** (convert beats → selected[])
4. **Rich Metadata** (pass all fields: desc, quote, tags, color)
5. **3 Export Options** (simplified from 6+)
6. **Grouped Beat Display** (show structure visually)

### ❌ What We're NOT Doing

1. **Video Generation** (causes crashes)
2. **HTML File Export** (redundant, just screenshot)
3. **FFmpeg in Browser** (memory issues)
4. **Redundant Formats** (EDL, Shotlist, OTI deprecated)
5. **Share Links** (unreliable, just download JSON)

### 🔮 Future Possibilities

1. **Voronoi Mosaic** (D3.js tessellation)
2. **Poster Generation** (Canvas → PNG download)
3. **Social Cards** (Auto og:image generation)
4. **Import Story** (Load a3 JSON back into editor)
5. **Remix Mode** (Reorder clips after assembly)
6. **CLI Export Tool** (Node.js script: JSON → MP4 via ffmpeg)

---

## 10. Backwards Compatibility Matrix

| Feature | Matrix Editor | a3.html | Compatible? |
|---------|--------------|---------|-------------|
| `id` | ✓ (generated) | ✓ (required) | ✓ YES |
| `title` | ✓ | ✓ | ✓ YES |
| `category` | ✓ | ✓ | ✓ YES |
| `desc` | ✓ | ✓ | ✓ YES |
| `quote` | ✓ | ✓ | ✓ YES |
| `tags` | ✓ | ✓ | ✓ YES |
| `start` | ✓ | ✓ | ✓ YES |
| `end` | ✓ | ✓ | ✓ YES |
| `color` | ✓ | ✓ | ✓ YES |
| `beats[]` | ✓ | ✗ | → Flattened |
| `selected[]` | ✗ | ✓ | ← Converted |
| `gameplay` | ✓ | ✗ | → Preserved |

**Conversion Strategy:**
- Matrix exports: `beats[]` + `selected[]` (flattened) + `gameplay{}`
- a3.html reads: `selected[]` (ignores `gameplay`)
- No data loss: everything preserved in single JSON

---

## 11. File Manifest

### Core Files
1. `matrix-editor.html` - Main gameplay (passes rich data)
2. `matrix-final-screen.html` - Export screen (3 views, 3 exports)
3. `test-final-screen.html` - Testing tool (sample data)
4. `a3.html` - Story viewer (compatible format)

### Documentation
5. `BAUHAUS-FINAL-SCREEN.md` - Design philosophy
6. `EXPORT-STRATEGY.md` - This file (technical strategy)

### Data Format Examples
7. `story_example.json` - Sample export (a3 compatible)

---

## 12. Testing Checklist

### Test Workflow

1. **Load test data**
   ```bash
   open test-final-screen.html
   click "LOAD TEST FILM"
   ```

2. **Verify Title Sequence**
   - ✓ Beats grouped with headers
   - ✓ Shot numbers sequential
   - ✓ Descriptions visible
   - ✓ Categories shown
   - ✓ Click to play works

3. **Test Copy Shot List**
   - ✓ Copies to clipboard
   - ✓ Shows preview
   - ✓ Includes all fields
   - ✓ Formatted correctly

4. **Test Download Story**
   - ✓ Downloads JSON
   - ✓ Filename correct
   - ✓ Valid JSON syntax
   - ✓ Has `selected[]` array
   - ✓ Compatible with a3.html

5. **Load in a3.html**
   ```bash
   open a3.html
   # Load downloaded JSON
   # Verify clips display
   ```

---

## Summary

**Core Strategy:**
- NO video export (crashes avoided)
- YES visual artifact (Title Sequence screenshot)
- YES data export (a3.html compatible JSON)
- Simplified to 3 essential exports
- Rich metadata fully leveraged
- Beat structure visually displayed

**User Can Say:**
"I played my way into making a film" + screenshot of Title Sequence

**Technical Win:**
Backwards compatible with a3.html while preserving gameplay metadata for future reimport.

**Next Steps:**
1. Test complete workflow
2. Generate example JSON
3. Verify a3.html compatibility
4. Consider Voronoi mosaic for V2
