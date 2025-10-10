// FILM GENERATOR - Separate module for generating playable films from OTI.JSON
// This keeps the main game clean and makes debugging easier

/**
 * Generate a playable HTML film from OTI data
 * @param {Object} otiData - The OTI.JSON data structure
 * @returns {string} - Complete HTML document as string
 */
function generateFilmHTML(otiData) {
    const title = otiData.title || "Untitled Documentary";
    const logline = otiData.logline || "";
    const runtime = Math.round(otiData.metadata.totalDuration);
    const color = "#E24A4A"; // Default color, could be passed in
    
    // Group sequences by act
    const acts = {
        1: otiData.sequences.filter(s => s.act === 1),
        2: otiData.sequences.filter(s => s.act === 2),
        3: otiData.sequences.filter(s => s.act === 3)
    };
    
    // Build the film HTML
    let html = `<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            background: #1a1a1a;
            color: #fff;
            font-family: 'Courier New', monospace;
            overflow: hidden;
        }
        .film-container {
            width: 100vw;
            height: 100vh;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #1a1a1a;
        }
        .frame {
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            display: none;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: #1a1a1a;
            z-index: 1;
            padding: 40px;
        }
        .frame.active { 
            display: flex;
            z-index: 10;
        }
        
        /* Title Card */
        .title-card {
            text-align: center;
            padding: 40px;
            border: 3px solid #000;
            background: #0a0a0a;
            max-width: 1000px;
        }
        .title-card h1 {
            font-size: clamp(36px, 8vw, 72px);
            font-weight: 900;
            color: #fff;
            letter-spacing: -1px;
            margin-bottom: 20px;
            text-transform: uppercase;
        }
        .title-card .logline {
            font-size: clamp(14px, 2.5vw, 18px);
            opacity: 0.7;
            max-width: 800px;
            line-height: 1.6;
            margin: 0 auto 30px;
            color: #999;
        }
        .title-card .meta {
            font-size: 11px;
            opacity: 0.5;
            font-family: 'Courier New', monospace;
            text-transform: uppercase;
            color: #666;
        }
        
        /* Act Divider */
        .act-divider {
            text-align: center;
            padding: 40px;
            border: 2px solid #333;
            background: #0a0a0a;
            max-width: 800px;
        }
        .act-divider h2 {
            font-size: clamp(28px, 6vw, 48px);
            font-weight: 900;
            color: ${color};
            letter-spacing: 2px;
            text-transform: uppercase;
        }
        
        /* Text Card - Story transitions */
        .text-card {
            text-align: center;
            padding: 40px;
            max-width: 1200px;
            margin: 0 auto;
            background: #0a0a0a;
            border: 2px solid #333;
        }
        .text-card .beat-intro {
            font-size: clamp(12px, 2vw, 14px);
            color: ${color};
            font-weight: 700;
            margin-bottom: 20px;
            letter-spacing: 1px;
            text-transform: uppercase;
        }
        .text-card .narrative-text {
            font-size: clamp(18px, 3.5vw, 28px);
            font-weight: 400;
            line-height: 1.5;
            margin-bottom: 30px;
            font-style: italic;
            color: #ccc;
        }
        .text-card .clip-preview {
            font-size: clamp(16px, 3vw, 24px);
            opacity: 0.7;
            line-height: 1.6;
            margin-bottom: 20px;
        }
        .text-card .syntagma-note {
            font-size: clamp(12px, 2vw, 16px);
            opacity: 0.5;
            font-family: 'Courier New', monospace;
            margin-top: 40px;
        }
        
        /* Geometric Chain Display (for video version text cards) */
        .chain-display {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 20px;
            flex-wrap: wrap;
            margin: 30px 0;
        }
        .chain-node {
            background: #2a2a2a;
            border: 2px solid #444;
            padding: 12px 20px;
            min-width: 120px;
            position: relative;
            transition: all 0.2s;
        }
        .chain-node:hover {
            transform: scale(1.05);
            border-color: ${color};
            box-shadow: 0 4px 12px rgba(0,0,0,0.5);
        }
        .chain-node .node-title {
            font-size: clamp(10px, 1.8vw, 13px);
            font-weight: 700;
            color: #fff;
            margin-bottom: 4px;
            line-height: 1.2;
        }
        .chain-node .node-icon {
            font-size: clamp(18px, 2.5vw, 24px);
            margin-bottom: 6px;
        }
        .chain-arrow {
            font-size: clamp(16px, 2.5vw, 20px);
            color: #666;
            opacity: 0.7;
        }
        
        /* Shot Frame */
        .shot-frame {
            width: 100%;
            height: 100%;
            position: relative;
        }
        .shot-frame iframe {
            width: 100%;
            height: 100%;
            border: none;
        }
        .shot-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            background: linear-gradient(to bottom, rgba(0,0,0,0.95) 0%, rgba(0,0,0,0.7) 50%, transparent 100%);
            padding: 30px;
            z-index: 10;
        }
        .shot-overlay .beat-label {
            font-size: clamp(14px, 2.5vw, 20px);
            font-weight: 700;
            color: ${color};
            margin-bottom: 8px;
        }
        .shot-overlay .syntagma-label {
            font-size: clamp(11px, 2vw, 16px);
            opacity: 0.7;
        }
        .shot-info {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: linear-gradient(to top, rgba(0,0,0,0.95) 0%, rgba(0,0,0,0.7) 50%, transparent 100%);
            padding: 30px;
            z-index: 10;
        }
        .shot-info .title {
            font-size: clamp(18px, 3.5vw, 28px);
            font-weight: 700;
            margin-bottom: 12px;
            color: ${color};
        }
        .shot-info .description {
            font-size: clamp(14px, 2.5vw, 18px);
            opacity: 0.9;
            line-height: 1.5;
            margin-bottom: 12px;
            max-width: 900px;
        }
        .shot-info .meta {
            font-size: clamp(11px, 1.8vw, 14px);
            opacity: 0.5;
            font-family: 'Courier New', monospace;
        }
        .shot-info .tags {
            display: inline-flex;
            gap: 8px;
            margin-top: 8px;
        }
        .shot-info .tag {
            background: rgba(255,255,255,0.1);
            padding: 4px 10px;
            border-radius: 12px;
            font-size: clamp(10px, 1.5vw, 12px);
            opacity: 0.7;
        }
        
        /* Controls */
        .controls {
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
            display: flex;
            gap: 12px;
            z-index: 100;
            background: #0a0a0a;
            padding: 16px;
            border-top: 2px solid #333;
            justify-content: center;
            align-items: center;
        }
        .controls button {
            padding: 8px 16px;
            border: 2px solid #444;
            background: #1a1a1a;
            color: #fff;
            cursor: pointer;
            font-family: 'Courier New', monospace;
            font-weight: bold;
            font-size: 11px;
            transition: all 0.2s;
            text-transform: uppercase;
        }
        .controls button:hover {
            background: #333;
            border-color: #666;
        }
        .controls button:active {
            transform: scale(0.95);
        }
    </style>
</head>
<body>
    <div class="film-container" id="filmContainer">
        <!-- Title Card -->
        <div class="frame active title-card" data-duration="3000">
            <h1>${title}</h1>
            ${logline ? `<div class="logline">${logline}</div>` : ''}
            <div class="meta">${otiData.sequences.length} beats · ${otiData.metadata.totalClips} shots · ${runtime}s</div>
        </div>
`;

    // Add act dividers and shots
    let frameIndex = 1;
    [1, 2, 3].forEach(actNum => {
        if (acts[actNum].length === 0) return;
        
        // Act divider
        const actNames = { 1: "SETUP", 2: "CONFRONTATION", 3: "RESOLUTION" };
        html += `
        <!-- Act ${actNum} Divider -->
        <div class="frame act-divider" data-duration="2000">
            <h2>ACT ${actNum}: ${actNames[actNum]}</h2>
        </div>
`;
        
        // Shots in this act
        acts[actNum].forEach(sequence => {
            // Add text card before each beat with geometric chain
            const narrative = generateBeatNarrative(sequence.beatName || 'Beat ' + sequence.beatNumber, sequence);
            
            // Build chain nodes
            const chainNodes = sequence.clips.map((clip, idx) => {
                return `
                    ${idx > 0 ? '<div class="chain-arrow">→</div>' : ''}
                    <div class="chain-node">
                        <div class="node-icon">${clip.icon || '●'}</div>
                        <div class="node-title">${clip.title}</div>
                    </div>
                `;
            }).join('');
            
            html += `
        <!-- Text Card: ${sequence.beatName} -->
        <div class="frame text-card" data-duration="4000">
            <div class="beat-intro">Beat ${sequence.beatNumber}: ${sequence.beatName || sequence.sequenceNumber}</div>
            <div class="narrative-text">${narrative}</div>
            <div class="chain-display">
                ${chainNodes}
            </div>
            <div class="syntagma-note">${sequence.syntagmaType || ''} ${sequence.syntagmaName ? '— ' + sequence.syntagmaName : ''} · ${sequence.clips.length} shots</div>
        </div>
`;
            
            sequence.clips.forEach((clip, clipIdx) => {
                const videoUrl = `https://www.youtube-nocookie.com/embed/${otiData.sourceVideo}?start=${clip.sourceIn}&end=${clip.sourceOut}&controls=0&modestbranding=1&autoplay=1&mute=0`;
                const description = clip.description || clip.desc || '';
                const tags = clip.tags || [];
                
                html += `
        <!-- Shot ${frameIndex}: ${clip.title} -->
        <div class="frame shot-frame" data-duration="${clip.duration * 1000}">
            <div class="shot-overlay">
                <div class="beat-label">Beat ${sequence.beatNumber}: ${sequence.beatName || sequence.sequenceNumber}</div>
                <div class="syntagma-label">${sequence.syntagmaType || ''} ${sequence.syntagmaName ? '- ' + sequence.syntagmaName : ''}</div>
            </div>
            <iframe src="${videoUrl}" allow="autoplay; encrypted-media" allowfullscreen></iframe>
            <div class="shot-info">
                <div class="title">${clip.title}</div>
                ${description ? `<div class="description">${description}</div>` : ''}
                <div class="meta">${clip.category} ${clip.icon || ''} · ${clip.duration}s · ${formatTimecode(clip.sourceIn)} - ${formatTimecode(clip.sourceOut)}</div>
                ${tags.length > 0 ? `<div class="tags">${tags.map(t => `<span class="tag">#${t}</span>`).join('')}</div>` : ''}
            </div>
        </div>
`;
                frameIndex++;
            });
        });
    });

    // Add controls and script
    html += `
    </div>
    
    <div class="controls">
        <button onclick="prevFrame()">◀ PREV</button>
        <button onclick="togglePlay()">⏯ PLAY</button>
        <button onclick="nextFrame()">NEXT ▶</button>
    </div>
    
    <script>
        let currentFrame = 0;
        let isPlaying = false;
        let autoAdvanceTimer = null;
        const frames = document.querySelectorAll('.frame');
        
        function showFrame(index) {
            frames.forEach((f, i) => {
                f.classList.toggle('active', i === index);
            });
            currentFrame = index;
            
            if (isPlaying) {
                const duration = parseInt(frames[index].dataset.duration) || 3000;
                clearTimeout(autoAdvanceTimer);
                autoAdvanceTimer = setTimeout(() => {
                    if (currentFrame < frames.length - 1) {
                        nextFrame();
                    } else {
                        isPlaying = false;
                    }
                }, duration);
            }
        }
        
        function nextFrame() {
            if (currentFrame < frames.length - 1) {
                showFrame(currentFrame + 1);
            }
        }
        
        function prevFrame() {
            if (currentFrame > 0) {
                showFrame(currentFrame - 1);
            }
        }
        
        function togglePlay() {
            isPlaying = !isPlaying;
            if (isPlaying) {
                showFrame(currentFrame);
            } else {
                clearTimeout(autoAdvanceTimer);
            }
        }
        
        // Keyboard controls
        document.addEventListener('keydown', (e) => {
            if (e.key === 'ArrowRight') nextFrame();
            if (e.key === 'ArrowLeft') prevFrame();
            if (e.key === ' ') { e.preventDefault(); togglePlay(); }
        });
        
        // Auto-start after title card
        setTimeout(() => {
            isPlaying = true;
            showFrame(currentFrame);
        }, 3000);
    </script>
</body>
</html>`;

    return html;
}

/**
 * Generate FFmpeg script for rendering final video
 * @param {Object} otiData - The OTI.JSON data structure
 * @returns {string} - Bash script for ffmpeg rendering
 */
function generateFFmpegScript(otiData) {
    const title = otiData.title.toLowerCase().replace(/[^a-z0-9]+/g, '_');
    let script = `#!/bin/bash
# FFmpeg render script for: ${otiData.title}
# Generated by Matrix Editor

set -e

echo "Downloading clips from YouTube..."
`;

    let clipNum = 1;
    otiData.sequences.forEach(seq => {
        seq.clips.forEach(clip => {
            const paddedNum = String(clipNum).padStart(3, '0');
            script += `yt-dlp --download-sections "*${clip.sourceIn}-${clip.sourceOut}" -o "clip_${paddedNum}.mp4" "https://youtube.com/watch?v=${otiData.sourceVideo}"\n`;
            clipNum++;
        });
    });

    script += `
echo "Creating concat file..."
cat > concat.txt << EOF
`;

    clipNum = 1;
    otiData.sequences.forEach(seq => {
        seq.clips.forEach(clip => {
            const paddedNum = String(clipNum).padStart(3, '0');
            script += `file 'clip_${paddedNum}.mp4'\n`;
            clipNum++;
        });
    });

    script += `EOF

echo "Rendering final film..."
ffmpeg -f concat -safe 0 -i concat.txt -c copy "${title}_final.mp4"

echo "Done! Film saved as ${title}_final.mp4"
`;

    return script;
}

/**
 * Generate narrative text for beat introduction
 */
function generateBeatNarrative(beatName, sequence) {
    const narratives = {
        "Opening Image": `Once upon a time in a world of ${sequence.clips.map(c => c.title.toLowerCase()).join(', ')}...`,
        "Theme Stated": `The question emerges: ${sequence.clips[0].description || 'What does it all mean?'}`,
        "Set-Up": `This is how things were: ${sequence.clips.length} fragments of a system in motion.`,
        "Catalyst": `Then everything changed when ${sequence.clips[0].title.toLowerCase()} arrived.`,
        "Debate": `Two paths diverge: ${sequence.clips.map(c => c.title).join(' or ')}?`,
        "Break into Two": `The crossing of the threshold into ${sequence.clips[0].category.toLowerCase()} territory.`,
        "B Story": `Meanwhile, a parallel story unfolds through ${sequence.clips.length} connected moments.`,
        "Fun and Games": `The promise of the premise: ${sequence.clips.map(c => c.title.toLowerCase()).join(', ')}.`,
        "Midpoint": `At the center, everything inverts: ${sequence.clips[0].description || 'False victory or defeat.'}`,
        "Bad Guys Close In": `The walls close in as ${sequence.clips.map(c => c.title.toLowerCase()).join(', ')} converge.`,
        "All Is Lost": `The lowest point: ${sequence.clips[0].description || 'Everything falls apart.'}`,
        "Dark Night of the Soul": `In darkness, ${sequence.clips.length} fragments of memory and loss.`,
        "Break into Three": `The solution reveals itself through ${sequence.clips.map(c => c.title.toLowerCase()).join(', ')}.`,
        "Finale": `The final confrontation: ${sequence.clips.length} pieces come together.`,
        "Final Image": `And so we end where we began, transformed by ${sequence.clips.map(c => c.title.toLowerCase()).join(', ')}.`
    };
    
    return narratives[beatName] || `Beat ${sequence.beatNumber}: ${beatName}`;
}

/**
 * Helper function to format timecode
 */
function formatTimecode(seconds) {
    const h = Math.floor(seconds / 3600);
    const m = Math.floor((seconds % 3600) / 60);
    const s = Math.floor(seconds % 60);
    return `${String(h).padStart(2, '0')}:${String(m).padStart(2, '0')}:${String(s).padStart(2, '0')}`;
}

/**
 * Generate text-only film (no YouTube embeds)
 * @param {Object} otiData - The OTI.JSON data structure
 * @returns {string} - Complete HTML document as string
 */
function generateTextOnlyFilm(otiData) {
    const title = otiData.title || "Untitled Documentary";
    const logline = otiData.logline || "";
    const runtime = Math.round(otiData.metadata.totalDuration);
    const color = "#E24A4A";
    
    // Group sequences by act
    const acts = {
        1: otiData.sequences.filter(s => s.act === 1),
        2: otiData.sequences.filter(s => s.act === 2),
        3: otiData.sequences.filter(s => s.act === 3)
    };
    
    let html = `<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title}</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            background: #000;
            color: #fff;
            font-family: 'Helvetica Neue', Arial, sans-serif;
            overflow: hidden;
        }
        .film-container {
            width: 100vw;
            height: 100vh;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .frame {
            width: 100%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            display: none;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 60px 40px;
            background: #000;
            z-index: 1;
        }
        .frame.active { 
            display: flex;
            z-index: 10;
        }
        
        .title-card {
            text-align: center;
            max-width: 1000px;
        }
        .title-card h1 {
            font-size: clamp(48px, 10vw, 120px);
            font-weight: 900;
            color: ${color};
            letter-spacing: 4px;
            margin-bottom: 30px;
            text-transform: uppercase;
        }
        .title-card .logline {
            font-size: clamp(18px, 3vw, 28px);
            opacity: 0.8;
            max-width: 800px;
            line-height: 1.6;
            margin: 0 auto 40px;
        }
        .title-card .meta {
            font-size: 14px;
            opacity: 0.5;
            font-family: 'Courier New', monospace;
        }
        
        .act-divider {
            text-align: center;
        }
        .act-divider h2 {
            font-size: clamp(36px, 8vw, 80px);
            font-weight: 900;
            color: ${color};
            letter-spacing: 6px;
        }
        
        .text-card {
            text-align: center;
            max-width: 1000px;
        }
        .text-card .beat-intro {
            font-size: clamp(14px, 2.5vw, 18px);
            color: ${color};
            font-weight: 700;
            margin-bottom: 30px;
            letter-spacing: 2px;
            text-transform: uppercase;
        }
        .text-card .narrative-text {
            font-size: clamp(24px, 5vw, 48px);
            font-weight: 300;
            line-height: 1.4;
            margin-bottom: 30px;
            font-style: italic;
        }
        .text-card .clip-preview {
            font-size: clamp(16px, 3vw, 24px);
            opacity: 0.7;
            line-height: 1.6;
            margin-bottom: 20px;
        }
        .text-card .syntagma-note {
            font-size: clamp(12px, 2vw, 16px);
            opacity: 0.5;
            font-family: 'Courier New', monospace;
            margin-top: 40px;
        }
        
        .beat-sequence {
            text-align: center;
            max-width: 1200px;
            display: flex;
            flex-direction: column;
            gap: 40px;
        }
        .beat-sequence .beat-header {
            font-size: clamp(16px, 3vw, 24px);
            color: ${color};
            font-weight: 700;
            letter-spacing: 2px;
            text-transform: uppercase;
        }
        .beat-sequence .narrative-line {
            font-size: clamp(20px, 4vw, 36px);
            font-weight: 300;
            font-style: italic;
            opacity: 0.9;
            line-height: 1.4;
        }
        
        /* Geometric Chain Display */
        .chain-display {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 20px;
            flex-wrap: wrap;
            margin: 30px 0;
        }
        .chain-node {
            background: rgba(255,255,255,0.05);
            border: 3px solid ${color};
            padding: 20px 30px;
            min-width: 200px;
            position: relative;
            clip-path: polygon(10% 0%, 90% 0%, 100% 50%, 90% 100%, 10% 100%, 0% 50%);
        }
        .chain-node .node-title {
            font-size: clamp(14px, 2.5vw, 20px);
            font-weight: 700;
            color: ${color};
            margin-bottom: 8px;
        }
        .chain-node .node-desc {
            font-size: clamp(11px, 1.8vw, 14px);
            opacity: 0.7;
            line-height: 1.4;
        }
        .chain-node .node-icon {
            font-size: clamp(24px, 4vw, 36px);
            margin-bottom: 10px;
        }
        .chain-arrow {
            font-size: clamp(24px, 4vw, 36px);
            color: ${color};
            opacity: 0.5;
        }
        
        .syntagma-label-bottom {
            font-size: clamp(11px, 2vw, 14px);
            opacity: 0.4;
            font-family: 'Courier New', monospace;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        
        .controls {
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
            display: flex;
            gap: 12px;
            z-index: 100;
            background: #0a0a0a;
            padding: 16px;
            border-top: 2px solid #333;
            justify-content: center;
            align-items: center;
        }
        .controls button {
            padding: 8px 16px;
            border: 2px solid #444;
            background: #1a1a1a;
            color: #fff;
            cursor: pointer;
            font-family: 'Courier New', monospace;
            font-weight: bold;
            font-size: 11px;
            transition: all 0.2s;
            text-transform: uppercase;
        }
        .controls button:hover {
            background: #333;
            border-color: #666;
        }
        .controls button:active {
            transform: scale(0.95);
        }
    </style>
</head>
<body>
    <div class="film-container" id="filmContainer">
        <!-- Title Card -->
        <div class="frame active title-card" data-duration="3000">
            <h1>${title}</h1>
            ${logline ? `<div class="logline">${logline}</div>` : ''}
            <div class="meta">${otiData.sequences.length} beats · ${otiData.metadata.totalClips} shots · ${runtime}s · TEXT-ONLY VERSION</div>
        </div>
`;

    // Add act dividers and text cards
    let frameIndex = 1;
    [1, 2, 3].forEach(actNum => {
        if (acts[actNum].length === 0) return;
        
        const actNames = { 1: "SETUP", 2: "CONFRONTATION", 3: "RESOLUTION" };
        html += `
        <!-- Act ${actNum} Divider -->
        <div class="frame act-divider" data-duration="2000">
            <h2>ACT ${actNum}: ${actNames[actNum]}</h2>
        </div>
`;
        
        acts[actNum].forEach(sequence => {
            // Show entire beat as one geometric chain (max 30s)
            const narrative = generateBeatNarrative(sequence.beatName || 'Beat ' + sequence.beatNumber, sequence);
            const duration = Math.min(sequence.clips.reduce((sum, c) => sum + c.duration, 0) * 1000, 30000); // Max 30s
            
            // Build chain nodes
            const chainNodes = sequence.clips.map((clip, idx) => {
                const desc = clip.description || clip.desc || '';
                const shortDesc = desc.split('.')[0] || desc.substring(0, 80); // First sentence or 80 chars
                return `
                    ${idx > 0 ? '<div class="chain-arrow">→</div>' : ''}
                    <div class="chain-node">
                        <div class="node-icon">${clip.icon || '●'}</div>
                        <div class="node-title">${clip.title}</div>
                        <div class="node-desc">${shortDesc}${desc.length > 80 ? '...' : ''}</div>
                    </div>
                `;
            }).join('');
            
            html += `
        <!-- Beat Sequence: ${sequence.beatName} -->
        <div class="frame beat-sequence" data-duration="${duration}">
            <div class="beat-header">Beat ${sequence.beatNumber}: ${sequence.beatName || sequence.sequenceNumber}</div>
            <div class="narrative-line">${narrative}</div>
            <div class="chain-display">
                ${chainNodes}
            </div>
            <div class="syntagma-label-bottom">${sequence.syntagmaType || ''} ${sequence.syntagmaName ? '— ' + sequence.syntagmaName : ''} · ${sequence.clips.length} shots · ${Math.round(duration/1000)}s</div>
        </div>
`;
            frameIndex++;
        });
    });

    html += `
    </div>
    
    <div class="controls">
        <button onclick="prevFrame()">◀ PREV</button>
        <button onclick="togglePlay()">⏯ PLAY</button>
        <button onclick="nextFrame()">NEXT ▶</button>
    </div>
    
    <script>
        let currentFrame = 0;
        let isPlaying = false;
        let autoAdvanceTimer = null;
        const frames = document.querySelectorAll('.frame');
        
        function showFrame(index) {
            frames.forEach((f, i) => {
                f.classList.toggle('active', i === index);
            });
            currentFrame = index;
            
            if (isPlaying) {
                const duration = parseInt(frames[index].dataset.duration) || 3000;
                clearTimeout(autoAdvanceTimer);
                autoAdvanceTimer = setTimeout(() => {
                    if (currentFrame < frames.length - 1) {
                        nextFrame();
                    } else {
                        isPlaying = false;
                    }
                }, duration);
            }
        }
        
        function nextFrame() {
            if (currentFrame < frames.length - 1) {
                showFrame(currentFrame + 1);
            }
        }
        
        function prevFrame() {
            if (currentFrame > 0) {
                showFrame(currentFrame - 1);
            }
        }
        
        function togglePlay() {
            isPlaying = !isPlaying;
            if (isPlaying) {
                showFrame(currentFrame);
            } else {
                clearTimeout(autoAdvanceTimer);
            }
        }
        
        document.addEventListener('keydown', (e) => {
            if (e.key === 'ArrowRight') nextFrame();
            if (e.key === 'ArrowLeft') prevFrame();
            if (e.key === ' ') { e.preventDefault(); togglePlay(); }
        });
        
        setTimeout(() => {
            isPlaying = true;
            showFrame(currentFrame);
        }, 3000);
    </script>
</body>
</html>`;

    return html;
}

// Export for use in matrix-editor.html
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { generateFilmHTML, generateTextOnlyFilm, generateFFmpegScript, formatTimecode };
}
