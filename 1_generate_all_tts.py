#!/usr/bin/env python3
"""
Generate TTS for all 46 clips
Uses timing_manifest.json for exact durations
"""

import json
import subprocess
import os

# Load timing manifest
with open('timing_manifest.json', 'r') as f:
    manifest = json.load(f)

# Create TTS directory
os.makedirs('tts', exist_ok=True)

print(f"🎙️  Generating TTS for {len(manifest['clips'])} clips")
print(f"   Voice: Alex")
print(f"   Rate: 160 words/minute (adaptive)")
print()

success_count = 0
failures = []

for clip in manifest['clips']:
    idx = clip['global_index']
    quote = clip['quote']
    duration = clip['duration']
    output_file = clip['tts_file']
    
    print(f"[{idx+1}/{len(manifest['clips'])}] {clip['title'][:40]}")
    print(f"   Target: {duration}s | Quote: {len(quote)} chars")
    
    # Adaptive rate based on quote length and duration
    # Rough estimate: ~10-15 characters per second at normal speed
    chars_per_sec = len(quote) / duration
    
    if chars_per_sec > 20:
        rate = 200  # Fast
    elif chars_per_sec > 15:
        rate = 180  # Medium-fast
    elif chars_per_sec > 10:
        rate = 160  # Normal
    else:
        rate = 140  # Slow, contemplative
    
    print(f"   Using rate: {rate} wpm")
    
    try:
        # Generate TTS
        subprocess.run([
            'say', '-v', 'Alex', '-r', str(rate),
            quote, '-o', output_file
        ], check=True, capture_output=True)
        
        # Verify duration
        result = subprocess.run([
            'ffprobe', '-v', 'error',
            '-show_entries', 'format=duration',
            '-of', 'default=noprint_wrappers=1:nokey=1',
            output_file
        ], capture_output=True, text=True)
        
        actual_duration = float(result.stdout.strip())
        
        if actual_duration <= duration + 1:  # Allow 1s buffer
            print(f"   ✓ Generated: {actual_duration:.1f}s")
            success_count += 1
        else:
            print(f"   ⚠️  Warning: {actual_duration:.1f}s (exceeds {duration}s)")
            success_count += 1
            
    except Exception as e:
        print(f"   ✗ Error: {e}")
        failures.append((idx, clip['title']))
    
    print()

print(f"✅ TTS Generation Complete")
print(f"   Success: {success_count}/{len(manifest['clips'])}")
if failures:
    print(f"   Failures: {len(failures)}")
    for idx, title in failures:
        print(f"      - Clip {idx}: {title}")
print()
print(f"📁 Output: tts/ directory ({success_count} files)")
