# A6B ENO-VICTOR REFACTOR PLAN
## "Speak Only in Symbols" - Media for Thinking the Unthinkable

### CORE PHILOSOPHY
**Stop trying to be a control panel. Become a small ecosystem where clips drift, settle, and invite you to listen with your eyes.**

---

## 1. REMOVE ALL TEXT → SYMBOLIC GLYPHS

### Replace Current Text UI:
```javascript
// BEFORE: Text labels everywhere
#overlay { text: "Score: 100, Level: 3" }
#controls { buttons: "Left", "Right", "Rotate", "Drop" }

// AFTER: Pure symbols
Floating Glyph HUD (screen-edge pinned):
  ⏯  Play/Pause garden
  ◎  Hold/swap current piece  
  ⎌  Rewind last step
  ∿  Rhythm indicator (pulses with gravity)
  
Status glyphs (no numbers):
  ████░░░░  Score bar (fills)
  ◴◵◴  Level dots (additive)
  0/49  → ●●●○○○○○○  Fragment collection (dots)
```

### Implementation:
```javascript
// Symbol HUD - no text allowed
class SymbolicHUD {
    constructor() {
        this.glyphs = {
            pause: { symbol: '⏯', pos: [-0.9, 0.9], action: 'togglePause' },
            hold: { symbol: '◎', pos: [-0.9, 0.7], action: 'holdPiece' },
            rewind: { symbol: '⎌', pos: [-0.9, 0.5], action: 'rewindStep' },
            gravity: { symbol: '∿', pos: [0.9, 0.9], animated: true }
        };
    }
    
    render(ctx) {
        Object.values(this.glyphs).forEach(g => {
            ctx.font = '48px monospace';
            ctx.fillStyle = '#AED581';
            const [x, y] = this.toScreenPos(g.pos);
            ctx.fillText(g.symbol, x, y);
            
            // Micro-animation on hover (no tooltip text)
            if (g.hover) this.animateGlyph(g);
        });
    }
    
    animateGlyph(glyph) {
        // ⎌ wiggles backward 12px
        // ∿ pulses with gravity rhythm
        // ◎ rotates slightly
    }
}
```

---

## 2. CAMERA FOLLOWS ATTENTION (NON-DISORIENTING)

### Spring-Dolly System:
```javascript
class CameraController {
    constructor(camera, grid) {
        this.camera = camera;
        this.grid = grid;
        this.target = null;
        this.damping = 0.12;
        this.focusedBlock = null;
    }
    
    // Ease camera to target (dolly + pedestal only, NO yaw/roll)
    easeTo(targetVec3, dist = 7) {
        const look = targetVec3.clone();
        const dir = this.camera.position.clone().sub(look).normalize();
        const desiredPos = look.clone().add(dir.multiplyScalar(dist));
        
        this.target = { pos: desiredPos, look: look };
    }
    
    update() {
        if (!this.target) return;
        
        // Spring interpolation
        this.camera.position.lerp(this.target.pos, this.damping);
        this.camera.lookAt(this.target.look);
        
        // Stop when close enough
        if (this.camera.position.distanceTo(this.target.pos) < 0.01) {
            this.target = null;
        }
    }
    
    // Center on cluster bounds (frustum fit)
    centerOnGrid(blocks) {
        const bounds = this.computeBounds(blocks);
        const center = bounds.center();
        this.easeTo(center, this.calculateOptimalDistance(bounds));
    }
    
    computeBounds(blocks) {
        const box = new THREE.Box3();
        blocks.forEach(b => box.expandByObject(b));
        return box;
    }
}
```

---

## 3. TAP/HOLD FOCUS MECHANIC

### Gesture System:
```javascript
class FocusGesture {
    constructor(raycaster, camera, scene) {
        this.raycaster = raycaster;
        this.camera = camera;
        this.scene = scene;
        this.holdTimer = null;
        this.holdThreshold = 300; // ms
    }
    
    onTouchStart(event) {
        const block = this.raycastBlock(event);
        if (!block) return;
        
        // Start hold timer
        this.holdTimer = setTimeout(() => {
            this.promoteBlock(block); // Pull forward + dim neighbors
        }, this.holdThreshold);
    }
    
    onTouchEnd(event) {
        clearTimeout(this.holdTimer);
        const block = this.raycastBlock(event);
        if (block) this.focusBlock(block); // Just camera ease
    }
    
    focusBlock(block) {
        const pos = block.getWorldPosition(new THREE.Vector3());
        cameraController.easeTo(pos, 6);
        this.drawHalos(block); // Fitness rings
    }
    
    promoteBlock(block) {
        // Subtle translate toward camera
        block.userData.promoted = true;
        new TWEEN.Tween(block.position)
            .to({ z: block.position.z - 0.35 }, 220)
            .easing(TWEEN.Easing.Cubic.InOut)
            .start();
        
        // Context dim (spotlight effect)
        this.scene.children.forEach(obj => {
            if (obj !== block && obj.material) {
                obj.material.emissiveIntensity = 0.06;
            }
        });
    }
}
```

---

## 4. STATE OVERLAYS (MAKE INVISIBLE VISIBLE)

### Halo Rings System:
```javascript
class StateHalos {
    // Inner ring = time-fit
    // Outer ring = adjacency
    // Opacity = confidence
    
    drawHalos(block) {
        const timeFit = this.calculateTimeFit(block);
        const adjacency = this.calculateAdjacency(block);
        
        // Inner ring (time continuity)
        const innerRing = new THREE.RingGeometry(0.8, 0.85, 32);
        const innerMat = new THREE.MeshBasicMaterial({
            color: 0x00ff00,
            transparent: true,
            opacity: timeFit,
            side: THREE.DoubleSide
        });
        const inner = new THREE.Mesh(innerRing, innerMat);
        
        // Outer ring (spatial adjacency)
        const outerRing = new THREE.RingGeometry(0.9, 0.95, 32);
        const outerMat = new THREE.MeshBasicMaterial({
            color: 0x0088ff,
            transparent: true,
            opacity: adjacency,
            side: THREE.DoubleSide
        });
        const outer = new THREE.Mesh(outerRing, outerMat);
        
        block.add(inner, outer);
    }
    
    // Micro-glyphs on corners
    addCornerGlyphs(block) {
        const glyphs = {
            topLeft: '◴',     // start marker
            topRight: '◵',    // end marker
            bottom: '∿'       // rhythm indicator
        };
        
        Object.entries(glyphs).forEach(([pos, symbol]) => {
            const sprite = this.createTextSprite(symbol);
            sprite.position.copy(this.getCornerPos(block, pos));
            block.add(sprite);
        });
    }
}
```

---

## 5. CHAIN-BUILDING AS EDITING

### Chain Detection & Charge:
```javascript
class ChainBuilder {
    constructor() {
        this.activeChains = [];
    }
    
    detectChains(grid) {
        // Horizontal chains where:
        // - Blocks are adjacent
        // - Time-compatible (end[n] ≈ start[n+1])
        // - Theme coherent (same category)
        
        for (let y = 0; y < grid.length; y++) {
            let chain = [];
            for (let x = 0; x < grid[y].length; x++) {
                const block = grid[y][x];
                if (block && this.canChain(chain, block)) {
                    chain.push(block);
                } else {
                    if (chain.length >= 3) {
                        this.chargeChain(chain);
                    }
                    chain = block ? [block] : [];
                }
            }
        }
    }
    
    chargeChain(chain) {
        // Draw charge line (left → right)
        const line = this.createChargeLine(chain);
        
        // Animate charge fill
        new TWEEN.Tween({ progress: 0 })
            .to({ progress: 1 }, 800)
            .onUpdate(val => {
                line.material.dashSize = val.progress * line.length;
            })
            .onComplete(() => {
                // Chain ready - tap to commit
                line.userData.ready = true;
                line.material.emissive.setHex(0x00ff00);
            })
            .start();
    }
    
    commitCut(chain) {
        // Gentle shutter-blink
        this.shutterBlink();
        
        // Clear chain
        chain.forEach(b => this.removeBlock(b));
        
        // Mint seed card (parameter vector)
        const seed = this.createSeedCard(chain);
        this.addToShelf(seed);
    }
    
    shutterBlink() {
        const overlay = document.createElement('div');
        overlay.style = 'position:fixed;inset:0;background:#000;opacity:0;';
        document.body.appendChild(overlay);
        
        overlay.animate([
            { opacity: 0 },
            { opacity: 0.6 },
            { opacity: 0 }
        ], {
            duration: 120,
            easing: 'cubic-bezier(0.4, 0, 0.2, 1)'
        }).onfinish = () => overlay.remove();
    }
}
```

---

## 6. PARAMETER DIALS (INTERACTIVE WHAT-IF)

### Symbolic Dials:
```javascript
class ParameterDials {
    // No text - just icons
    // ① Gravity: • (dot pulses)
    // ② Magnet: ⊂⊃ (brackets expand/contract)
    
    constructor() {
        this.dials = [
            { icon: '•', param: 'gravity', value: 1.0, range: [0.1, 2.0] },
            { icon: '⊂⊃', param: 'magnetStrength', value: 0.5, range: [0, 1.0] }
        ];
    }
    
    render(ctx) {
        this.dials.forEach((dial, i) => {
            const x = window.innerWidth - 80;
            const y = 100 + (i * 100);
            
            // Icon
            ctx.font = '32px monospace';
            ctx.fillText(dial.icon, x, y);
            
            // Value arc (visual feedback)
            const percent = (dial.value - dial.range[0]) / (dial.range[1] - dial.range[0]);
            this.drawArc(ctx, x, y, percent);
        });
    }
    
    onTouchMove(event, dial) {
        // Turn dial → immediate re-simulation
        const newValue = this.calculateValue(event, dial);
        dial.value = newValue;
        
        // Apply without delay
        this.applyParameter(dial.param, newValue);
        this.reSimulate(); // Instant feedback
    }
}
```

---

## 7. LINKED VIEWS (CHAIN STRIP)

### Mini-Map Strip:
```javascript
class ChainStripOverlay {
    // Tiny strip at bottom showing chain coherence
    // Pulses when cut-point nears
    
    constructor() {
        this.canvas = document.createElement('canvas');
        this.canvas.width = window.innerWidth;
        this.canvas.height = 60;
        this.canvas.style = 'position:fixed;bottom:0;left:0;opacity:0.8;pointer-events:none;';
        document.body.appendChild(this.canvas);
        this.ctx = this.canvas.getContext('2d');
    }
    
    update(chains) {
        this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);
        
        chains.forEach((chain, i) => {
            const x = (i / chains.length) * this.canvas.width;
            const coherence = this.calculateCoherence(chain);
            
            // Draw coherence bar
            this.ctx.fillStyle = `rgba(174, 213, 129, ${coherence})`;
            this.ctx.fillRect(x, 0, this.canvas.width / chains.length, this.canvas.height);
            
            // Pulse when near cut-point
            if (coherence > 0.8) {
                this.pulse(x);
            }
        });
    }
}
```

---

## 8. SEED CARDS (PARAMETER REMIX)

### Edit History as Seeds:
```javascript
class SeedCardSystem {
    // Each edit becomes a reusable parameter vector
    
    createSeedCard(chain) {
        return {
            gravity: this.currentGravity,
            magnetStrength: this.currentMagnet,
            cadence: this.calculateCadence(chain),
            blocks: chain.map(b => b.userData.concept.id),
            icon: this.generateIcon(chain) // Unique glyph
        };
    }
    
    renderShelf(seeds) {
        // Bottom shelf of seed tiles
        seeds.forEach((seed, i) => {
            const tile = this.createTile(seed);
            tile.position.set(-5 + i * 1.2, -8, 0);
            
            // Drag to replay those conditions
            tile.userData.draggable = true;
            tile.userData.onDrag = () => this.replaySeed(seed);
        });
    }
    
    replaySeed(seed) {
        // Restore parameter vector
        this.setGravity(seed.gravity);
        this.setMagnet(seed.magnetStrength);
        
        // Re-spawn those blocks with that cadence
        this.replaySequence(seed.blocks, seed.cadence);
    }
}
```

---

## IMPLEMENTATION PRIORITY

### Phase 1: Camera & Focus (Most Impact)
1. ✅ Spring-dolly camera controller
2. ✅ Frustum-centered grid fitting
3. ✅ Tap/hold gesture system
4. ✅ Non-disorienting easing

### Phase 2: Symbolic HUD
1. ✅ Remove all text labels
2. ✅ Glyph-only controls
3. ✅ Parameter dials (icon-based)
4. ✅ Status as visual bars/dots

### Phase 3: State Overlays
1. ✅ Halo rings (time/adjacency)
2. ✅ Corner glyphs (◴◵∿)
3. ✅ Chain charge lines
4. ✅ Scope view (motion energy)

### Phase 4: Chain Editing
1. ✅ Chain detection algorithm
2. ✅ Charge animation
3. ✅ Tap-to-commit
4. ✅ Shutter blink
5. ✅ Seed card minting

### Phase 5: Linked Views
1. ✅ Chain strip overlay
2. ✅ Mini-map adjacency graph
3. ✅ Split-peek A/B comparison
4. ✅ Scrub-history (2-finger hold)

---

## KEY CONSTRAINTS

### "Speak Only in Symbols"
- ❌ NO text menus
- ❌ NO numeric readouts
- ❌ NO word labels
- ✅ ONLY glyphs, icons, shapes
- ✅ ONLY spatial relationships
- ✅ ONLY motion/animation

### "Non-Disorienting Camera"
- Lock horizon & roll
- Dolly + pedestal only
- Max 8° yaw change per focus
- Spring easing (cubic in/out)
- 180-260ms durations (beat-quantized)

### "Listen with Your Eyes"
- Attention follows curiosity
- System reveals structure
- Accidents are features
- Peripheral becomes central
- Drift → settle → compose

---

## BRET VICTOR PRINCIPLES APPLIED

1. **Surface the Invisible**
   - Halos show fitness
   - Glyphs mark rhythm points
   - Chain bands sweep before cut

2. **Overcome Cognitive Limits**
   - Auto-fit frustum
   - Ghost frame anchors
   - Parallax depth lanes

3. **Multiple Modes of Thought**
   - Interactive: direct manipulation
   - Visual: motion energy scope
   - Symbolic: knot icons

4. **Rapid What-If**
   - Dials re-simulate instantly
   - Scrub-history (8 sec loop)
   - A/B parameter comparison

5. **Link Perspectives**
   - Main + strip in lockstep
   - Pulse on predicted cuts
   - Split-peek overlays

6. **Abstract & Generalize**
   - Seed cards = parameter vectors
   - Drag to replay conditions
   - Remix without menus

---

## ENO OBLIQUE STRATEGIES EMBEDDED

1. **"Center the peripheral"**
   - Animate attention to edges
   - Nearly-missed solves cuts
   
2. **"Listen for cadence"**
   - Fall → hover → focus → breath → align → release
   - Asymmetries provoke accidents

3. **"Set conditions, welcome drift"**
   - Garden reseeds toward dwelled-on fragments
   - Unused motifs enter low-tide periphery

---

## FINAL NORTH STAR

> **Fewer words. More felt structure. Steady rhythms. A camera that follows curiosity.**

The editor is no longer a control panel.  
It's a small ecosystem where clips drift, settle, and speak through behavior.  
You listen with your eyes.  
The garden guides the camera to what's speaking.  
Not what's labeled.

---

## NEXT STEPS

1. Implement camera controller with spring-dolly
2. Replace text HUD with symbolic glyphs
3. Add tap/hold focus gestures
4. Draw state halos on blocks
5. Build chain detection + charge system
6. Create seed card shelf
7. Add parameter dials (visual only)
8. Test on mobile (touch gestures)

**The instrument edits by listening to behavior, not pushing menus.**
