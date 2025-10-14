#!/usr/bin/env python3
"""
Assemble video-only version with overlays (no audio)
Reads timing_manifest.json and renders per-clip overlays, then concatenates.
Output: video_only_overlays.mp4
"""
import json, os

with open('timing_manifest.json','r') as f:
    manifest = json.load(f)

FONT = "/System/Library/Fonts/Supplemental/Courier New Bold.ttf"
if not os.path.exists(FONT):
    FONT = "/System/Library/Fonts/Courier.dfont"

script = [
"#!/bin/bash",
"set -e",
"echo '🎬 Building video-only cut with overlays (no audio)...'",
"TEMP_DIR='temp_video_only'",
"mkdir -p \"$TEMP_DIR\"",
]

for i, clip in enumerate(manifest['clips']):
    # find beat for this clip
    beat = next(b for b in manifest['beats'] if any(c['global_index']==clip['global_index'] for c in b['clips']))
    input_video = clip['video_file']
    out = f"$TEMP_DIR/clip_{i:03d}.mp4"
    title = clip['title'].replace("'","'\\''").replace(":","\\:")
    quote = clip['quote'].replace("'","'\\''").replace(":","\\:")
    title_echo = clip['title'].replace('"','\\"')
    beat_label = f"BEAT {beat['beat_number']}\\: {beat['beat_name']}".replace("'","'\\''").replace(":","\\:")
    duration = clip['duration']
    script += [
        f"echo \"  [{i+1}/{len(manifest['clips'])}] {title_echo}\"",
        (
            "ffmpeg -i \\\"%s\\\" "
            "-filter_complex \\\""
            "[0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,"
            "drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,"
            "drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,"
            "drawtext=fontfile='%s':text='%s':fontcolor=white@0.7:fontsize=16:x=(w-text_w)/2:y=30,"
            "drawtext=fontfile='%s':text='%s':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=h/2-50:enable='between(t,0,3)',"
            "drawtext=fontfile='%s':text='%s':fontcolor=yellow@0.85:fontsize=20:x=(w-text_w)/2:y=h-120[v]\" "
            "-map \"[v]\" -an -ss 0 -t %d -c:v libx264 -preset medium -crf 22 -y %s -loglevel error"
        ) % (input_video, FONT, beat_label, FONT, title, FONT, quote, duration, out)
    ]

script += [
"echo '🎞️  Concatenating clips (video-only)...'",
"cat > $TEMP_DIR/concat.txt << 'EOF'",
]

for i in range(len(manifest['clips'])):
    script.append(f"file 'clip_{i:03d}.mp4'")

script += [
"EOF",
"ffmpeg -f concat -safe 0 -i $TEMP_DIR/concat.txt -c copy -y video_only_overlays.mp4 -loglevel error",
"echo '✅ Video-only cut ready: video_only_overlays.mp4'",
"# rm -rf $TEMP_DIR  # keep for inspection",
]

with open('assemble_video_only.sh','w') as f:
    f.write("\n".join(script))

os.chmod('assemble_video_only.sh', 0o755)
print('✅ Generated assemble_video_only.sh')
