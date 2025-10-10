# 🧀🕳️ SWISS-CHEESE Testing Guide

## What Changed

**File:** `swipe-food-swiss-cheese.html`

### New Features:
1. ✅ **Swipe LEFT to skip** - Cards you don't want disappear to the left
2. ✅ **Compiler selection** - Choose how to compile fragment's personality
3. ✅ **Compile Soul button** - Creates AI persona with simulated compilation
4. ✅ **Status updates to COMPILED** - Shows blue badge after compilation
5. ✅ **Personas saved to localStorage** - Compiled souls persist
6. ✅ **Smart UI states** - Button changes to ✓ after compilation

### Visual Changes:
- Swipe hint now shows: **"← Swipe left to skip | Swipe right to collect →"**
- Chat panel has **COMPILER dropdown** + **⚡ Compile Soul button**
- After compilation: Button turns **green** with "✓ Soul Compiled"

---

## Testing Steps

### Test 1: Swipe Left to Skip
1. Open `swipe-food-swiss-cheese.html`
2. See first card
3. **Swipe LEFT** (drag card to the left and release)
4. **Expected:**
   - Card flies off screen to the left
   - Rotates counter-clockwise
   - Next card appears
   - Console shows: `[SWIPE] Swiped left by 150px - SKIP`
   - Skipped card NOT in collection

### Test 2: Swipe Right Still Works
1. With second card showing
2. **Swipe RIGHT** (drag to right and release)
3. **Expected:**
   - Card flies off right
   - Added to collection
   - Console shows: `[SWIPE] Swiped right by 150px`

### Test 3: Compile a Fragment
1. Swipe right on a card (collect it)
2. Collection shows item with **[PENDING]** badge
3. **Click the item** in collection
4. Chat opens (green highlight on item)
5. See **COMPILER dropdown** with 3 options:
   - Stanislavski - Method acting
   - CharacterGrowth - Personal evolution
   - PlotDynamics - Story structure
6. Select "CharacterGrowth"
7. Click **⚡ Compile Soul** button
8. **Expected:**
   - Button changes to "⏳ Compiling..."
   - Wait 1.5 seconds
   - Button changes to "✓ Soul Compiled" (green)
   - Dropdown becomes disabled
   - Collection item changes to **[COMPILED]** badge (blue)
   - Console shows:
     ```
     [COMPILE] Starting compilation for "Family of Man" with CharacterGrowth
     [COMPILE] ✓ Compiled "Family of Man" with CharacterGrowth
     [COMPILE] Soul key: fom-exhibition-1950s::CharacterGrowth
     ```

### Test 4: Compiled State Persists
1. After compiling a fragment
2. Refresh the page
3. Click the compiled item in collection
4. **Expected:**
   - Button shows "✓ Soul Compiled" (already done)
   - Dropdown disabled and shows saved compiler
   - Cannot compile again (button disabled)

### Test 5: Different Compilers
1. Collect 3 fragments
2. Click fragment 1 → Compile with "Stanislavski"
3. Click fragment 2 → Compile with "CharacterGrowth"
4. Click fragment 3 → Compile with "PlotDynamics"
5. In console, type: `store.personas`
6. **Expected:** See 3 personas with different soulKeys:
   ```javascript
   {
     "fom-exhibition-1950s::Stanislavski": { ... },
     "afeni-harsh-reality::CharacterGrowth": { ... },
     "tupac-grand-stories::PlotDynamics": { ... }
   }
   ```

### Test 6: Skip Multiple Cards
1. Start fresh session
2. Swipe LEFT on first 5 cards (skip them all)
3. Swipe RIGHT on 6th card (collect it)
4. **Expected:**
   - Collection shows only 1 item (the 6th card)
   - First 5 cards are gone forever (not in collection)

---

## What Should Work

✅ All CHEESE features (localStorage persistence)  
✅ All APPLE-BUTTER features (clickable collection)  
✅ Swipe LEFT to skip cards  
✅ Swipe RIGHT to collect  
✅ Select compiler from dropdown  
✅ Click "Compile Soul" button  
✅ Status updates to COMPILED  
✅ Personas saved to localStorage  
✅ Compiled state persists on refresh  
✅ Cannot re-compile same fragment  

---

## What's NOT Added Yet

❌ Send messages (coming in bacon)  
❌ Chat messages (input still disabled)  
❌ Conviction system (coming in eggs)  
❌ Decisions (coming in pancakes)  
❌ Real OpenAI compilation (currently simulated)  

---

## Success Criteria

**SWISS-CHEESE is successful if:**
1. Swipe LEFT → Card skips, not in collection
2. Swipe RIGHT → Card collected
3. Click collection item → Chat opens
4. Select compiler → Click Compile → Button changes to ✓
5. Collection badge changes from PENDING to COMPILED
6. Refresh page → Compiled state preserved
7. Can't re-compile same fragment
8. Different fragments can use different compilers

**If any criteria fails:** Debug before moving forward!

---

## Console Output Expected

```
🧀🕳️ SWISS-CHEESE: Skip + Compile initialized
[🧀 LOADED] Restored 0 items from localStorage
[RENDER] Card: "Family of Man"

[User swipes left]
[SWIPE] Swiped left by 150px - SKIP
[RENDER] Card: "Individual Self"

[User swipes right]
[SWIPE] Swiped right by 150px
[ADD TO STORY] Fragment: "Individual Self"
[🧀 SAVED] Story saved to localStorage

[User clicks collection item]
[OPEN CHAT] For instanceId: abc123
[OPEN CHAT] Found item: "Individual Self"
[OPEN CHAT] Chat opened for "Individual Self"

[User clicks Compile Soul]
[COMPILE] Starting compilation for "Individual Self" with Stanislavski
[COMPILE] ✓ Compiled "Individual Self" with Stanislavski
[COMPILE] Soul key: bayer-individual-self::Stanislavski
```

---

## Persona Data Structure

After compilation, in `localStorage`:

```javascript
{
  "personas": {
    "fom-exhibition-1950s::Stanislavski": {
      "SchemaID": "POML.CharSoul.v1",
      "CompilerFingerprint": {
        "name": "Stanislavski",
        "version": "1.0"
      },
      "Identity": {
        "Moniker": "Family of Man (Exhibition)",
        "Essence": "A new way of seeing the world...",
        "Voice": "Direct, challenging",
        "ZeroContextGoal": "Convince the filmmaker that \"Family of Man\" is essential..."
      }
    }
  }
}
```

---

## Next Step

Once SWISS-CHEESE tests pass → We can either:

**Option A:** Create **swipe-food-bacon.html** (send/receive messages)
**Option B:** Continue polishing SWISS-CHEESE

Ready to test! 🧀🕳️
