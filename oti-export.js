/**
 * OTI EXPORT LIBRARY
 * Universal export format for all Sense Ritual tools
 * Connects all crushers/meshworks to prompt-lab.html
 */

const OTIExport = {
  
  /**
   * Syntagma type definitions (Metz)
   */
  SYNTAGMAS: {
    'AS': 'Autonomous Shot',
    'PS': 'Parallel Syntagma',
    'BS': 'Bracket Syntagma',
    'DS': 'Descriptive Syntagma',
    'ALT': 'Alternating Syntagma',
    'SC': 'Scene',
    'ES': 'Episodic Sequence',
    'OS': 'Ordinary Sequence'
  },

  /**
   * 15 Save the Cat beats
   */
  BEATS: [
    { id: 1, name: 'Opening Image', act: 1 },
    { id: 2, name: 'Theme Stated', act: 1 },
    { id: 3, name: 'Set-Up', act: 1 },
    { id: 4, name: 'Catalyst', act: 1 },
    { id: 5, name: 'Debate', act: 1 },
    { id: 6, name: 'Break into Two', act: 2 },
    { id: 7, name: 'B Story', act: 2 },
    { id: 8, name: 'Fun and Games', act: 2 },
    { id: 9, name: 'Midpoint', act: 2 },
    { id: 10, name: 'Bad Guys Close In', act: 2 },
    { id: 11, name: 'All Is Lost', act: 2 },
    { id: 12, name: 'Dark Night of the Soul', act: 2 },
    { id: 13, name: 'Break into Three', act: 3 },
    { id: 14, name: 'Finale', act: 3 },
    { id: 15, name: 'Final Image', act: 3 }
  ],

  /**
   * Create base OTI structure
   */
  createBase(options = {}) {
    return {
      version: "1.0",
      title: options.title || "Untitled Film",
      logline: options.logline || "Generated from Sense Ritual tool",
      timestamp: new Date().toISOString(),
      coherenceScore: options.coherenceScore || 0,
      sourceVideo: options.sourceVideo || "",
      sourceTool: options.sourceTool || "unknown",
      metadata: options.metadata || {},
      sequences: []
    };
  },

  /**
   * Create a sequence (beat)
   */
  createSequence(options = {}) {
    const beat = this.BEATS[options.beatNumber - 1] || this.BEATS[0];
    return {
      id: options.id || options.beatNumber || 1,
      sequenceNumber: options.sequenceNumber || options.beatNumber || 1,
      beatName: options.beatName || beat.name,
      beatNumber: options.beatNumber || 1,
      act: options.act || beat.act,
      syntagmaType: options.syntagmaType || 'OS',
      syntagmaName: this.SYNTAGMAS[options.syntagmaType || 'OS'],
      lane: options.lane !== undefined ? options.lane : 0,
      flagged: options.flagged || false,
      rating: options.rating || null,
      tagged: options.tagged || false,
      metadata: options.metadata || {},
      clips: []
    };
  },

  /**
   * Create a clip
   */
  createClip(options = {}) {
    return {
      clipNumber: options.clipNumber || 1,
      clipId: options.clipId || `clip-${Date.now()}`,
      title: options.title || "Untitled Clip",
      category: options.category || "General",
      icon: options.icon || "📹",
      sourceIn: options.sourceIn || 0,
      sourceOut: options.sourceOut || (options.sourceIn || 0) + (options.duration || 5),
      duration: options.duration || 5,
      description: options.description || "",
      tags: options.tags || [],
      metadata: options.metadata || {}
    };
  },

  /**
   * EXPORT FROM NARRATIVE MESHWORK ORGANIC
   */
  fromNarrativeMeshwork(game) {
    const oti = this.createBase({
      title: "Narrative Meshwork Film",
      logline: "Assembled through organic cellular gameplay",
      sourceTool: "narrative-meshwork-organic",
      coherenceScore: game.score || 0,
      metadata: {
        moves: game.moves,
        beatsCollected: game.beatsCollected.length,
        automating: game.automating
      }
    });

    // Convert collected clips to sequences
    game.collectedClips.forEach((clip, index) => {
      const sequence = this.createSequence({
        id: index + 1,
        beatNumber: clip.beat,
        syntagmaType: clip.syntagma,
        metadata: {
          symbol: clip.type,
          cellType: 'organic-voronoi'
        }
      });

      sequence.clips.push(this.createClip({
        clipNumber: 1,
        clipId: `meshwork-${index}`,
        title: `Beat ${clip.beat}`,
        sourceIn: clip.start,
        sourceOut: clip.end,
        duration: clip.end - clip.start,
        metadata: {
          videoIndex: clip.type,
          breathingPhase: game.currentAct
        }
      }));

      oti.sequences.push(sequence);
    });

    return oti;
  },

  /**
   * EXPORT FROM MESHWORK 725
   */
  fromMeshwork725(cells, settings) {
    const oti = this.createBase({
      title: "Meshwork 725 Composition",
      logline: "Visual composition with breathing animation",
      sourceTool: "meshwork-725",
      metadata: {
        bloom: settings.bloom,
        edgeSoftness: settings.edgeSoftness,
        blendMode: settings.blendMode
      }
    });

    const sequence = this.createSequence({
      beatNumber: 1,
      beatName: "Visual Composition",
      syntagmaType: 'DS', // Descriptive
      metadata: {
        cellCount: cells.length
      }
    });

    cells.forEach((cell, i) => {
      sequence.clips.push(this.createClip({
        clipNumber: i + 1,
        clipId: `cell-${i}`,
        title: `Voronoi Cell ${i}`,
        duration: 5,
        metadata: {
          videoIndex: cell.videoIndex,
          centerX: cell.x,
          centerY: cell.y,
          breathing: cell.breathingPhase
        }
      }));
    });

    oti.sequences.push(sequence);
    return oti;
  },

  /**
   * EXPORT FROM M-CRUSHER-09 (Flux Garden)
   */
  fromFluxGarden(shapes, flowField) {
    const oti = this.createBase({
      title: "Flux Garden Flow",
      logline: "Organic flow field composition",
      sourceTool: "m-crusher-09",
      metadata: {
        shapeCount: shapes.length,
        noiseScale: flowField.scale
      }
    });

    const sequence = this.createSequence({
      beatNumber: 1,
      beatName: "Flow State",
      syntagmaType: 'ALT', // Alternating (flow patterns)
    });

    shapes.forEach((shape, i) => {
      sequence.clips.push(this.createClip({
        clipNumber: i + 1,
        clipId: `shape-${i}`,
        title: `Flow Shape ${i}`,
        duration: 10,
        metadata: {
          velocityX: shape.vx,
          velocityY: shape.vy,
          hue: shape.hue,
          noiseValue: shape.noise
        }
      }));
    });

    oti.sequences.push(sequence);
    return oti;
  },

  /**
   * EXPORT FROM M-CRUSHER-08 (Video Garden Automata)
   */
  fromVideoGarden(grid, generation) {
    const oti = this.createBase({
      title: "Video Garden Evolution",
      logline: "Cellular automata-driven video composition",
      sourceTool: "m-crusher-08",
      metadata: {
        generation: generation,
        gridSize: grid.length
      }
    });

    const sequence = this.createSequence({
      beatNumber: 1,
      beatName: `Generation ${generation}`,
      syntagmaType: 'ES', // Episodic
    });

    grid.forEach((row, r) => {
      row.forEach((cell, c) => {
        if (cell.active) {
          sequence.clips.push(this.createClip({
            clipNumber: r * row.length + c + 1,
            clipId: `cell-${r}-${c}`,
            title: `Cell ${r},${c}`,
            duration: cell.stateDuration || 5,
            metadata: {
              state: cell.state,
              neighbors: cell.neighborCount,
              position: [r, c]
            }
          }));
        }
      });
    });

    oti.sequences.push(sequence);
    return oti;
  },

  /**
   * EXPORT FROM M-CRUSHER-07 (Mosaic Sampler)
   */
  fromMosaicSampler(grid) {
    const oti = this.createBase({
      title: "Polytemporal Mosaic",
      logline: "Grid-based video comparison",
      sourceTool: "m-crusher-07",
      metadata: {
        gridSize: grid.length
      }
    });

    const sequence = this.createSequence({
      beatNumber: 1,
      beatName: "Polytemporal Comparison",
      syntagmaType: 'PS', // Parallel
    });

    grid.forEach((cell, i) => {
      sequence.clips.push(this.createClip({
        clipNumber: i + 1,
        clipId: cell.videoId || `grid-${i}`,
        title: cell.title || `Grid Cell ${i}`,
        sourceIn: cell.currentTime || 0,
        sourceOut: (cell.currentTime || 0) + 10,
        duration: 10,
        metadata: {
          gridPosition: cell.position,
          playbackRate: cell.playbackRate || 1
        }
      }));
    });

    oti.sequences.push(sequence);
    return oti;
  },

  /**
   * EXPORT FROM M-CRUSHER-06 (Match-3 Sequencer)
   */
  fromMatch3Sequencer(matchHistory) {
    const oti = this.createBase({
      title: "Match-3 Sequence",
      logline: "Narrative assembled through match-3 gameplay",
      sourceTool: "m-crusher-06",
      metadata: {
        totalMatches: matchHistory.length
      }
    });

    matchHistory.forEach((match, index) => {
      const sequence = this.createSequence({
        id: index + 1,
        beatNumber: index + 1,
        beatName: `Match ${index + 1}`,
        syntagmaType: this.detectSyntagmaFromMatch(match),
        metadata: {
          matchType: match.type,
          matchLength: match.cells.length
        }
      });

      match.cells.forEach((cell, i) => {
        sequence.clips.push(this.createClip({
          clipNumber: i + 1,
          clipId: cell.fragmentId,
          title: cell.fragmentTitle || `Fragment ${cell.fragmentId}`,
          duration: cell.duration || 5,
          metadata: {
            symbol: cell.symbol,
            position: cell.position
          }
        }));
      });

      oti.sequences.push(sequence);
    });

    return oti;
  },

  /**
   * EXPORT FROM GARDEN EDITOR
   */
  fromGardenEditor(timeline) {
    const oti = this.createBase({
      title: "Garden Editor Sequence",
      logline: "Tetris-style montage assembly",
      sourceTool: "garden",
      metadata: {
        recursiveLevels: timeline.levels || 6
      }
    });

    timeline.sequences.forEach((seq, index) => {
      const sequence = this.createSequence({
        id: index + 1,
        beatNumber: seq.beatIndex || index + 1,
        syntagmaType: this.detectSyntagmaFromBlocks(seq.blocks),
        metadata: {
          locked: seq.locked,
          level: seq.level
        }
      });

      seq.blocks.forEach((block, i) => {
        sequence.clips.push(this.createClip({
          clipNumber: i + 1,
          clipId: block.fragmentId,
          title: block.title || `Block ${i}`,
          sourceIn: block.timeIn,
          sourceOut: block.timeOut,
          duration: block.duration,
          metadata: {
            shape: block.shape,
            rotation: block.rotation
          }
        }));
      });

      oti.sequences.push(sequence);
    });

    return oti;
  },

  /**
   * EXPORT FROM MATRIX EDITOR
   */
  fromMatrixEditor(beatSheet) {
    const oti = this.createBase({
      title: beatSheet.title || "Matrix Editor Film",
      logline: beatSheet.logline || "Timeline-based assembly",
      sourceTool: "matrix-editor",
      coherenceScore: beatSheet.coherenceScore || 0
    });

    beatSheet.beats.forEach((beat, index) => {
      const sequence = this.createSequence({
        id: index + 1,
        beatNumber: beat.beatNumber,
        beatName: beat.beatName,
        act: beat.act,
        syntagmaType: beat.syntagmaCode,
        lane: beat.track,
        flagged: beat.flagged,
        rating: beat.rating
      });

      beat.clips.forEach((clip, i) => {
        sequence.clips.push(this.createClip({
          clipNumber: i + 1,
          clipId: clip.id,
          title: clip.title,
          category: clip.category,
          icon: clip.icon,
          sourceIn: clip.in,
          sourceOut: clip.out,
          duration: clip.duration,
          description: clip.description,
          tags: clip.tags
        }));
      });

      oti.sequences.push(sequence);
    });

    return oti;
  },

  /**
   * Helper: Detect syntagma from match pattern
   */
  detectSyntagmaFromMatch(match) {
    if (match.type === 'horizontal') return 'OS'; // Ordinary Sequence
    if (match.type === 'vertical') return 'DS'; // Descriptive
    if (match.type === 'l-shape') return 'BS'; // Bracket
    if (match.type === 't-shape') return 'ALT'; // Alternating
    return 'OS';
  },

  /**
   * Helper: Detect syntagma from block arrangement
   */
  detectSyntagmaFromBlocks(blocks) {
    if (blocks.length === 1) return 'AS'; // Autonomous Shot
    if (blocks.length === 2) return 'PS'; // Parallel
    if (blocks.length >= 3 && blocks.length <= 5) return 'SC'; // Scene
    if (blocks.length > 5) return 'OS'; // Ordinary Sequence
    return 'OS';
  },

  /**
   * Download OTI JSON file
   */
  download(oti, filename = 'export.oti.json') {
    const json = JSON.stringify(oti, null, 2);
    const blob = new Blob([json], { type: 'application/json' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = filename;
    a.click();
    URL.revokeObjectURL(url);
  },

  /**
   * Open in prompt-lab
   */
  sendToPromptLab(oti) {
    // Store in localStorage for prompt-lab to pick up
    localStorage.setItem('oti_export', JSON.stringify(oti));
    // Open prompt-lab in new tab
    window.open('prompt-lab.html', '_blank');
  },

  /**
   * Create export button HTML
   */
  createButton(containerId, tool, dataGetter) {
    const container = document.getElementById(containerId);
    if (!container) return;

    const btn = document.createElement('button');
    btn.textContent = '📤 Export to Prompt Lab';
    btn.style.cssText = `
      padding: 12px 24px;
      background: #00ff00;
      color: #000;
      border: none;
      font-weight: bold;
      cursor: pointer;
      font-family: 'Courier New', monospace;
      margin: 10px;
    `;
    btn.onclick = () => {
      const data = dataGetter();
      let oti;
      
      switch(tool) {
        case 'narrative-meshwork':
          oti = this.fromNarrativeMeshwork(data);
          break;
        case 'meshwork-725':
          oti = this.fromMeshwork725(data.cells, data.settings);
          break;
        case 'm-crusher-09':
          oti = this.fromFluxGarden(data.shapes, data.flowField);
          break;
        case 'm-crusher-08':
          oti = this.fromVideoGarden(data.grid, data.generation);
          break;
        case 'm-crusher-07':
          oti = this.fromMosaicSampler(data.grid);
          break;
        case 'm-crusher-06':
          oti = this.fromMatch3Sequencer(data.matchHistory);
          break;
        case 'garden':
          oti = this.fromGardenEditor(data.timeline);
          break;
        case 'matrix':
          oti = this.fromMatrixEditor(data.beatSheet);
          break;
        default:
          console.error('Unknown tool:', tool);
          return;
      }
      
      this.download(oti);
      this.sendToPromptLab(oti);
      
      alert('✓ Exported to Prompt Lab!\nFile downloaded and sent to lab.');
    };
    
    container.appendChild(btn);
  }
};

// Make available globally
if (typeof window !== 'undefined') {
  window.OTIExport = OTIExport;
}
