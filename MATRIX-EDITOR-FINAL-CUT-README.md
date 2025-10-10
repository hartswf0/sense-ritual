# Matrix Editor - Final Cut System

## Overview

The Matrix Editor now features a fully functional **Final Cut Screen** that opens when you click "Assemble Final Cut" after collecting 12+ clips across your chains.

## What's New

### 1. **Mobile-Optimized Film Viewer** (`matrix-final-screen.html`)
   - **Film Player**: Watch your assembled documentary with autoplay
   - **Beat Sheet Visualization**: Visual grid showing all beats and clips
   - **Easy Navigation**: Click any clip to play it immediately
   - **Responsive Design**: Works perfectly on mobile and desktop

### 2. **Export Options**

#### Download Options:
- **📦 OTI.JSON** - Production-ready film data for further editing
- **📝 STORYMAP.MD** - Markdown script with shot descriptions
- **🎥 SHOTLIST.JS** - JavaScript array of all shots
- **⚙️ EDL** - Edit Decision List for video editing software

#### Copy-to-Clipboard:
- **📋 COPY PROMPTS** - All shot descriptions with timecodes
- **📋 COPY JSON** - Raw JSON data for pasting into other tools

### 3. **Film Player Features**

- **▶ PLAY FILM** - Autoplay all clips consecutively
- **⏹ STOP** - Stop playback
- **⏮ PREV** / **⏭ NEXT** - Manual navigation
- **Click Clips** - Jump to any specific clip in the beat sheet

### 4. **Live Score Breakdown**

Displays your narrative coherence score with breakdown:
- Base Score
- Shared Clips count
- Chain Connections
- Dominant Theme percentage

## How to Use

### From Matrix Editor:

1. **Play the game** and collect clips across different lanes
2. **Form chains** by getting 3+ clips in a lane
3. **Collect 12+ total clips** across all chains
4. Click **"ASSEMBLE FINAL CUT"** button
5. New window opens with your film ready to view and export

### Testing Without Playing:

1. Open `test-final-screen.html` in your browser
2. Click **"LOAD TEST FILM"** for a small 3-beat example
3. Click **"LOAD LARGE FILM"** for a complete 15-beat film
4. This loads sample data and opens the final screen

### Direct Access:

1. Open `matrix-final-screen.html` directly
2. It will load any saved film from localStorage
3. If none exists, shows sample film data

## File Structure

```
matrix-editor.html              # Main game (updated to save & open final screen)
matrix-final-screen.html        # New standalone film viewer & exporter
test-final-screen.html          # Testing tool with sample data
```

## Mobile Considerations

### Optimized for Mobile:
- ✅ Smooth scrolling with `-webkit-overflow-scrolling: touch`
- ✅ Horizontal clip scrolling in beat lanes
- ✅ Responsive grid layouts (2 columns on small screens)
- ✅ Large touch targets for buttons
- ✅ Copy-to-clipboard works on mobile
- ✅ Full-width export buttons on mobile
- ✅ Sticky header with score

### Known Issues:
- YouTube autoplay may require user interaction on some mobile browsers
- iOS Safari may block popups - use "PLAY FILM" button after window opens

## Export Format Examples

### OTI.JSON Structure:
```json
{
  "version": "1.0",
  "title": "Your Film Title",
  "logline": "Brief description",
  "coherenceScore": 1450,
  "sourceVideo": "BQ2n6SN7gOY",
  "sequences": [...],
  "metadata": {...}
}
```

### STORYMAP.MD Structure:
```markdown
# Your Film Title

Brief description

---

## Beat 1: Opening Image

**Syntagma:** DS

### Shot 1

- **Content:** Family of Man
- **Duration:** 26s
- **Timecode:** 00:00:00:27 - 00:00:00:53
```

### PROMPTS (Copy to Clipboard):
```
Shot 1: Family of Man (26s) from Opening Image
Timecode: 00:00:00:27 - 00:00:00:53

Shot 2: Individual Self (11s) from Opening Image
Timecode: 00:00:01:07 - 00:00:01:18
```

## Technical Details

### localStorage Key:
- `matrixEditorFilm` - Stores complete film data

### Data Structure:
```javascript
{
  score: Number,
  stats: {
    base: Number,
    sharedClips: Number,
    connections: Number,
    dominantCategory: String,
    dominance: Number (percentage)
  },
  beats: Array[{
    name: String,
    syntagma: String,
    clips: Array[{
      icon: String,
      title: String,
      duration: Number,
      start: Number,
      end: Number,
      category: String,
      desc: String
    }]
  }],
  metadata: {
    totalBeats: Number,
    totalShots: Number,
    totalDuration: Number
  }
}
```

### YouTube Embed:
- Uses `youtube-nocookie.com` for privacy
- Autoplay enabled for film playback
- Start/end times set per clip
- 1.5s buffer between clips for transitions

## Inspired By

- **class-analysis.html** - Visual lane/grid layout
- **prompt-lab.html** - Export options & copy-to-clipboard
- **Modern mobile UX** - Touch-friendly, smooth scrolling

## Future Enhancements

Potential additions:
- **Export to Video** - Generate actual video file
- **Share Links** - Generate shareable URLs
- **Thumbnail Preview** - Show video thumbnails in beat sheet
- **Edit Mode** - Reorder clips after assembly
- **Audio Visualization** - Waveforms or VU meters
- **Collaboration** - Share films with others
- **AI Analysis** - Get AI feedback on narrative coherence

## Troubleshooting

### Final screen doesn't open?
- Check if popup blocker is enabled
- Look for browser notification to allow popups
- Manually open `matrix-final-screen.html`

### No film data showing?
- Data is stored in localStorage
- Clear browser cache may erase saved films
- Use "Download OTI.JSON" to keep permanent copies

### Videos won't autoplay?
- Some browsers require user interaction first
- Click "PLAY FILM" button manually
- Check browser autoplay policies

### Copy-to-clipboard not working?
- Requires HTTPS or localhost
- Check browser permissions
- Preview boxes show content regardless

## Credits

Built for the Matrix Editor game/film assembly system. 
Uses Adam Curtis's "Can't Get You Out of My Head" as source material.
Designed for creative documentary remixing and narrative exploration.
