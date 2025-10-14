#!/bin/bash
# Test TTS generation for ONE clip
# This verifies timing before generating all 46

set -e

echo "🎙️  Testing TTS Generation"
echo ""

# Test clip (first one)
TEST_QUOTE="Algorithms isolate us in personalized realities."
TEST_DURATION=20  # seconds
TARGET_FILE="test_tts.aiff"

echo "Test quote: \"$TEST_QUOTE\""
echo "Target duration: ${TEST_DURATION}s"
echo ""

# Generate TTS at different rates
for RATE in 120 150 180 200; do
    echo "Testing rate: $RATE words/minute..."
    say -v Alex -r $RATE "$TEST_QUOTE" -o "test_rate_${RATE}.aiff"
    
    # Get actual duration
    ACTUAL=$(ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "test_rate_${RATE}.aiff" 2>/dev/null)
    ACTUAL_INT=$(printf "%.0f" $ACTUAL)
    
    echo "  Generated duration: ${ACTUAL}s (${ACTUAL_INT}s rounded)"
    echo "  Fits in ${TEST_DURATION}s clip: $([ $ACTUAL_INT -le $TEST_DURATION ] && echo '✅ YES' || echo '❌ NO')"
    echo ""
done

echo "📊 Recommendation:"
echo "   For 20s clip with this quote length:"
echo "   • Rate 120: Too slow, may exceed clip time"
echo "   • Rate 150: Good balance ✓"
echo "   • Rate 180: Faster, more room"
echo "   • Rate 200: Very fast, hard to understand"
echo ""
echo "💡 Use rate 150-180 for most clips"
echo ""
echo "🧹 Cleaning up test files..."
rm -f test_rate_*.aiff
