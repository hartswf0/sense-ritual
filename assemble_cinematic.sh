#!/bin/bash
# Filter Bubbles: Cinematic Edition - Final Assembly
set -e

echo "🎬 Assembling Cinematic Documentary"
echo "   46 clips + TTS narration + text overlays"

TEMP_DIR="temp_cinematic"
mkdir -p "$TEMP_DIR"


# Clip 1/46: Filter Bubbles
echo "  Processing [1/46] Filter Bubbles"

ffmpeg -i "NICK/Filter_Bubbles_documentary_opening_image_icon__algorithms_iso_be430d70-6919-4ac3-a009-45c1ea3eff22_3.mp4" -i "tts/clip_000.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 1\\: Opening Image':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Filter Bubbles':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Algorithms isolate us in personalized realities.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 20 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_000_final.mp4 -loglevel error


# Clip 2/46: Zubaydah's Diary
echo "  Processing [2/46] Zubaydah's Diary"

ffmpeg -i "NICK/Zubaydahs_Diary_scene_memories_in_fragments_nothing_linked_th_51c60d7b-87db-40ff-a116-4e1941bc37c1_0.mp4" -i "tts/clip_001.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 1\\: Opening Image':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Zubaydah'\''s Diary':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Memories in fragments, nothing linked them, made no sense.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 6 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_001_final.mp4 -loglevel error


# Clip 3/46: Unreal Fairyland
echo "  Processing [3/46] Unreal Fairyland"

ffmpeg -i "NICK/Unreal_Fairyland_scene_the_world_that_concealed_the_harsh_rea_4d60401b-7aed-4b38-9170-946767a41fb8_0.mp4" -i "tts/clip_002.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 1\\: Opening Image':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Unreal Fairyland':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='The world that concealed the harsh reality of power.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 7 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_002_final.mp4 -loglevel error


# Clip 4/46: Mass Incarceration
echo "  Processing [4/46] Mass Incarceration"

ffmpeg -i "NICK/Mass_Incarceration_scene_hundreds_of_thousands_imprisoned_wit_504ec4a9-0240-4987-bd62-cc162f8f42ab_0.mp4" -i "tts/clip_003.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 2\\: Theme Stated':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Mass Incarceration':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Hundreds of thousands imprisoned with no hope of parole.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 8 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_003_final.mp4 -loglevel error


# Clip 5/46: Unreal Fairyland
echo "  Processing [5/46] Unreal Fairyland"

ffmpeg -i "NICK/Unreal_Fairyland_scene_the_world_that_concealed_the_harsh_rea_4d60401b-7aed-4b38-9170-946767a41fb8_0.mp4" -i "tts/clip_004.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 2\\: Theme Stated':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Unreal Fairyland':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='The world that concealed the harsh reality of power.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 7 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_004_final.mp4 -loglevel error


# Clip 6/46: Societal Boom
echo "  Processing [6/46] Societal Boom"

ffmpeg -i "NICK/Societal_Boom_scene_society_lets_you_go_far_but_as_soon_as_yo_57a22ed3-21cf-4e75-af79-286831bbff20_3.mp4" -i "tts/clip_005.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 2\\: Theme Stated':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Societal Boom':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Society lets you go far, but as soon as you ask questions, boom.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 7 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_005_final.mp4 -loglevel error


# Clip 7/46: Perpetual Now
echo "  Processing [7/46] Perpetual Now"

ffmpeg -i "NICK/Perpetual_Now_scene_trapped_in_perpetual_now_haunted_by_fragm_1c14abd3-6938-43f2-8508-a6e0c4d03126_3.mp4" -i "tts/clip_006.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 3\\: Set-Up':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Perpetual Now':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Trapped in perpetual now, haunted by fragments.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 7 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_006_final.mp4 -loglevel error


# Clip 8/46: Godzilla Fear
echo "  Processing [8/46] Godzilla Fear"

ffmpeg -i "NICK/Godzilla_Fear_scene_disconnected_memories_spread_fear_across__5594d491-ae3f-4fec-bb56-7d84f74d0a65_3.mp4" -i "tts/clip_007.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 3\\: Set-Up':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Godzilla Fear':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Disconnected memories spread fear across America.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 11 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_007_final.mp4 -loglevel error


# Clip 9/46: Complexity Theory
echo "  Processing [9/46] Complexity Theory"

ffmpeg -i "NICK/Complexity_Theory_scene_computers_see_hidden_patterns_make_ch_bfe9532d-fd6e-4440-b908-8896d1f6f6a0_1.mp4" -i "tts/clip_008.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 3\\: Set-Up':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Complexity Theory':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Computers see hidden patterns, make chaos manageable.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 13 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_008_final.mp4 -loglevel error


# Clip 10/46: Zubaydah's Diary
echo "  Processing [10/46] Zubaydah's Diary"

ffmpeg -i "NICK/Zubaydahs_Diary_scene_memories_in_fragments_nothing_linked_th_51c60d7b-87db-40ff-a116-4e1941bc37c1_0.mp4" -i "tts/clip_009.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 4\\: Catalyst':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Zubaydah'\''s Diary':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Memories in fragments, nothing linked them, made no sense.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 6 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_009_final.mp4 -loglevel error


# Clip 11/46: Jihad Disintegration
echo "  Processing [11/46] Jihad Disintegration"

ffmpeg -i "NICK/Jihad_Disintegration_scene_organization_disintegrating_all_so_70d4c74b-8c2d-4312-a5ef-0218606eeb09_2.mp4" -i "tts/clip_010.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 4\\: Catalyst':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Jihad Disintegration':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Organization disintegrating, all solidarity gone.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 11 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_010_final.mp4 -loglevel error


# Clip 12/46: Societal Boom
echo "  Processing [12/46] Societal Boom"

ffmpeg -i "NICK/Societal_Boom_scene_society_lets_you_go_far_but_as_soon_as_yo_57a22ed3-21cf-4e75-af79-286831bbff20_3.mp4" -i "tts/clip_011.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 4\\: Catalyst':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Societal Boom':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Society lets you go far, but as soon as you ask questions, boom.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 7 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_011_final.mp4 -loglevel error


# Clip 13/46: Societal Boom
echo "  Processing [13/46] Societal Boom"

ffmpeg -i "NICK/Societal_Boom_scene_society_lets_you_go_far_but_as_soon_as_yo_57a22ed3-21cf-4e75-af79-286831bbff20_3.mp4" -i "tts/clip_012.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 5\\: Debate':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Societal Boom':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Society lets you go far, but as soon as you ask questions, boom.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 7 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_012_final.mp4 -loglevel error


# Clip 14/46: Grand Stories
echo "  Processing [14/46] Grand Stories"

ffmpeg -i "NICK/grand-stories.mp4" -i "tts/clip_013.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 5\\: Debate':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Grand Stories':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Believed deeply in their power to move people and inspire change.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 5 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_013_final.mp4 -loglevel error


# Clip 15/46: Saudi Dream Society
echo "  Processing [15/46] Saudi Dream Society"

ffmpeg -i "NICK/Saudi_Dream_Society_scene_billions_created_a_dreamlike_societ_01eb3f87-3043-4029-9067-c0954744b5a3_2.mp4" -i "tts/clip_014.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 5\\: Debate':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Saudi Dream Society':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Billions created a dreamlike society, deeply corrupt.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 5 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_014_final.mp4 -loglevel error


# Clip 16/46: Individual Self
echo "  Processing [16/46] Individual Self"

ffmpeg -i "NICK/Individual_Self_scene_at_the_center_of_that_world_is_the_indi_4d09ed90-f274-41df-97dd-255ff04f1bdf_3.mp4" -i "tts/clip_015.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 6\\: Break into Two':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Individual Self':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='At the center of that world is the individual self, making their own story.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 11 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_015_final.mp4 -loglevel error


# Clip 17/46: Unreal Fairyland
echo "  Processing [17/46] Unreal Fairyland"

ffmpeg -i "NICK/Unreal_Fairyland_scene_the_world_that_concealed_the_harsh_rea_4d60401b-7aed-4b38-9170-946767a41fb8_0.mp4" -i "tts/clip_016.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 6\\: Break into Two':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Unreal Fairyland':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='The world that concealed the harsh reality of power.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 7 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_016_final.mp4 -loglevel error


# Clip 18/46: Family of Man
echo "  Processing [18/46] Family of Man"

ffmpeg -i "NICK/Family_of_Man_scene_a_new_way_of_seeing_the_world_an_alternat_3390e6d3-e91d-46b6-bfeb-d75a6314cc5e_1.mp4" -i "tts/clip_017.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 6\\: Break into Two':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Family of Man':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='A new way of seeing the world, an alternative to the horrors of Nazism and communism.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 26 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_017_final.mp4 -loglevel error


# Clip 19/46: Surveillance Capitalism
echo "  Processing [19/46] Surveillance Capitalism"

ffmpeg -i "NICK/Surveillance_Capitalism_scene_extracting_behavioral_data_to_p_4095cf7a-0bb3-46a1-9144-5d2b0e6f6446_0.mp4" -i "tts/clip_018.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 7\\: B Story':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Surveillance Capitalism':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Extracting behavioral data to predict and modify.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 20 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_018_final.mp4 -loglevel error


# Clip 20/46: Crack Epidemic
echo "  Processing [20/46] Crack Epidemic"

ffmpeg -i "NICK/Crack_Epidemic_scene_crack_swept_through_black_communities_Af_27c4f242-b297-4372-b27d-848d3b7e553f_1.mp4" -i "tts/clip_019.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 7\\: B Story':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Crack Epidemic':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Crack swept through black communities, Afeni became addicted.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 9 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_019_final.mp4 -loglevel error


# Clip 21/46: Chaos Theory
echo "  Processing [21/46] Chaos Theory"

ffmpeg -i "NICK/Chaos_Theory_scene_tiny_changes_have_massive_catastrophic_con_23725a73-86c1-419f-85bd-9ce51ff8d2f6_0.mp4" -i "tts/clip_020.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 7\\: B Story':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Chaos Theory':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Tiny changes have massive catastrophic consequences.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 5 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_020_final.mp4 -loglevel error


# Clip 22/46: Perpetual Now
echo "  Processing [22/46] Perpetual Now"

ffmpeg -i "NICK/Perpetual_Now_scene_trapped_in_perpetual_now_haunted_by_fragm_1c14abd3-6938-43f2-8508-a6e0c4d03126_3.mp4" -i "tts/clip_021.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 8\\: Fun and Games':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Perpetual Now':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Trapped in perpetual now, haunted by fragments.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 7 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_021_final.mp4 -loglevel error


# Clip 23/46: Predictive Algorithms
echo "  Processing [23/46] Predictive Algorithms"

ffmpeg -i "NICK/Predictive_Algorithms_scene_algorithms_that_predict_and_shape_ffc3ae51-0647-4fc0-bb52-e6334448010d_2.mp4" -i "tts/clip_022.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 8\\: Fun and Games':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Predictive Algorithms':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Algorithms that predict and shape human behavior.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 20 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_022_final.mp4 -loglevel error


# Clip 24/46: Individual Self
echo "  Processing [24/46] Individual Self"

ffmpeg -i "NICK/Individual_Self_scene_at_the_center_of_that_world_is_the_indi_4d09ed90-f274-41df-97dd-255ff04f1bdf_3.mp4" -i "tts/clip_023.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 8\\: Fun and Games':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Individual Self':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='At the center of that world is the individual self, making their own story.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 11 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_023_final.mp4 -loglevel error


# Clip 25/46: Godzilla Fear
echo "  Processing [25/46] Godzilla Fear"

ffmpeg -i "NICK/Godzilla_Fear_scene_disconnected_memories_spread_fear_across__5594d491-ae3f-4fec-bb56-7d84f74d0a65_3.mp4" -i "tts/clip_024.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 9\\: Midpoint':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Godzilla Fear':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Disconnected memories spread fear across America.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 11 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_024_final.mp4 -loglevel error


# Clip 26/46: Neural Networks
echo "  Processing [26/46] Neural Networks"

ffmpeg -i "NICK/Neural_Networks_scene_AI_learns_from_mass_data_ignores_all_hu_cb7f3037-fbcb-4aa4-9dc4-202676420809_3.mp4" -i "tts/clip_025.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 9\\: Midpoint':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Neural Networks':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='AI learns from mass data, ignores all human stories.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 11 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_025_final.mp4 -loglevel error


# Clip 27/46: Societal Boom
echo "  Processing [27/46] Societal Boom"

ffmpeg -i "NICK/Societal_Boom_scene_society_lets_you_go_far_but_as_soon_as_yo_57a22ed3-21cf-4e75-af79-286831bbff20_3.mp4" -i "tts/clip_026.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 9\\: Midpoint':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Societal Boom':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Society lets you go far, but as soon as you ask questions, boom.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 7 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_026_final.mp4 -loglevel error


# Clip 28/46: Individual Self
echo "  Processing [28/46] Individual Self"

ffmpeg -i "NICK/Individual_Self_scene_at_the_center_of_that_world_is_the_indi_4d09ed90-f274-41df-97dd-255ff04f1bdf_3.mp4" -i "tts/clip_027.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 10\\: Bad Guys Close In':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Individual Self':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='At the center of that world is the individual self, making their own story.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 11 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_027_final.mp4 -loglevel error


# Clip 29/46: Saudi Dream Society
echo "  Processing [29/46] Saudi Dream Society"

ffmpeg -i "NICK/Saudi_Dream_Society_scene_billions_created_a_dreamlike_societ_01eb3f87-3043-4029-9067-c0954744b5a3_2.mp4" -i "tts/clip_028.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 10\\: Bad Guys Close In':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Saudi Dream Society':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Billions created a dreamlike society, deeply corrupt.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 5 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_028_final.mp4 -loglevel error


# Clip 30/46: Individual Self
echo "  Processing [30/46] Individual Self"

ffmpeg -i "NICK/Individual_Self_scene_at_the_center_of_that_world_is_the_indi_4d09ed90-f274-41df-97dd-255ff04f1bdf_3.mp4" -i "tts/clip_029.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 10\\: Bad Guys Close In':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Individual Self':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='At the center of that world is the individual self, making their own story.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 11 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_029_final.mp4 -loglevel error


# Clip 31/46: Individual Self
echo "  Processing [31/46] Individual Self"

ffmpeg -i "NICK/Individual_Self_scene_at_the_center_of_that_world_is_the_indi_4d09ed90-f274-41df-97dd-255ff04f1bdf_3.mp4" -i "tts/clip_030.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 10\\: Bad Guys Close In':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Individual Self':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='At the center of that world is the individual self, making their own story.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 11 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_030_final.mp4 -loglevel error


# Clip 32/46: Neural Networks
echo "  Processing [32/46] Neural Networks"

ffmpeg -i "NICK/Neural_Networks_scene_AI_learns_from_mass_data_ignores_all_hu_cb7f3037-fbcb-4aa4-9dc4-202676420809_3.mp4" -i "tts/clip_031.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 11\\: All Is Lost':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Neural Networks':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='AI learns from mass data, ignores all human stories.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 11 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_031_final.mp4 -loglevel error


# Clip 33/46: Mass Incarceration
echo "  Processing [33/46] Mass Incarceration"

ffmpeg -i "NICK/Mass_Incarceration_scene_hundreds_of_thousands_imprisoned_wit_504ec4a9-0240-4987-bd62-cc162f8f42ab_0.mp4" -i "tts/clip_032.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 11\\: All Is Lost':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Mass Incarceration':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Hundreds of thousands imprisoned with no hope of parole.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 8 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_032_final.mp4 -loglevel error


# Clip 34/46: Neural Networks
echo "  Processing [34/46] Neural Networks"

ffmpeg -i "NICK/Neural_Networks_scene_AI_learns_from_mass_data_ignores_all_hu_cb7f3037-fbcb-4aa4-9dc4-202676420809_3.mp4" -i "tts/clip_033.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 11\\: All Is Lost':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Neural Networks':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='AI learns from mass data, ignores all human stories.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 11 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_033_final.mp4 -loglevel error


# Clip 35/46: Saudi Dream Society
echo "  Processing [35/46] Saudi Dream Society"

ffmpeg -i "NICK/Saudi_Dream_Society_scene_billions_created_a_dreamlike_societ_01eb3f87-3043-4029-9067-c0954744b5a3_2.mp4" -i "tts/clip_034.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 12\\: Dark Night of the Soul':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Saudi Dream Society':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Billions created a dreamlike society, deeply corrupt.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 5 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_034_final.mp4 -loglevel error


# Clip 36/46: Mass Incarceration
echo "  Processing [36/46] Mass Incarceration"

ffmpeg -i "NICK/Mass_Incarceration_scene_hundreds_of_thousands_imprisoned_wit_504ec4a9-0240-4987-bd62-cc162f8f42ab_0.mp4" -i "tts/clip_035.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 12\\: Dark Night of the Soul':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Mass Incarceration':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Hundreds of thousands imprisoned with no hope of parole.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 8 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_035_final.mp4 -loglevel error


# Clip 37/46: Neural Networks
echo "  Processing [37/46] Neural Networks"

ffmpeg -i "NICK/Neural_Networks_scene_AI_learns_from_mass_data_ignores_all_hu_cb7f3037-fbcb-4aa4-9dc4-202676420809_3.mp4" -i "tts/clip_036.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 12\\: Dark Night of the Soul':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Neural Networks':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='AI learns from mass data, ignores all human stories.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 11 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_036_final.mp4 -loglevel error


# Clip 38/46: Surveillance Capitalism
echo "  Processing [38/46] Surveillance Capitalism"

ffmpeg -i "NICK/Surveillance_Capitalism_scene_extracting_behavioral_data_to_p_4095cf7a-0bb3-46a1-9144-5d2b0e6f6446_0.mp4" -i "tts/clip_037.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 13\\: Break into Three':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Surveillance Capitalism':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Extracting behavioral data to predict and modify.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 20 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_037_final.mp4 -loglevel error


# Clip 39/46: Predictive Algorithms
echo "  Processing [39/46] Predictive Algorithms"

ffmpeg -i "NICK/Predictive_Algorithms_scene_algorithms_that_predict_and_shape_ffc3ae51-0647-4fc0-bb52-e6334448010d_2.mp4" -i "tts/clip_038.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 13\\: Break into Three':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Predictive Algorithms':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Algorithms that predict and shape human behavior.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 20 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_038_final.mp4 -loglevel error


# Clip 40/46: Godzilla Fear
echo "  Processing [40/46] Godzilla Fear"

ffmpeg -i "NICK/Godzilla_Fear_scene_disconnected_memories_spread_fear_across__5594d491-ae3f-4fec-bb56-7d84f74d0a65_3.mp4" -i "tts/clip_039.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 13\\: Break into Three':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Godzilla Fear':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Disconnected memories spread fear across America.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 11 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_039_final.mp4 -loglevel error


# Clip 41/46: CIA Interrogation
echo "  Processing [41/46] CIA Interrogation"

ffmpeg -i "NICK/cia-interrogation.mp4" -i "tts/clip_040.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 14\\: Finale':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='CIA Interrogation':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Waterboarding 83 times to create learned helplessness.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 12 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_040_final.mp4 -loglevel error


# Clip 42/46: Godzilla Fear
echo "  Processing [42/46] Godzilla Fear"

ffmpeg -i "NICK/Godzilla_Fear_scene_disconnected_memories_spread_fear_across__5594d491-ae3f-4fec-bb56-7d84f74d0a65_3.mp4" -i "tts/clip_041.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 14\\: Finale':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Godzilla Fear':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Disconnected memories spread fear across America.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 11 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_041_final.mp4 -loglevel error


# Clip 43/46: Perpetual Now
echo "  Processing [43/46] Perpetual Now"

ffmpeg -i "NICK/Perpetual_Now_scene_trapped_in_perpetual_now_haunted_by_fragm_1c14abd3-6938-43f2-8508-a6e0c4d03126_3.mp4" -i "tts/clip_042.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 14\\: Finale':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Perpetual Now':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Trapped in perpetual now, haunted by fragments.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 7 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_042_final.mp4 -loglevel error


# Clip 44/46: Mass Incarceration
echo "  Processing [44/46] Mass Incarceration"

ffmpeg -i "NICK/Mass_Incarceration_scene_hundreds_of_thousands_imprisoned_wit_504ec4a9-0240-4987-bd62-cc162f8f42ab_0.mp4" -i "tts/clip_043.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 15\\: Final Image':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Mass Incarceration':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Hundreds of thousands imprisoned with no hope of parole.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 8 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_043_final.mp4 -loglevel error


# Clip 45/46: Mass Incarceration
echo "  Processing [45/46] Mass Incarceration"

ffmpeg -i "NICK/Mass_Incarceration_scene_hundreds_of_thousands_imprisoned_wit_504ec4a9-0240-4987-bd62-cc162f8f42ab_0.mp4" -i "tts/clip_044.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 15\\: Final Image':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Mass Incarceration':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Hundreds of thousands imprisoned with no hope of parole.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 8 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_044_final.mp4 -loglevel error


# Clip 46/46: Grand Stories
echo "  Processing [46/46] Grand Stories"

ffmpeg -i "NICK/grand-stories.mp4" -i "tts/clip_045.aiff" \
  -filter_complex "\
    [0:v]scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2:color=black,\
    drawbox=y=0:color=black@1.0:width=iw:height=100:t=fill,\
    drawbox=y=ih-100:color=black@1.0:width=iw:height=100:t=fill,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='BEAT 15\\: Final Image':fontcolor=white:fontsize=32:x=(w-text_w)/2:y=26:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Grand Stories':fontcolor=yellow:fontsize=56:x=(w-text_w)/2:y=(h/2-50):enable='between(t,0,3)':box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=yellow@0.8:borderw=3,\
    drawtext=fontfile='/System/Library/Fonts/Supplemental/Courier New Bold.ttf':text='Believed deeply in their power to move people and inspire change.':fontcolor=white:fontsize=36:x=(w-text_w)/2:y=h-135:box=1:boxcolor=black@0.7:boxborderw=15:bordercolor=white@0.8:borderw=2[v]" \
  -map "[v]" -map 1:a \
  -ss 0 -t 5 \
  -c:v libx264 -preset medium -crf 22 \
  -c:a aac -b:a 192k \
  -shortest -y $TEMP_DIR/clip_045_final.mp4 -loglevel error


echo ""
echo "🎞️  Concatenating all clips..."

cat > $TEMP_DIR/concat.txt << 'EOFCONCAT'
file 'clip_000_final.mp4'
file 'clip_001_final.mp4'
file 'clip_002_final.mp4'
file 'clip_003_final.mp4'
file 'clip_004_final.mp4'
file 'clip_005_final.mp4'
file 'clip_006_final.mp4'
file 'clip_007_final.mp4'
file 'clip_008_final.mp4'
file 'clip_009_final.mp4'
file 'clip_010_final.mp4'
file 'clip_011_final.mp4'
file 'clip_012_final.mp4'
file 'clip_013_final.mp4'
file 'clip_014_final.mp4'
file 'clip_015_final.mp4'
file 'clip_016_final.mp4'
file 'clip_017_final.mp4'
file 'clip_018_final.mp4'
file 'clip_019_final.mp4'
file 'clip_020_final.mp4'
file 'clip_021_final.mp4'
file 'clip_022_final.mp4'
file 'clip_023_final.mp4'
file 'clip_024_final.mp4'
file 'clip_025_final.mp4'
file 'clip_026_final.mp4'
file 'clip_027_final.mp4'
file 'clip_028_final.mp4'
file 'clip_029_final.mp4'
file 'clip_030_final.mp4'
file 'clip_031_final.mp4'
file 'clip_032_final.mp4'
file 'clip_033_final.mp4'
file 'clip_034_final.mp4'
file 'clip_035_final.mp4'
file 'clip_036_final.mp4'
file 'clip_037_final.mp4'
file 'clip_038_final.mp4'
file 'clip_039_final.mp4'
file 'clip_040_final.mp4'
file 'clip_041_final.mp4'
file 'clip_042_final.mp4'
file 'clip_043_final.mp4'
file 'clip_044_final.mp4'
file 'clip_045_final.mp4'
EOFCONCAT

ffmpeg -f concat -safe 0 -i $TEMP_DIR/concat.txt \
  -c copy \
  -y filter_bubbles_cinematic_with_tts.mp4 -loglevel error

echo ""
echo "🧹 Cleaning up..."
rm -rf $TEMP_DIR

echo ""
echo "✅ CINEMATIC DOCUMENTARY COMPLETE!"
echo ""
echo "📁 Output: filter_bubbles_cinematic_with_tts.mp4"
echo "⏱️  Duration: 7:46"
echo "🎙️  Features:"
echo "   • TTS narration for all 46 quotes"
echo "   • Cinematic letterbox (2.35:1 style)"
echo "   • Text overlays (beat, title, quote)"
echo "   • 1920×1080 HD resolution"
echo ""
ls -lh filter_bubbles_cinematic_with_tts.mp4
