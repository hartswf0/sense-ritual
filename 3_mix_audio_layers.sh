#!/bin/bash
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

echo "  Converting TTS 1/46..."
ffmpeg -i tts/clip_000.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_000.wav -loglevel error
echo "  Converting TTS 2/46..."
ffmpeg -i tts/clip_001.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_001.wav -loglevel error
echo "  Converting TTS 3/46..."
ffmpeg -i tts/clip_002.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_002.wav -loglevel error
echo "  Converting TTS 4/46..."
ffmpeg -i tts/clip_003.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_003.wav -loglevel error
echo "  Converting TTS 5/46..."
ffmpeg -i tts/clip_004.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_004.wav -loglevel error
echo "  Converting TTS 6/46..."
ffmpeg -i tts/clip_005.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_005.wav -loglevel error
echo "  Converting TTS 7/46..."
ffmpeg -i tts/clip_006.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_006.wav -loglevel error
echo "  Converting TTS 8/46..."
ffmpeg -i tts/clip_007.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_007.wav -loglevel error
echo "  Converting TTS 9/46..."
ffmpeg -i tts/clip_008.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_008.wav -loglevel error
echo "  Converting TTS 10/46..."
ffmpeg -i tts/clip_009.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_009.wav -loglevel error
echo "  Converting TTS 11/46..."
ffmpeg -i tts/clip_010.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_010.wav -loglevel error
echo "  Converting TTS 12/46..."
ffmpeg -i tts/clip_011.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_011.wav -loglevel error
echo "  Converting TTS 13/46..."
ffmpeg -i tts/clip_012.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_012.wav -loglevel error
echo "  Converting TTS 14/46..."
ffmpeg -i tts/clip_013.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_013.wav -loglevel error
echo "  Converting TTS 15/46..."
ffmpeg -i tts/clip_014.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_014.wav -loglevel error
echo "  Converting TTS 16/46..."
ffmpeg -i tts/clip_015.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_015.wav -loglevel error
echo "  Converting TTS 17/46..."
ffmpeg -i tts/clip_016.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_016.wav -loglevel error
echo "  Converting TTS 18/46..."
ffmpeg -i tts/clip_017.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_017.wav -loglevel error
echo "  Converting TTS 19/46..."
ffmpeg -i tts/clip_018.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_018.wav -loglevel error
echo "  Converting TTS 20/46..."
ffmpeg -i tts/clip_019.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_019.wav -loglevel error
echo "  Converting TTS 21/46..."
ffmpeg -i tts/clip_020.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_020.wav -loglevel error
echo "  Converting TTS 22/46..."
ffmpeg -i tts/clip_021.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_021.wav -loglevel error
echo "  Converting TTS 23/46..."
ffmpeg -i tts/clip_022.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_022.wav -loglevel error
echo "  Converting TTS 24/46..."
ffmpeg -i tts/clip_023.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_023.wav -loglevel error
echo "  Converting TTS 25/46..."
ffmpeg -i tts/clip_024.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_024.wav -loglevel error
echo "  Converting TTS 26/46..."
ffmpeg -i tts/clip_025.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_025.wav -loglevel error
echo "  Converting TTS 27/46..."
ffmpeg -i tts/clip_026.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_026.wav -loglevel error
echo "  Converting TTS 28/46..."
ffmpeg -i tts/clip_027.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_027.wav -loglevel error
echo "  Converting TTS 29/46..."
ffmpeg -i tts/clip_028.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_028.wav -loglevel error
echo "  Converting TTS 30/46..."
ffmpeg -i tts/clip_029.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_029.wav -loglevel error
echo "  Converting TTS 31/46..."
ffmpeg -i tts/clip_030.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_030.wav -loglevel error
echo "  Converting TTS 32/46..."
ffmpeg -i tts/clip_031.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_031.wav -loglevel error
echo "  Converting TTS 33/46..."
ffmpeg -i tts/clip_032.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_032.wav -loglevel error
echo "  Converting TTS 34/46..."
ffmpeg -i tts/clip_033.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_033.wav -loglevel error
echo "  Converting TTS 35/46..."
ffmpeg -i tts/clip_034.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_034.wav -loglevel error
echo "  Converting TTS 36/46..."
ffmpeg -i tts/clip_035.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_035.wav -loglevel error
echo "  Converting TTS 37/46..."
ffmpeg -i tts/clip_036.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_036.wav -loglevel error
echo "  Converting TTS 38/46..."
ffmpeg -i tts/clip_037.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_037.wav -loglevel error
echo "  Converting TTS 39/46..."
ffmpeg -i tts/clip_038.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_038.wav -loglevel error
echo "  Converting TTS 40/46..."
ffmpeg -i tts/clip_039.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_039.wav -loglevel error
echo "  Converting TTS 41/46..."
ffmpeg -i tts/clip_040.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_040.wav -loglevel error
echo "  Converting TTS 42/46..."
ffmpeg -i tts/clip_041.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_041.wav -loglevel error
echo "  Converting TTS 43/46..."
ffmpeg -i tts/clip_042.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_042.wav -loglevel error
echo "  Converting TTS 44/46..."
ffmpeg -i tts/clip_043.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_043.wav -loglevel error
echo "  Converting TTS 45/46..."
ffmpeg -i tts/clip_044.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_044.wav -loglevel error
echo "  Converting TTS 46/46..."
ffmpeg -i tts/clip_045.aiff -ar 48000 -ac 2 $TEMP_DIR/tts_045.wav -loglevel error

echo ""
echo "Step 2: Concatenate all TTS with silence gaps..."

# Create concat list with proper timing
cat > $TEMP_DIR/tts_concat.txt << 'EOFCONCAT'
file 'tts_000.wav'
file 'tts_001.wav'
file 'tts_002.wav'
file 'tts_003.wav'
file 'tts_004.wav'
file 'tts_005.wav'
file 'tts_006.wav'
file 'tts_007.wav'
file 'tts_008.wav'
file 'tts_009.wav'
file 'tts_010.wav'
file 'tts_011.wav'
file 'tts_012.wav'
file 'tts_013.wav'
file 'tts_014.wav'
file 'tts_015.wav'
file 'tts_016.wav'
file 'tts_017.wav'
file 'tts_018.wav'
file 'tts_019.wav'
file 'tts_020.wav'
file 'tts_021.wav'
file 'tts_022.wav'
file 'tts_023.wav'
file 'tts_024.wav'
file 'tts_025.wav'
file 'tts_026.wav'
file 'tts_027.wav'
file 'tts_028.wav'
file 'tts_029.wav'
file 'tts_030.wav'
file 'tts_031.wav'
file 'tts_032.wav'
file 'tts_033.wav'
file 'tts_034.wav'
file 'tts_035.wav'
file 'tts_036.wav'
file 'tts_037.wav'
file 'tts_038.wav'
file 'tts_039.wav'
file 'tts_040.wav'
file 'tts_041.wav'
file 'tts_042.wav'
file 'tts_043.wav'
file 'tts_044.wav'
file 'tts_045.wav'
EOFCONCAT

ffmpeg -f concat -safe 0 -i $TEMP_DIR/tts_concat.txt -c:a pcm_s16le -y $TEMP_DIR/tts_full.wav -loglevel error

echo ""
echo "Step 3: Mix ambient + TTS..."

# Convert ambient to WAV
ffmpeg -i ambient_soundtrack.m4a -ar 48000 -ac 2 $TEMP_DIR/ambient.wav -loglevel error

# Mix: ambient at 30% + TTS at 100%
ffmpeg -i $TEMP_DIR/ambient.wav -i $TEMP_DIR/tts_full.wav \
  -filter_complex "[0:a]volume=0.3[ambient];[1:a]volume=1.0[narration];[ambient][narration]amix=inputs=2:duration=first[a]" \
  -map "[a]" \
  -c:a aac -b:a 256k \
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
