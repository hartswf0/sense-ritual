# MATRIX EDITOR EXPORT AUDIT — Complete Backend Infrastructure

**Date:** 2025-10-14  
**Auditor:** System Analysis

---

## 🎯 EXECUTIVE SUMMARY

Matrix Editor exports **5 file formats** simultaneously via client-side generation:

1. **OTI.JSON** — Narrative genome (sequences/clips/metadata)
2. **EDL** — Edit Decision List (Final Cut/Premiere import)
3. **STORYMAP.MD** — Hierarchical documentation with ekphrasis
4. **SHOTLIST.JS** — Code-based shot prompts for AI tools
5. **CHART.D3.JS** — D3.js visualization data

**Architecture:** 100% client-side, Blob URLs, no server, sequential downloads with delays.

---

## 📋 EXPORT SYSTEM FLOW

```javascript
function exportAllFormats() {
    exportFinalCutOTI();              // OTI JSON
    setTimeout(() => exportStorymap(), 500);
    setTimeout(() => exportShotlist(), 1000);
    setTimeout(() => exportChartD3(), 1500);
    showNarrative('NARRATIVE EXPORTED', game.color);
}
```

**Trigger:** User clicks button → 4 files download → Ready for prompt-lab.html

---

## 📄 FORMAT 1: OTI JSON

### Data Structure:
```json
{
  "version": "1.0",
  "title": "Film Title",
  "logline": "Description",
  "timestamp": "ISO 8601",
  "coherenceScore": 1450,
  "sourceVideo": "YouTube_ID",
  "sequences": [
    {
      "id": 1,
      "sequenceNumber": 1,
      "lane": 0,
      "wall": { "type": "stone", "col": 5, "health": 100 },
      "flagged": false,
      "rating": "up",
      "note": "Critical sequence",
      "clips": [
        {
          "clipNumber": 1,
          "clipId": "Fragment",
          "title": "Full Title",
          "category": "Technology",
          "icon": "📊",
          "sourceIn": 89,
          "sourceOut": 103,
          "duration": 14,
          "tags": ["tag1"],
          "description": "Desc"
        }
      ]
    }
  ],
  "metadata": {
    "totalSequences": 15,
    "totalClips": 55,
    "totalDuration": 450,
    "faction": "Name",
    "wave": 10,
    "kills": 25,
    "flaggedChains": 3,
    "upvotedChains": 8
  }
}
```

**Key Features:**
- Gameplay metadata (faction, wave, kills, score)
- Editorial flags (flagged, rating, tagged, notes)
- Wall system data from gameplay
- Complete timing + categorization

---

## 📄 FORMAT 2: EDL (CMX 3600)

```edl
TITLE: Final Cut Assembly
FCM: NON-DROP FRAME

* SEQUENCE 1
* NOTE: Opening sequence

001  001      V     C        00:01:29:00 00:01:43:00 00:00:00:00 00:00:14:00
* FROM CLIP: Godzilla Fear
* CATEGORY: Culture
```

**Purpose:** Import into Final Cut/Premiere/Avid  
**Features:** Timecode format, sequence grouping, metadata comments

---

## 📄 FORMAT 3: STORYMAP.MD

Hierarchical documentation: **Diegesis → Act → Beat → Syntagma → Shot**

```markdown
# Act 1: Setup

### Beat 1: Opening Image

#### Syntagma 1 (SY1)
**Type:** Bracket Syntagma (BS)

#### Shot 1 (SH1)
- **Content:** A high angle of godzilla fear. Camera slowly zooms in...
- **Angle:** High angle
- **Movement:** Slow zoom-in
- **Duration:** 14 seconds
- **Timecode:** 00:01:29 - 00:01:43
```

### Inferential Systems:

**Camera Angle (by category):**
```javascript
{
  "Technology": ["High angle", "Eye-level", "Dutch angle"],
  "Politics": ["Low angle", "Eye-level", "Over-shoulder"],
  "Culture": ["Eye-level", "Close-up", "Wide shot"],
  "Economics": ["Bird's eye", "Eye-level", "Low angle"]
}
```

**Camera Movement (by syntagma):**
```javascript
{
  "AS": ["Static hold", "Slow zoom-in"],
  "DS": ["Slow pan", "Crane shot"],
  "SC": ["Handheld", "Tracking"],
  "OS": ["Quick cut", "Whip pan"],
  "BS": ["Montage cut", "Rapid zoom"]
}
```

**Ekphrasis Generation:**
```javascript
"A {angle} of {title}. The camera {movement}, 
emphasizing {beatName}. Duration: {duration}s."
```

**Purpose:** Production bible for directors/DPs/editors

---

## 📄 FORMAT 4: SHOTLIST.JS

```javascript
// Shotlist for: Film Title
// Total shots: 55

const prompts = [
  // Shot 1 - Opening Image
  "A high angle of godzilla fear. Camera zooms in...",
  
  // Shot 2 - Opening Image
  "An eye-level of filter bubbles. Camera pans across...",
];

module.exports = prompts;
```

**Purpose:** AI video generation (Runway, Pika, Midjourney)  
**Usage:**
```javascript
const prompts = require('./shotlist.js');
prompts.forEach(async (p, i) => {
  const video = await runway.generate(p);
});
```

---

## 📄 FORMAT 5: CHART.D3.JS

```javascript
const data = {
  "name": "Diegesis",
  "children": [
    {
      "name": "Act 1: Setup",
      "children": [
        {
          "name": "Beat 1: Opening Image",
          "children": [
            {
              "name": "Syntagma: Bracket Syntagma",
              "children": [
                {
                  "name": "Shot 1",
                  "content": "Godzilla Fear",
                  "duration": 14,
                  "category": "Culture"
                }
              ]
            }
          ]
        }
      ]
    }
  ]
};
```

**Purpose:** D3.js tree/sunburst/treemap visualizations  
**Usage:** `d3.hierarchy(data)` → render narrative structure

---

## 🎬 FILM GENERATION (film-generator.js)

### Functions:

**1. `generateFilmHTML(otiData)`**
- Title card + act dividers + beat cards + YouTube iframes
- Auto-play, keyboard controls, responsive design

**2. `generateTextOnlyFilm(otiData)`**
- Pure text version (no videos)
- Geometric chain displays, narrative cards

**3. `generateFFmpegScript(otiData)`**
```bash
yt-dlp --download-sections "*89-103" -o "clip_001.mp4" "URL"
# ... all clips
ffmpeg -f concat -i concat.txt -c copy "final.mp4"
```

**4. `generateBeatNarrative(beatName, sequence)`**
```javascript
{
  "Opening Image": "Once upon a time in {clips}...",
  "Catalyst": "Then everything changed when {clip} arrived.",
  "All Is Lost": "The lowest point: {description}"
}
```

---

## 🔄 COMPLETE DATA FLOW

```
Matrix Editor → exportAllFormats() →
  ├─ OTI JSON downloaded
  ├─ EDL downloaded
  ├─ Storymap.md downloaded
  ├─ Shotlist.js downloaded
  └─ Chart.d3.js downloaded

User uploads OTI to prompt-lab.html →
  ├─ HTML Film (browser playback)
  ├─ FFmpeg Script (render MP4)
  ├─ Text Film (storyboard)
  └─ Storymap (documentation)
```

---

## 💾 SHARING MECHANISMS

**Current:** File-based downloads

**Available:**
- localStorage → window.open('prompt-lab.html')
- URL parameters with base64
- GitHub Gist integration
- WebSocket for real-time collab

---

## 🎯 PARITY PLAN: All Tools Should Export

### **Minimum (MVP):**
- ✅ OTI JSON (sequences/clips/timing)
- ✅ "Export to Prompt Lab" button

### **Standard:**
- ✅ Full OTI JSON + metadata
- ✅ EDL for NLE
- ✅ Beat/syntagma structure

### **Advanced (Full Parity):**
- ✅ All 5 formats
- ✅ Camera inference
- ✅ Ekphrasis generation
- ✅ FFmpeg script

---

## 🛠️ IMPLEMENTATION ROADMAP

### **Priority 1: Production Tools**
1. ⬜ Garden Editor — Add full 5-file export
2. ⬜ Matrix Editor — Verify complete

### **Priority 2: Best Experimental**
3. ⬜ Narrative Meshwork Organic — OTI + Storymap
4. ⬜ Meshwork 725 — State capture
5. ⬜ M-Crusher-09 — Flow recording

### **Priority 3: Remaining**
6-9. ⬜ Other crushers/meshworks

### **Priority 4: Enhanced Generation**
10. ⬜ Tool-specific ekphrasis templates
11. ⬜ Prompt-lab multi-tool UI
12. ⬜ Cross-tool remixing

---

## 📊 CAPABILITY MATRIX

| Feature | Matrix | Garden | Others | Target |
|---------|--------|--------|--------|--------|
| OTI JSON | ✅ | ⚠️ | ❌ | ✅ |
| EDL | ✅ | ⚠️ | ❌ | ✅ |
| Storymap | ✅ | ❌ | ❌ | ✅ |
| Shotlist | ✅ | ❌ | ❌ | ✅ |
| Chart.d3 | ✅ | ❌ | ❌ | ✅ |
| Ekphrasis | ✅ | ❌ | ❌ | ✅ |
| Camera AI | ✅ | ❌ | ❌ | ✅ |
| Prompt-Lab | ✅ | ⚠️ | ❌ | ✅ |
| FFmpeg | ✅ | ❌ | ❌ | ✅ |

---

## 💡 KEY INSIGHTS

**What Makes Matrix Export Powerful:**
1. **5 complementary formats** — Not just one export
2. **Inferential intelligence** — Camera angles/movements auto-generated
3. **Narrative generation** — Beat descriptions auto-created
4. **Professional outputs** — EDL, Storymap, FFmpeg all industry-standard
5. **AI-ready** — Shotlist.js designed for automation pipelines

**Why All Tools Need This:**
- Unified output = interchangeable authoring modes
- Each tool's procedural rhetoric preserved in metadata
- All paths lead to film generation
- Cross-tool remixing becomes possible

---

## 🚀 NEXT STEPS

1. **Read `oti-export.js`** — Universal library ready
2. **Implement Priority 1-2** — Add to top 5 tools
3. **Test full pipeline** — Tool → OTI → Prompt Lab → Film
4. **Document procedural rhetoric** — Each tool's unique export metadata

**The Vision:** Every game becomes a valid filmmaking interface. Export unifies them all.
