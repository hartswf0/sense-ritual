# NARRATIVE MESHWORK INTEGRATION PLAN

## Problem Analysis
From user's screenshot:
1. ❌ Black gaps at cell edges (video doesn't fill)
2. ❌ Narrative beats not showing in sequence
3. ❌ Texture mapping broken

## Root Cause
Trying to retrofit complex video system onto narrative garden's simple grid. Need clean integration.

## Solution: Build Properly

### Keep from Narrative Garden:
✅ Beat collection system (works perfectly)
✅ Syntagma selection modal
✅ Act progress tracking
✅ Beat list UI
✅ Match-3 mechanics

### Add from Meshwork-725:
✅ Video-filled cells (but SIMPLER approach)
✅ Breathing animation
✅ Bloom & soft edges
✅ Film player

### Fix Video Texture Mapping:
Instead of complex geometry-aware sampling:
1. Draw video directly to canvas position
2. Use simpler rectangular cells (slightly rounded)
3. Fill ENTIRE cell area + slight overlap
4. Add breathing effect on opacity/scale

## Implementation Steps

1. **Start with narrative-garden-v03.html base**
2. **Replace draw() function:**
   - Instead of solid colors, draw videos
   - Simple approach: ctx.drawImage() per cell
   - Add small padding overlap to prevent gaps
3. **Add breathing system:**
   - Breathing object with act-based speeds
   - Apply to cell opacity/bloom
4. **Add film player:**
   - Button to toggle video player
   - Beat buttons for time jumping
5. **Keep beat collection:**
   - On match → collect beat → show syntagma selector
   - Breathing changes with act

## Key Simplification

**Instead of:** Complex Voronoi + geometry sampling
**Use:** Simple rounded rectangles + video fills + breathing

**This ensures:**
- No black gaps (videos overlap slightly)
- Better performance
- Clearer code
- Working beat system

## File to Create
`narrative-meshwork-clean.html` - Fresh, working version

Ready to implement?
