# DUAL VIDEO SUPPORT — YouTube + Local Files

**Updated:** 2025-10-14  
**Feature:** Prompt Lab now supports BOTH video source types!

---

## 🎯 SUPPORTED FORMATS

### **Format 1: Local Video Files**
```json
{
  "clipId": "filter-bubble-isolation",
  "title": "Filter Bubbles",
  "duration": 20,
  "videoFile": "NICK/Filter_Bubbles_documentary_opening_image_icon__algorithms_iso_be430d70-6919-4ac3-a009-45c1ea3eff22_3.mp4",
  "sourceIn": 0,
  "sourceOut": 20
}
```

**Use when:**
- Videos are stored locally (e.g., NICK/ directory)
- Working offline
- Pushing to GitHub with video files
- AI-generated clips

---

### **Format 2: YouTube Videos**
```json
{
  "clipId": "curtis-intro",
  "title": "Adam Curtis Introduction",
  "duration": 30,
  "youtubeId": "BQ2n6SN7gOY",
  "sourceIn": 0,
  "sourceOut": 30
}
```

**Use when:**
- Source is YouTube documentary
- Working with timecode references
- Sharing projects without large files
- Archival footage

---

## 🔄 AUTO-DETECTION LOGIC

Prompt Lab automatically detects which format each clip uses:

```javascript
if (clip.youtubeId) {
  // Use YouTube workflow
  // - Download with yt-dlp
  // - Embed with YouTube iframe
  // - Extract timecode segment
} else if (clip.videoFile) {
  // Use local file workflow
  // - Reference local path
  // - Embed with <video> tag
  // - Trim from local file
}
```

---

## 📄 HTML PREVIEW OUTPUT

### **YouTube Clips:**
```html
<iframe 
  src="https://www.youtube.com/embed/BQ2n6SN7gOY?start=0&end=30" 
  frameborder="0" 
  allowfullscreen>
</iframe>
```

### **Local Clips:**
```html
<video controls>
  <source src="NICK/Filter_Bubbles_...3.mp4" type="video/mp4">
</video>
```

---

## 🎬 FFMPEG SCRIPT OUTPUT

### **YouTube Workflow:**
```bash
# Download from YouTube (once per video)
if [ ! -f "$TEMP_DIR/youtube_BQ2n6SN7gOY_raw.mp4" ]; then
  yt-dlp -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' \
    -o "$TEMP_DIR/youtube_BQ2n6SN7gOY_raw.mp4" \
    "https://www.youtube.com/watch?v=BQ2n6SN7gOY"
fi

# Trim clip from downloaded video
ffmpeg -i "$TEMP_DIR/youtube_BQ2n6SN7gOY_raw.mp4" \
  -ss 0 \
  -t 30 \
  -c:v libx264 -preset fast -crf 22 \
  -c:a aac -b:a 128k \
  -y $TEMP_DIR/clip_000.mp4
```

### **Local File Workflow:**
```bash
# Trim local video file (no download needed)
ffmpeg -i "NICK/Filter_Bubbles_...3.mp4" \
  -ss 0 \
  -t 20 \
  -c:v libx264 -preset fast -crf 22 \
  -c:a aac -b:a 128k \
  -y $TEMP_DIR/clip_000.mp4
```

---

## 💡 MIXED PROJECTS

You can **mix both formats** in the same documentary!

**Example OTI.json:**
```json
{
  "sequences": [
    {
      "beatNumber": 1,
      "beatName": "Opening Image",
      "clips": [
        {
          "title": "Local AI-generated intro",
          "videoFile": "NICK/intro.mp4",
          "duration": 10
        },
        {
          "title": "Curtis documentary clip",
          "youtubeId": "BQ2n6SN7gOY",
          "sourceIn": 30,
          "sourceOut": 50,
          "duration": 20
        },
        {
          "title": "Local outro",
          "videoFile": "NICK/outro.mp4",
          "duration": 5
        }
      ]
    }
  ]
}
```

The FFmpeg script will:
1. Download YouTube video once (cached)
2. Process local intro (direct)
3. Trim YouTube segment
4. Process local outro (direct)
5. Concatenate all clips into final film

---

## 🚀 BENEFITS

### **Local Videos:**
- ✅ Work offline
- ✅ No copyright issues
- ✅ Custom AI-generated content
- ✅ Full control over assets
- ✅ Fast processing (no download)

### **YouTube Videos:**
- ✅ Reference existing documentaries
- ✅ Smaller OTI JSON files
- ✅ Easy sharing (no large files)
- ✅ Archival access
- ✅ Timecode precision

### **Mixed Approach:**
- ✅ Best of both worlds
- ✅ Remix archive + original content
- ✅ Educational fair use
- ✅ Citation through source links

---

## 📊 DEPENDENCIES

### **For Local Videos:**
- **Required:** `ffmpeg`
- **Optional:** None

### **For YouTube Videos:**
- **Required:** `ffmpeg`, `yt-dlp`
- **Install:** `pip install yt-dlp`

### **For Mixed Projects:**
- **Required:** `ffmpeg`, `yt-dlp`

---

## 🎯 USE CASES

### **All Local (Your Current Project):**
```
Filter Bubbles Documentary
├── OTI JSON: 45 clips → NICK/*.mp4
├── Processing: Direct ffmpeg trim
└── Output: Pure local assembly
```

### **All YouTube:**
```
Curtis Documentary Remix
├── OTI JSON: 30 clips → youtubeId
├── Processing: yt-dlp download + trim
└── Output: Archival remix
```

### **Hybrid:**
```
Critical Documentary
├── OTI JSON:
│   ├── 20 clips → NICK/*.mp4 (AI voiceover)
│   ├── 15 clips → youtubeId (Curtis archive)
│   └── 10 clips → NICK/*.mp4 (custom B-roll)
└── Output: Original + archival synthesis
```

---

## ✨ AUTOMATIC SMART DETECTION

Prompt Lab inspects each clip and automatically:
1. Detects video source type
2. Generates appropriate HTML embed
3. Generates appropriate FFmpeg commands
4. Shows correct metadata in text export
5. Validates dependencies needed

**No manual configuration required!** Just use the right JSON format for each clip.

---

## 🎬 COMPLETE PIPELINE

```
1. Create OTI JSON (mix YouTube + Local clips)
2. Load into Prompt Lab
3. Generate outputs:
   • HTML Preview (YouTube iframes + local <video>)
   • FFmpeg Script (auto-detects and processes both)
   • Text Storymap (shows source type for each)
4. Run FFmpeg script
5. Get final assembled film!
```

**Works seamlessly with both video types!** 🚀✨
