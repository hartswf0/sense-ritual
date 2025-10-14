#!/usr/bin/env python3
"""
Generate Brian Eno-style ambient soundscapes
One per beat, using timing manifest
"""

import json
import os

with open('timing_manifest.json', 'r') as f:
    manifest = json.load(f)

os.makedirs('ambient', exist_ok=True)

print("🎵 Generating Eno-style Ambient Soundscapes")
print(f"   {len(manifest['beats'])} unique textures")

# Sonic characteristics per beat
TEXTURES = {
    1: ("drone", [65, 130, 195]),
    2: ("shimmer", [73, 146, 219]),
    3: ("pulse", [82, 164, 246]),
    4: ("tension", [87, 174, 261]),
    5: ("debate", [98, 196, 294]),
    6: ("transition", [110, 220, 330]),
    7: ("narrative", [123, 246, 369]),
    8: ("playful", [131, 262, 393]),
    9: ("peak", [147, 294, 441]),
    10: ("dark", [165, 330, 495]),
    11: ("despair", [175, 350, 525]),
    12: ("abyss", [185, 370, 555]),
    13: ("resolve", [196, 392, 588]),
    14: ("climax", [220, 440, 660]),
    15: ("resolution", [233, 466, 699])
}

script = """#!/bin/bash
# Brian Eno-style Generative Soundscapes
set -e

echo "🎵 Generating Ambient Music..."
echo ""

# Check for sox
if ! command -v sox &> /dev/null; then
    echo "Installing sox via brew..."
    brew install sox
fi

mkdir -p ambient

"""

for beat in manifest['beats']:
    num = beat['beat_number']
    duration = beat['duration']
    texture, freqs = TEXTURES[num]
    
    script += f"""
echo "  Beat {num:2d}: {beat['beat_name']:<25} ({duration}s) - {texture}"

# Generate 3 layers at different frequencies
sox -n ambient/beat_{num:02d}_layer1.wav synth {duration} sine {freqs[0]} vol 0.15 fade h 2 {duration-4} 2 2>/dev/null
sox -n ambient/beat_{num:02d}_layer2.wav synth {duration} sine {freqs[1]} vol 0.10 fade h 3 {duration-6} 3 2>/dev/null
sox -n ambient/beat_{num:02d}_layer3.wav synth {duration} sine {freqs[2]} vol 0.08 fade h 2 {duration-4} 2 2>/dev/null

# Mix layers
sox -m ambient/beat_{num:02d}_layer*.wav ambient/beat_{num:02d}_mix.wav 2>/dev/null

# Add reverb for space
sox ambient/beat_{num:02d}_mix.wav ambient/beat_{num:02d}_final.wav reverb 50 50 100 100 0 5 2>/dev/null

# Clean up
rm ambient/beat_{num:02d}_layer*.wav ambient/beat_{num:02d}_mix.wav

"""

# Concatenate all beats
script += """
echo ""
echo "🎼 Assembling full soundtrack..."

# Concatenate in order
sox $(ls ambient/beat_*_final.wav | sort) ambient/full_soundtrack.wav 2>/dev/null

# Convert to AAC
ffmpeg -i ambient/full_soundtrack.wav -c:a aac -b:a 192k -y ambient_soundtrack.m4a -loglevel error

echo ""
echo "✅ Ambient soundtrack complete!"
echo "📁 ambient_soundtrack.m4a (""" + str(manifest['total_duration']) + """s)
echo ""
ls -lh ambient_soundtrack.m4a
"""

with open('2_generate_eno_music.sh', 'w') as f:
    f.write(script)

os.chmod('2_generate_eno_music.sh', 0o755)

print()
print("✅ Music generation script created!")
print("📄 File: 2_generate_eno_music.sh")
print()
print("⚙️  To generate: ./2_generate_eno_music.sh")
print("⏱️  Time: ~3-5 minutes")
