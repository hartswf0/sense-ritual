#!/usr/bin/env python3
"""
FIX TWO MAJOR ISSUES:
1. Video diversity - swap redundant clips with unused alternatives
2. Timing mismatch - recalculate actual durations from real video files
"""

import json
import os
import subprocess
from collections import defaultdict, Counter

print("🔧 COMPREHENSIVE FIX: Diversity + Timing")
print("=" * 80)

# Load current manifest
with open('timing_manifest.json', 'r') as f:
    manifest = json.load(f)

# Step 1: Get actual video durations from files
print("\n📏 STEP 1: Measuring actual video durations...")
actual_durations = {}
for clip in manifest['clips']:
    video_file = clip['video_file']
    if video_file not in actual_durations:
        try:
            result = subprocess.run([
                'ffprobe', '-v', 'error',
                '-show_entries', 'format=duration',
                '-of', 'default=noprint_wrappers=1:nokey=1',
                video_file
            ], capture_output=True, text=True)
            duration = float(result.stdout.strip())
            actual_durations[video_file] = duration
            print(f"  ✓ {os.path.basename(video_file)[:50]}: {duration:.1f}s")
        except:
            print(f"  ✗ Could not read: {video_file}")
            actual_durations[video_file] = clip['duration']  # fallback

# Step 2: Find all available videos per concept
print("\n🎬 STEP 2: Cataloging all available videos by concept...")
all_videos = defaultdict(list)
for file in os.listdir('NICK/'):
    if file.endswith('.mp4'):
        # Extract concept from filename (e.g., "Individual_Self_scene_...")
        concept = file.split('_scene_')[0] if '_scene_' in file else file.split('.')[0]
        full_path = f'NICK/{file}'
        
        # Get duration
        try:
            result = subprocess.run([
                'ffprobe', '-v', 'error',
                '-show_entries', 'format=duration',
                '-of', 'default=noprint_wrappers=1:nokey=1',
                full_path
            ], capture_output=True, text=True)
            duration = float(result.stdout.strip())
            all_videos[concept].append({
                'path': full_path,
                'filename': file,
                'duration': duration
            })
        except:
            pass

for concept, videos in sorted(all_videos.items()):
    print(f"  {concept}: {len(videos)} variants")

# Step 3: Identify redundant uses
print("\n🔄 STEP 3: Finding redundant clip uses...")
used_videos = [clip['video_file'] for clip in manifest['clips']]
usage_count = Counter(used_videos)
redundant = {path: count for path, count in usage_count.items() if count > 1}

print(f"  Total uses: {len(used_videos)}")
print(f"  Unique videos: {len(set(used_videos))}")
print(f"  Redundant uses: {sum(v-1 for v in redundant.values())}")

# Step 4: Create diversity-optimized manifest
print("\n🌈 STEP 4: Generating diversity-optimized manifest...")
used_per_concept = defaultdict(set)
new_clips = []
total_time = 0

for beat_idx, beat in enumerate(manifest['beats']):
    beat_start = total_time
    beat_clips = []
    
    for clip in beat['clips']:
        # Extract concept from current video
        video_file = clip['video_file']
        basename = os.path.basename(video_file)
        concept = basename.split('_scene_')[0] if '_scene_' in basename else basename.split('.')[0]
        
        # Find unused alternative for this concept
        available = all_videos.get(concept, [])
        
        # Prefer unused videos
        unused = [v for v in available if v['path'] not in used_per_concept[concept]]
        
        if unused:
            selected = unused[0]  # Pick first unused
        elif available:
            selected = available[0]  # Fallback to any variant
        else:
            # Keep original if no alternatives
            selected = {
                'path': video_file,
                'filename': os.path.basename(video_file),
                'duration': actual_durations.get(video_file, clip['duration'])
            }
        
        # Mark as used
        used_per_concept[concept].add(selected['path'])
        
        # Create new clip entry with actual duration
        new_clip = {
            'global_index': clip['global_index'],
            'beat_index': clip['beat_index'],
            'title': clip['title'],
            'quote': clip['quote'],
            'duration': min(selected['duration'], 20),  # Cap at 20s to match original intent
            'start_time': total_time,
            'end_time': total_time + min(selected['duration'], 20),
            'video_file': selected['path'],
            'tts_file': clip['tts_file'],
            'icon': clip['icon'],
            'category': clip['category']
        }
        
        total_time += new_clip['duration']
        beat_clips.append(new_clip)
        new_clips.append(new_clip)
    
    beat['clips'] = beat_clips
    beat['start_time'] = beat_start
    beat['end_time'] = total_time
    beat['duration'] = total_time - beat_start

# Update manifest
manifest['clips'] = new_clips
manifest['total_duration'] = total_time

# Save new manifest
with open('timing_manifest_optimized.json', 'w') as f:
    json.dump(manifest, f, indent=2)

print(f"\n✅ OPTIMIZED MANIFEST CREATED")
print(f"   File: timing_manifest_optimized.json")
print(f"   Total duration: {total_time:.1f}s ({int(total_time)//60}:{int(total_time)%60:02d})")
print(f"   Unique videos used: {len(set(c['video_file'] for c in new_clips))}/{len(new_clips)}")

# Step 5: Show diversity improvement
print("\n📊 DIVERSITY IMPROVEMENT:")
old_unique = len(set(used_videos))
new_unique = len(set(c['video_file'] for c in new_clips))
print(f"   Before: {old_unique}/46 unique videos")
print(f"   After:  {new_unique}/46 unique videos")
print(f"   Improvement: +{new_unique - old_unique} more variety")

print("\n🎵 NEXT STEPS:")
print("   1. Regenerate ambient music for correct duration:")
print(f"      Duration needed: {total_time}s")
print("   2. Regenerate TTS if quotes/timing changed")
print("   3. Render with optimized manifest")
