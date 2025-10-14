#!/usr/bin/env python3
"""
Assemble complete cinematic documentary with TTS + overlays
"""

import json
import os

with open('timing_manifest.json', 'r') as f:
    manifest = json.load(f)

FONT = "/System/Library/Fonts/Supplemental/Courier New Bold.ttf"
if not os.path.exists(FONT):
    FONT = "/System/Library/Fonts/Courier.dfont"

print("🎬 Generating Cinematic Assembly Script")
print(f"   {len(manifest['clips'])} clips with TTS narration")
print(f"   Duration: {manifest['total_duration']}s")

script = f"""#!/bin/bash
# Filter Bubbles: Cinematic Edition - Final Assembly
set -e

echo "🎬 Assembling Cinematic Documentary"
echo "   46 clips + TTS narration + text overlays"

TEMP_DIR="temp_cinematic"
mkdir -p "$TEMP_DIR"

"""

# Process each clip with overlays and TTS
for i, clip in enumerate(manifest['clips']):
    beat = next(b for b in manifest['beats'] if any(c['global_index'] == clip['global_index'] for c in b['clips']))
    
    input_video = clip['video_file']
    tts_audio = clip['tts_file']
    output = f"$TEMP_DIR/clip_{str(i).zfill(3)}_final.mp4"
    
    # Escape text for FFmpeg
    title = clip['title'].replace("'", "'\\''").replace(":", "\\:")
    quote = clip['quote'].replace("'", "'\\''").replace(":", "\\:")
    beat_label = f"BEAT {beat['beat_number']}\\: {beat['beat_name']}".replace("'", "'\\''").replace(":", "\\:")
    
    script += f"""
# Clip {i+1}/{len(manifest['clips'])}: {clip['title']}
echo "  Processing [{i+1}/{len(manifest['clips'])}] {clip['title']}"

ffmpeg -i "{input_video}" -i "{tts_audio}" \\
  -filter_complex "\\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\\
    drawtext=fontfile='{FONT}':text='{beat_label}':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\\
    drawtext=fontfile='{FONT}':text='{title}':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\\
    drawtext=fontfile='{FONT}':text='{quote}':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \\
  -map "[v]" -map 1:a \\
  -ss 0 -t {clip['duration']} \\
  -c:v libx264 -preset medium -crf 22 \\
  -c:a aac -b:a 192k \\
  -shortest -y {output} -loglevel error

"""

# Create concat list
script += """
echo ""
echo "🎞️  Concatenating all clips..."

cat > $TEMP_DIR/concat.txt << 'EOFCONCAT'
"""

for i in range(len(manifest['clips'])):
    script += f"file 'clip_{str(i).zfill(3)}_final.mp4'\n"

script += """EOFCONCAT

ffmpeg -f concat -safe 0 -i $TEMP_DIR/concat.txt \\
  -c copy \\
  -y filter_bubbles_cinematic_with_tts.mp4 -loglevel error

echo ""
echo "🧹 Cleaning up..."
rm -rf $TEMP_DIR

echo ""
echo "✅ CINEMATIC DOCUMENTARY COMPLETE!"
echo ""
echo "📁 Output: filter_bubbles_cinematic_with_tts.mp4"
echo "⏱️  Duration: """ + f"{manifest['total_duration']//60}:{manifest['total_duration']%60:02d}" + """"
echo "🎙️  Features:"
echo "   • TTS narration for all 46 quotes"
echo "   • Cinematic letterbox (2.35:1 style)"
echo "   • Text overlays (beat, title, quote)"
echo "   • 1920×1080 HD resolution"
echo ""
ls -lh filter_bubbles_cinematic_with_tts.mp4
"""

with open('assemble_cinematic.sh', 'w') as f:
    f.write(script)

os.chmod('assemble_cinematic.sh', 0o755)

print()
print("✅ Assembly script generated!")
print("📄 File: assemble_cinematic.sh")
print()
print("⚙️  To render: ./assemble_cinematic.sh")
print("⏱️  Estimated time: 10-15 minutes")
print()
print("🎬 Output will include:")
print("   • TTS narration (already generated)")
print("   • Letterbox bars")
print("   • Text overlays")
print("   • HD 1920×1080")
