# TIMING PLAN — Filter Bubbles Cinematic Edition

## 📊 COMPONENT BREAKDOWN

### **Total Film Duration:** 238 seconds (3:58)

---

## 🎬 CLIP-BY-CLIP TIMING

Generated from OTI JSON - all 46 clips with exact durations:

```python
import json
with open('filter-bubbles-documentary.oti.json', 'r') as f:
    oti = json.load(f)

total_time = 0
for seq in oti['sequences']:
    print(f"\n### BEAT {seq['beatNumber']}: {seq['beatName']}")
    beat_duration = 0
    for i, clip in enumerate(seq['clips'], 1):
        clip_start = total_time
        clip_end = total_time + clip['duration']
        beat_duration += clip['duration']
        total_time = clip_end
        
        print(f"Clip {i}: {clip['title']}")
        print(f"  Duration: {clip['duration']}s")
        print(f"  Timeline: {clip_start}s → {clip_end}s")
        print(f"  Quote: \"{clip['quote'][:50]}...\"")
        print(f"  TTS file: narration_{str(seq['beatNumber']-1).zfill(2)}_{str(i-1).zfill(2)}.aiff")
        print()
    
    print(f"  BEAT TOTAL: {beat_duration}s")
```

---

## 🎙️ TTS TIMING REQUIREMENTS

**Problem:** TTS narration might not match clip duration exactly

**Solutions:**
1. **Speed adjustment:** Adjust TTS rate to fit duration
2. **Fade out:** If TTS is shorter, fade naturally
3. **Extend clip:** If TTS is critical, extend video slightly

**Test approach:**
```bash
# 1. Generate ONE TTS sample
say -v Alex -r 150 "Test quote here" -o test.aiff

# 2. Check duration
ffprobe -v error -show_entries format=duration test.aiff

# 3. Compare to target clip duration
# 4. Adjust rate (-r parameter) if needed
```

---

## 🎵 MUSIC TIMING BY BEAT

Each beat needs its own ambient soundscape:

| Beat | Name | Duration | Start | End | Sonic Texture |
|------|------|----------|-------|-----|---------------|
| 1 | Opening Image | 33s | 0:00 | 0:33 | Drone |
| 2 | Theme Stated | 22s | 0:33 | 0:55 | Shimmer |
| 3 | Set-Up | 31s | 0:55 | 1:26 | Pulse |
| 4 | Catalyst | 24s | 1:26 | 1:50 | Tension |
| 5 | Debate | 17s | 1:50 | 2:07 | Debate |
| 6 | Break into Two | 44s | 2:07 | 2:51 | Transition |
| 7 | B Story | 34s | 2:51 | 3:25 | Narrative |
| 8 | Fun and Games | 38s | 3:25 | 4:03 | Playful |
| 9 | Midpoint | 29s | 4:03 | 4:32 | Peak |
| 10 | Bad Guys Close In | 44s | 4:32 | 5:16 | Dark |
| 11 | All Is Lost | 30s | 5:16 | 5:46 | Despair |
| 12 | Dark Night | 24s | 5:46 | 6:10 | Abyss |
| 13 | Break into Three | 51s | 6:10 | 7:01 | Resolve |
| 14 | Finale | 30s | 7:01 | 7:31 | Climax |
| 15 | Final Image | 21s | 7:31 | 7:52 | Resolution |

**TOTAL:** 472s (7:52) — Wait, this doesn't match!

---

## ⚠️ TIMING DISCREPANCY DISCOVERED

- **OTI metadata says:** 466s (7:46)
- **Actual beat durations:** Need to recalculate from actual clips
- **Must verify:** Sum of all clip durations

---

## 🏗️ MODULAR BUILD APPROACH

### **Phase 1: Generate TTS (Test First!)**
```bash
# Test single clip
./1_generate_tts_test.sh

# Generate all if test passes
./1_generate_tts_all.sh
```

### **Phase 2: Generate Music (Test First!)**
```bash
# Test single beat
./2_generate_music_test.sh

# Generate all beats
./2_generate_music_all.sh
```

### **Phase 3: Process Videos**
```bash
# Test single clip with overlays
./3_process_video_test.sh

# Process all clips
./3_process_video_all.sh
```

### **Phase 4: Sync Check**
```bash
# Verify all timings match
./4_verify_timing.sh
```

### **Phase 5: Final Assembly**
```bash
# Concatenate everything
./5_assemble_final.sh
```

---

## 🎯 NEXT STEPS

1. **Calculate exact timings** from OTI JSON
2. **Test TTS generation** for one clip
3. **Verify TTS duration** matches clip
4. **Adjust rates** if needed
5. **Generate all TTS** files
6. **Test music generation** for one beat
7. **Generate all music**
8. **Build modular assembly pipeline**
