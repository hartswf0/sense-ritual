#!/usr/bin/env python3
import json

# Load video codex for file mappings
with open('NICK/video-codex.json', 'r') as f:
    codex = json.load(f)

def get_video(clip_id):
    """Get recommended video file path for a clip ID"""
    concept = codex['concepts'].get(clip_id, {})
    videos = concept.get('videos', [])
    for v in videos:
        if v.get('recommended'):
            return f"NICK/{v['file']}"
    return f"NICK/{videos[0]['file']}" if videos else f"NICK/{clip_id}.mp4"

# Complete documentary structure - all 46 shots
oti = {
    "version": "1.0",
    "title": "Filter Bubbles: A Documentary",
    "logline": "A documentary assembled through interactive gameplay in Matrix Editor",
    "timestamp": "2025-10-14T06:02:00.000Z",
    "coherenceScore": 3310,
    "sourceVideo": "NICK/",
    "sourceTool": "Matrix Editor",
    "metadata": {
        "totalClips": 46,
        "totalDuration": 466,
        "beatsCollected": 15,
        "tool": "Matrix Editor",
        "videoDirectory": "NICK/"
    },
    "sequences": []
}

# All 15 beats with complete clip data
beats_data = [
    # Beat 1
    {"beat": 1, "name": "Opening Image", "act": "act1", "syntagma": "PS", "clips": [
        {"id": "filter-bubble-isolation", "title": "Filter Bubbles", "cat": "Media Apparatus", "icon": "◡", "dur": 20, "desc": "Algorithms isolate us in personalized realities.", "quote": "Algorithms isolate us in personalized realities."},
        {"id": "zubaydah-diary-fragments", "title": "Zubaydah's Diary", "cat": "Personal Apparatus", "icon": "◗", "dur": 6, "desc": "Memories in fragments, nothing linked them, made no sense.", "quote": "Memories in fragments, nothing linked them, made no sense."},
        {"id": "afeni-fairyland-conceal", "title": "Unreal Fairyland", "cat": "Systemic Critique", "icon": "◑", "dur": 7, "desc": "The world that concealed the harsh reality of power.", "quote": "The world that concealed the harsh reality of power."}
    ]},
    # Beat 2
    {"beat": 2, "name": "Theme Stated", "act": "act1", "syntagma": "PS", "clips": [
        {"id": "mass-incarceration-clinton", "title": "Mass Incarceration", "cat": "Systemic Control", "icon": "◕", "dur": 8, "desc": "Hundreds of thousands imprisoned with no hope of parole.", "quote": "Hundreds of thousands imprisoned with no hope of parole."},
        {"id": "afeni-fairyland-conceal", "title": "Unreal Fairyland", "cat": "Systemic Critique", "icon": "◑", "dur": 7, "desc": "The world that concealed the harsh reality of power.", "quote": "The world that concealed the harsh reality of power.", "alt": 1},
        {"id": "society-boom-q", "title": "Societal Boom", "cat": "Systemic Control", "icon": "◓", "dur": 7, "desc": "Society lets you go far, but as soon as you ask questions, boom.", "quote": "Society lets you go far, but as soon as you ask questions, boom."}
    ]},
    # Beat 3
    {"beat": 3, "name": "Set-Up", "act": "act1", "syntagma": "PS", "clips": [
        {"id": "zubaydah-perpetual-now", "title": "Perpetual Now", "cat": "Emotional State", "icon": "◙", "dur": 7, "desc": "Trapped in perpetual now, haunted by fragments.", "quote": "Trapped in perpetual now, haunted by fragments."},
        {"id": "cia-godzilla-fear", "title": "Godzilla Fear", "cat": "Systemic Impact", "icon": "◛", "dur": 11, "desc": "Disconnected memories spread fear across America.", "quote": "Disconnected memories spread fear across America."},
        {"id": "complexity-theory-patterns", "title": "Complexity Theory", "cat": "Scientific Theory", "icon": "◝", "dur": 13, "desc": "Computers see hidden patterns, make chaos manageable.", "quote": "Computers see hidden patterns, make chaos manageable."}
    ]},
    # Beat 4
    {"beat": 4, "name": "Catalyst", "act": "act1", "syntagma": "PS", "clips": [
        {"id": "zubaydah-diary-fragments", "title": "Zubaydah's Diary", "cat": "Personal Apparatus", "icon": "◗", "dur": 6, "desc": "Memories in fragments, nothing linked them, made no sense.", "quote": "Memories in fragments, nothing linked them, made no sense.", "alt": 1},
        {"id": "jihad-disintegration-factions", "title": "Jihad Disintegration", "cat": "Systemic Event", "icon": "◘", "dur": 11, "desc": "Organization disintegrating, all solidarity gone.", "quote": "Organization disintegrating, all solidarity gone."},
        {"id": "society-boom-q", "title": "Societal Boom", "cat": "Systemic Control", "icon": "◓", "dur": 7, "desc": "Society lets you go far, but as soon as you ask questions, boom.", "quote": "Society lets you go far, but as soon as you ask questions, boom.", "alt": 1}
    ]},
    # Beat 5
    {"beat": 5, "name": "Debate", "act": "act1", "syntagma": "PS", "clips": [
        {"id": "society-boom-q", "title": "Societal Boom", "cat": "Systemic Control", "icon": "◓", "dur": 7, "desc": "Society lets you go far, but as soon as you ask questions, boom.", "quote": "Society lets you go far, but as soon as you ask questions, boom.", "alt": 2},
        {"id": "tupac-grand-stories", "title": "Grand Stories", "cat": "Core Concept", "icon": "◒", "dur": 5, "desc": "Believed deeply in their power to move people and inspire change.", "quote": "Believed deeply in their power to move people and inspire change."},
        {"id": "saudi-dream-corrupt", "title": "Saudi Dream Society", "cat": "Systemic Critique", "icon": "◖", "dur": 5, "desc": "Billions created a dreamlike society, deeply corrupt.", "quote": "Billions created a dreamlike society, deeply corrupt."}
    ]},
    # Beat 6
    {"beat": 6, "name": "Break into Two", "act": "act2a", "syntagma": "PS", "clips": [
        {"id": "bayer-individual-self", "title": "Individual Self", "cat": "Core Concept", "icon": "◐", "dur": 11, "desc": "At the center of that world is the individual self, making their own story.", "quote": "At the center of that world is the individual self, making their own story."},
        {"id": "afeni-fairyland-conceal", "title": "Unreal Fairyland", "cat": "Systemic Critique", "icon": "◑", "dur": 7, "desc": "The world that concealed the harsh reality of power.", "quote": "The world that concealed the harsh reality of power."},
        {"id": "fom-exhibition-1950s", "title": "Family of Man", "cat": "Media Apparatus", "icon": "◯", "dur": 26, "desc": "A new way of seeing the world, an alternative to the horrors of Nazism and communism.", "quote": "A new way of seeing the world, an alternative to the horrors of Nazism and communism."}
    ]},
    # Beat 7
    {"beat": 7, "name": "B Story", "act": "act2a", "syntagma": "PS", "clips": [
        {"id": "surveillance-capitalism", "title": "Surveillance Capitalism", "cat": "Systemic Control", "icon": "◠", "dur": 20, "desc": "Extracting behavioral data to predict and modify.", "quote": "Extracting behavioral data to predict and modify."},
        {"id": "crack-epidemic-afeni-fall", "title": "Crack Epidemic", "cat": "Systemic Event", "icon": "◔", "dur": 9, "desc": "Crack swept through black communities, Afeni became addicted.", "quote": "Crack swept through black communities, Afeni became addicted."},
        {"id": "chaos-theory-unpredictable", "title": "Chaos Theory", "cat": "Scientific Theory", "icon": "◜", "dur": 5, "desc": "Tiny changes have massive catastrophic consequences.", "quote": "Tiny changes have massive catastrophic consequences."}
    ]},
    # Beat 8
    {"beat": 8, "name": "Fun and Games", "act": "act2a", "syntagma": "PS", "clips": [
        {"id": "zubaydah-perpetual-now", "title": "Perpetual Now", "cat": "Emotional State", "icon": "◙", "dur": 7, "desc": "Trapped in perpetual now, haunted by fragments.", "quote": "Trapped in perpetual now, haunted by fragments.", "alt": 1},
        {"id": "algorithms-predict-behavior", "title": "Predictive Algorithms", "cat": "Technological Apparatus", "icon": "◟", "dur": 20, "desc": "Algorithms that predict and shape human behavior.", "quote": "Algorithms that predict and shape human behavior."},
        {"id": "bayer-individual-self", "title": "Individual Self", "cat": "Core Concept", "icon": "◐", "dur": 11, "desc": "At the center of that world is the individual self, making their own story.", "quote": "At the center of that world is the individual self, making their own story.", "alt": 1}
    ]},
    # Beat 9
    {"beat": 9, "name": "Midpoint", "act": "act2a", "syntagma": "PS", "clips": [
        {"id": "cia-godzilla-fear", "title": "Godzilla Fear", "cat": "Systemic Impact", "icon": "◛", "dur": 11, "desc": "Disconnected memories spread fear across America.", "quote": "Disconnected memories spread fear across America.", "alt": 1},
        {"id": "hinton-neural-networks", "title": "Neural Networks", "cat": "Technological Apparatus", "icon": "◞", "dur": 11, "desc": "AI learns from mass data, ignores all human stories.", "quote": "AI learns from mass data, ignores all human stories."},
        {"id": "society-boom-q", "title": "Societal Boom", "cat": "Systemic Control", "icon": "◓", "dur": 7, "desc": "Society lets you go far, but as soon as you ask questions, boom.", "quote": "Society lets you go far, but as soon as you ask questions, boom.", "alt": 3}
    ]},
    # Beat 10
    {"beat": 10, "name": "Bad Guys Close In", "act": "act2a", "syntagma": "OS", "clips": [
        {"id": "bayer-individual-self", "title": "Individual Self", "cat": "Core Concept", "icon": "◐", "dur": 11, "desc": "At the center of that world is the individual self, making their own story.", "quote": "At the center of that world is the individual self, making their own story.", "alt": 2},
        {"id": "saudi-dream-corrupt", "title": "Saudi Dream Society", "cat": "Systemic Critique", "icon": "◖", "dur": 5, "desc": "Billions created a dreamlike society, deeply corrupt.", "quote": "Billions created a dreamlike society, deeply corrupt.", "alt": 1},
        {"id": "bayer-individual-self", "title": "Individual Self", "cat": "Core Concept", "icon": "◐", "dur": 11, "desc": "At the center of that world is the individual self, making their own story.", "quote": "At the center of that world is the individual self, making their own story.", "alt": 3},
        {"id": "bayer-individual-self", "title": "Individual Self", "cat": "Core Concept", "icon": "◐", "dur": 11, "desc": "At the center of that world is the individual self, making their own story.", "quote": "At the center of that world is the individual self, making their own story.", "alt": 4}
    ]},
    # Beat 11
    {"beat": 11, "name": "All Is Lost", "act": "act2b", "syntagma": "PS", "clips": [
        {"id": "hinton-neural-networks", "title": "Neural Networks", "cat": "Technological Apparatus", "icon": "◞", "dur": 11, "desc": "AI learns from mass data, ignores all human stories.", "quote": "AI learns from mass data, ignores all human stories."},
        {"id": "mass-incarceration-clinton", "title": "Mass Incarceration", "cat": "Systemic Control", "icon": "◕", "dur": 8, "desc": "Hundreds of thousands imprisoned with no hope of parole.", "quote": "Hundreds of thousands imprisoned with no hope of parole.", "alt": 1},
        {"id": "hinton-neural-networks", "title": "Neural Networks", "cat": "Technological Apparatus", "icon": "◞", "dur": 11, "desc": "AI learns from mass data, ignores all human stories.", "quote": "AI learns from mass data, ignores all human stories."}
    ]},
    # Beat 12
    {"beat": 12, "name": "Dark Night of the Soul", "act": "act2b", "syntagma": "PS", "clips": [
        {"id": "saudi-dream-corrupt", "title": "Saudi Dream Society", "cat": "Systemic Critique", "icon": "◖", "dur": 5, "desc": "Billions created a dreamlike society, deeply corrupt.", "quote": "Billions created a dreamlike society, deeply corrupt.", "alt": 2},
        {"id": "mass-incarceration-clinton", "title": "Mass Incarceration", "cat": "Systemic Control", "icon": "◕", "dur": 8, "desc": "Hundreds of thousands imprisoned with no hope of parole.", "quote": "Hundreds of thousands imprisoned with no hope of parole.", "alt": 2},
        {"id": "hinton-neural-networks", "title": "Neural Networks", "cat": "Technological Apparatus", "icon": "◞", "dur": 11, "desc": "AI learns from mass data, ignores all human stories.", "quote": "AI learns from mass data, ignores all human stories."}
    ]},
    # Beat 13
    {"beat": 13, "name": "Break into Three", "act": "act3", "syntagma": "PS", "clips": [
        {"id": "surveillance-capitalism", "title": "Surveillance Capitalism", "cat": "Systemic Control", "icon": "◠", "dur": 20, "desc": "Extracting behavioral data to predict and modify.", "quote": "Extracting behavioral data to predict and modify.", "alt": 1},
        {"id": "algorithms-predict-behavior", "title": "Predictive Algorithms", "cat": "Technological Apparatus", "icon": "◟", "dur": 20, "desc": "Algorithms that predict and shape human behavior.", "quote": "Algorithms that predict and shape human behavior.", "alt": 1},
        {"id": "cia-godzilla-fear", "title": "Godzilla Fear", "cat": "Systemic Impact", "icon": "◛", "dur": 11, "desc": "Disconnected memories spread fear across America.", "quote": "Disconnected memories spread fear across America.", "alt": 2}
    ]},
    # Beat 14
    {"beat": 14, "name": "Finale", "act": "act3", "syntagma": "PS", "clips": [
        {"id": "cia-enhanced-interrogation", "title": "CIA Interrogation", "cat": "Systemic Control", "icon": "◚", "dur": 12, "desc": "Waterboarding 83 times to create learned helplessness.", "quote": "Waterboarding 83 times to create learned helplessness."},
        {"id": "cia-godzilla-fear", "title": "Godzilla Fear", "cat": "Systemic Impact", "icon": "◛", "dur": 11, "desc": "Disconnected memories spread fear across America.", "quote": "Disconnected memories spread fear across America.", "alt": 3},
        {"id": "zubaydah-perpetual-now", "title": "Perpetual Now", "cat": "Emotional State", "icon": "◙", "dur": 7, "desc": "Trapped in perpetual now, haunted by fragments.", "quote": "Trapped in perpetual now, haunted by fragments.", "alt": 2}
    ]},
    # Beat 15
    {"beat": 15, "name": "Final Image", "act": "act3", "syntagma": "PS", "clips": [
        {"id": "mass-incarceration-clinton", "title": "Mass Incarceration", "cat": "Systemic Control", "icon": "◕", "dur": 8, "desc": "Hundreds of thousands imprisoned with no hope of parole.", "quote": "Hundreds of thousands imprisoned with no hope of parole.", "alt": 3},
        {"id": "mass-incarceration-clinton", "title": "Mass Incarceration", "cat": "Systemic Control", "icon": "◕", "dur": 8, "desc": "Hundreds of thousands imprisoned with no hope of parole.", "quote": "Hundreds of thousands imprisoned with no hope of parole.", "alt": 4},
        {"id": "tupac-grand-stories", "title": "Grand Stories", "cat": "Core Concept", "icon": "◒", "dur": 5, "desc": "Believed deeply in their power to move people and inspire change.", "quote": "Believed deeply in their power to move people and inspire change."}
    ]}
]

# Build sequences
for i, beat_data in enumerate(beats_data, 1):
    sequence = {
        "id": i,
        "sequenceNumber": i,
        "beatNumber": beat_data["beat"],
        "beatName": beat_data["name"],
        "act": beat_data["act"],
        "syntagmaType": beat_data["syntagma"],
        "syntagmaName": "Parallel Syntagma" if beat_data["syntagma"] == "PS" else "Ordinary Sequence",
        "clips": []
    }
    
    for clip_data in beat_data["clips"]:
        clip = {
            "clipId": clip_data["id"],
            "title": clip_data["title"],
            "category": clip_data["cat"],
            "icon": clip_data["icon"],
            "sourceIn": 0,
            "sourceOut": clip_data["dur"],
            "duration": clip_data["dur"],
            "description": clip_data["desc"],
            "quote": clip_data["quote"],
            "tags": [clip_data["cat"], beat_data["name"]],
            "color": "#E24A4A",
            "videoFile": get_video(clip_data["id"])
        }
        sequence["clips"].append(clip)
    
    oti["sequences"].append(sequence)

# Write final OTI
with open('filter-bubbles-documentary.oti.json', 'w') as f:
    json.dump(oti, f, indent=2)

print(f"✅ Complete OTI JSON created!")
print(f"   • 15 beats (Save the Cat structure)")
print(f"   • 46 shots with video files")
print(f"   • Total duration: 7:46")
print(f"   • Coherence score: 3310")
print(f"\n📁 File: filter-bubbles-documentary.oti.json")
print(f"🚀 Ready to load into Prompt Lab!")
