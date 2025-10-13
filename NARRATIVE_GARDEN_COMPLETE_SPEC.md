# NARRATIVE GARDEN COMPLETE — Implementation Spec

## Goal

Combine ALL narrative garden features + actual video + cellular automata into one complete system where:
1. Match-3 cells show actual video textures
2. Cellular automata creates organic patterns
3. Collecting beats unlocks video segments
4. Collected segments can be watched as a complete film
5. Full narrative structure (15 beats, syntagmas, acts, clips, timeline)

---

## Required Features

### ✅ From v0.1-v0.5
- [x] 15-beat collection
- [x] Syntagma selection
- [x] Act structure visualization
- [x] Timeline view
- [x] Export (Storymap, EDL, JSON, Shotlist)

### ➕ NEW Features
- [ ] Video textures in match-3 cells (10 video types)
- [ ] Cellular automata rules (from m-crusher-08/09)
- [ ] Video segment unlocking system
- [ ] Film player panel
- [ ] Sequential film playback
- [ ] Export actual video sequence

---

## Technical Architecture

### Video System
```javascript
const VIDEO_TYPES = [
  {file: 'MEDIA/video_0443d3f46b1f433597e8d9d89469cad8.mp4', title: 'Red'},
  {file: 'MEDIA/video_06ac4003fedc438588cf48eb594c8f22.mp4', title: 'Cyan'},
  // ... 10 total
];

game.videos = {}; // Loaded video elements
game.collectedSegments = []; // Beat + video file mapping
```

### Cell Structure
```javascript
grid[r][c] = {
  type: 0-9, // Video type
  state: 'stable'|'matching'|'bursting',
  timer: 0,
  video: HTMLVideoElement
}
```

### Cellular Automata Rules
1. **Propagation:** Cells adopt dominant neighbor type
2. **Bursting:** Matched cells explode and reset
3. **Decay:** Inactive cells fade
4. **Flow:** Perlin noise displacement (optional)

### Film System
```javascript
collectedSegments = [
  {
    beatId: 1,
    beatName: 'Opening Image',
    syntagma: 'DS',
    videoFile: 'MEDIA/video_xxx.mp4',
    startTime: 0,
    duration: 10
  },
  // ... 15 segments
]
```

**Playback:**
- Sequential auto-play through all segments
- Timeline scrubber
- Click segment to jump
- Export concatenated sequence

---

## UI Layout

```
┌─────────────────────────────────────────────────┐
│ HEADER: Stats (Beats, Segments, Score, Moves)  │
├────────┬──────────────────────┬─────────────────┤
│ FILM   │                      │ STRUCTURE       │
│ PLAYER │   MATCH-3 CANVAS     │ Act 1: 0/5      │
│ • Vid  │   (Video Textures)   │ Act 2A: 0/5     │
│ • List │                      │ Act 2B: 0/2     │
│ • Ctrl │                      │ Act 3: 0/3      │
├────────┴──────────────────────┴─────────────────┤
│ TOOLBAR: Restart | Watch Film | Export          │
└─────────────────────────────────────────────────┘
```

---

## Implementation Steps

### Phase 1: Video Integration (PRIORITY)
1. Load 10 video files as textures
2. Draw video frames in canvas cells
3. Loop videos continuously
4. Handle video ready states

### Phase 2: Cellular Automata
1. Add cell state machine
2. Implement propagation rules
3. Add bursting animations
4. Optional: Flow field displacement

### Phase 3: Segment Collection
1. Map beat → video segment
2. Store collected segments
3. Update film player UI
4. Add segment list

### Phase 4: Film Playback
1. Sequential video player
2. Segment navigation
3. Timeline visualization
4. Play/pause controls

### Phase 5: Export
1. Generate segment list JSON
2. Export EDL with actual timecodes
3. Create concatenation script
4. Optional: Server-side video merge

---

## Code Changes Required

### 1. Video Loading
```javascript
function loadVideos() {
  VIDEO_TYPES.forEach((vid, idx) => {
    const v = document.createElement('video');
    v.src = vid.file;
    v.muted = true;
    v.loop = true;
    v.playsinline = true;
    v.preload = 'auto';
    v.addEventListener('loadeddata', () => v.play());
    v.load();
    game.videos[idx] = v;
  });
}
```

### 2. Draw Video Cells
```javascript
function draw() {
  for (let r = 0; r < GRID_SIZE; r++) {
    for (let c = 0; c < GRID_SIZE; c++) {
      const cell = game.grid[r][c];
      const video = game.videos[cell.type];
      
      if (video && video.readyState >= 2) {
        ctx.drawImage(video, x, y, CELL_SIZE, CELL_SIZE);
      }
    }
  }
}
```

### 3. Collect Segments
```javascript
function selectSyntagma(code) {
  const beat = BEATS[game.pendingBeatId - 1];
  const videoType = Math.floor(Math.random() * 10);
  
  const segment = {
    beatId: game.pendingBeatId,
    beatName: beat.name,
    syntagma: code,
    videoFile: VIDEO_TYPES[videoType].file,
    startTime: 0,
    duration: 10
  };
  
  game.collectedSegments.push(segment);
  updateFilmPlayer();
}
```

### 4. Play Film
```javascript
function playAllSegments() {
  const player = document.getElementById('filmPlayer');
  let currentIndex = 0;
  
  function playNext() {
    if (currentIndex >= game.collectedSegments.length) return;
    const seg = game.collectedSegments[currentIndex];
    player.src = seg.videoFile;
    player.currentTime = seg.startTime;
    player.play();
    player.onended = () => {
      currentIndex++;
      playNext();
    };
  }
  
  playNext();
}
```

---

## File Structure

**Create:**
- `narrative-garden-complete.html` — Full implementation
- `NARRATIVE_GARDEN_COMPLETE_SPEC.md` — This document

**Update:**
- `ritual-garden-index.html` — Add complete version
- `aaa.html` — Add complete version link

---

## Testing Checklist

- [ ] All 10 videos load and play
- [ ] Video textures visible in cells
- [ ] Match-3 mechanics work with videos
- [ ] Cellular automata creates patterns
- [ ] Beat collection triggers syntagma selection
- [ ] Segments added to film player
- [ ] Film plays sequentially
- [ ] All 15 beats collectible
- [ ] Export generates valid files
- [ ] Mobile responsive

---

## Performance Notes

**Video Loading:**
- 10 videos × ~5MB = ~50MB total
- Use `preload="metadata"` initially
- Load full video on first use
- Consider video compression

**Canvas Performance:**
- Drawing 64 video frames per frame = heavy
- Consider requestVideoFrameCallback API
- Throttle cellular automata updates
- Use OffscreenCanvas for video processing

**Memory:**
- 10 simultaneous video elements = ~500MB RAM
- Release videos when not in view
- Implement video pooling

---

## Future Enhancements

1. **Video Segments** — Each video pre-segmented into 4 parts
2. **Smart Selection** — AI suggests best video per beat
3. **Transitions** — Crossfades between segments
4. **Sound Design** — Procedural audio on matches
5. **Haptic Feedback** — Mobile vibration patterns
6. **Multiplayer** — Collaborative film building
7. **Server Export** — Cloud-side video concatenation

---

## Why This Is The Magnum Opus

This combines:
- **Ritual Garden** mechanics (video, automata, emergence)
- **Narrative Garden** structure (beats, syntagmas, acts)
- **Matrix-Editor** framework (15 beats, 8 syntagmas, exports)
- **Actual filmmaking** (real videos, playable sequences)

**Result:** The first match-3 game that actually makes films.

---

*Implementation Priority: Video Integration → Cellular Automata → Film Playback → Export*
