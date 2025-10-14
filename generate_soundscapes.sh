#!/bin/bash
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


# ========================================
# BEAT 1: Opening Image
# Act: act1 | Texture: drone
# Duration: 33s
# ========================================

echo "  Generating Beat 1: Opening Image (33s)"

sox -n $SOUND_DIR/beat_01_layer1.wav synth 33 sine 65 vol 0.15
sox -n $SOUND_DIR/beat_01_layer2.wav synth 33 sine 130 vol 0.10 fade h 2 29 2
sox -n $SOUND_DIR/beat_01_layer3.wav synth 33 sine 195 vol 0.08 fade h 3 27 3
sox -m $SOUND_DIR/beat_01_layer1.wav \
       $SOUND_DIR/beat_01_layer2.wav \
       $SOUND_DIR/beat_01_layer3.wav \
       $SOUND_DIR/beat_01_mix.wav

# Add subtle reverb for space
sox $SOUND_DIR/beat_01_mix.wav \
    $SOUND_DIR/beat_01_final.wav \
    reverb 50 50 100 100 0 5

# Clean up layers
rm $SOUND_DIR/beat_01_layer*.wav $SOUND_DIR/beat_01_mix.wav


# ========================================
# BEAT 2: Theme Stated
# Act: act1 | Texture: shimmer
# Duration: 22s
# ========================================

echo "  Generating Beat 2: Theme Stated (22s)"

sox -n $SOUND_DIR/beat_02_layer1.wav synth 22 sine 73 sine 0.3 vol 0.12
sox -n $SOUND_DIR/beat_02_layer2.wav synth 22 sine 146 sine 0.2 vol 0.09 fade h 1 20 1
sox -n $SOUND_DIR/beat_02_layer3.wav synth 22 sine 219 sine 0.15 vol 0.06
sox -m $SOUND_DIR/beat_02_layer1.wav \
       $SOUND_DIR/beat_02_layer2.wav \
       $SOUND_DIR/beat_02_layer3.wav \
       $SOUND_DIR/beat_02_mix.wav

# Add subtle reverb for space
sox $SOUND_DIR/beat_02_mix.wav \
    $SOUND_DIR/beat_02_final.wav \
    reverb 50 50 100 100 0 5

# Clean up layers
rm $SOUND_DIR/beat_02_layer*.wav $SOUND_DIR/beat_02_mix.wav


# ========================================
# BEAT 3: Set-Up
# Act: act1 | Texture: pulse
# Duration: 31s
# ========================================

echo "  Generating Beat 3: Set-Up (31s)"

sox -n $SOUND_DIR/beat_03_layer1.wav synth 31 sine 82 tremolo 0.5 50 vol 0.13
sox -n $SOUND_DIR/beat_03_layer2.wav synth 31 sine 164 tremolo 0.7 40 vol 0.10
sox -n $SOUND_DIR/beat_03_layer3.wav synth 31 sine 246 vol 0.07 fade h 2 27 2
sox -m $SOUND_DIR/beat_03_layer1.wav \
       $SOUND_DIR/beat_03_layer2.wav \
       $SOUND_DIR/beat_03_layer3.wav \
       $SOUND_DIR/beat_03_mix.wav

# Add subtle reverb for space
sox $SOUND_DIR/beat_03_mix.wav \
    $SOUND_DIR/beat_03_final.wav \
    reverb 50 50 100 100 0 5

# Clean up layers
rm $SOUND_DIR/beat_03_layer*.wav $SOUND_DIR/beat_03_mix.wav


# ========================================
# BEAT 4: Catalyst
# Act: act1 | Texture: tension
# Duration: 24s
# ========================================

echo "  Generating Beat 4: Catalyst (24s)"

sox -n $SOUND_DIR/beat_04_layer1.wav synth 24 sine 87 sine 88.74 vol 0.14
sox -n $SOUND_DIR/beat_04_layer2.wav synth 24 sine 174 tremolo 1.5 30 vol 0.11
sox -n $SOUND_DIR/beat_04_layer3.wav synth 24 sine 261 sine 255.78 vol 0.08
sox -m $SOUND_DIR/beat_04_layer1.wav \
       $SOUND_DIR/beat_04_layer2.wav \
       $SOUND_DIR/beat_04_layer3.wav \
       $SOUND_DIR/beat_04_mix.wav

# Add subtle reverb for space
sox $SOUND_DIR/beat_04_mix.wav \
    $SOUND_DIR/beat_04_final.wav \
    reverb 50 50 100 100 0 5

# Clean up layers
rm $SOUND_DIR/beat_04_layer*.wav $SOUND_DIR/beat_04_mix.wav


# ========================================
# BEAT 5: Debate
# Act: act1 | Texture: debate
# Duration: 17s
# ========================================

echo "  Generating Beat 5: Debate (17s)"

sox -n $SOUND_DIR/beat_05_layer1.wav synth 17 sine 98 sine 117.6 vol 0.14
sox -n $SOUND_DIR/beat_05_layer2.wav synth 17 sine 196 fade h 1 15 1 vol 0.10
sox -n $SOUND_DIR/beat_05_layer3.wav synth 17 sine 294 tremolo 0.8 30 vol 0.07
sox -m $SOUND_DIR/beat_05_layer1.wav \
       $SOUND_DIR/beat_05_layer2.wav \
       $SOUND_DIR/beat_05_layer3.wav \
       $SOUND_DIR/beat_05_mix.wav

# Add subtle reverb for space
sox $SOUND_DIR/beat_05_mix.wav \
    $SOUND_DIR/beat_05_final.wav \
    reverb 50 50 100 100 0 5

# Clean up layers
rm $SOUND_DIR/beat_05_layer*.wav $SOUND_DIR/beat_05_mix.wav


# ========================================
# BEAT 6: Break into Two
# Act: act2a | Texture: transition
# Duration: 44s
# ========================================

echo "  Generating Beat 6: Break into Two (44s)"

sox -n $SOUND_DIR/beat_06_layer1.wav synth 44 sine 110 sine 132.0 vol 0.14
sox -n $SOUND_DIR/beat_06_layer2.wav synth 44 sine 220 fade h 1 42 1 vol 0.10
sox -n $SOUND_DIR/beat_06_layer3.wav synth 44 sine 330 tremolo 0.8 30 vol 0.07
sox -m $SOUND_DIR/beat_06_layer1.wav \
       $SOUND_DIR/beat_06_layer2.wav \
       $SOUND_DIR/beat_06_layer3.wav \
       $SOUND_DIR/beat_06_mix.wav

# Add subtle reverb for space
sox $SOUND_DIR/beat_06_mix.wav \
    $SOUND_DIR/beat_06_final.wav \
    reverb 50 50 100 100 0 5

# Clean up layers
rm $SOUND_DIR/beat_06_layer*.wav $SOUND_DIR/beat_06_mix.wav


# ========================================
# BEAT 7: B Story
# Act: act2a | Texture: narrative
# Duration: 34s
# ========================================

echo "  Generating Beat 7: B Story (34s)"

sox -n $SOUND_DIR/beat_07_layer1.wav synth 34 sine 123 sine 147.6 vol 0.14
sox -n $SOUND_DIR/beat_07_layer2.wav synth 34 sine 246 fade h 1 32 1 vol 0.10
sox -n $SOUND_DIR/beat_07_layer3.wav synth 34 sine 369 tremolo 0.8 30 vol 0.07
sox -m $SOUND_DIR/beat_07_layer1.wav \
       $SOUND_DIR/beat_07_layer2.wav \
       $SOUND_DIR/beat_07_layer3.wav \
       $SOUND_DIR/beat_07_mix.wav

# Add subtle reverb for space
sox $SOUND_DIR/beat_07_mix.wav \
    $SOUND_DIR/beat_07_final.wav \
    reverb 50 50 100 100 0 5

# Clean up layers
rm $SOUND_DIR/beat_07_layer*.wav $SOUND_DIR/beat_07_mix.wav


# ========================================
# BEAT 8: Fun and Games
# Act: act2a | Texture: playful
# Duration: 38s
# ========================================

echo "  Generating Beat 8: Fun and Games (38s)"

sox -n $SOUND_DIR/beat_08_layer1.wav synth 38 sine 131 sine 157.2 vol 0.14
sox -n $SOUND_DIR/beat_08_layer2.wav synth 38 sine 262 fade h 1 36 1 vol 0.10
sox -n $SOUND_DIR/beat_08_layer3.wav synth 38 sine 393 tremolo 0.8 30 vol 0.07
sox -m $SOUND_DIR/beat_08_layer1.wav \
       $SOUND_DIR/beat_08_layer2.wav \
       $SOUND_DIR/beat_08_layer3.wav \
       $SOUND_DIR/beat_08_mix.wav

# Add subtle reverb for space
sox $SOUND_DIR/beat_08_mix.wav \
    $SOUND_DIR/beat_08_final.wav \
    reverb 50 50 100 100 0 5

# Clean up layers
rm $SOUND_DIR/beat_08_layer*.wav $SOUND_DIR/beat_08_mix.wav


# ========================================
# BEAT 9: Midpoint
# Act: act2a | Texture: peak
# Duration: 29s
# ========================================

echo "  Generating Beat 9: Midpoint (29s)"

sox -n $SOUND_DIR/beat_09_layer1.wav synth 29 sine 147 sine 220.5 vol 0.15
sox -n $SOUND_DIR/beat_09_layer2.wav synth 29 sine 294 sine 441.0 vol 0.12
sox -n $SOUND_DIR/beat_09_layer3.wav synth 29 sine 441 fade h 0 29 0 vol 0.09
sox -m $SOUND_DIR/beat_09_layer1.wav \
       $SOUND_DIR/beat_09_layer2.wav \
       $SOUND_DIR/beat_09_layer3.wav \
       $SOUND_DIR/beat_09_mix.wav

# Add subtle reverb for space
sox $SOUND_DIR/beat_09_mix.wav \
    $SOUND_DIR/beat_09_final.wav \
    reverb 50 50 100 100 0 5

# Clean up layers
rm $SOUND_DIR/beat_09_layer*.wav $SOUND_DIR/beat_09_mix.wav


# ========================================
# BEAT 10: Bad Guys Close In
# Act: act2a | Texture: dark
# Duration: 38s
# ========================================

echo "  Generating Beat 10: Bad Guys Close In (38s)"

sox -n $SOUND_DIR/beat_10_layer1.wav synth 38 sine 82.5 vol 0.18
sox -n $SOUND_DIR/beat_10_layer2.wav synth 38 sine 247.5 tremolo 0.3 20 vol 0.13
sox -n $SOUND_DIR/beat_10_layer3.wav synth 38 pinknoise vol 0.03 lowpass 330
sox -m $SOUND_DIR/beat_10_layer1.wav \
       $SOUND_DIR/beat_10_layer2.wav \
       $SOUND_DIR/beat_10_layer3.wav \
       $SOUND_DIR/beat_10_mix.wav

# Add subtle reverb for space
sox $SOUND_DIR/beat_10_mix.wav \
    $SOUND_DIR/beat_10_final.wav \
    reverb 50 50 100 100 0 5

# Clean up layers
rm $SOUND_DIR/beat_10_layer*.wav $SOUND_DIR/beat_10_mix.wav


# ========================================
# BEAT 11: All Is Lost
# Act: act2b | Texture: despair
# Duration: 30s
# ========================================

echo "  Generating Beat 11: All Is Lost (30s)"

sox -n $SOUND_DIR/beat_11_layer1.wav synth 30 sine 175 bend 0,-200,30 vol 0.16
sox -n $SOUND_DIR/beat_11_layer2.wav synth 30 sine 350 fade h 0 15.0 15.0 vol 0.12
sox -n $SOUND_DIR/beat_11_layer3.wav synth 30 pinknoise vol 0.04 fade h 0 30 0
sox -m $SOUND_DIR/beat_11_layer1.wav \
       $SOUND_DIR/beat_11_layer2.wav \
       $SOUND_DIR/beat_11_layer3.wav \
       $SOUND_DIR/beat_11_mix.wav

# Add subtle reverb for space
sox $SOUND_DIR/beat_11_mix.wav \
    $SOUND_DIR/beat_11_final.wav \
    reverb 50 50 100 100 0 5

# Clean up layers
rm $SOUND_DIR/beat_11_layer*.wav $SOUND_DIR/beat_11_mix.wav


# ========================================
# BEAT 12: Dark Night
# Act: act2b | Texture: abyss
# Duration: 24s
# ========================================

echo "  Generating Beat 12: Dark Night (24s)"

sox -n $SOUND_DIR/beat_12_layer1.wav synth 24 sine 46.25 vol 0.20
sox -n $SOUND_DIR/beat_12_layer2.wav synth 24 sine 185.0 tremolo 0.1 10 vol 0.15
sox -n $SOUND_DIR/beat_12_layer3.wav synth 24 brownnoise vol 0.05 lowpass 185
sox -m $SOUND_DIR/beat_12_layer1.wav \
       $SOUND_DIR/beat_12_layer2.wav \
       $SOUND_DIR/beat_12_layer3.wav \
       $SOUND_DIR/beat_12_mix.wav

# Add subtle reverb for space
sox $SOUND_DIR/beat_12_mix.wav \
    $SOUND_DIR/beat_12_final.wav \
    reverb 50 50 100 100 0 5

# Clean up layers
rm $SOUND_DIR/beat_12_layer*.wav $SOUND_DIR/beat_12_mix.wav


# ========================================
# BEAT 13: Break into Three
# Act: act3 | Texture: resolve
# Duration: 51s
# ========================================

echo "  Generating Beat 13: Break into Three (51s)"

sox -n $SOUND_DIR/beat_13_layer1.wav synth 51 sine 196 bend 0,100,51 vol 0.15
sox -n $SOUND_DIR/beat_13_layer2.wav synth 51 sine 392 fade h 0 51 0 vol 0.11
sox -n $SOUND_DIR/beat_13_layer3.wav synth 51 sine 588 sine 1176 vol 0.08
sox -m $SOUND_DIR/beat_13_layer1.wav \
       $SOUND_DIR/beat_13_layer2.wav \
       $SOUND_DIR/beat_13_layer3.wav \
       $SOUND_DIR/beat_13_mix.wav

# Add subtle reverb for space
sox $SOUND_DIR/beat_13_mix.wav \
    $SOUND_DIR/beat_13_final.wav \
    reverb 50 50 100 100 0 5

# Clean up layers
rm $SOUND_DIR/beat_13_layer*.wav $SOUND_DIR/beat_13_mix.wav


# ========================================
# BEAT 14: Finale
# Act: act3 | Texture: climax
# Duration: 30s
# ========================================

echo "  Generating Beat 14: Finale (30s)"

sox -n $SOUND_DIR/beat_14_layer1.wav synth 30 sine 220 sine 440 vol 0.17
sox -n $SOUND_DIR/beat_14_layer2.wav synth 30 sine 440 sine 660.0 tremolo 2 40 vol 0.14
sox -n $SOUND_DIR/beat_14_layer3.wav synth 30 sine 660 sine 1320 vol 0.10
sox -m $SOUND_DIR/beat_14_layer1.wav \
       $SOUND_DIR/beat_14_layer2.wav \
       $SOUND_DIR/beat_14_layer3.wav \
       $SOUND_DIR/beat_14_mix.wav

# Add subtle reverb for space
sox $SOUND_DIR/beat_14_mix.wav \
    $SOUND_DIR/beat_14_final.wav \
    reverb 50 50 100 100 0 5

# Clean up layers
rm $SOUND_DIR/beat_14_layer*.wav $SOUND_DIR/beat_14_mix.wav


# ========================================
# BEAT 15: Final Image
# Act: act3 | Texture: resolution
# Duration: 21s
# ========================================

echo "  Generating Beat 15: Final Image (21s)"

sox -n $SOUND_DIR/beat_15_layer1.wav synth 21 sine 233 sine 279.59999999999997 vol 0.14
sox -n $SOUND_DIR/beat_15_layer2.wav synth 21 sine 466 fade h 1 19 1 vol 0.10
sox -n $SOUND_DIR/beat_15_layer3.wav synth 21 sine 699 tremolo 0.8 30 vol 0.07
sox -m $SOUND_DIR/beat_15_layer1.wav \
       $SOUND_DIR/beat_15_layer2.wav \
       $SOUND_DIR/beat_15_layer3.wav \
       $SOUND_DIR/beat_15_mix.wav

# Add subtle reverb for space
sox $SOUND_DIR/beat_15_mix.wav \
    $SOUND_DIR/beat_15_final.wav \
    reverb 50 50 100 100 0 5

# Clean up layers
rm $SOUND_DIR/beat_15_layer*.wav $SOUND_DIR/beat_15_mix.wav


echo ""
echo "🎼 Assembling complete soundtrack..."

# Create list of all beat soundscapes
echo "file 'beat_01_final.wav'" >> $SOUND_DIR/concat.txt
echo "file 'beat_02_final.wav'" >> $SOUND_DIR/concat.txt
echo "file 'beat_03_final.wav'" >> $SOUND_DIR/concat.txt
echo "file 'beat_04_final.wav'" >> $SOUND_DIR/concat.txt
echo "file 'beat_05_final.wav'" >> $SOUND_DIR/concat.txt
echo "file 'beat_06_final.wav'" >> $SOUND_DIR/concat.txt
echo "file 'beat_07_final.wav'" >> $SOUND_DIR/concat.txt
echo "file 'beat_08_final.wav'" >> $SOUND_DIR/concat.txt
echo "file 'beat_09_final.wav'" >> $SOUND_DIR/concat.txt
echo "file 'beat_10_final.wav'" >> $SOUND_DIR/concat.txt
echo "file 'beat_11_final.wav'" >> $SOUND_DIR/concat.txt
echo "file 'beat_12_final.wav'" >> $SOUND_DIR/concat.txt
echo "file 'beat_13_final.wav'" >> $SOUND_DIR/concat.txt
echo "file 'beat_14_final.wav'" >> $SOUND_DIR/concat.txt
echo "file 'beat_15_final.wav'" >> $SOUND_DIR/concat.txt

# Concatenate all beats
sox $(ls $SOUND_DIR/beat_*_final.wav | sort) $SOUND_DIR/full_soundtrack.wav

# Convert to AAC for video
ffmpeg -i $SOUND_DIR/full_soundtrack.wav \
  -c:a aac -b:a 192k \
  -y ambient_soundtrack.m4a -loglevel error

echo ""
echo "✅ Ambient Soundtrack Complete!"
echo "📁 Output: ambient_soundtrack.m4a"
echo "🎵 15 unique sonic textures, one per beat"
echo "⏱️  Duration: 466s"
echo ""
echo "🎨 Sonic Palette:"
echo "   Beat  1: Opening Image        | drone        | act1"
echo "   Beat  2: Theme Stated         | shimmer      | act1"
echo "   Beat  3: Set-Up               | pulse        | act1"
echo "   Beat  4: Catalyst             | tension      | act1"
echo "   Beat  5: Debate               | debate       | act1"
echo "   Beat  6: Break into Two       | transition   | act2a"
echo "   Beat  7: B Story              | narrative    | act2a"
echo "   Beat  8: Fun and Games        | playful      | act2a"
echo "   Beat  9: Midpoint             | peak         | act2a"
echo "   Beat 10: Bad Guys Close In    | dark         | act2a"
echo "   Beat 11: All Is Lost          | despair      | act2b"
echo "   Beat 12: Dark Night           | abyss        | act2b"
echo "   Beat 13: Break into Three     | resolve      | act3"
echo "   Beat 14: Finale               | climax       | act3"
echo "   Beat 15: Final Image          | resolution   | act3"

echo ""
echo "💡 To use in render, edit render_cinematic.sh:"
echo "   Replace music generation with: -i ambient_soundtrack.m4a"
