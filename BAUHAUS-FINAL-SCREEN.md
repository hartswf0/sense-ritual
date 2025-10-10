# Matrix Editor - Bauhaus Minimal Film Presentation

## Design Philosophy: Less is More

**Bauhaus Principles Applied:**
- Form follows function
- No decorative elements (removed all emojis)
- Grid-based layouts
- Typography hierarchy
- Functional minimalism
- What you see is what you get

---

## Key Changes

### 1. Score Moved to Top
```
OLD: Hidden in collapsed section
NEW: Prominent in hero section
```

**Visibility:**
- Large numerical score display
- Immediate breakdown (Base, Shared, Links, Category %)
- No need to expand sections

### 2. No Emojis - Pure Typography
```
OLD: 🎬 WATCH FILM
NEW: VIEW FILM
```

**Cleaner interface:**
- Uppercase text for hierarchy
- Letter spacing for emphasis
- No visual clutter

### 3. Three Viewing Modes

#### **LINEAR**
- Traditional single-player film viewing
- Beat-organized timeline below
- Click any clip card to jump to it
- Sequential playback

#### **MOSAIC**
- All clips displayed simultaneously in grid
- Hover to see title and duration
- Click any clip to watch in linear view
- Visual overview of entire film

#### **TITLE SEQUENCE**
- Animated card presentation
- Icon + Title + Beat name
- Click any card to watch that clip
- Cinematic opening credits style

### 4. Simplified Exports (3 Core Functions)

**Removed:**
- ❌ Share Link (redundant)
- ❌ Copy JSON (developer-only)
- ❌ Download EDL (niche format)
- ❌ Download Shotlist JS (redundant)

**Kept:**
- ✓ **Copy Shot List** - Complete formatted text with all metadata
- ✓ **Download Script** - Markdown screenplay format
- ✓ **Download Data** - Full OTI.JSON with stats

### 5. Enhanced Copy Shot List

**Now includes:**
```
Title
Logline
============================================================

BEAT 1: OPENING IMAGE
Syntagma: DS
------------------------------------------------------------

Shot 1: Family of Man
  Icon: ◯
  Duration: 26s
  Timecode: 00:00:00:27 → 00:00:00:53
  Category: Media Apparatus
  Description: [if available]

[... continues for all shots ...]

============================================================
Total: 44 shots · 3:42
Coherence Score: 1450
```

---

## Layout Structure

```
┌─────────────────────────────────────────┐
│ [Back]                                  │
│                                         │
│ FILM TITLE                              │
│ Logline text here                       │
│ 3 beats · 44 shots · 3:42              │
│                                         │
│ ┌─────────────────────────────────────┐ │
│ │        1450                         │ │
│ │   Narrative Coherence               │ │
│ │  450   4      3      68%           │ │
│ │  Base  Shared Links  Category      │ │
│ └─────────────────────────────────────┘ │
└─────────────────────────────────────────┘
┌─────────────────────────────────────────┐
│ VIEW FILM                               │
│ ┌────────┬────────┬────────────────┐   │
│ │ LINEAR │ MOSAIC │ TITLE SEQUENCE │   │
│ └────────┴────────┴────────────────┘   │
│                                         │
│ [View Content Here]                     │
└─────────────────────────────────────────┘
┌─────────────────────────────────────────┐
│ EXPORT                                  │
│ ┌────────────┬────────────┬──────────┐ │
│ │ Copy Shot  │ Download   │ Download │ │
│ │ List       │ Script     │ Data     │ │
│ └────────────┴────────────┴──────────┘ │
└─────────────────────────────────────────┘
```

---

## Mosaic View Details

**Grid Layout:**
- Responsive columns (min 250px)
- 2px gaps for visual separation
- 16:9 aspect ratio per tile
- Muted autoplay preview in each tile

**Interaction:**
- Hover reveals overlay with title/duration
- Click switches to linear view and plays
- Sequential numbering (1, 2, 3...)
- Color-coded by faction

**Use Case:**
- Quick visual scan of entire film
- Jump to specific moments
- Compare visual composition
- Overview before watching

---

## Title Sequence View

**Animated Entry:**
- Staggered fade-in (0.1s delay per card)
- Grid of cards showing icon + title
- Clean borders with faction colors
- Beat name subtitle

**Interaction:**
- Click any card to play that clip
- Cinematic presentation style
- Graphical export potential
- Shareable as static images

**Use Case:**
- Opening credits aesthetic
- Visual film poster
- Social media sharing
- Graphic design reference

---

## Typography

```css
Film Title:  28-48px, 700 weight, -0.5px spacing
Logline:     13-16px, opacity 0.6
Meta:        11-13px, Courier New, opacity 0.5
Score:       48-96px, 900 weight
Section:     14-18px, uppercase, 700 weight
Body:        11-14px, regular
```

**Hierarchy:**
1. Score (largest)
2. Film Title
3. Section Titles
4. Content
5. Metadata

---

## Color System

**Base:**
- Background: #000 (pure black)
- Text: #fff (pure white)
- Borders: #333 (dark grey)
- Dividers: #222 (darker grey)

**Faction Colors:**
- Universalists: #4A90E2 (blue)
- Deconstructors: #E24A4A (red)
- Algorithm Advocates: #FFD700 (gold)

**Applied To:**
- Score display border
- Beat lane borders
- Mosaic tile borders
- Title card borders
- Button hover states

---

## Mobile Optimization

**Touch Targets:**
- Minimum 44px for all buttons
- Large tab buttons for mode switching
- Scrollable clip timelines
- Pinch-zoom friendly mosaic

**Performance:**
- Lazy-load iframes in mosaic
- Muted autoplay to save bandwidth
- Collapsible sections removed
- Everything visible at once

**Gestures:**
- Horizontal swipe through clips
- Tap to play
- Native browser controls

---

## Export Format Comparison

### Copy Shot List (Text)
```
Plain text
Easy to paste anywhere
Includes all metadata
Good for AI prompts
Ready for sharing
```

### Download Script (Markdown)
```
# Formatted heading structure
**Bold labels**
- Bullet points
Readable in any text editor
Good for documentation
```

### Download Data (JSON)
```json
{
  "structured": true,
  "programmatic": "use",
  "stats": "included",
  "format": "OTI standard"
}
```

---

## What Makes It Bauhaus

1. **Functional Form** - Every element serves a purpose
2. **Grid System** - Structured layouts, no arbitrary placement
3. **Typography Focus** - Text hierarchy over decoration
4. **Primary Shapes** - Rectangles, squares, circles
5. **Minimal Color** - Black, white, one accent color
6. **No Ornamentation** - No emojis, icons, or decoration
7. **Clarity** - Information architecture is obvious
8. **Honest Materials** - Shows what it is, no fake depth

---

## Technical Implementation

### View Switching
```javascript
function switchView(mode) {
  // Update tab buttons
  document.querySelectorAll('.view-mode-btn')
    .forEach(btn => btn.classList.remove('active'));
  event.target.classList.add('active');
  
  // Switch content
  document.querySelectorAll('.view-content')
    .forEach(v => v.classList.remove('active'));
  document.getElementById(mode + 'View')
    .classList.add('active');
}
```

### Mosaic Rendering
```javascript
function renderMosaicView() {
  const mosaicHTML = allClips.map((clip, idx) => `
    <div class="mosaic-item" onclick="playClipDirect(${idx})">
      <div class="mosaic-number">${idx + 1}</div>
      <iframe src="..." frameborder="0"></iframe>
      <div class="mosaic-overlay">
        <div class="mosaic-title">${clip.title}</div>
        <div class="mosaic-duration">${clip.duration}s</div>
      </div>
    </div>
  `).join('');
}
```

### Enhanced Copy
```javascript
function copyPrompts() {
  let shotList = `${filmData.title}\n`;
  // ... builds complete formatted list
  // Includes: icon, duration, timecode, category, description
  
  navigator.clipboard.writeText(shotList);
  // Shows preview in code block
}
```

---

## Before/After

### Before (V1):
- Cluttered with emojis
- Score hidden in collapsed section
- Too many export options (6+)
- Only linear viewing
- Confusing navigation
- Mobile unfriendly

### After (V2 Bauhaus):
- Clean typography only
- Score prominent at top
- 3 essential exports
- 3 viewing modes
- Clear navigation
- Mobile-first

---

## Use Cases

### For Filmmakers:
- **Linear**: Watch rough cut
- **Mosaic**: Visual continuity check
- **Title**: Export for poster

### For Writers:
- **Copy Shot List**: All details for AI prompts
- **Download Script**: Readable screenplay

### For Developers:
- **Download Data**: Full JSON with stats

### For Sharing:
- **Title Sequence**: Screenshot for social media
- **Mosaic**: Overview image
- **Script**: Send to collaborators

---

## Performance

**Load Time:**
- Initial: <1s (no heavy assets)
- Mosaic: Lazy loads as needed
- Title: Instant (text only)

**Memory:**
- Linear: 1 iframe
- Mosaic: N iframes (muted, paused)
- Title: 0 iframes

**Mobile Data:**
- Muted previews save bandwidth
- User initiates playback
- No auto-downloading

---

## Future Enhancements

**Graphic Exports:**
- Export title sequence as PNG grid
- Generate poster from cards
- Create social media cards

**Advanced Mosaic:**
- Group by beat (colored sections)
- Resize tiles by duration
- Synchronized playback option

**Collaboration:**
- Share URL with film data
- Embed code for websites
- Export to video editing software

---

## Summary

The new Bauhaus design transforms the film presentation from a cluttered tool interface into a **minimal, functional, and beautiful** movie viewing experience.

**Core Principles:**
- What you see is what you get
- Form follows function
- Less is more

**Key Features:**
- Score at top (always visible)
- 3 viewing modes (linear, mosaic, title)
- 3 export options (copy, script, data)
- Enhanced shot list with all metadata
- No emojis, pure typography
- Mobile-optimized
- Grid-based layouts

**Result:** A professional film presentation tool that respects Bauhaus minimalism while maximizing functionality.
