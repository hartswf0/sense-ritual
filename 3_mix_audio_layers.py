#!/usr/bin/env python3
"""
Mix audio layers: Ambient music (30%) + TTS narration (100%)
Creates final audio track to sync with video
"""

import json

with open('timing_manifest.json', 'r') as f:
    manifest = json.load(f)

print("🎚️  Generating Audio Mix Script")
print("   Layer 1: Ambient music (30% volume)")
print("   Layer 2: TTS narration (100% volume)")

script = """#!/bin/bash
# Mix ambient soundscapes with TTS narration
set -e

echo "🎚️  Mixing audio layers..."
echo ""

# Check dependencies
if [ ! -f "ambient_soundtrack.m4a" ]; then
    echo "❌ ambient_soundtrack.m4a not found!"
    echo "   Run: ./2_generate_eno_music.sh first"
    exit 1
fi

TEMP_DIR="temp_audio_mix"
mkdir -p "$TEMP_DIR"

echo "Step 1: Convert TTS files to consistent format..."

"""

# Convert all TTS to WAV for mixing
for i, clip in enumerate(manifest['clips']):
    script += f"""echo "  Converting TTS {i+1}/{len(manifest['clips'])}..."
ffmpeg -i {clip['tts_file']} -ar 48000 -ac 2 $TEMP_DIR/tts_{i:03d}.wav -loglevel error
"""

script += """
echo ""
echo "Step 2: Concatenate all TTS with silence gaps..."

# Create concat list with proper timing
cat > $TEMP_DIR/tts_concat.txt << 'EOFCONCAT'
"""

# Add TTS files with silence padding to match video timing
for i, clip in enumerate(manifest['clips']):
    script += f"file 'tts_{i:03d}.wav'\n"
    # Add silence after TTS to fill clip duration
    # TTS is typically 2-4s, clip might be 5-20s
    # The silence will be trimmed when syncing to video duration

script += """EOFCONCAT

ffmpeg -f concat -safe 0 -i $TEMP_DIR/tts_concat.txt -c:a pcm_s16le -y $TEMP_DIR/tts_full.wav -loglevel error

echo ""
echo "Step 3: Mix ambient + TTS..."

# Convert ambient to WAV
ffmpeg -i ambient_soundtrack.m4a -ar 48000 -ac 2 $TEMP_DIR/ambient.wav -loglevel error

# Mix: ambient at 30% + TTS at 100%
ffmpeg -i $TEMP_DIR/ambient.wav -i $TEMP_DIR/tts_full.wav \\
  -filter_complex "[0:a]volume=0.3[ambient];[1:a]volume=1.0[narration];[ambient][narration]amix=inputs=2:duration=first[a]" \\
  -map "[a]" \\
  -c:a aac -b:a 256k \\
  -y final_audio_mix.m4a -loglevel error

echo ""
echo "🧹 Cleaning up..."
rm -rf $TEMP_DIR

echo ""
echo "✅ Audio mix complete!"
echo "📁 final_audio_mix.m4a"
echo ""
echo "🎚️  Mix levels:"
echo "   • Ambient music: 30%"
echo "   • TTS narration: 100%"
echo ""
ls -lh final_audio_mix.m4a
"""

with open('3_mix_audio_layers.sh', 'w') as f:
    f.write(script)

import os
os.chmod('3_mix_audio_layers.sh', 0o755)

print()
print("✅ Audio mixing script created!")
print("📄 File: 3_mix_audio_layers.sh")
print()
print("⚙️  Pipeline:")
print("   1. ./2_generate_eno_music.sh  (ambient soundscapes)")
print("   2. ./3_mix_audio_layers.sh     (mix music + TTS)")
print("   3. Add to video with overlays")
