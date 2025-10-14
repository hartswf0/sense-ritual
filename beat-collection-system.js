/**
 * UNIVERSAL BEAT COLLECTION SYSTEM
 * Add to any Sense Ritual game to enable:
 * - Visual beat collection notifications
 * - Progress tracking (X/15 beats)
 * - "Assemble Final Cut" button when complete
 * - Opens final-screen.html with score/export options
 */

const BeatCollectionSystem = {
  // Configuration
  config: {
    totalBeats: 15,
    flashDuration: 2000,
    flashColor: '#00ffff',
    completionSound: true
  },
  
  // State
  collectedBeats: [],
  
  // Initialize system
  init(options = {}) {
    this.config = { ...this.config, ...options };
    this.createUI();
    this.attachStyles();
  },
  
  // Create UI elements
  createUI() {
    // Beat flash notification
    if (!document.getElementById('beatFlash')) {
      const flash = document.createElement('div');
      flash.id = 'beatFlash';
      flash.className = 'beat-flash';
      document.body.appendChild(flash);
    }
    
    // Progress tracker
    if (!document.getElementById('beatProgress')) {
      const progress = document.createElement('div');
      progress.id = 'beatProgress';
      progress.className = 'beat-progress';
      progress.innerHTML = `
        <div class="beat-progress-bar">
          <div class="beat-progress-fill" style="width: 0%"></div>
        </div>
        <div class="beat-progress-text">0/${this.config.totalBeats} Beats</div>
      `;
      document.body.appendChild(progress);
    }
    
    // Assemble button (hidden initially)
    if (!document.getElementById('assembleFinalCutBtn')) {
      const btn = document.createElement('button');
      btn.id = 'assembleFinalCutBtn';
      btn.className = 'assemble-btn';
      btn.style.display = 'none';
      btn.innerHTML = '🎬 ASSEMBLE FINAL CUT';
      btn.onclick = () => this.openFinalScreen();
      document.body.appendChild(btn);
    }
  },
  
  // Attach required CSS
  attachStyles() {
    if (document.getElementById('beatCollectionStyles')) return;
    
    const style = document.createElement('style');
    style.id = 'beatCollectionStyles';
    style.textContent = `
      /* Beat Flash Notification */
      .beat-flash {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background: rgba(0, 0, 0, 0.95);
        border: 4px solid var(--flash-color, #00ffff);
        padding: 40px 60px;
        font-size: clamp(24px, 5vw, 48px);
        font-weight: 900;
        text-align: center;
        color: var(--flash-color, #00ffff);
        z-index: 9999;
        pointer-events: none;
        opacity: 0;
        transition: opacity 0.3s;
        text-transform: uppercase;
        letter-spacing: 0.1em;
        box-shadow: 0 0 40px var(--flash-color, #00ffff);
      }
      
      .beat-flash.show {
        opacity: 1;
        animation: beatPulse 0.5s ease-out;
      }
      
      @keyframes beatPulse {
        0% { transform: translate(-50%, -50%) scale(0.8); }
        50% { transform: translate(-50%, -50%) scale(1.1); }
        100% { transform: translate(-50%, -50%) scale(1); }
      }
      
      /* Progress Tracker */
      .beat-progress {
        position: fixed;
        top: 20px;
        left: 50%;
        transform: translateX(-50%);
        background: rgba(0, 0, 0, 0.85);
        border: 2px solid #333;
        padding: 12px 20px;
        min-width: 200px;
        z-index: 100;
        backdrop-filter: blur(10px);
      }
      
      .beat-progress-bar {
        width: 100%;
        height: 8px;
        background: #222;
        border-radius: 4px;
        overflow: hidden;
        margin-bottom: 8px;
      }
      
      .beat-progress-fill {
        height: 100%;
        background: linear-gradient(90deg, #00ffff, #ff00ff);
        transition: width 0.5s ease-out;
      }
      
      .beat-progress-text {
        font-size: 14px;
        font-weight: 700;
        text-align: center;
        color: #fff;
        letter-spacing: 0.05em;
      }
      
      /* Assemble Button */
      .assemble-btn {
        position: fixed;
        bottom: 30px;
        left: 50%;
        transform: translateX(-50%);
        padding: 20px 40px;
        background: linear-gradient(135deg, #00ffff, #ff00ff);
        border: none;
        color: #000;
        font-size: 18px;
        font-weight: 900;
        text-transform: uppercase;
        letter-spacing: 0.1em;
        cursor: pointer;
        z-index: 200;
        box-shadow: 0 10px 40px rgba(0, 255, 255, 0.5);
        transition: all 0.3s;
        animation: assembleGlow 2s ease-in-out infinite;
      }
      
      .assemble-btn:hover {
        transform: translateX(-50%) scale(1.1);
        box-shadow: 0 15px 60px rgba(0, 255, 255, 0.8);
      }
      
      @keyframes assembleGlow {
        0%, 100% { box-shadow: 0 10px 40px rgba(0, 255, 255, 0.5); }
        50% { box-shadow: 0 10px 60px rgba(255, 0, 255, 0.7); }
      }
      
      @media (max-width: 768px) {
        .beat-flash {
          padding: 30px 40px;
          font-size: clamp(18px, 4vw, 32px);
        }
        
        .beat-progress {
          top: 10px;
          min-width: 160px;
          padding: 8px 16px;
        }
        
        .assemble-btn {
          bottom: 20px;
          padding: 16px 32px;
          font-size: 14px;
        }
      }
    `;
    document.head.appendChild(style);
  },
  
  // Collect a beat
  collect(beatData) {
    const {
      beatNumber,
      beatName,
      syntagma,
      clips = [],
      metadata = {}
    } = beatData;
    
    // Store beat
    this.collectedBeats.push({
      beatNumber,
      beatName,
      syntagma,
      clips,
      metadata,
      timestamp: Date.now()
    });
    
    // Show flash
    this.showFlash(beatNumber, beatName);
    
    // Update progress
    this.updateProgress();
    
    // Check completion
    if (this.collectedBeats.length >= this.config.totalBeats) {
      this.onComplete();
    }
    
    // Play sound
    if (this.config.completionSound) {
      this.playCollectionSound();
    }
  },
  
  // Show beat collection flash
  showFlash(beatNumber, beatName) {
    const flash = document.getElementById('beatFlash');
    if (!flash) return;
    
    flash.style.setProperty('--flash-color', this.config.flashColor);
    flash.innerHTML = `
      <div style="font-size: 0.5em; opacity: 0.7; margin-bottom: 8px;">BEAT ${beatNumber}</div>
      <div>${beatName.toUpperCase()}</div>
      <div style="font-size: 0.4em; opacity: 0.5; margin-top: 8px;">${this.collectedBeats.length}/${this.config.totalBeats} COLLECTED</div>
    `;
    
    flash.classList.add('show');
    
    setTimeout(() => {
      flash.classList.remove('show');
    }, this.config.flashDuration);
  },
  
  // Update progress bar
  updateProgress() {
    const progressText = document.querySelector('.beat-progress-text');
    const progressFill = document.querySelector('.beat-progress-fill');
    
    if (progressText) {
      progressText.textContent = `${this.collectedBeats.length}/${this.config.totalBeats} Beats`;
    }
    
    if (progressFill) {
      const percentage = (this.collectedBeats.length / this.config.totalBeats) * 100;
      progressFill.style.width = `${percentage}%`;
    }
  },
  
  // Handle completion
  onComplete() {
    // Show assemble button
    const btn = document.getElementById('assembleFinalCutBtn');
    if (btn) {
      btn.style.display = 'block';
      btn.classList.add('show');
    }
    
    // Completion flash
    setTimeout(() => {
      this.showCompletionFlash();
    }, 500);
    
    // Play completion sound
    this.playCompletionSound();
  },
  
  // Show completion flash
  showCompletionFlash() {
    const flash = document.getElementById('beatFlash');
    if (!flash) return;
    
    flash.style.setProperty('--flash-color', '#00ff00');
    flash.innerHTML = `
      <div style="font-size: 1.2em;">🎬</div>
      <div>ALL BEATS COLLECTED!</div>
      <div style="font-size: 0.5em; margin-top: 16px; opacity: 0.7;">15/15 • NARRATIVE COMPLETE</div>
    `;
    
    flash.classList.add('show');
    
    setTimeout(() => {
      flash.classList.remove('show');
    }, 3000);
  },
  
  // Open final screen
  openFinalScreen() {
    // Save data to localStorage for final screen
    localStorage.setItem('final_cut_data', JSON.stringify({
      game: window.game || {},
      beats: this.collectedBeats,
      sourceTool: document.title,
      timestamp: Date.now()
    }));
    
    // Open new window
    window.open('final-screen.html', '_blank', 'width=1400,height=900');
  },
  
  // Play collection sound
  playCollectionSound() {
    try {
      const audioContext = new (window.AudioContext || window.webkitAudioContext)();
      const oscillator = audioContext.createOscillator();
      const gainNode = audioContext.createGain();
      
      oscillator.connect(gainNode);
      gainNode.connect(audioContext.destination);
      
      oscillator.frequency.value = 800 + (this.collectedBeats.length * 50);
      gainNode.gain.value = 0.1;
      
      oscillator.start();
      oscillator.stop(audioContext.currentTime + 0.1);
    } catch (e) {
      console.log('Audio not supported');
    }
  },
  
  // Play completion sound
  playCompletionSound() {
    try {
      const audioContext = new (window.AudioContext || window.webkitAudioContext)();
      
      // Chord
      [523.25, 659.25, 783.99].forEach((freq, i) => {
        const oscillator = audioContext.createOscillator();
        const gainNode = audioContext.createGain();
        
        oscillator.connect(gainNode);
        gainNode.connect(audioContext.destination);
        
        oscillator.frequency.value = freq;
        gainNode.gain.value = 0.1;
        
        oscillator.start(audioContext.currentTime + i * 0.1);
        oscillator.stop(audioContext.currentTime + i * 0.1 + 0.5);
      });
    } catch (e) {
      console.log('Audio not supported');
    }
  },
  
  // Get collection status
  getStatus() {
    return {
      collected: this.collectedBeats.length,
      total: this.config.totalBeats,
      percentage: (this.collectedBeats.length / this.config.totalBeats) * 100,
      complete: this.collectedBeats.length >= this.config.totalBeats,
      beats: this.collectedBeats
    };
  },
  
  // Reset system
  reset() {
    this.collectedBeats = [];
    this.updateProgress();
    
    const btn = document.getElementById('assembleFinalCutBtn');
    if (btn) {
      btn.style.display = 'none';
    }
  }
};

// Auto-initialize if on compatible page
if (typeof window !== 'undefined') {
  window.BeatCollectionSystem = BeatCollectionSystem;
  
  // Auto-init on load
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', () => {
      BeatCollectionSystem.init();
    });
  } else {
    BeatCollectionSystem.init();
  }
}
