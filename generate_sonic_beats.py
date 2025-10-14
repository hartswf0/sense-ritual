#!/usr/bin/env python3
"""
Generative Ambient Soundscapes - Brian Eno Style
Creates unique sonic textures for each of the 15 beats
"""

import json

with open('filter-bubbles-documentary.oti.json', 'r') as f:
    oti = json.load(f)

# Beat-specific sonic characteristics
# Frequencies and textures evolve through the narrative arc
BEAT_SONICS = {
    1: {"name": "Opening Image", "freq": [65, 130, 195], "texture": "drone", "act": "act1"},
    2: {"name": "Theme Stated", "freq": [73, 146, 219], "texture": "shimmer", "act": "act1"},
    3: {"name": "Set-Up", "freq": [82, 164, 246], "texture": "pulse", "act": "act1"},
    4: {"name": "Catalyst", "freq": [87, 174, 261], "texture": "tension", "act": "act1"},
    5: {"name": "Debate", "freq": [98, 196, 294], "texture": "debate", "act": "act1"},
    6: {"name": "Break into Two", "freq": [110, 220, 330], "texture": "transition", "act": "act2a"},
    7: {"name": "B Story", "freq": [123, 246, 369], "texture": "narrative", "act": "act2a"},
    8: {"name": "Fun and Games", "freq": [131, 262, 393], "texture": "playful", "act": "act2a"},
    9: {"name": "Midpoint", "freq": [147, 294, 441], "texture": "peak", "act": "act2a"},
    10: {"name": "Bad Guys Close In", "freq": [165, 330, 495], "texture": "dark", "act": "act2a"},
    11: {"name": "All Is Lost", "freq": [175, 350, 525], "texture": "despair", "act": "act2b"},
    12: {"name": "Dark Night", "freq": [185, 370, 555], "texture": "abyss", "act": "act2b"},
    13: {"name": "Break into Three", "freq": [196, 392, 588], "texture": "resolve", "act": "act3"},
    14: {"name": "Finale", "freq": [220, 440, 660], "texture": "climax", "act": "act3"},
    15: {"name": "Final Image", "freq": [233, 466, 699], "texture": "resolution", "act": "act3"}
}

print("🎵 Generating Brian Eno-style Ambient Soundscapes...")
print(f"   Creating 15 unique sonic textures for each beat")

script = """#!/bin/bash
# Generative Ambient Soundscapes Generator
# Brian Eno-inspired sonic textures for each beat

set -e

echo "🎵 Generating Ambient Soundscapes..."
echo "   Style: Generative/Ambient (Brian Eno approach)"

SOUND_DIR="temp_soundscapes"
mkdir -p "$SOUND_DIR"

# Check for sox (Sound eXchange) - powerful audio synthesis
if ! command -v sox &> /dev/null; then
    echo "⚠️  sox not found. Installing via brew..."
    brew install sox 2>/dev/null || echo "Please install sox: brew install sox"
fi

"""

# Calculate duration for each beat
beat_durations = {}
for seq in oti['sequences']:
    beat_num = seq['beatNumber']
    total_duration = sum(clip['duration'] for clip in seq['clips'])
    beat_durations[beat_num] = total_duration

# Generate soundscape for each beat
for beat_num, sonic in BEAT_SONICS.items():
    duration = beat_durations.get(beat_num, 30)
    freqs = sonic['freq']
    
    script += f"""
# ========================================
# BEAT {beat_num}: {sonic['name']}
# Act: {sonic['act']} | Texture: {sonic['texture']}
# Duration: {duration}s
# ========================================

echo "  Generating Beat {beat_num}: {sonic['name']} ({duration}s)"

"""
    
    # Different generative techniques for different textures
    if sonic['texture'] == 'drone':
        # Deep sustained tones
        script += f"""sox -n $SOUND_DIR/beat_{beat_num:02d}_layer1.wav synth {duration} sine {freqs[0]} vol 0.15
sox -n $SOUND_DIR/beat_{beat_num:02d}_layer2.wav synth {duration} sine {freqs[1]} vol 0.10 fade h 2 {duration-4} 2
sox -n $SOUND_DIR/beat_{beat_num:02d}_layer3.wav synth {duration} sine {freqs[2]} vol 0.08 fade h 3 {duration-6} 3
"""
    
    elif sonic['texture'] == 'shimmer':
        # Shimmering high frequencies with slow modulation
        script += f"""sox -n $SOUND_DIR/beat_{beat_num:02d}_layer1.wav synth {duration} sine {freqs[0]} sine 0.3 vol 0.12
sox -n $SOUND_DIR/beat_{beat_num:02d}_layer2.wav synth {duration} sine {freqs[1]} sine 0.2 vol 0.09 fade h 1 {duration-2} 1
sox -n $SOUND_DIR/beat_{beat_num:02d}_layer3.wav synth {duration} sine {freqs[2]} sine 0.15 vol 0.06
"""
    
    elif sonic['texture'] == 'pulse':
        # Pulsing rhythm with tremolo
        script += f"""sox -n $SOUND_DIR/beat_{beat_num:02d}_layer1.wav synth {duration} sine {freqs[0]} tremolo 0.5 50 vol 0.13
sox -n $SOUND_DIR/beat_{beat_num:02d}_layer2.wav synth {duration} sine {freqs[1]} tremolo 0.7 40 vol 0.10
sox -n $SOUND_DIR/beat_{beat_num:02d}_layer3.wav synth {duration} sine {freqs[2]} vol 0.07 fade h 2 {duration-4} 2
"""
    
    elif sonic['texture'] == 'tension':
        # Dissonant, tense frequencies
        script += f"""sox -n $SOUND_DIR/beat_{beat_num:02d}_layer1.wav synth {duration} sine {freqs[0]} sine {freqs[0]*1.02} vol 0.14
sox -n $SOUND_DIR/beat_{beat_num:02d}_layer2.wav synth {duration} sine {freqs[1]} tremolo 1.5 30 vol 0.11
sox -n $SOUND_DIR/beat_{beat_num:02d}_layer3.wav synth {duration} sine {freqs[2]} sine {freqs[2]*0.98} vol 0.08
"""
    
    elif sonic['texture'] == 'dark':
        # Low, ominous tones
        script += f"""sox -n $SOUND_DIR/beat_{beat_num:02d}_layer1.wav synth {duration} sine {freqs[0]*0.5} vol 0.18
sox -n $SOUND_DIR/beat_{beat_num:02d}_layer2.wav synth {duration} sine {freqs[1]*0.75} tremolo 0.3 20 vol 0.13
sox -n $SOUND_DIR/beat_{beat_num:02d}_layer3.wav synth {duration} pinknoise vol 0.03 lowpass {freqs[1]}
"""
    
    elif sonic['texture'] == 'peak':
        # Bright, ascending feeling
        script += f"""sox -n $SOUND_DIR/beat_{beat_num:02d}_layer1.wav synth {duration} sine {freqs[0]} sine {freqs[0]*1.5} vol 0.15
sox -n $SOUND_DIR/beat_{beat_num:02d}_layer2.wav synth {duration} sine {freqs[1]} sine {freqs[1]*1.5} vol 0.12
sox -n $SOUND_DIR/beat_{beat_num:02d}_layer3.wav synth {duration} sine {freqs[2]} fade h 0 {duration} 0 vol 0.09
"""
    
    elif sonic['texture'] == 'despair':
        # Descending, fading
        script += f"""sox -n $SOUND_DIR/beat_{beat_num:02d}_layer1.wav synth {duration} sine {freqs[0]} bend 0,{-200},{duration} vol 0.16
sox -n $SOUND_DIR/beat_{beat_num:02d}_layer2.wav synth {duration} sine {freqs[1]} fade h 0 {duration/2} {duration/2} vol 0.12
sox -n $SOUND_DIR/beat_{beat_num:02d}_layer3.wav synth {duration} pinknoise vol 0.04 fade h 0 {duration} 0
"""
    
    elif sonic['texture'] == 'abyss':
        # Deepest, darkest point
        script += f"""sox -n $SOUND_DIR/beat_{beat_num:02d}_layer1.wav synth {duration} sine {freqs[0]*0.25} vol 0.20
sox -n $SOUND_DIR/beat_{beat_num:02d}_layer2.wav synth {duration} sine {freqs[1]*0.5} tremolo 0.1 10 vol 0.15
sox -n $SOUND_DIR/beat_{beat_num:02d}_layer3.wav synth {duration} brownnoise vol 0.05 lowpass {freqs[0]}
"""
    
    elif sonic['texture'] == 'resolve':
        # Rising, hopeful
        script += f"""sox -n $SOUND_DIR/beat_{beat_num:02d}_layer1.wav synth {duration} sine {freqs[0]} bend 0,{100},{duration} vol 0.15
sox -n $SOUND_DIR/beat_{beat_num:02d}_layer2.wav synth {duration} sine {freqs[1]} fade h 0 {duration} 0 vol 0.11
sox -n $SOUND_DIR/beat_{beat_num:02d}_layer3.wav synth {duration} sine {freqs[2]} sine {freqs[2]*2} vol 0.08
"""
    
    elif sonic['texture'] == 'climax':
        # Maximum energy and brightness
        script += f"""sox -n $SOUND_DIR/beat_{beat_num:02d}_layer1.wav synth {duration} sine {freqs[0]} sine {freqs[0]*2} vol 0.17
sox -n $SOUND_DIR/beat_{beat_num:02d}_layer2.wav synth {duration} sine {freqs[1]} sine {freqs[1]*1.5} tremolo 2 40 vol 0.14
sox -n $SOUND_DIR/beat_{beat_num:02d}_layer3.wav synth {duration} sine {freqs[2]} sine {freqs[2]*2} vol 0.10
"""
    
    else:  # resolution, narrative, playful, debate, transition
        # Balanced, evolving texture
        script += f"""sox -n $SOUND_DIR/beat_{beat_num:02d}_layer1.wav synth {duration} sine {freqs[0]} sine {freqs[0]*1.2} vol 0.14
sox -n $SOUND_DIR/beat_{beat_num:02d}_layer2.wav synth {duration} sine {freqs[1]} fade h 1 {duration-2} 1 vol 0.10
sox -n $SOUND_DIR/beat_{beat_num:02d}_layer3.wav synth {duration} sine {freqs[2]} tremolo 0.8 30 vol 0.07
"""
    
    # Mix the three layers into one beat soundscape
    script += f"""sox -m $SOUND_DIR/beat_{beat_num:02d}_layer1.wav \\
       $SOUND_DIR/beat_{beat_num:02d}_layer2.wav \\
       $SOUND_DIR/beat_{beat_num:02d}_layer3.wav \\
       $SOUND_DIR/beat_{beat_num:02d}_mix.wav

# Add subtle reverb for space
sox $SOUND_DIR/beat_{beat_num:02d}_mix.wav \\
    $SOUND_DIR/beat_{beat_num:02d}_final.wav \\
    reverb 50 50 100 100 0 5

# Clean up layers
rm $SOUND_DIR/beat_{beat_num:02d}_layer*.wav $SOUND_DIR/beat_{beat_num:02d}_mix.wav

"""

# Concatenate all beat soundscapes
script += """
echo ""
echo "🎼 Assembling complete soundtrack..."

# Create list of all beat soundscapes
"""

for beat_num in range(1, 16):
    script += f"echo \"file 'beat_{beat_num:02d}_final.wav'\" >> $SOUND_DIR/concat.txt\n"

script += """
# Concatenate all beats
sox $(ls $SOUND_DIR/beat_*_final.wav | sort) $SOUND_DIR/full_soundtrack.wav

# Convert to AAC for video
ffmpeg -i $SOUND_DIR/full_soundtrack.wav \\
  -c:a aac -b:a 192k \\
  -y ambient_soundtrack.m4a -loglevel error

echo ""
echo "✅ Ambient Soundtrack Complete!"
echo "📁 Output: ambient_soundtrack.m4a"
echo "🎵 15 unique sonic textures, one per beat"
echo "⏱️  Duration: """ + str(sum(beat_durations.values())) + """s"
echo ""
echo "🎨 Sonic Palette:"
"""

for beat_num, sonic in BEAT_SONICS.items():
    script += f'echo "   Beat {beat_num:2d}: {sonic["name"]:<20} | {sonic["texture"]:<12} | {sonic["act"]}"\n'

script += """
echo ""
echo "💡 To use in render, edit render_cinematic.sh:"
echo "   Replace music generation with: -i ambient_soundtrack.m4a"
"""

with open('generate_soundscapes.sh', 'w') as f:
    f.write(script)

import os
os.chmod('generate_soundscapes.sh', 0o755)

print("✅ Soundscape generator created!")
print("📄 File: generate_soundscapes.sh")
print("")
print("🎨 15 Unique Sonic Textures:")
for beat_num, sonic in BEAT_SONICS.items():
    print(f"   Beat {beat_num:2d}: {sonic['name']:<20} | {sonic['texture']:<12} | {sonic['act']}")
print("")
print("🎵 Generative Techniques Used:")
print("   • Layered sine wave drones")
print("   • Frequency modulation")
print("   • Tremolo and vibrato")
print("   • Pink/brown noise textures")
print("   • Pitch bending")
print("   • Spatial reverb")
print("")
print("⚙️  To generate: ./generate_soundscapes.sh")
print("⏱️  Time: ~2-3 minutes")
