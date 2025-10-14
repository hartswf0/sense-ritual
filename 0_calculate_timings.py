#!/usr/bin/env python3
"""
Calculate exact timings for all components
Output: timing_manifest.json
"""

import json

with open('filter-bubbles-documentary.oti.json', 'r') as f:
    oti = json.load(f)

manifest = {
    "title": oti['title'],
    "total_duration": 0,
    "beats": [],
    "clips": []
}

clip_global_index = 0
total_time = 0

for seq in oti['sequences']:
    beat_info = {
        "beat_number": seq['beatNumber'],
        "beat_name": seq['beatName'],
        "act": seq['act'],
        "start_time": total_time,
        "clips": [],
        "duration": 0
    }
    
    for clip in seq['clips']:
        clip_info = {
            "global_index": clip_global_index,
            "beat_index": len(beat_info['clips']),
            "title": clip['title'],
            "quote": clip['quote'],
            "duration": clip['duration'],
            "start_time": total_time,
            "end_time": total_time + clip['duration'],
            "video_file": clip['videoFile'],
            "tts_file": f"tts/clip_{str(clip_global_index).zfill(3)}.aiff",
            "icon": clip['icon'],
            "category": clip['category']
        }
        
        beat_info['clips'].append(clip_info)
        manifest['clips'].append(clip_info)
        beat_info['duration'] += clip['duration']
        total_time += clip['duration']
        clip_global_index += 1
    
    beat_info['end_time'] = total_time
    manifest['beats'].append(beat_info)

manifest['total_duration'] = total_time

# Save manifest
with open('timing_manifest.json', 'w') as f:
    json.dump(manifest, f, indent=2)

print("✅ Timing Manifest Generated")
print(f"   Total clips: {len(manifest['clips'])}")
print(f"   Total duration: {manifest['total_duration']}s ({manifest['total_duration']//60}:{manifest['total_duration']%60:02d})")
print(f"   Total beats: {len(manifest['beats'])}")
print()
print("📊 Beat Durations:")
for beat in manifest['beats']:
    print(f"   Beat {beat['beat_number']:2d}: {beat['beat_name']:<20} {beat['duration']:3d}s  ({beat['start_time']:3d}s → {beat['end_time']:3d}s)")
print()
print("📁 Output: timing_manifest.json")
