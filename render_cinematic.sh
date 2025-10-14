#!/bin/bash
# Filter Bubbles: A Documentary - CINEMATIC EDITION
# With text overlays, music, letterbox, and TTS narration

set -e

echo "🎬 Enhanced Cinematic Render"
echo "📊 46 clips with full production"

TEMP_DIR="temp_cinematic"
mkdir -p "$TEMP_DIR"
mkdir -p "$TEMP_DIR/audio"

# Check dependencies
command -v ffmpeg >/dev/null 2>&1 || { echo "❌ ffmpeg required"; exit 1; }
command -v say >/dev/null 2>&1 || { echo "❌ TTS (say) not available"; exit 1; }


# ========================================
# GENERATE TTS NARRATION
# ========================================

# Narration 1: Filter Bubbles
echo '  Generating narration 1/46'
say -v Alex -r 150 'Algorithms isolate us in personalized realities.' -o $TEMP_DIR/audio/narration_000.aiff

# Narration 2: Zubaydah's Diary
echo '  Generating narration 2/46'
say -v Alex -r 150 'Memories in fragments, nothing linked them, made no sense.' -o $TEMP_DIR/audio/narration_001.aiff

# Narration 3: Unreal Fairyland
echo '  Generating narration 3/46'
say -v Alex -r 150 'The world that concealed the harsh reality of power.' -o $TEMP_DIR/audio/narration_002.aiff

# Narration 4: Mass Incarceration
echo '  Generating narration 4/46'
say -v Alex -r 150 'Hundreds of thousands imprisoned with no hope of parole.' -o $TEMP_DIR/audio/narration_003.aiff

# Narration 5: Unreal Fairyland
echo '  Generating narration 5/46'
say -v Alex -r 150 'The world that concealed the harsh reality of power.' -o $TEMP_DIR/audio/narration_004.aiff

# Narration 6: Societal Boom
echo '  Generating narration 6/46'
say -v Alex -r 150 'Society lets you go far, but as soon as you ask questions, boom.' -o $TEMP_DIR/audio/narration_005.aiff

# Narration 7: Perpetual Now
echo '  Generating narration 7/46'
say -v Alex -r 150 'Trapped in perpetual now, haunted by fragments.' -o $TEMP_DIR/audio/narration_006.aiff

# Narration 8: Godzilla Fear
echo '  Generating narration 8/46'
say -v Alex -r 150 'Disconnected memories spread fear across America.' -o $TEMP_DIR/audio/narration_007.aiff

# Narration 9: Complexity Theory
echo '  Generating narration 9/46'
say -v Alex -r 150 'Computers see hidden patterns, make chaos manageable.' -o $TEMP_DIR/audio/narration_008.aiff

# Narration 10: Zubaydah's Diary
echo '  Generating narration 10/46'
say -v Alex -r 150 'Memories in fragments, nothing linked them, made no sense.' -o $TEMP_DIR/audio/narration_009.aiff

# Narration 11: Jihad Disintegration
echo '  Generating narration 11/46'
say -v Alex -r 150 'Organization disintegrating, all solidarity gone.' -o $TEMP_DIR/audio/narration_010.aiff

# Narration 12: Societal Boom
echo '  Generating narration 12/46'
say -v Alex -r 150 'Society lets you go far, but as soon as you ask questions, boom.' -o $TEMP_DIR/audio/narration_011.aiff

# Narration 13: Societal Boom
echo '  Generating narration 13/46'
say -v Alex -r 150 'Society lets you go far, but as soon as you ask questions, boom.' -o $TEMP_DIR/audio/narration_012.aiff

# Narration 14: Grand Stories
echo '  Generating narration 14/46'
say -v Alex -r 150 'Believed deeply in their power to move people and inspire change.' -o $TEMP_DIR/audio/narration_013.aiff

# Narration 15: Saudi Dream Society
echo '  Generating narration 15/46'
say -v Alex -r 150 'Billions created a dreamlike society, deeply corrupt.' -o $TEMP_DIR/audio/narration_014.aiff

# Narration 16: Individual Self
echo '  Generating narration 16/46'
say -v Alex -r 150 'At the center of that world is the individual self, making their own story.' -o $TEMP_DIR/audio/narration_015.aiff

# Narration 17: Unreal Fairyland
echo '  Generating narration 17/46'
say -v Alex -r 150 'The world that concealed the harsh reality of power.' -o $TEMP_DIR/audio/narration_016.aiff

# Narration 18: Family of Man
echo '  Generating narration 18/46'
say -v Alex -r 150 'A new way of seeing the world, an alternative to the horrors of Nazism and communism.' -o $TEMP_DIR/audio/narration_017.aiff

# Narration 19: Surveillance Capitalism
echo '  Generating narration 19/46'
say -v Alex -r 150 'Extracting behavioral data to predict and modify.' -o $TEMP_DIR/audio/narration_018.aiff

# Narration 20: Crack Epidemic
echo '  Generating narration 20/46'
say -v Alex -r 150 'Crack swept through black communities, Afeni became addicted.' -o $TEMP_DIR/audio/narration_019.aiff

# Narration 21: Chaos Theory
echo '  Generating narration 21/46'
say -v Alex -r 150 'Tiny changes have massive catastrophic consequences.' -o $TEMP_DIR/audio/narration_020.aiff

# Narration 22: Perpetual Now
echo '  Generating narration 22/46'
say -v Alex -r 150 'Trapped in perpetual now, haunted by fragments.' -o $TEMP_DIR/audio/narration_021.aiff

# Narration 23: Predictive Algorithms
echo '  Generating narration 23/46'
say -v Alex -r 150 'Algorithms that predict and shape human behavior.' -o $TEMP_DIR/audio/narration_022.aiff

# Narration 24: Individual Self
echo '  Generating narration 24/46'
say -v Alex -r 150 'At the center of that world is the individual self, making their own story.' -o $TEMP_DIR/audio/narration_023.aiff

# Narration 25: Godzilla Fear
echo '  Generating narration 25/46'
say -v Alex -r 150 'Disconnected memories spread fear across America.' -o $TEMP_DIR/audio/narration_024.aiff

# Narration 26: Neural Networks
echo '  Generating narration 26/46'
say -v Alex -r 150 'AI learns from mass data, ignores all human stories.' -o $TEMP_DIR/audio/narration_025.aiff

# Narration 27: Societal Boom
echo '  Generating narration 27/46'
say -v Alex -r 150 'Society lets you go far, but as soon as you ask questions, boom.' -o $TEMP_DIR/audio/narration_026.aiff

# Narration 28: Individual Self
echo '  Generating narration 28/46'
say -v Alex -r 150 'At the center of that world is the individual self, making their own story.' -o $TEMP_DIR/audio/narration_027.aiff

# Narration 29: Saudi Dream Society
echo '  Generating narration 29/46'
say -v Alex -r 150 'Billions created a dreamlike society, deeply corrupt.' -o $TEMP_DIR/audio/narration_028.aiff

# Narration 30: Individual Self
echo '  Generating narration 30/46'
say -v Alex -r 150 'At the center of that world is the individual self, making their own story.' -o $TEMP_DIR/audio/narration_029.aiff

# Narration 31: Individual Self
echo '  Generating narration 31/46'
say -v Alex -r 150 'At the center of that world is the individual self, making their own story.' -o $TEMP_DIR/audio/narration_030.aiff

# Narration 32: Neural Networks
echo '  Generating narration 32/46'
say -v Alex -r 150 'AI learns from mass data, ignores all human stories.' -o $TEMP_DIR/audio/narration_031.aiff

# Narration 33: Mass Incarceration
echo '  Generating narration 33/46'
say -v Alex -r 150 'Hundreds of thousands imprisoned with no hope of parole.' -o $TEMP_DIR/audio/narration_032.aiff

# Narration 34: Neural Networks
echo '  Generating narration 34/46'
say -v Alex -r 150 'AI learns from mass data, ignores all human stories.' -o $TEMP_DIR/audio/narration_033.aiff

# Narration 35: Saudi Dream Society
echo '  Generating narration 35/46'
say -v Alex -r 150 'Billions created a dreamlike society, deeply corrupt.' -o $TEMP_DIR/audio/narration_034.aiff

# Narration 36: Mass Incarceration
echo '  Generating narration 36/46'
say -v Alex -r 150 'Hundreds of thousands imprisoned with no hope of parole.' -o $TEMP_DIR/audio/narration_035.aiff

# Narration 37: Neural Networks
echo '  Generating narration 37/46'
say -v Alex -r 150 'AI learns from mass data, ignores all human stories.' -o $TEMP_DIR/audio/narration_036.aiff

# Narration 38: Surveillance Capitalism
echo '  Generating narration 38/46'
say -v Alex -r 150 'Extracting behavioral data to predict and modify.' -o $TEMP_DIR/audio/narration_037.aiff

# Narration 39: Predictive Algorithms
echo '  Generating narration 39/46'
say -v Alex -r 150 'Algorithms that predict and shape human behavior.' -o $TEMP_DIR/audio/narration_038.aiff

# Narration 40: Godzilla Fear
echo '  Generating narration 40/46'
say -v Alex -r 150 'Disconnected memories spread fear across America.' -o $TEMP_DIR/audio/narration_039.aiff

# Narration 41: CIA Interrogation
echo '  Generating narration 41/46'
say -v Alex -r 150 'Waterboarding 83 times to create learned helplessness.' -o $TEMP_DIR/audio/narration_040.aiff

# Narration 42: Godzilla Fear
echo '  Generating narration 42/46'
say -v Alex -r 150 'Disconnected memories spread fear across America.' -o $TEMP_DIR/audio/narration_041.aiff

# Narration 43: Perpetual Now
echo '  Generating narration 43/46'
say -v Alex -r 150 'Trapped in perpetual now, haunted by fragments.' -o $TEMP_DIR/audio/narration_042.aiff

# Narration 44: Mass Incarceration
echo '  Generating narration 44/46'
say -v Alex -r 150 'Hundreds of thousands imprisoned with no hope of parole.' -o $TEMP_DIR/audio/narration_043.aiff

# Narration 45: Mass Incarceration
echo '  Generating narration 45/46'
say -v Alex -r 150 'Hundreds of thousands imprisoned with no hope of parole.' -o $TEMP_DIR/audio/narration_044.aiff

# Narration 46: Grand Stories
echo '  Generating narration 46/46'
say -v Alex -r 150 'Believed deeply in their power to move people and inspire change.' -o $TEMP_DIR/audio/narration_045.aiff


# ========================================
# PROCESS CLIPS WITH OVERLAYS
# ========================================


# BEAT 1: Opening Image

echo '  [1/46] Enhancing: Filter Bubbles'
ffmpeg -i "NICK/Filter_Bubbles_documentary_opening_image_icon__algorithms_iso_be430d70-6919-4ac3-a009-45c1ea3eff22_3.mp4" -i $TEMP_DIR/audio/narration_000.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 1\: Opening Image':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Filter Bubbles':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Algorithms isolate us in personalized realities.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 20 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_000_enhanced.mp4 -loglevel error

echo '  [2/46] Enhancing: Zubaydah'\''s Diary'
ffmpeg -i "NICK/Zubaydahs_Diary_scene_memories_in_fragments_nothing_linked_th_51c60d7b-87db-40ff-a116-4e1941bc37c1_0.mp4" -i $TEMP_DIR/audio/narration_001.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 1\: Opening Image':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Zubaydah'\''s Diary':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Memories in fragments, nothing linked them, made no sense.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 6 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_001_enhanced.mp4 -loglevel error

echo '  [3/46] Enhancing: Unreal Fairyland'
ffmpeg -i "NICK/Unreal_Fairyland_scene_the_world_that_concealed_the_harsh_rea_4d60401b-7aed-4b38-9170-946767a41fb8_0.mp4" -i $TEMP_DIR/audio/narration_002.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 1\: Opening Image':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Unreal Fairyland':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='The world that concealed the harsh reality of power.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 7 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_002_enhanced.mp4 -loglevel error


# BEAT 2: Theme Stated

echo '  [4/46] Enhancing: Mass Incarceration'
ffmpeg -i "NICK/Mass_Incarceration_scene_hundreds_of_thousands_imprisoned_wit_504ec4a9-0240-4987-bd62-cc162f8f42ab_0.mp4" -i $TEMP_DIR/audio/narration_003.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 2\: Theme Stated':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Mass Incarceration':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Hundreds of thousands imprisoned with no hope of parole.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 8 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_003_enhanced.mp4 -loglevel error

echo '  [5/46] Enhancing: Unreal Fairyland'
ffmpeg -i "NICK/Unreal_Fairyland_scene_the_world_that_concealed_the_harsh_rea_4d60401b-7aed-4b38-9170-946767a41fb8_0.mp4" -i $TEMP_DIR/audio/narration_004.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 2\: Theme Stated':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Unreal Fairyland':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='The world that concealed the harsh reality of power.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 7 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_004_enhanced.mp4 -loglevel error

echo '  [6/46] Enhancing: Societal Boom'
ffmpeg -i "NICK/Societal_Boom_scene_society_lets_you_go_far_but_as_soon_as_yo_57a22ed3-21cf-4e75-af79-286831bbff20_3.mp4" -i $TEMP_DIR/audio/narration_005.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 2\: Theme Stated':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Societal Boom':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Society lets you go far, but as soon as you ask questions, boom.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 7 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_005_enhanced.mp4 -loglevel error


# BEAT 3: Set-Up

echo '  [7/46] Enhancing: Perpetual Now'
ffmpeg -i "NICK/Perpetual_Now_scene_trapped_in_perpetual_now_haunted_by_fragm_1c14abd3-6938-43f2-8508-a6e0c4d03126_3.mp4" -i $TEMP_DIR/audio/narration_006.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 3\: Set-Up':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Perpetual Now':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Trapped in perpetual now, haunted by fragments.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 7 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_006_enhanced.mp4 -loglevel error

echo '  [8/46] Enhancing: Godzilla Fear'
ffmpeg -i "NICK/Godzilla_Fear_scene_disconnected_memories_spread_fear_across__5594d491-ae3f-4fec-bb56-7d84f74d0a65_3.mp4" -i $TEMP_DIR/audio/narration_007.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 3\: Set-Up':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Godzilla Fear':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Disconnected memories spread fear across America.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 11 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_007_enhanced.mp4 -loglevel error

echo '  [9/46] Enhancing: Complexity Theory'
ffmpeg -i "NICK/Complexity_Theory_scene_computers_see_hidden_patterns_make_ch_bfe9532d-fd6e-4440-b908-8896d1f6f6a0_1.mp4" -i $TEMP_DIR/audio/narration_008.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 3\: Set-Up':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Complexity Theory':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Computers see hidden patterns, make chaos manageable.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 13 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_008_enhanced.mp4 -loglevel error


# BEAT 4: Catalyst

echo '  [10/46] Enhancing: Zubaydah'\''s Diary'
ffmpeg -i "NICK/Zubaydahs_Diary_scene_memories_in_fragments_nothing_linked_th_51c60d7b-87db-40ff-a116-4e1941bc37c1_0.mp4" -i $TEMP_DIR/audio/narration_009.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 4\: Catalyst':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Zubaydah'\''s Diary':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Memories in fragments, nothing linked them, made no sense.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 6 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_009_enhanced.mp4 -loglevel error

echo '  [11/46] Enhancing: Jihad Disintegration'
ffmpeg -i "NICK/Jihad_Disintegration_scene_organization_disintegrating_all_so_70d4c74b-8c2d-4312-a5ef-0218606eeb09_2.mp4" -i $TEMP_DIR/audio/narration_010.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 4\: Catalyst':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Jihad Disintegration':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Organization disintegrating, all solidarity gone.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 11 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_010_enhanced.mp4 -loglevel error

echo '  [12/46] Enhancing: Societal Boom'
ffmpeg -i "NICK/Societal_Boom_scene_society_lets_you_go_far_but_as_soon_as_yo_57a22ed3-21cf-4e75-af79-286831bbff20_3.mp4" -i $TEMP_DIR/audio/narration_011.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 4\: Catalyst':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Societal Boom':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Society lets you go far, but as soon as you ask questions, boom.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 7 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_011_enhanced.mp4 -loglevel error


# BEAT 5: Debate

echo '  [13/46] Enhancing: Societal Boom'
ffmpeg -i "NICK/Societal_Boom_scene_society_lets_you_go_far_but_as_soon_as_yo_57a22ed3-21cf-4e75-af79-286831bbff20_3.mp4" -i $TEMP_DIR/audio/narration_012.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 5\: Debate':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Societal Boom':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Society lets you go far, but as soon as you ask questions, boom.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 7 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_012_enhanced.mp4 -loglevel error

echo '  [14/46] Enhancing: Grand Stories'
ffmpeg -i "NICK/grand-stories.mp4" -i $TEMP_DIR/audio/narration_013.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 5\: Debate':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Grand Stories':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Believed deeply in their power to move people and inspire change.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 5 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_013_enhanced.mp4 -loglevel error

echo '  [15/46] Enhancing: Saudi Dream Society'
ffmpeg -i "NICK/Saudi_Dream_Society_scene_billions_created_a_dreamlike_societ_01eb3f87-3043-4029-9067-c0954744b5a3_2.mp4" -i $TEMP_DIR/audio/narration_014.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 5\: Debate':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Saudi Dream Society':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Billions created a dreamlike society, deeply corrupt.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 5 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_014_enhanced.mp4 -loglevel error


# BEAT 6: Break into Two

echo '  [16/46] Enhancing: Individual Self'
ffmpeg -i "NICK/Individual_Self_scene_at_the_center_of_that_world_is_the_indi_4d09ed90-f274-41df-97dd-255ff04f1bdf_3.mp4" -i $TEMP_DIR/audio/narration_015.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 6\: Break into Two':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Individual Self':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='At the center of that world is the individual self, making their own story.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 11 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_015_enhanced.mp4 -loglevel error

echo '  [17/46] Enhancing: Unreal Fairyland'
ffmpeg -i "NICK/Unreal_Fairyland_scene_the_world_that_concealed_the_harsh_rea_4d60401b-7aed-4b38-9170-946767a41fb8_0.mp4" -i $TEMP_DIR/audio/narration_016.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 6\: Break into Two':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Unreal Fairyland':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='The world that concealed the harsh reality of power.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 7 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_016_enhanced.mp4 -loglevel error

echo '  [18/46] Enhancing: Family of Man'
ffmpeg -i "NICK/Family_of_Man_scene_a_new_way_of_seeing_the_world_an_alternat_3390e6d3-e91d-46b6-bfeb-d75a6314cc5e_1.mp4" -i $TEMP_DIR/audio/narration_017.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 6\: Break into Two':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Family of Man':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='A new way of seeing the world, an alternative to the horrors of Nazism and communism.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 26 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_017_enhanced.mp4 -loglevel error


# BEAT 7: B Story

echo '  [19/46] Enhancing: Surveillance Capitalism'
ffmpeg -i "NICK/Surveillance_Capitalism_scene_extracting_behavioral_data_to_p_4095cf7a-0bb3-46a1-9144-5d2b0e6f6446_0.mp4" -i $TEMP_DIR/audio/narration_018.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 7\: B Story':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Surveillance Capitalism':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Extracting behavioral data to predict and modify.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 20 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_018_enhanced.mp4 -loglevel error

echo '  [20/46] Enhancing: Crack Epidemic'
ffmpeg -i "NICK/Crack_Epidemic_scene_crack_swept_through_black_communities_Af_27c4f242-b297-4372-b27d-848d3b7e553f_1.mp4" -i $TEMP_DIR/audio/narration_019.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 7\: B Story':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Crack Epidemic':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Crack swept through black communities, Afeni became addicted.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 9 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_019_enhanced.mp4 -loglevel error

echo '  [21/46] Enhancing: Chaos Theory'
ffmpeg -i "NICK/Chaos_Theory_scene_tiny_changes_have_massive_catastrophic_con_23725a73-86c1-419f-85bd-9ce51ff8d2f6_0.mp4" -i $TEMP_DIR/audio/narration_020.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 7\: B Story':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Chaos Theory':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Tiny changes have massive catastrophic consequences.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 5 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_020_enhanced.mp4 -loglevel error


# BEAT 8: Fun and Games

echo '  [22/46] Enhancing: Perpetual Now'
ffmpeg -i "NICK/Perpetual_Now_scene_trapped_in_perpetual_now_haunted_by_fragm_1c14abd3-6938-43f2-8508-a6e0c4d03126_3.mp4" -i $TEMP_DIR/audio/narration_021.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 8\: Fun and Games':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Perpetual Now':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Trapped in perpetual now, haunted by fragments.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 7 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_021_enhanced.mp4 -loglevel error

echo '  [23/46] Enhancing: Predictive Algorithms'
ffmpeg -i "NICK/Predictive_Algorithms_scene_algorithms_that_predict_and_shape_ffc3ae51-0647-4fc0-bb52-e6334448010d_2.mp4" -i $TEMP_DIR/audio/narration_022.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 8\: Fun and Games':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Predictive Algorithms':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Algorithms that predict and shape human behavior.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 20 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_022_enhanced.mp4 -loglevel error

echo '  [24/46] Enhancing: Individual Self'
ffmpeg -i "NICK/Individual_Self_scene_at_the_center_of_that_world_is_the_indi_4d09ed90-f274-41df-97dd-255ff04f1bdf_3.mp4" -i $TEMP_DIR/audio/narration_023.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 8\: Fun and Games':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Individual Self':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='At the center of that world is the individual self, making their own story.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 11 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_023_enhanced.mp4 -loglevel error


# BEAT 9: Midpoint

echo '  [25/46] Enhancing: Godzilla Fear'
ffmpeg -i "NICK/Godzilla_Fear_scene_disconnected_memories_spread_fear_across__5594d491-ae3f-4fec-bb56-7d84f74d0a65_3.mp4" -i $TEMP_DIR/audio/narration_024.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 9\: Midpoint':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Godzilla Fear':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Disconnected memories spread fear across America.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 11 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_024_enhanced.mp4 -loglevel error

echo '  [26/46] Enhancing: Neural Networks'
ffmpeg -i "NICK/Neural_Networks_scene_AI_learns_from_mass_data_ignores_all_hu_cb7f3037-fbcb-4aa4-9dc4-202676420809_3.mp4" -i $TEMP_DIR/audio/narration_025.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 9\: Midpoint':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Neural Networks':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='AI learns from mass data, ignores all human stories.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 11 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_025_enhanced.mp4 -loglevel error

echo '  [27/46] Enhancing: Societal Boom'
ffmpeg -i "NICK/Societal_Boom_scene_society_lets_you_go_far_but_as_soon_as_yo_57a22ed3-21cf-4e75-af79-286831bbff20_3.mp4" -i $TEMP_DIR/audio/narration_026.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 9\: Midpoint':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Societal Boom':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Society lets you go far, but as soon as you ask questions, boom.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 7 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_026_enhanced.mp4 -loglevel error


# BEAT 10: Bad Guys Close In

echo '  [28/46] Enhancing: Individual Self'
ffmpeg -i "NICK/Individual_Self_scene_at_the_center_of_that_world_is_the_indi_4d09ed90-f274-41df-97dd-255ff04f1bdf_3.mp4" -i $TEMP_DIR/audio/narration_027.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 10\: Bad Guys Close In':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Individual Self':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='At the center of that world is the individual self, making their own story.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 11 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_027_enhanced.mp4 -loglevel error

echo '  [29/46] Enhancing: Saudi Dream Society'
ffmpeg -i "NICK/Saudi_Dream_Society_scene_billions_created_a_dreamlike_societ_01eb3f87-3043-4029-9067-c0954744b5a3_2.mp4" -i $TEMP_DIR/audio/narration_028.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 10\: Bad Guys Close In':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Saudi Dream Society':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Billions created a dreamlike society, deeply corrupt.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 5 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_028_enhanced.mp4 -loglevel error

echo '  [30/46] Enhancing: Individual Self'
ffmpeg -i "NICK/Individual_Self_scene_at_the_center_of_that_world_is_the_indi_4d09ed90-f274-41df-97dd-255ff04f1bdf_3.mp4" -i $TEMP_DIR/audio/narration_029.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 10\: Bad Guys Close In':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Individual Self':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='At the center of that world is the individual self, making their own story.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 11 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_029_enhanced.mp4 -loglevel error

echo '  [31/46] Enhancing: Individual Self'
ffmpeg -i "NICK/Individual_Self_scene_at_the_center_of_that_world_is_the_indi_4d09ed90-f274-41df-97dd-255ff04f1bdf_3.mp4" -i $TEMP_DIR/audio/narration_030.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 10\: Bad Guys Close In':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Individual Self':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='At the center of that world is the individual self, making their own story.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 11 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_030_enhanced.mp4 -loglevel error


# BEAT 11: All Is Lost

echo '  [32/46] Enhancing: Neural Networks'
ffmpeg -i "NICK/Neural_Networks_scene_AI_learns_from_mass_data_ignores_all_hu_cb7f3037-fbcb-4aa4-9dc4-202676420809_3.mp4" -i $TEMP_DIR/audio/narration_031.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 11\: All Is Lost':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Neural Networks':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='AI learns from mass data, ignores all human stories.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 11 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_031_enhanced.mp4 -loglevel error

echo '  [33/46] Enhancing: Mass Incarceration'
ffmpeg -i "NICK/Mass_Incarceration_scene_hundreds_of_thousands_imprisoned_wit_504ec4a9-0240-4987-bd62-cc162f8f42ab_0.mp4" -i $TEMP_DIR/audio/narration_032.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 11\: All Is Lost':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Mass Incarceration':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Hundreds of thousands imprisoned with no hope of parole.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 8 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_032_enhanced.mp4 -loglevel error

echo '  [34/46] Enhancing: Neural Networks'
ffmpeg -i "NICK/Neural_Networks_scene_AI_learns_from_mass_data_ignores_all_hu_cb7f3037-fbcb-4aa4-9dc4-202676420809_3.mp4" -i $TEMP_DIR/audio/narration_033.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 11\: All Is Lost':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Neural Networks':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='AI learns from mass data, ignores all human stories.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 11 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_033_enhanced.mp4 -loglevel error


# BEAT 12: Dark Night of the Soul

echo '  [35/46] Enhancing: Saudi Dream Society'
ffmpeg -i "NICK/Saudi_Dream_Society_scene_billions_created_a_dreamlike_societ_01eb3f87-3043-4029-9067-c0954744b5a3_2.mp4" -i $TEMP_DIR/audio/narration_034.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 12\: Dark Night of the Soul':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Saudi Dream Society':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Billions created a dreamlike society, deeply corrupt.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 5 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_034_enhanced.mp4 -loglevel error

echo '  [36/46] Enhancing: Mass Incarceration'
ffmpeg -i "NICK/Mass_Incarceration_scene_hundreds_of_thousands_imprisoned_wit_504ec4a9-0240-4987-bd62-cc162f8f42ab_0.mp4" -i $TEMP_DIR/audio/narration_035.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 12\: Dark Night of the Soul':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Mass Incarceration':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Hundreds of thousands imprisoned with no hope of parole.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 8 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_035_enhanced.mp4 -loglevel error

echo '  [37/46] Enhancing: Neural Networks'
ffmpeg -i "NICK/Neural_Networks_scene_AI_learns_from_mass_data_ignores_all_hu_cb7f3037-fbcb-4aa4-9dc4-202676420809_3.mp4" -i $TEMP_DIR/audio/narration_036.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 12\: Dark Night of the Soul':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Neural Networks':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='AI learns from mass data, ignores all human stories.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 11 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_036_enhanced.mp4 -loglevel error


# BEAT 13: Break into Three

echo '  [38/46] Enhancing: Surveillance Capitalism'
ffmpeg -i "NICK/Surveillance_Capitalism_scene_extracting_behavioral_data_to_p_4095cf7a-0bb3-46a1-9144-5d2b0e6f6446_0.mp4" -i $TEMP_DIR/audio/narration_037.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 13\: Break into Three':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Surveillance Capitalism':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Extracting behavioral data to predict and modify.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 20 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_037_enhanced.mp4 -loglevel error

echo '  [39/46] Enhancing: Predictive Algorithms'
ffmpeg -i "NICK/Predictive_Algorithms_scene_algorithms_that_predict_and_shape_ffc3ae51-0647-4fc0-bb52-e6334448010d_2.mp4" -i $TEMP_DIR/audio/narration_038.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 13\: Break into Three':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Predictive Algorithms':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Algorithms that predict and shape human behavior.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 20 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_038_enhanced.mp4 -loglevel error

echo '  [40/46] Enhancing: Godzilla Fear'
ffmpeg -i "NICK/Godzilla_Fear_scene_disconnected_memories_spread_fear_across__5594d491-ae3f-4fec-bb56-7d84f74d0a65_3.mp4" -i $TEMP_DIR/audio/narration_039.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 13\: Break into Three':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Godzilla Fear':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Disconnected memories spread fear across America.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 11 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_039_enhanced.mp4 -loglevel error


# BEAT 14: Finale

echo '  [41/46] Enhancing: CIA Interrogation'
ffmpeg -i "NICK/cia-interrogation.mp4" -i $TEMP_DIR/audio/narration_040.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 14\: Finale':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='CIA Interrogation':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Waterboarding 83 times to create learned helplessness.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 12 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_040_enhanced.mp4 -loglevel error

echo '  [42/46] Enhancing: Godzilla Fear'
ffmpeg -i "NICK/Godzilla_Fear_scene_disconnected_memories_spread_fear_across__5594d491-ae3f-4fec-bb56-7d84f74d0a65_3.mp4" -i $TEMP_DIR/audio/narration_041.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 14\: Finale':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Godzilla Fear':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Disconnected memories spread fear across America.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 11 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_041_enhanced.mp4 -loglevel error

echo '  [43/46] Enhancing: Perpetual Now'
ffmpeg -i "NICK/Perpetual_Now_scene_trapped_in_perpetual_now_haunted_by_fragm_1c14abd3-6938-43f2-8508-a6e0c4d03126_3.mp4" -i $TEMP_DIR/audio/narration_042.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 14\: Finale':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Perpetual Now':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Trapped in perpetual now, haunted by fragments.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 7 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_042_enhanced.mp4 -loglevel error


# BEAT 15: Final Image

echo '  [44/46] Enhancing: Mass Incarceration'
ffmpeg -i "NICK/Mass_Incarceration_scene_hundreds_of_thousands_imprisoned_wit_504ec4a9-0240-4987-bd62-cc162f8f42ab_0.mp4" -i $TEMP_DIR/audio/narration_043.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 15\: Final Image':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Mass Incarceration':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Hundreds of thousands imprisoned with no hope of parole.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 8 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_043_enhanced.mp4 -loglevel error

echo '  [45/46] Enhancing: Mass Incarceration'
ffmpeg -i "NICK/Mass_Incarceration_scene_hundreds_of_thousands_imprisoned_wit_504ec4a9-0240-4987-bd62-cc162f8f42ab_0.mp4" -i $TEMP_DIR/audio/narration_044.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 15\: Final Image':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Mass Incarceration':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Hundreds of thousands imprisoned with no hope of parole.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 8 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_044_enhanced.mp4 -loglevel error

echo '  [46/46] Enhancing: Grand Stories'
ffmpeg -i "NICK/grand-stories.mp4" -i $TEMP_DIR/audio/narration_045.aiff \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,\
    pad=1920:1080:(ow-iw)/2:(oh-ih)/2,\
    drawbox=y=0:color=black@1:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1:width=iw:height=100:t=fill,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='BEAT 15\: Final Image':fontcolor=white@0.8:fontsize=14:x=(w-text_w)/2:y=20,\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Grand Stories':fontcolor=white:fontsize=28:x=(w-text_w)/2:y=60:enable='between(t,0,3)',\
    drawtext=fontfile=/System/Library/Fonts/Courier.dfont:text='Believed deeply in their power to move people and inspire change.':fontcolor=yellow@0.9:fontsize=18:x=(w-text_w)/2:y=h-100-60:enable='gte(t,1)'\
    [v];\
    [1:a]volume=1.5[narration];\
    [narration]apad[a]" \
  -map "[v]" -map "[a]" \
  -ss 0 -t 5 \
  -c:v libx264 -preset medium -crf 20 \
  -c:a aac -b:a 192k \
  -shortest \
  -y $TEMP_DIR/clip_045_enhanced.mp4 -loglevel error


# ========================================
# CONCATENATE WITH BACKGROUND MUSIC
# ========================================

echo '🎞️  Concatenating enhanced clips...'
cat > $TEMP_DIR/concat.txt << 'EOF'
file 'clip_000_enhanced.mp4'
file 'clip_001_enhanced.mp4'
file 'clip_002_enhanced.mp4'
file 'clip_003_enhanced.mp4'
file 'clip_004_enhanced.mp4'
file 'clip_005_enhanced.mp4'
file 'clip_006_enhanced.mp4'
file 'clip_007_enhanced.mp4'
file 'clip_008_enhanced.mp4'
file 'clip_009_enhanced.mp4'
file 'clip_010_enhanced.mp4'
file 'clip_011_enhanced.mp4'
file 'clip_012_enhanced.mp4'
file 'clip_013_enhanced.mp4'
file 'clip_014_enhanced.mp4'
file 'clip_015_enhanced.mp4'
file 'clip_016_enhanced.mp4'
file 'clip_017_enhanced.mp4'
file 'clip_018_enhanced.mp4'
file 'clip_019_enhanced.mp4'
file 'clip_020_enhanced.mp4'
file 'clip_021_enhanced.mp4'
file 'clip_022_enhanced.mp4'
file 'clip_023_enhanced.mp4'
file 'clip_024_enhanced.mp4'
file 'clip_025_enhanced.mp4'
file 'clip_026_enhanced.mp4'
file 'clip_027_enhanced.mp4'
file 'clip_028_enhanced.mp4'
file 'clip_029_enhanced.mp4'
file 'clip_030_enhanced.mp4'
file 'clip_031_enhanced.mp4'
file 'clip_032_enhanced.mp4'
file 'clip_033_enhanced.mp4'
file 'clip_034_enhanced.mp4'
file 'clip_035_enhanced.mp4'
file 'clip_036_enhanced.mp4'
file 'clip_037_enhanced.mp4'
file 'clip_038_enhanced.mp4'
file 'clip_039_enhanced.mp4'
file 'clip_040_enhanced.mp4'
file 'clip_041_enhanced.mp4'
file 'clip_042_enhanced.mp4'
file 'clip_043_enhanced.mp4'
file 'clip_044_enhanced.mp4'
file 'clip_045_enhanced.mp4'
EOF

# Concatenate all clips
ffmpeg -f concat -safe 0 -i $TEMP_DIR/concat.txt \
  -c:v copy -c:a copy \
  -y $TEMP_DIR/assembled.mp4 -loglevel error

echo '🎵 Adding background music...'

# Use generated ambient soundscapes
# Each beat has its own generative Brian Eno-style texture
# Run ./generate_soundscapes.sh first if not done
if [ ! -f "ambient_soundtrack.m4a" ]; then
  echo "⚠️  Generating ambient soundscapes first..."
  ./generate_soundscapes.sh
fi

# No need to generate - using ambient_soundtrack.m4a
# Duration matches video automatically
echo "Using pre-generated ambient soundtrack..."
# Placeholder for concat timing
ffmpeg -f lavfi -i anullsrc=r=48000:cl=stereo \
  -t 466 \
  -c:a aac -b:a 128k \
  -y $TEMP_DIR/music.m4a -loglevel error

# Mix narration with generative ambient soundtrack (music at 30% volume)
echo "🎵 Mixing TTS narration with ambient soundscapes..."
ffmpeg -i $TEMP_DIR/assembled.mp4 -i ambient_soundtrack.m4a \
  -filter_complex "[0:a][1:a]amix=inputs=2:duration=first:weights=1 0.3[a]" \
  -map 0:v -map "[a]" \
  -c:v copy -c:a aac -b:a 256k \
  -y filter_bubbles_cinematic.mp4 -loglevel error


echo '🧹 Cleaning up...'
rm -rf $TEMP_DIR

echo ''
echo '✅ CINEMATIC RENDER COMPLETE!'
echo '📁 Output: filter_bubbles_cinematic.mp4'
echo ''
ls -lh filter_bubbles_cinematic.mp4
echo ''
echo '🎬 Features:'
echo '  • Letterbox bars (cinematic 2.35:1 style)'
echo '  • Text overlays (titles, quotes, beats)'
echo '  • TTS narration for all quotes'
echo '  • Background music mix'
echo '  • 1920×1080 HD resolution'
