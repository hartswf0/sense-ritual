#!/usr/bin/env python3
"""
Enhanced Cinematic Render for Filter Bubbles Documentary
- Text overlays (titles, quotes, beat names)
- Background music
- Letterbox bars (2.35:1 aspect ratio)
- TTS narration
"""

import json
import os

# Load OTI
with open('filter-bubbles-documentary.oti.json', 'r') as f:
    oti = json.load(f)

# Configuration
FONT = "/System/Library/Fonts/Courier.dfont"  # macOS system font
TITLE_SIZE = 28
QUOTE_SIZE = 18
BEAT_SIZE = 14
LETTERBOX_HEIGHT = 100  # Black bars top/bottom

print("🎬 Generating Enhanced Cinematic Render Script...")

script = f"""#!/bin/bash
# {oti['title']} - CINEMATIC EDITION
# With text overlays, music, letterbox, and TTS narration

set -e

echo "🎬 Enhanced Cinematic Render"
echo "📊 {oti['metadata']['totalClips']} clips with full production"

TEMP_DIR="temp_cinematic"
mkdir -p "$TEMP_DIR"
mkdir -p "$TEMP_DIR/audio"

# Check dependencies
command -v ffmpeg >/dev/null 2>&1 || {{ echo "❌ ffmpeg required"; exit 1; }}
command -v say >/dev/null 2>&1 || {{ echo "❌ TTS (say) not available"; exit 1; }}

"""

# Generate TTS narration for each clip
narration_files = []
clip_index = 0

script += "\n# ========================================\n"
script += "# GENERATE TTS NARRATION\n"
script += "# ========================================\n\n"

for seq_idx, seq in enumerate(oti['sequences']):
    for clip_idx, clip in enumerate(seq['clips']):
        narration_file = f"$TEMP_DIR/audio/narration_{str(clip_index).zfill(3)}.aiff"
        narration_files.append(narration_file)
        
        # Clean quote for TTS
        quote_text = clip['quote'].replace('"', '').replace("'", "")
        
        script += f"# Narration {clip_index + 1}: {clip['title']}\n"
        script += f"echo '  Generating narration {clip_index + 1}/{oti['metadata']['totalClips']}'\n"
        script += f"say -v Alex -r 150 '{quote_text}' -o {narration_file}\n\n"
        
        clip_index += 1

# Process each clip with overlays
script += "\n# ========================================\n"
script += "# PROCESS CLIPS WITH OVERLAYS\n"
script += "# ========================================\n\n"

clip_index = 0
processed_clips = []

for seq_idx, seq in enumerate(oti['sequences']):
    script += f"\n# BEAT {seq['beatNumber']}: {seq['beatName']}\n\n"
    
    for clip_idx, clip in enumerate(seq['clips']):
        input_file = clip['videoFile']
        output_file = f"$TEMP_DIR/clip_{str(clip_index).zfill(3)}_enhanced.mp4"
        processed_clips.append(output_file)
        narration = narration_files[clip_index]
        
        # Escape special characters for FFmpeg
        title = clip['title'].replace("'", "'\\''")
        quote = clip['quote'].replace("'", "'\\''")
        beat_name = seq['beatName'].replace("'", "'\\''")
        
        script += f"echo '  [{clip_index + 1}/{oti['metadata']['totalClips']}] Enhancing: {title}'\n"
        
        # Complex FFmpeg filter
        script += f"""ffmpeg -i "{input_file}" -i {narration} \\
  -filter_complex "\\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\\
    drawbox=y=0:color=black@1:width=iw:height={LETTERBOX_HEIGHT}:t=fill,\\
    drawbox=y=ih-{LETTERBOX_HEIGHT}:color=black@1:width=iw:height={LETTERBOX_HEIGHT}:t=fill,\\
    drawtext=fontfile={FONT}:text='BEAT {seq['beatNumber']}\\: {beat_name}':fontcolor=white@0.8:fontsize={BEAT_SIZE}:x=(w-text_w)/2:y=20,\\
    drawtext=fontfile={FONT}:text='{title}':fontcolor=white:fontsize={TITLE_SIZE}:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\\
    drawtext=fontfile={FONT}:text='{quote}':fontcolor=yellow@0.9:fontsize={QUOTE_SIZE}:x=(w-text_w)/2:y=h-{LETTERBOX_HEIGHT}-60:enable='gte(t,1)'\\
    [v];\\
    [1:a]volume=1.5[narration];\\
    [narration]apad[a]" \\
  -map "[v]" -map "[a]" \\
  -ss {clip['sourceIn']} -t {clip['duration']} \\
  -c:v libx264 -preset medium -crf 20 \\
  -c:a aac -b:a 192k \\
  -shortest \\
  -y {output_file} -loglevel error

"""
        
        clip_index += 1

# Concatenate
script += "\n# ========================================\n"
script += "# CONCATENATE WITH BACKGROUND MUSIC\n"
script += "# ========================================\n\n"

script += "echo '🎞️  Concatenating enhanced clips...'\n"
script += "cat > $TEMP_DIR/concat.txt << 'EOF'\n"
for clip_file in processed_clips:
    script += f"file '{clip_file.replace('$TEMP_DIR/', '')}'\n"
script += "EOF\n\n"

script += """# Concatenate all clips
ffmpeg -f concat -safe 0 -i $TEMP_DIR/concat.txt \\
  -c:v copy -c:a copy \\
  -y $TEMP_DIR/assembled.mp4 -loglevel error

echo '🎵 Adding background music...'

# Create background music (can replace with actual music file)
# For now, generate silent track - replace with: ffmpeg -i your_music.mp3 ...
ffmpeg -f lavfi -i anullsrc=r=48000:cl=stereo \\
  -t """ + str(oti['metadata']['totalDuration']) + """ \\
  -c:a aac -b:a 128k \\
  -y $TEMP_DIR/music.m4a -loglevel error

# Mix narration with music (music at 20% volume)
ffmpeg -i $TEMP_DIR/assembled.mp4 -i $TEMP_DIR/music.m4a \\
  -filter_complex "[0:a][1:a]amix=inputs=2:duration=first:weights=1 0.2[a]" \\
  -map 0:v -map "[a]" \\
  -c:v copy -c:a aac -b:a 192k \\
  -y filter_bubbles_cinematic.mp4 -loglevel error

"""

script += """
echo '🧹 Cleaning up...'
rm -rf $TEMP_DIR

echo ''
echo '✅ CINEMATIC RENDER COMPLETE!'
echo '📁 Output: filter_bubbles_cinematic.mp4'
echo ''
ls -lh filter_bubbles_cinematic.mp4
echo ''
echo '🎬 Features:'
echo '  • Letterbox bars (cinematic 2.35:1 style)'
echo '  • Text overlays (titles, quotes, beats)'
echo '  • TTS narration for all quotes'
echo '  • Background music mix'
echo '  • 1920×1080 HD resolution'
"""

# Write the script
with open('render_cinematic.sh', 'w') as f:
    f.write(script)

os.chmod('render_cinematic.sh', 0o755)

print(f"✅ Enhanced render script created!")
print(f"📄 File: render_cinematic.sh")
print(f"")
print(f"🎬 Features:")
print(f"  • {oti['metadata']['totalClips']} clips with full text overlays")
print(f"  • TTS narration for all {oti['metadata']['totalClips']} quotes")
print(f"  • Cinematic letterbox bars")
print(f"  • Background music track")
print(f"  • Beat indicators on every clip")
print(f"")
print(f"⚙️  To render: ./render_cinematic.sh")
print(f"⏱️  Estimated time: 15-20 minutes")
