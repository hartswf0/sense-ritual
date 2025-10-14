#!/bin/bash
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


echo "  Beat  1: Opening Image             (33s) - drone"

# Generate 3 layers at different frequencies
sox -n ambient/beat_01_layer1.wav synth 33 sine 65 vol 0.15 fade h 2 29 2 2>/dev/null
sox -n ambient/beat_01_layer2.wav synth 33 sine 130 vol 0.10 fade h 3 27 3 2>/dev/null
sox -n ambient/beat_01_layer3.wav synth 33 sine 195 vol 0.08 fade h 2 29 2 2>/dev/null

# Mix layers
sox -m ambient/beat_01_layer*.wav ambient/beat_01_mix.wav 2>/dev/null

# Add reverb for space
sox ambient/beat_01_mix.wav ambient/beat_01_final.wav reverb 50 50 100 100 0 5 2>/dev/null

# Clean up
rm ambient/beat_01_layer*.wav ambient/beat_01_mix.wav


echo "  Beat  2: Theme Stated              (22s) - shimmer"

# Generate 3 layers at different frequencies
sox -n ambient/beat_02_layer1.wav synth 22 sine 73 vol 0.15 fade h 2 18 2 2>/dev/null
sox -n ambient/beat_02_layer2.wav synth 22 sine 146 vol 0.10 fade h 3 16 3 2>/dev/null
sox -n ambient/beat_02_layer3.wav synth 22 sine 219 vol 0.08 fade h 2 18 2 2>/dev/null

# Mix layers
sox -m ambient/beat_02_layer*.wav ambient/beat_02_mix.wav 2>/dev/null

# Add reverb for space
sox ambient/beat_02_mix.wav ambient/beat_02_final.wav reverb 50 50 100 100 0 5 2>/dev/null

# Clean up
rm ambient/beat_02_layer*.wav ambient/beat_02_mix.wav


echo "  Beat  3: Set-Up                    (31s) - pulse"

# Generate 3 layers at different frequencies
sox -n ambient/beat_03_layer1.wav synth 31 sine 82 vol 0.15 fade h 2 27 2 2>/dev/null
sox -n ambient/beat_03_layer2.wav synth 31 sine 164 vol 0.10 fade h 3 25 3 2>/dev/null
sox -n ambient/beat_03_layer3.wav synth 31 sine 246 vol 0.08 fade h 2 27 2 2>/dev/null

# Mix layers
sox -m ambient/beat_03_layer*.wav ambient/beat_03_mix.wav 2>/dev/null

# Add reverb for space
sox ambient/beat_03_mix.wav ambient/beat_03_final.wav reverb 50 50 100 100 0 5 2>/dev/null

# Clean up
rm ambient/beat_03_layer*.wav ambient/beat_03_mix.wav


echo "  Beat  4: Catalyst                  (24s) - tension"

# Generate 3 layers at different frequencies
sox -n ambient/beat_04_layer1.wav synth 24 sine 87 vol 0.15 fade h 2 20 2 2>/dev/null
sox -n ambient/beat_04_layer2.wav synth 24 sine 174 vol 0.10 fade h 3 18 3 2>/dev/null
sox -n ambient/beat_04_layer3.wav synth 24 sine 261 vol 0.08 fade h 2 20 2 2>/dev/null

# Mix layers
sox -m ambient/beat_04_layer*.wav ambient/beat_04_mix.wav 2>/dev/null

# Add reverb for space
sox ambient/beat_04_mix.wav ambient/beat_04_final.wav reverb 50 50 100 100 0 5 2>/dev/null

# Clean up
rm ambient/beat_04_layer*.wav ambient/beat_04_mix.wav


echo "  Beat  5: Debate                    (17s) - debate"

# Generate 3 layers at different frequencies
sox -n ambient/beat_05_layer1.wav synth 17 sine 98 vol 0.15 fade h 2 13 2 2>/dev/null
sox -n ambient/beat_05_layer2.wav synth 17 sine 196 vol 0.10 fade h 3 11 3 2>/dev/null
sox -n ambient/beat_05_layer3.wav synth 17 sine 294 vol 0.08 fade h 2 13 2 2>/dev/null

# Mix layers
sox -m ambient/beat_05_layer*.wav ambient/beat_05_mix.wav 2>/dev/null

# Add reverb for space
sox ambient/beat_05_mix.wav ambient/beat_05_final.wav reverb 50 50 100 100 0 5 2>/dev/null

# Clean up
rm ambient/beat_05_layer*.wav ambient/beat_05_mix.wav


echo "  Beat  6: Break into Two            (44s) - transition"

# Generate 3 layers at different frequencies
sox -n ambient/beat_06_layer1.wav synth 44 sine 110 vol 0.15 fade h 2 40 2 2>/dev/null
sox -n ambient/beat_06_layer2.wav synth 44 sine 220 vol 0.10 fade h 3 38 3 2>/dev/null
sox -n ambient/beat_06_layer3.wav synth 44 sine 330 vol 0.08 fade h 2 40 2 2>/dev/null

# Mix layers
sox -m ambient/beat_06_layer*.wav ambient/beat_06_mix.wav 2>/dev/null

# Add reverb for space
sox ambient/beat_06_mix.wav ambient/beat_06_final.wav reverb 50 50 100 100 0 5 2>/dev/null

# Clean up
rm ambient/beat_06_layer*.wav ambient/beat_06_mix.wav


echo "  Beat  7: B Story                   (34s) - narrative"

# Generate 3 layers at different frequencies
sox -n ambient/beat_07_layer1.wav synth 34 sine 123 vol 0.15 fade h 2 30 2 2>/dev/null
sox -n ambient/beat_07_layer2.wav synth 34 sine 246 vol 0.10 fade h 3 28 3 2>/dev/null
sox -n ambient/beat_07_layer3.wav synth 34 sine 369 vol 0.08 fade h 2 30 2 2>/dev/null

# Mix layers
sox -m ambient/beat_07_layer*.wav ambient/beat_07_mix.wav 2>/dev/null

# Add reverb for space
sox ambient/beat_07_mix.wav ambient/beat_07_final.wav reverb 50 50 100 100 0 5 2>/dev/null

# Clean up
rm ambient/beat_07_layer*.wav ambient/beat_07_mix.wav


echo "  Beat  8: Fun and Games             (38s) - playful"

# Generate 3 layers at different frequencies
sox -n ambient/beat_08_layer1.wav synth 38 sine 131 vol 0.15 fade h 2 34 2 2>/dev/null
sox -n ambient/beat_08_layer2.wav synth 38 sine 262 vol 0.10 fade h 3 32 3 2>/dev/null
sox -n ambient/beat_08_layer3.wav synth 38 sine 393 vol 0.08 fade h 2 34 2 2>/dev/null

# Mix layers
sox -m ambient/beat_08_layer*.wav ambient/beat_08_mix.wav 2>/dev/null

# Add reverb for space
sox ambient/beat_08_mix.wav ambient/beat_08_final.wav reverb 50 50 100 100 0 5 2>/dev/null

# Clean up
rm ambient/beat_08_layer*.wav ambient/beat_08_mix.wav


echo "  Beat  9: Midpoint                  (29s) - peak"

# Generate 3 layers at different frequencies
sox -n ambient/beat_09_layer1.wav synth 29 sine 147 vol 0.15 fade h 2 25 2 2>/dev/null
sox -n ambient/beat_09_layer2.wav synth 29 sine 294 vol 0.10 fade h 3 23 3 2>/dev/null
sox -n ambient/beat_09_layer3.wav synth 29 sine 441 vol 0.08 fade h 2 25 2 2>/dev/null

# Mix layers
sox -m ambient/beat_09_layer*.wav ambient/beat_09_mix.wav 2>/dev/null

# Add reverb for space
sox ambient/beat_09_mix.wav ambient/beat_09_final.wav reverb 50 50 100 100 0 5 2>/dev/null

# Clean up
rm ambient/beat_09_layer*.wav ambient/beat_09_mix.wav


echo "  Beat 10: Bad Guys Close In         (38s) - dark"

# Generate 3 layers at different frequencies
sox -n ambient/beat_10_layer1.wav synth 38 sine 165 vol 0.15 fade h 2 34 2 2>/dev/null
sox -n ambient/beat_10_layer2.wav synth 38 sine 330 vol 0.10 fade h 3 32 3 2>/dev/null
sox -n ambient/beat_10_layer3.wav synth 38 sine 495 vol 0.08 fade h 2 34 2 2>/dev/null

# Mix layers
sox -m ambient/beat_10_layer*.wav ambient/beat_10_mix.wav 2>/dev/null

# Add reverb for space
sox ambient/beat_10_mix.wav ambient/beat_10_final.wav reverb 50 50 100 100 0 5 2>/dev/null

# Clean up
rm ambient/beat_10_layer*.wav ambient/beat_10_mix.wav


echo "  Beat 11: All Is Lost               (30s) - despair"

# Generate 3 layers at different frequencies
sox -n ambient/beat_11_layer1.wav synth 30 sine 175 vol 0.15 fade h 2 26 2 2>/dev/null
sox -n ambient/beat_11_layer2.wav synth 30 sine 350 vol 0.10 fade h 3 24 3 2>/dev/null
sox -n ambient/beat_11_layer3.wav synth 30 sine 525 vol 0.08 fade h 2 26 2 2>/dev/null

# Mix layers
sox -m ambient/beat_11_layer*.wav ambient/beat_11_mix.wav 2>/dev/null

# Add reverb for space
sox ambient/beat_11_mix.wav ambient/beat_11_final.wav reverb 50 50 100 100 0 5 2>/dev/null

# Clean up
rm ambient/beat_11_layer*.wav ambient/beat_11_mix.wav


echo "  Beat 12: Dark Night of the Soul    (24s) - abyss"

# Generate 3 layers at different frequencies
sox -n ambient/beat_12_layer1.wav synth 24 sine 185 vol 0.15 fade h 2 20 2 2>/dev/null
sox -n ambient/beat_12_layer2.wav synth 24 sine 370 vol 0.10 fade h 3 18 3 2>/dev/null
sox -n ambient/beat_12_layer3.wav synth 24 sine 555 vol 0.08 fade h 2 20 2 2>/dev/null

# Mix layers
sox -m ambient/beat_12_layer*.wav ambient/beat_12_mix.wav 2>/dev/null

# Add reverb for space
sox ambient/beat_12_mix.wav ambient/beat_12_final.wav reverb 50 50 100 100 0 5 2>/dev/null

# Clean up
rm ambient/beat_12_layer*.wav ambient/beat_12_mix.wav


echo "  Beat 13: Break into Three          (51s) - resolve"

# Generate 3 layers at different frequencies
sox -n ambient/beat_13_layer1.wav synth 51 sine 196 vol 0.15 fade h 2 47 2 2>/dev/null
sox -n ambient/beat_13_layer2.wav synth 51 sine 392 vol 0.10 fade h 3 45 3 2>/dev/null
sox -n ambient/beat_13_layer3.wav synth 51 sine 588 vol 0.08 fade h 2 47 2 2>/dev/null

# Mix layers
sox -m ambient/beat_13_layer*.wav ambient/beat_13_mix.wav 2>/dev/null

# Add reverb for space
sox ambient/beat_13_mix.wav ambient/beat_13_final.wav reverb 50 50 100 100 0 5 2>/dev/null

# Clean up
rm ambient/beat_13_layer*.wav ambient/beat_13_mix.wav


echo "  Beat 14: Finale                    (30s) - climax"

# Generate 3 layers at different frequencies
sox -n ambient/beat_14_layer1.wav synth 30 sine 220 vol 0.15 fade h 2 26 2 2>/dev/null
sox -n ambient/beat_14_layer2.wav synth 30 sine 440 vol 0.10 fade h 3 24 3 2>/dev/null
sox -n ambient/beat_14_layer3.wav synth 30 sine 660 vol 0.08 fade h 2 26 2 2>/dev/null

# Mix layers
sox -m ambient/beat_14_layer*.wav ambient/beat_14_mix.wav 2>/dev/null

# Add reverb for space
sox ambient/beat_14_mix.wav ambient/beat_14_final.wav reverb 50 50 100 100 0 5 2>/dev/null

# Clean up
rm ambient/beat_14_layer*.wav ambient/beat_14_mix.wav


echo "  Beat 15: Final Image               (21s) - resolution"

# Generate 3 layers at different frequencies
sox -n ambient/beat_15_layer1.wav synth 21 sine 233 vol 0.15 fade h 2 17 2 2>/dev/null
sox -n ambient/beat_15_layer2.wav synth 21 sine 466 vol 0.10 fade h 3 15 3 2>/dev/null
sox -n ambient/beat_15_layer3.wav synth 21 sine 699 vol 0.08 fade h 2 17 2 2>/dev/null

# Mix layers
sox -m ambient/beat_15_layer*.wav ambient/beat_15_mix.wav 2>/dev/null

# Add reverb for space
sox ambient/beat_15_mix.wav ambient/beat_15_final.wav reverb 50 50 100 100 0 5 2>/dev/null

# Clean up
rm ambient/beat_15_layer*.wav ambient/beat_15_mix.wav


echo ""
echo "🎼 Assembling full soundtrack..."

# Concatenate in order
sox $(ls ambient/beat_*_final.wav | sort) ambient/full_soundtrack.wav 2>/dev/null

# Convert to AAC
ffmpeg -i ambient/full_soundtrack.wav -c:a aac -b:a 192k -y ambient_soundtrack.m4a -loglevel error

echo ""
echo "✅ Ambient soundtrack complete!"
echo "📁 ambient_soundtrack.m4a (466s)
echo ""
ls -lh ambient_soundtrack.m4a
